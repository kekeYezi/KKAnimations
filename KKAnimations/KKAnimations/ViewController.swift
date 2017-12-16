//
//  ViewController.swift
//  KKAnimations
//
//  Created by keke on 2017/12/16.
//  Copyright © 2017年 keke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let animations = ["fruits","Timi"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "KKAnimations"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifer = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifer)
        }
        
        cell?.textLabel?.text = animations[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = FruitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break;
            
        default:
            print("default")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

