//
//  ViewController.swift
//  CustomTableView
//
//  Created by Sait Demirel on 16.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    struct Sunset {
        let title:String
        let imageName:String
    }
    let data:[Sunset] =
    [Sunset(title: "Gün Doğumu", imageName: "sunset1"),
     Sunset(title: "Sabah", imageName: "sunset2"),
     Sunset(title: "Öğle", imageName: "sunset3"),
     Sunset(title: "İkindi", imageName: "sunset4"),
     Sunset(title: "Akşam", imageName: "sunset5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.rowHeight = 100
        
    }


}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "hucre", for: indexPath) as! CustomTableViewCell
        //table.explainLabel.text = sunset.title bu hatalı tabeldan değil cellden ulaşmaya çalışacağız
        cell.explainLabel.text = sunset.title
        cell.iconImageView.image = UIImage(named: sunset.imageName)
        return cell
    }
}
