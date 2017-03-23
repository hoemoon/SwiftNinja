//
//  MyView.swift
//  MyView
//
//  Created by hoemoon on 22/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class MyView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let gradi = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [randomUIColor().cgColor, randomUIColor().cgColor] as CFArray, locations: nil)
        
        context?.drawLinearGradient(gradi!, start: CGPoint(x: self.bounds.midX, y: self.bounds.minY) , end: CGPoint(x: self.bounds.midX, y: self.bounds.maxY), options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        drawLine()
        drawArc()
    }
    
    func randomUIColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    func randomFloat256() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }
    
    func drawLine() {
        for _ in 1...10 {
            let myBezier = UIBezierPath()
            myBezier.move(to: CGPoint(x: randomX(), y: randomY()))
            myBezier.addLine(to: CGPoint(x: randomX(), y: randomY()))
            
            randomUIColor().setStroke()
            myBezier.stroke()
        }
    }
    
    func drawArc() {
        for _ in 1...10 {
            let centerPoint = CGPoint(x: randomX(), y: randomY())
            let randomColor = randomUIColor()
            let ciclePath: UIBezierPath = UIBezierPath(arcCenter: centerPoint, radius: CGFloat(randomX() / 2), startAngle: CGFloat((random360()).rad), endAngle: CGFloat((random360()).rad), clockwise: true)
            ciclePath.addLine(to: centerPoint)
            ciclePath.close()
            ciclePath.stroke()
            
            UIColor.clear.setStroke()
            randomColor.setFill()
            ciclePath.fill()
            
//            let layer = CAShapeLayer()
//            layer.path = ciclePath.cgPath
//            layer.fillColor = randomColor
//            layer.backgroundColor = nil
//            layer.strokeColor = randomColor
//            
//            self.layer.addSublayer(layer)
        }
    }
    
    func random360() -> Int {
        return Int(arc4random_uniform(360))
    }
    
    func randomX() -> Int {
        return Int(arc4random_uniform(UInt32(self.bounds.maxX)))
    }
    func randomY() -> Int {
        return Int(arc4random_uniform(UInt32(self.bounds.maxY)))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let sublayers = self.layer.sublayers else { return }
        for layer in sublayers {
            layer.isHidden = true
        }
        self.setNeedsDisplay()
    }
}

extension Int {
    var rad: Double { return Double(self) * .pi / 180 }
}
