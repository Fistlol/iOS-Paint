//
//  CustomView.swift
//  Drawing
//
//  Created by Абзал Арстанов on 2/19/21.
//

import UIKit

class CustomView: UIView {
//    var point1: CGPoint? --- Demo
//    var point2: CGPoint!
    
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
    }
    
    var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        // Drawing code --- Demo
//        let circle = Circle.init(with: 100, and: CGPoint(x: 100, y: 200), withSome: .black, and: 4, isFilled: false)
//        circle.drawPath()
//        let rect = Rectangle(p1: center, p2: CGPoint(x: 0, y: 0), color: .red, stroke_width: 10, isFilled: false)
//        rect.drawPath()
//        if let p1 = point1 {
//            let rect = Rectangle(p1: p1, p2: point2, color: .green, stroke_width: 3, isFilled: false)
//            rect.drawPath()
//        }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            point1 = touch.location(in: self)
//        }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            point2 = touch.location(in: self)
//        }
//        setNeedsDisplay()
//    }
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)
        
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
        
    }
    
//    var line = [CGPoint]()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
//        print(point)
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        lines.append(lastLine)
        
//        var lastLine = lines.last
//        lastLine?.append(point)
        
//        line.append(point)
        
        setNeedsDisplay()
    }
    
}
