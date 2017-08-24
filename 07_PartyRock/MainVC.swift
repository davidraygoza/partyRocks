//
//  ViewController.swift
//  07_PartyRock
//
//  Created by David Raygoza on 14/08/17.
//  Copyright © 2017 David Raygoza. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
    @IBOutlet weak var tableView : UITableView!
    var partyRocks = [PartyRock]()
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let p1 = PartyRock(imageURL:"https://i.ytimg.com/vi/9BMwcO6_hyA/maxresdefault.jpg",videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/9BMwcO6_hyA\" frameborder=\"0\" allowfullscreen></iframe>\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle:"Bon Jovi - Always")
        let p2 = PartyRock(imageURL:"https://i.ytimg.com/vi/1w7OgIMMRc4/maxresdefault.jpg",videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w7OgIMMRc4\" frameborder=\"0\" allowfullscreen></iframe>",videoTitle:"Sweet child of mine -Guns and Roses")
        let p3 = PartyRock(imageURL:"https://i.ytimg.com/vi/fV4DiAyExN0/maxresdefault.jpg", videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fV4DiAyExN0\" frameborder=\"0\" allowfullscreen></iframe>",videoTitle:"Hoobastank - The Reason ")
        let p4 = PartyRock(imageURL:"https://i.ytimg.com/vi/eW2qlKa6oHw/maxresdefault.jpg",videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/eW2qlKa6oHw\" frameborder=\"0\" allowfullscreen></iframe>",videoTitle:"Lenny Kravitz - Again")
        let p5 = PartyRock(imageURL:"https://i.ytimg.com/vi/NMNgbISmF4I/maxresdefault.jpg",videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/NMNgbISmF4I\" frameborder=\"0\" allowfullscreen></iframe>\" frameborder=\"0\" allowfullscreen></iframe>",videoTitle:"Aerosmith - Crazy")
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        tableView.delegate = self
        tableView.dataSource = self 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //this is for reusable cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            if let party = sender as? PartyRock{
                destination.partyRock = party
            }
        }
    }

}

