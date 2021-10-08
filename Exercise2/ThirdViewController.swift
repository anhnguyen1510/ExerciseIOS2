//
//  ThirdViewController.swift
//  Exercise2
//
//  Created by Anhnguyen on 09/10/2021.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var centralWidth: NSLayoutConstraint!
    @IBOutlet weak var secondWidth: NSLayoutConstraint!
    @IBOutlet weak var minuteWidth: NSLayoutConstraint!
    @IBOutlet weak var hourWidth: NSLayoutConstraint!
    
    @IBOutlet weak var frameWidth: NSLayoutConstraint!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var minuteImageView: UIImageView!
    @IBOutlet weak var hourImageView: UIImageView!
    
    private var scale: CGFloat = 1.0 {
        didSet {
            updateUIByScaleValue()
        }
    }
    private var timer: Timer?
    private let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    private let units = [Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond]
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        start()
    }
    
    private func configUI() {
        hourImageView?.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        minuteImageView?.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        secondImageView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.7)
    }
    
    private func updateUIByScaleValue() {
        frameWidth?.constant = (frameWidth?.constant ?? 0) * scale
        hourWidth?.constant = (hourWidth?.constant ?? 0) * scale
        minuteWidth?.constant = (minuteWidth?.constant ?? 0) * scale
        secondWidth?.constant = (secondWidth?.constant ?? 0) * scale
        centralWidth?.constant = (centralWidth?.constant ?? 0) * scale
    }

    deinit {
        stop()
    }
    
    func start() {
        tick()
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(tick),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func tick() {
        let components = calendar.dateComponents(Set<Calendar.Component>(units), from: Date())
        guard let hour = components.hour,
            let minute = components.minute,
            let second = components.second,
            let nanoSecond = components.nanosecond else {
                return
        }
        let realSecond = Double(second) + pow(Double(nanoSecond),Double(-9))
        let realMinute = Double(minute) + realSecond / 60.0
        let realHour = Double(hour) + realMinute / 60.0
        let secondAngle = realSecond / 60.0 * .pi * 2.0
        let minuteAngle = realMinute / 60.0 * .pi * 2.0
        let hourAngle = realHour / 12.0 * .pi * 2.0
        
        hourImageView?.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
        minuteImageView?.transform = CGAffineTransform(rotationAngle: CGFloat(minuteAngle))
        secondImageView?.transform = CGAffineTransform(rotationAngle: CGFloat(secondAngle))
    }
}
