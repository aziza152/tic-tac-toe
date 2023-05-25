//
//  ViewController.swift
//  noliki
//
//  Created by Aziza on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {
    var player = 1
    var state = [0,0,0,0,0,0,0,0,0]
    var winState = [[0,1,2], [3,4,5], [6,7,8],[0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        if state [sender.tag - 1] != 0 { //3
            return
        }
        state [sender.tag - 1] = player  //2
        count += 1
        
        if player == 1 {
            sender.setBackgroundImage (UIImage(named: "x"), for: .normal)
            player = 2
        } else {
            sender.setBackgroundImage (UIImage(named: "o"), for: .normal)
            player = 1
        }
        for winArray in winState {
            if state [winArray[0]] == state [winArray[1]] &&
                state [winArray[1]] == state [winArray[2]] {
                if state [winArray[0]] == 1 {
                    print ("X win")
                    let alert = UIAlertController (title: "X win!",
                                                   message: "X win", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in
                        self.clear()
                        
                    }))  // handler = событие
                    present(alert, animated: true, completion: nil)
                    return
                }
                if state [winArray[0]] == 2 {
                    print ("O win")
                    let alert = UIAlertController (title: "O win!",
                                                   message: "O win", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in
                        self.clear()
                        
                    }))  // handler = событие
                    present(alert, animated: true, completion: nil)
                    return
                }
            }
        }
        if count == 9 {
            let alert = UIAlertController (title: "nobody win",
                                                       message: "nobody win", preferredStyle: .alert)
                        
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in self.clear() }))
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func clear() {
        player = 1
        count = 0
        for i in 0...8 {
            state [i] = 0
            let button = view.viewWithTag(i + 1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
        }
    }
}
