//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var kalp1: UIImageView!
    @IBOutlet weak var kalp2: UIImageView!
    @IBOutlet weak var kalp3: UIImageView!
    @IBOutlet weak var kalp4: UIImageView!
    @IBOutlet weak var kalp5: UIImageView!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    @IBOutlet weak var kucuk: UIButton!
    @IBOutlet weak var buyuk: UIButton!
    @IBOutlet weak var esit: UIButton!
    
    @IBOutlet weak var again: UIButton!
    
    var can = 5;
    
    

    
    var plus = 0;
    var eksi = 0;
    
    
    
    let oddNumbers = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"];

    var scoreNumber = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceImageView1.alpha = 0;
        diceImageView2.alpha = 0;
        
        
        number.text = String(Int.random(in: 2...12)) ;
        
    }
    
    func gameOver(){
        diceImageView1.alpha = 0;
        diceImageView2.alpha = 0;
        score.alpha = 0;
        scoreLabel.alpha = 0;
        buyuk.alpha = 0;
        esit.alpha = 0;
        buyuk.alpha = 0;
        gameOverLabel.alpha = 1;
        again.alpha = 0;
        number.alpha = 0;
        
    }
   
    func canGoster(){
        
        
        let kalpler = [kalp5, kalp4, kalp3, kalp2, kalp1];
    
        var a = 4 - can;
        if(a >= 0){
            for sayi in 0...a{
                kalpler[sayi]?.alpha = 0;
            }
        }
       
        
    }
    
    @IBAction func again(_ sender: Any) {
        
        again.alpha = 0;
        diceImageView1.alpha = 0;
        diceImageView2.alpha = 0;
        esit.alpha = 1;
        buyuk.alpha = 1;
        kucuk.alpha = 1;
        
        number.text = String(Int.random(in: 2...12)) ;

        
    }
    
     func canAzalt() {
        
        
        if(scoreNumber < 0){
            can = can - 1;
            if(can == 0){
                gameOver();
            }
        }
    }
    
    @IBAction func kucuk(_ sender: Any) {
       
        diceImageView1.alpha = 1;
        diceImageView2.alpha = 1;
        
        kucuk.alpha = 0;
        buyuk.alpha = 0;
        esit.alpha = 0;
        again.alpha = 1;
        
        let a = Int.random(in: 0...5);
        let b = Int.random(in: 0...5);
        let sum = a + b + 2;
        let answer = Int(number.text!) ?? 0;
       
        diceImageView1.image = UIImage(named: oddNumbers[a]);
        diceImageView2.image = UIImage(named: oddNumbers[b]);
        
        if(sum < answer){
            print("Kazandınız");
             plus = (12 - answer)*10;
            scoreNumber = scoreNumber + plus;
        }else {
            print("Kaybettiniz");
            eksi = (answer - 2)*10;
            scoreNumber = scoreNumber - eksi ;
            canAzalt();
        }
        
        
        score.text = String(scoreNumber);

        canGoster();
       
    }
    
    @IBAction func buyuk(_ sender: Any) {
      
        
        diceImageView1.alpha = 1;
        diceImageView2.alpha = 1;
        
        kucuk.alpha = 0;
        buyuk.alpha = 0;
        esit.alpha = 0;
        again.alpha = 1;
        
        let a = Int.random(in: 0...5);
        let b = Int.random(in: 0...5);
        let sum = a + b + 2;
        let answer = Int(number.text!) ?? 0;

        
        diceImageView1.image = UIImage(named: oddNumbers[a]);
        diceImageView2.image = UIImage(named: oddNumbers[b]);
        
        if(sum > answer){
            print("Kazandınız");
             plus = (answer - 2)*10;
            scoreNumber = scoreNumber + plus;
        }else {
            print("Kaybettiniz");
            eksi = (12 - answer)*10;
            scoreNumber = scoreNumber - eksi;
            canAzalt();
        }
        
        score.text = String(scoreNumber);
        canGoster();

      }
    
    @IBAction func esit(_ sender: Any) {
        
        diceImageView1.alpha = 1;
        diceImageView2.alpha = 1;
        
        kucuk.alpha = 0;
        buyuk.alpha = 0;
        esit.alpha = 0;
        again.alpha = 1;
        let a = Int.random(in: 0...5);
        let b = Int.random(in: 0...5);
        let sum = a + b + 2;
        let answer = Int(number.text!) ?? 0;


        diceImageView1.image = UIImage(named: oddNumbers[a]);
        diceImageView2.image = UIImage(named: oddNumbers[b]);
        
        
        if(sum == answer){
            print("Kazandınız");
            scoreNumber = scoreNumber + 100;
        }else {
            print("Kaybettiniz");
            scoreNumber = scoreNumber - 100;
            canAzalt();
        }
        
        score.text = String(scoreNumber);
        canGoster();

    }
    
}



