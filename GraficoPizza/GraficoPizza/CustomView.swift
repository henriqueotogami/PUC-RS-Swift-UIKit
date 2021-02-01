//
//  CustomView.swift
//  GraficoPizza
//
//  Created by Henrique Matheus Alves Pereira on 31/01/21.
//

import UIKit
import QuartzCore

@IBDesignable
class CustomView: UIView {

    var backgroundLayer: CAShapeLayer!
    var lineWidth: Double = 0.0
    var pieOverLayer: CAShapeLayer!
    
    @IBInspectable var piePercentage:Double = 0.0
    {
        willSet(newPiePercentage) { updatePiePercentage(newPiePercentage: newPiePercentage)}
        }
    
    @IBInspectable
    var pieColor:UIColor = UIColor(red: 49/255, green: 209/255, blue: 102/255, alpha: 1)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lineWidth = Double(self.frame.size.width)/2
        
        if !(backgroundLayer != nil) {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
            
            
            let rect = bounds.insetBy(dx: CGFloat(lineWidth / 2.0) ,dy: CGFloat(lineWidth / 2.0))
            let path = UIBezierPath(ovalIn: rect)
            
            backgroundLayer.path = path.cgPath
            
            backgroundLayer.fillColor = nil
            backgroundLayer.lineWidth = CGFloat(lineWidth)
            backgroundLayer.strokeColor = UIColor(white: 0.5, alpha: 0.3).cgColor
            
        }
        
        backgroundLayer.frame = layer.bounds
        
        if !(pieOverLayer != nil) {
            pieOverLayer = CAShapeLayer()
            layer.addSublayer(pieOverLayer)
            
            
            let rect = bounds.insetBy(dx: CGFloat(lineWidth / 2.0) ,dy: CGFloat(lineWidth / 2.0))
            let path = UIBezierPath(ovalIn: rect)
            
            pieOverLayer.path = path.cgPath
            
            pieOverLayer.fillColor = nil
            pieOverLayer.lineWidth = CGFloat(lineWidth)
            pieOverLayer.strokeColor = pieColor.cgColor
            pieOverLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            pieOverLayer.transform = CATransform3DRotate(pieOverLayer.transform, CGFloat(-Double.pi/2), 0, 0, 1)
        }
        
        pieOverLayer.frame = layer.bounds
        
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
            if (pieOverLayer != nil) {
                self.pieOverLayer.strokeEnd = CGFloat( piePercentage / 100)
            }
        }
    
    func updatePiePercentage(newPiePercentage: Double)
        {
            if (pieOverLayer != nil)
            {
                
                CATransaction.begin()
                let animation = CABasicAnimation(keyPath: "strokeEnd")
                animation.duration = ((newPiePercentage/100) - (self.piePercentage/100)) * 3
                animation.fromValue = self.piePercentage / 100
                animation.toValue = newPiePercentage / 100
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                
                
                CATransaction.setCompletionBlock({ () -> Void in
                    CATransaction.begin()
                    CATransaction.setValue(kCFBooleanTrue,forKey:kCATransactionDisableActions)
                    self.pieOverLayer.strokeEnd = CGFloat(newPiePercentage / 100)
                    CATransaction.commit()
                    
                })
                
                self.pieOverLayer.add(animation, forKey: "animateStrokeEnd")
                
                CATransaction.commit()
                
            }
        }
}
