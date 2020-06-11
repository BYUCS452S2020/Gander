//
//  WebAPI.swift
//  GanderClient
//
//  Created by Joseph Koetting on 6/10/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//

import Foundation

class webAPI {
    
    func loadPerson() {
        
        guard let url = URL(string: "http://167.172.198.53:3005/person") else {
              print("Invalid URL")
              return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([PersonJson].self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        let results = decodedResponse
                        print(results[0])
                        
                        for person in results {
                            realPerson.append(person.toPerson())
                        }
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    func loadPost() {
        
        guard let url = URL(string: "http://167.172.198.53:3005/post") else {
              print("Invalid URL")
              return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([PostJson].self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        let results = decodedResponse
                        print(results)
                        
                        for post in results {
                            realPosts.append(post.toPost())
                        }
                        
                        for post in realPosts {
                                        post.initIsPost()
                                        
                                        if (post.isPost)
                                        {
                                            realCoolPosts.append(post)
                                        }
                                    }
                    }

    
                    
                    print("hello")
                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    func savePerson(personJson: PersonJson) {
        
        guard let url = URL(string: "http://167.172.198.53:3005/person") else {
                print("Invalid URL")
                return
            }
        
        var jsondata: Data
        do {
        
            let encoder = JSONEncoder()
            jsondata = try encoder.encode(personJson)
            
            var request = URLRequest(url: url)
               request.httpMethod = "POST"
               request.httpBody = jsondata

            URLSession.shared.dataTask(with: request) { data, response, error in
                // Saved Person
            }.resume()
            
        } catch {
            print("Whoops, an error occured: \(error)")
        }
    }
    
    
    func savePost(postJson: PostJson) {

        guard let url = URL(string: "http://167.172.198.53:3005/post") else {
                print("Invalid URL")
                return
            }
        
        var jsondata: Data
        do {

            let encoder = JSONEncoder()
            jsondata = try encoder.encode(postJson)
            
            var request = URLRequest(url: url)
               request.httpMethod = "POST"
               request.httpBody = jsondata
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                // Saved Person
            }.resume()
            
        } catch {
            print("Whoops, an error occured: \(error)")
        }
    }
    
        func delete() {
            guard let url = URL(string: "http://167.172.198.53:3005/delete") else {
                print("Invalid URL")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
            }.resume()
    }
}

func deleteData() {
    let web = webAPI()
    web.delete()
}


func loadData() {
    
    let web = webAPI()
    web.loadPerson()
    web.loadPost()
}


func saveData() {
    
    let web = webAPI()
    for person in savePerson {
        web.savePerson(personJson: person.toCodable())
    }
    
    for post in savePost {
        web.savePost(postJson: post.toCodable())
    }
}
