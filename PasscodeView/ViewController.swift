//
//  ViewController.swift
//  PasscodeView
//
//  Created by Damon Cricket on 16.09.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, CAAnimationDelegate {
    
    struct Constants {
        static let password: String = "1379"
        static let blueColor: UIColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    }

    var input: String = ""
    
    @IBOutlet weak var pointsView: UIView?
    
    @IBOutlet weak var firstPointView: UIView?
    @IBOutlet weak var secondPointView: UIView?
    @IBOutlet weak var thirdPointView: UIView?
    @IBOutlet weak var fourthPointView: UIView?
    
    @IBOutlet weak var oneButton: UIButton?
    @IBOutlet weak var twoButton: UIButton?
    @IBOutlet weak var threeButton: UIButton?
    @IBOutlet weak var fourButton: UIButton?
    @IBOutlet weak var fiveButton: UIButton?
    @IBOutlet weak var sixButton: UIButton?
    @IBOutlet weak var sevenButton: UIButton?
    @IBOutlet weak var eightButton: UIButton?
    @IBOutlet weak var nineButton: UIButton?
    @IBOutlet weak var zeroButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        adjust(pointView: firstPointView)
        adjust(pointView: secondPointView)
        adjust(pointView: thirdPointView)
        adjust(pointView: fourthPointView)
        
        adjust(button: oneButton)
        adjust(button: twoButton)
        adjust(button: threeButton)
        adjust(button: fourButton)
        adjust(button: fiveButton)
        adjust(button: sixButton)
        adjust(button: sevenButton)
        adjust(button: eightButton)
        adjust(button: nineButton)
        adjust(button: zeroButton)
    }
    
    private func adjust(pointView: UIView?) {
        pointView?.layer.cornerRadius = pointView!.frame.width/2.0
        pointView?.layer.borderWidth = 2.0
        pointView?.layer.borderColor = Constants.blueColor.cgColor
    }
    
    private func adjust(button: UIButton?) {
        button?.layer.cornerRadius = button!.frame.width/2.0
        button?.layer.borderWidth = 2.0
        button?.layer.borderColor = Constants.blueColor.cgColor
    }
    
    @IBAction func oneButtonTap(sender: UIButton) {
        add(numeric: "1")
        fillPoints()
        check()
    }
    
    @IBAction func twoButtonTap(sender: UIButton) {
        add(numeric: "2")
        fillPoints()
        check()
        check()
    }
    
    @IBAction func threeButtonTap(sender: UIButton) {
        add(numeric: "3")
        fillPoints()
        check()
    }
    
    @IBAction func fourButtonTap(sender: UIButton) {
        add(numeric: "4")
        fillPoints()
        check()
    }
    
    @IBAction func fiveButtonTap(sender: UIButton) {
        add(numeric: "5")
        fillPoints()
        check()
    }
    
    @IBAction func sixButtonTap(sender: UIButton) {
        add(numeric: "6")
        fillPoints()
        check()
    }
    
    @IBAction func sevenButtonTap(sender: UIButton) {
        add(numeric: "7")
        fillPoints()
        check()
    }
    
    @IBAction func eightButtonTap(sender: UIButton) {
        add(numeric: "8")
        fillPoints()
        check()
    }
    
    @IBAction func nineButtonTap(sender: UIButton) {
        add(numeric: "9")
        fillPoints()
        check()
    }
    
    @IBAction func zeroButtonTap(sender: UIButton) {
        add(numeric: "0")
        fillPoints()
        check()
    }
    
    func add(numeric: String) {
        guard input.count <= 4 else {
            return
        }
        
        input += numeric
    }
    
    func fillPoints() {
        if input.count == 0 {
            clearPointViews()
        } else if input.count == 1 {
            firstPointView?.backgroundColor = Constants.blueColor
        } else if input.count == 2 {
            secondPointView?.backgroundColor = Constants.blueColor
        } else if input.count == 3 {
            thirdPointView?.backgroundColor = Constants.blueColor
        } else if input.count == 4 {
            fourthPointView?.backgroundColor = Constants.blueColor
        }
    }
    
    func check() {
        if input.count == 4 {
            if input == Constants.password {
                let alert = UIAlertController(title: "Authorization", message: "Authorized", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default) {_ in
                    self.clearPointViews()
                    self.input = ""
                }
                alert.addAction(action)
                present(alert, animated: true)
            } else {
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.07
                animation.repeatCount = 4
                animation.autoreverses = true
                animation.fromValue = NSValue(cgPoint: CGPoint(x: pointsView!.center.x - 15, y: pointsView!.center.y))
                animation.toValue = NSValue(cgPoint: CGPoint(x: pointsView!.center.x + 15, y: pointsView!.center.y))
                animation.delegate = self
                pointsView?.layer.add(animation, forKey: "position")
            }
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        clearPointViews()
        input = ""
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }

    func clearPointViews() {
        firstPointView?.backgroundColor = UIColor.clear
        secondPointView?.backgroundColor = UIColor.clear
        thirdPointView?.backgroundColor = UIColor.clear
        fourthPointView?.backgroundColor = UIColor.clear
    }
}

