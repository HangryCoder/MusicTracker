//
//  ViewController.swift
//  MusicTracker
//
//  Created by Sonia Wadji on 12/09/18.
//  Copyright © 2018 genora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fetchAudioURL = "http://www.genorainnovations.com/Audio/fetch_audio.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: fetchAudioURL)!
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        data!, options: [])
                    print(jsonResponse) //Response result
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
        }
        task.resume()
    }

}

