//
//  ViewController.swift
//  TechPod
//
//  Created by Towa Aoyagi on 2021/02/05.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    
    var imageNameArray = [String]()
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //処理をViewControllerで処理する為の文
        table.dataSource = self
        table.delegate = self
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        fileNameArray = ["cannon", "elise", "arria"]
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    
    //セル数指定
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = songNameArray[indexPath.row]
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelect indexPath: IndexPath){
        print((songNameArray[indexPath.row]))
        
        //音楽ファイル設定
        //パスの取得
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        //パス渡し
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
        
    }


}

