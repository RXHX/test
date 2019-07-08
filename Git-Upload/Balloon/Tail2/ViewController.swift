//
//  ViewController.swift
//  Tail2
//
//  Created by Rohan on 02/06/19.
//  Copyright © 2019 Infogain. All rights reserved.
//

import UIKit
class View:UIView{
  
    
    
    
    var balloon : UIView!;
    
    var label = PaddingLabel(withInsets: 12, 12, 12, 12);
    //  var counter:Int = 0;
    
   
    
    
    let gldata = Balloon.sharedInstance;
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews();
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews();
    }
    
    
    func initSubviews()
    {
                balloon = UIView(frame: frame)
        
              //  let nib = UINib(nibName: "View", bundle: nil)
              //  nib.instantiate(withOwner: self, options: nil)
        
                balloon.backgroundColor = UIColor.clear
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 3))
                path.addArc(withCenter: CGPoint(x:5,y:5), radius: 5, startAngle: 0, endAngle: 300, clockwise: true);
                path.addLine(to: CGPoint(x:gldata.triangle_starting_x_point,y:0));
                path.addLine(to: CGPoint(x:gldata.triangle_starting_x_point+5,y:gldata.triangle_height));
                path.addLine(to: CGPoint(x:gldata.triangle_starting_x_point+10,y:0));
                path.addLine(to: CGPoint(x:gldata.width - 3,y:0));
                path.addArc(withCenter: CGPoint(x:gldata.width - 5,y:5), radius: 4.5, startAngle: 0, endAngle: 315, clockwise: true);
                path.addLine(to: CGPoint(x:gldata.width,y:3));
                path.addLine(to: CGPoint(x:gldata.width,y:gldata.height - 3));
                path.addArc(withCenter: CGPoint(x:gldata.width-5,y:gldata.height-5), radius: 4.5, startAngle: 90, endAngle: 180, clockwise: true);
                path.addLine(to: CGPoint(x:gldata.width - 3,y:gldata.height));
                path.addLine(to: CGPoint(x:3,y:gldata.height));
                path.addArc(withCenter: CGPoint(x:5,y:gldata.height-5), radius: 4.5, startAngle: 90, endAngle: 180, clockwise: true);
                path.addLine(to:CGPoint(x:0,y:gldata.height-3));
                path.close()
                let shape = CAShapeLayer()
                shape.fillColor = #colorLiteral(red: 0.2901960784, green: 0.2666666667, blue: 0.2666666667, alpha: 0.9)
                shape.path = path.cgPath
                balloon.layer.addSublayer(shape)
                label.text = gldata.message1;
                label.textAlignment = .left;
                label.font = UIFont.systemFont(ofSize:14);
                label.textColor = UIColor.white;
                label.adjustsFontSizeToFitWidth = true;
                label.numberOfLines = 0;
                balloon.addSubview(label);
                label.bindFrameToSuperviewBounds();
                //         self.view.addSubview(balloon);
               addSubview(balloon);
                //balloon.alpha = 0
    
            }
    }




class PaddingLabel: UILabel {
    
    var topInset: CGFloat
    var bottomInset: CGFloat
    var leftInset: CGFloat
    var rightInset: CGFloat
    
    required init(withInsets top: CGFloat, _ bottom: CGFloat,_ left: CGFloat,_ right: CGFloat) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}

extension UIView {
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true

    }

}
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target:self,action:#selector(dismissView));
//        tap.cancelsTouchesInView = true
//        view.addGestureRecognizer(tap);
//        isClick = false
//    }
//
//
//    // Second Global Instance
//    // static let sharedInstance2 = BalloonMaker();
//    @IBAction func onClick(_ sender: Any) {
//
//
//        isClick = !isClick
//        print(isClick);
//        if isClick{
//            tailmaking(X_coordinate: gldata.X_coordinate,Y_coordinate: gldata.Y_coordinate,width: gldata.width,height: gldata.height,triangle_height: gldata.triangle_height,triangle_starting_x_point: gldata.triangle_starting_x_point,message:gldata.message1);
//        }else{
//            self .dismissView()
//
//        }
//
//
//
//    }
//
    
    
//
//    @objc func dismissView() {
//
//        //  print("Entered Dissmiss View");
//
//
//        UIView.animate(withDuration: 0.7,
//                       delay: 0.20,
//                       options: .curveEaseOut,
//                       animations: {
//                        self.balloon.alpha = 0.0
//        }) { (_) in
//            //    print("Removal");
//            self.balloon.removeFromSuperview();
//            self.isClick = false;
//
//        }
//
//
//    }
//
    
    
//
//
//
//
//    func tailmaking(X_coordinate:CGFloat,Y_coordinate:CGFloat,width:CGFloat,height:CGFloat,triangle_height:CGFloat,triangle_starting_x_point:CGFloat,message:String)
//    {
//
//
//
//
//
//
//
//
//}

//
//
//
//
//
//extension UIView {
//    func bindFrameToSuperviewBounds() {
//        guard let superview = self.superview else {
//            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
//            return
//        }
//
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
//        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
//        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
//        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
//
//    }
//
//
//
//
//
//
//    func initSubviews() {
//
//
//        self.balloon = UIView(frame: CGRect(x: X_coordinate, y: Y_coordinate, width: width, height: height))
//
//        let nib = UINib(nibName: "CaptionableImageView", bundle: nil)
//        nib.instantiate(withOwner: self, options: nil)
//
//        balloon.backgroundColor = UIColor.clear
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 3))
//        path.addArc(withCenter: CGPoint(x:5,y:5), radius: 5, startAngle: 0, endAngle: 300, clockwise: true);
//        path.addLine(to: CGPoint(x:triangle_starting_x_point,y:0));
//        path.addLine(to: CGPoint(x:triangle_starting_x_point+5,y:triangle_height));
//        path.addLine(to: CGPoint(x:triangle_starting_x_point+10,y:0));
//        path.addLine(to: CGPoint(x:width - 3,y:0));
//        path.addArc(withCenter: CGPoint(x:width - 5,y:5), radius: 4.5, startAngle: 0, endAngle: 315, clockwise: true);
//        path.addLine(to: CGPoint(x:width,y:3));
//        path.addLine(to: CGPoint(x:width,y:height - 3));
//        path.addArc(withCenter: CGPoint(x:width-5,y:height-5), radius: 4.5, startAngle: 90, endAngle: 180, clockwise: true);
//        path.addLine(to: CGPoint(x:width - 3,y:height));
//        path.addLine(to: CGPoint(x:3,y:height));
//        path.addArc(withCenter: CGPoint(x:5,y:height-5), radius: 4.5, startAngle: 90, endAngle: 180, clockwise: true);
//        path.addLine(to:CGPoint(x:0,y:height-3));
//        path.close()
//        let shape = CAShapeLayer()
//        shape.fillColor = #colorLiteral(red: 0.2901960784, green: 0.2666666667, blue: 0.2666666667, alpha: 0.9)
//        shape.path = path.cgPath
//        balloon.layer.addSublayer(shape)
//        label.text = message;
//        label.textAlignment = .left;
//        label.font = UIFont.systemFont(ofSize:14);
//        label.textColor = UIColor.white;
//        label.adjustsFontSizeToFitWidth = true;
//        label.numberOfLines = 0;
//        balloon.addSubview(label);
//        label.bindFrameToSuperviewBounds();
//        //         self.view.addSubview(balloon);
//        self.view.addSubview(balloon);
//        balloon.alpha = 0
//        UIView.animate(withDuration: 0.7, delay: 0.20, options: .curveEaseIn, animations: {
//            self.balloon.alpha = 1
//        }, completion: { finished in
//            // print("Basket doors opened!")
//        })
//
//
//    }
//
//
//
//
//
//
//
//
//
//            // custom initialization logic
//
//    }
 
//}



