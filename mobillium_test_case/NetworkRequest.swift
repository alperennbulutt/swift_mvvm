import Foundation


class NetworkRequest {
    
    let baseUrl =  "https://api.spacexdata.com"
    let pastEndpoint = "/v5/launches/past"
    let upcomingEndpoint = "/v5/launches/upcoming"
    
    func getPastEvent(completion: @escaping (Result<[PastModel], Error>) -> Void){
        let url = URL(string: baseUrl + pastEndpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // URLSession oluşturuluyor
        let session = URLSession.shared

        // GET isteği yapılıyor
        let task = session.dataTask(with: request) { (data, response, error) in
            // Yanıt işleme kodları burada
            if let error = error {
                print("Hata oluştu: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Geçersiz HTTP yanıtı")
                return
            }

            guard let data = data else {
                print("Boş yanıt")
                return
            }

            // Veriyi işleyin (örneğin, JSON verisini çözme)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])

                // Dispatch to the main queue if needed
                DispatchQueue.main.async {
                    do {
                        let result = try JSONDecoder().decode([PastModel].self, from: data)
                        completion(.success(result))
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(.failure(error))
                    }
                }
            } catch {
                print("JSON çözme hatası: \(error)")
            }
        }
        task.resume()
    }
    
}






