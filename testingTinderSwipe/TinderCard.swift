//
//  TinderCard.swift
//  testingTinderSwipe
//
//  Created by Nicky on 11/16/17.
//  Copyright © 2017 Nicky. All rights reserved.
//
let PHOTOS = ["photo1","photo2", "photo3", "photo4", "photo5", "photo5"]
let NAMES = ["Alice Roberts","Kristen Bystrom","Zhi Yuh Ou Yang","Charlene Nicer","Nicholas Chin", "Nicholas Chin"]
let DEPTS = ["Data & Analytics", "Data & Analytics", "Finance & Accounting", "Software Development", "Software Development", "Software Development"]
let ROLES = ["Senior Optimization Analyst", "Applied Data Scientist", "Financial Analyst", "Software Developer II - IT Integration", "Senior Software Developer - eCommerce Web", "Senior Software Developer - eCommerce Web"]
let THERESOLD_MARGIN = (UIScreen.main.bounds.size.width/2) * 0.75
let SCALE_STRENGTH : CGFloat = 4
let SCALE_RANGE : CGFloat = 0.90
var count = 0


import UIKit


protocol TinderCardDelegate: NSObjectProtocol {
    func cardGoesLeft(card: TinderCard)
    func cardGoesRight(card: TinderCard)
    func currentCardStatus(card: TinderCard, distance: CGFloat)
}

class TinderCard: UIView {
    
    var xCenter: CGFloat = 0.0
    var yCenter: CGFloat = 0.0
    var originalPoint = CGPoint.zero
    var imageViewStatus = UIImageView()
    var overLayImage = UIImageView()
    var isLiked = false
    
    
    weak var delegate: TinderCardDelegate?
    
    public init(frame: CGRect, value: String) {
        super.init(frame: frame)
        setupView(at: value)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(at value:String) {
        
        layer.cornerRadius = 20
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0.5, height: 3)
        layer.shadowColor = UIColor.darkGray.cgColor
        clipsToBounds = true
        isUserInteractionEnabled = false
        originalPoint = center
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.beingDragged))
        addGestureRecognizer(panGestureRecognizer)
        
        let backGroundImageView = UIImageView(frame:bounds)
        backGroundImageView.image = UIImage(named:String(Int(1 + count % (8 - 1))))
        backGroundImageView.contentMode = .scaleAspectFill
        backGroundImageView.clipsToBounds = true;
        addSubview(backGroundImageView)
        
        let profileImageView = UIImageView(frame:CGRect(x: 20, y: frame.size.height - 80, width: 60, height: 60))
        profileImageView.image = UIImage(named:PHOTOS[count])
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 25
        profileImageView.clipsToBounds = true
        addSubview(profileImageView)
        

        let header = UILabel(frame:CGRect(x: 30, y: frame.size.height - 500, width: frame.size.width - 250, height: 45))
        header.textAlignment = .center
        header.layer.backgroundColor = UIColor.orange.cgColor
        header.layer.borderColor = UIColor.white.cgColor
        header.layer.borderWidth = 1
        header.layer.cornerRadius = 4
        addSubview(header)
        let attributedHeader = NSMutableAttributedString(string: " WANTS ", attributes: [.foregroundColor: UIColor.darkText,.font:UIFont.boldSystemFont(ofSize:20),])
        header.attributedText = attributedHeader
        addSubview(header)
        
        let header2 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 500, width: frame.size.width - 250, height: 45))
        header2.textAlignment = .center
        header2.layer.backgroundColor = UIColor.orange.cgColor
        header2.layer.borderColor = UIColor.white.cgColor
        header2.layer.borderWidth = 1
        header2.layer.cornerRadius = 4
        addSubview(header)
        let attributedHeader2 = NSMutableAttributedString(string: " HAS ", attributes: [.foregroundColor: UIColor.darkText,.font:UIFont.boldSystemFont(ofSize:20),])
        header2.attributedText = attributedHeader2
        addSubview(header2)

        // ALICE
        if (count == 0) {
            let wantTag = UILabel(frame:CGRect(x: 30, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            wantTag.textAlignment = .center
            wantTag.layer.backgroundColor = UIColor.white.cgColor
            wantTag.layer.borderColor = UIColor.lightGray.cgColor
            wantTag.layer.borderWidth = 1
            wantTag.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST = NSMutableAttributedString(string: " Python ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag.attributedText = attributedST
            addSubview(wantTag)
            
            let wantTag2 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            wantTag2.textAlignment = .center
            wantTag2.layer.backgroundColor = UIColor.white.cgColor
            wantTag2.layer.borderColor = UIColor.lightGray.cgColor
            wantTag2.layer.borderWidth = 1
            wantTag2.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST2 = NSMutableAttributedString(string: " C++ ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag2.attributedText = attributedST2
            addSubview(wantTag2)
            
            let haveTag = UILabel(frame:CGRect(x: 220, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            haveTag.textAlignment = .center
            haveTag.layer.backgroundColor = UIColor.white.cgColor
            haveTag.layer.borderColor = UIColor.lightGray.cgColor
            haveTag.layer.borderWidth = 1
            haveTag.layer.cornerRadius = 4
            addSubview(haveTag)
            let attributedHT = NSMutableAttributedString(string: " Java ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag.attributedText = attributedHT
            addSubview(haveTag)
            
            let haveTag2 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            haveTag2.textAlignment = .center
            haveTag2.layer.backgroundColor = UIColor.white.cgColor
            haveTag2.layer.borderColor = UIColor.lightGray.cgColor
            haveTag2.layer.borderWidth = 1
            haveTag2.layer.cornerRadius = 4
            addSubview(haveTag2)
            let attributedHT2 = NSMutableAttributedString(string: " Public Speaking ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag2.attributedText = attributedHT2
            addSubview(haveTag2)
            
        }
        // KRISTEN
        if (count == 1) {
            let wantTag = UILabel(frame:CGRect(x: 30, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            wantTag.textAlignment = .center
            wantTag.layer.backgroundColor = UIColor.white.cgColor
            wantTag.layer.borderColor = UIColor.lightGray.cgColor
            wantTag.layer.borderWidth = 1
            wantTag.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST = NSMutableAttributedString(string: " C++ ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag.attributedText = attributedST
            addSubview(wantTag)
            
            let wantTag2 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            wantTag2.textAlignment = .center
            wantTag2.layer.backgroundColor = UIColor.white.cgColor
            wantTag2.layer.borderColor = UIColor.lightGray.cgColor
            wantTag2.layer.borderWidth = 1
            wantTag2.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST2 = NSMutableAttributedString(string: " Java ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag2.attributedText = attributedST2
            addSubview(wantTag2)
            
            let haveTag = UILabel(frame:CGRect(x: 220, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            haveTag.textAlignment = .center
            haveTag.layer.backgroundColor = UIColor.white.cgColor
            haveTag.layer.borderColor = UIColor.lightGray.cgColor
            haveTag.layer.borderWidth = 1
            haveTag.layer.cornerRadius = 4
            addSubview(haveTag)
            let attributedHT = NSMutableAttributedString(string: " Python ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag.attributedText = attributedHT
            addSubview(haveTag)
            
            let haveTag2 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            haveTag2.textAlignment = .center
            haveTag2.layer.backgroundColor = UIColor.white.cgColor
            haveTag2.layer.borderColor = UIColor.lightGray.cgColor
            haveTag2.layer.borderWidth = 1
            haveTag2.layer.cornerRadius = 4
            addSubview(haveTag2)
            let attributedHT2 = NSMutableAttributedString(string: " Public Speaking ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag2.attributedText = attributedHT2
            addSubview(haveTag2)
            
            let haveTag3 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 280, width: frame.size.width - 250, height: 45))
            haveTag3.textAlignment = .center
            haveTag3.layer.backgroundColor = UIColor.white.cgColor
            haveTag3.layer.borderColor = UIColor.lightGray.cgColor
            haveTag3.layer.borderWidth = 1
            haveTag3.layer.cornerRadius = 4
            addSubview(haveTag3)
            let attributedHT3 = NSMutableAttributedString(string: " Agile ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag3.attributedText = attributedHT3
            addSubview(haveTag3)
            
            let haveTag4 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 210, width: frame.size.width - 250, height: 45))
            haveTag4.textAlignment = .center
            haveTag4.layer.backgroundColor = UIColor.white.cgColor
            haveTag4.layer.borderColor = UIColor.lightGray.cgColor
            haveTag4.layer.borderWidth = 1
            haveTag4.layer.cornerRadius = 4
            addSubview(haveTag4)
            let attributedHT4 = NSMutableAttributedString(string: " Excel ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag4.attributedText = attributedHT4
            addSubview(haveTag4)
        }
        // ZHI YUH
        if (count == 2) {
            let wantTag = UILabel(frame:CGRect(x: 30, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            wantTag.textAlignment = .center
            wantTag.layer.backgroundColor = UIColor.white.cgColor
            wantTag.layer.borderColor = UIColor.lightGray.cgColor
            wantTag.layer.borderWidth = 1
            wantTag.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST = NSMutableAttributedString(string: " Java ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag.attributedText = attributedST
            addSubview(wantTag)
            
            let wantTag2 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            wantTag2.textAlignment = .center
            wantTag2.layer.backgroundColor = UIColor.white.cgColor
            wantTag2.layer.borderColor = UIColor.lightGray.cgColor
            wantTag2.layer.borderWidth = 1
            wantTag2.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST2 = NSMutableAttributedString(string: " Agile ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag2.attributedText = attributedST2
            addSubview(wantTag2)
            
            let wantTag3 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 280, width: frame.size.width - 250, height: 45))
            wantTag3.textAlignment = .center
            wantTag3.layer.backgroundColor = UIColor.white.cgColor
            wantTag3.layer.borderColor = UIColor.lightGray.cgColor
            wantTag3.layer.borderWidth = 1
            wantTag3.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST3 = NSMutableAttributedString(string: " Python ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag3.attributedText = attributedST3
            addSubview(wantTag3)
            
            
            let haveTag = UILabel(frame:CGRect(x: 220, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            haveTag.textAlignment = .center
            haveTag.layer.backgroundColor = UIColor.white.cgColor
            haveTag.layer.borderColor = UIColor.lightGray.cgColor
            haveTag.layer.borderWidth = 1
            haveTag.layer.cornerRadius = 4
            addSubview(haveTag)
            let attributedHT = NSMutableAttributedString(string: " Excel ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag.attributedText = attributedHT
            addSubview(haveTag)
            
            let haveTag2 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            haveTag2.textAlignment = .center
            haveTag2.layer.backgroundColor = UIColor.white.cgColor
            haveTag2.layer.borderColor = UIColor.lightGray.cgColor
            haveTag2.layer.borderWidth = 1
            haveTag2.layer.cornerRadius = 4
            addSubview(haveTag2)
            let attributedHT2 = NSMutableAttributedString(string: " R ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag2.attributedText = attributedHT2
            addSubview(haveTag2)
        }
        // CHARLENE
        if (count == 3) {
            let wantTag = UILabel(frame:CGRect(x: 30, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            wantTag.textAlignment = .center
            wantTag.layer.backgroundColor = UIColor.white.cgColor
            wantTag.layer.borderColor = UIColor.lightGray.cgColor
            wantTag.layer.borderWidth = 1
            wantTag.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST = NSMutableAttributedString(string: " Javascript ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag.attributedText = attributedST
            addSubview(wantTag)
            
            let wantTag2 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            wantTag2.textAlignment = .center
            wantTag2.layer.backgroundColor = UIColor.white.cgColor
            wantTag2.layer.borderColor = UIColor.lightGray.cgColor
            wantTag2.layer.borderWidth = 1
            wantTag2.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST2 = NSMutableAttributedString(string: " Public Speaking ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag2.attributedText = attributedST2
            addSubview(wantTag2)
            
            let haveTag = UILabel(frame:CGRect(x: 220, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            haveTag.textAlignment = .center
            haveTag.layer.backgroundColor = UIColor.white.cgColor
            haveTag.layer.borderColor = UIColor.lightGray.cgColor
            haveTag.layer.borderWidth = 1
            haveTag.layer.cornerRadius = 4
            addSubview(haveTag)
            let attributedHT = NSMutableAttributedString(string: " Machine Learning ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag.attributedText = attributedHT
            addSubview(haveTag)
            
            let haveTag2 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            haveTag2.textAlignment = .center
            haveTag2.layer.backgroundColor = UIColor.white.cgColor
            haveTag2.layer.borderColor = UIColor.lightGray.cgColor
            haveTag2.layer.borderWidth = 1
            haveTag2.layer.cornerRadius = 4
            addSubview(haveTag2)
            let attributedHT2 = NSMutableAttributedString(string: " Python ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag2.attributedText = attributedHT2
            addSubview(haveTag2)
        }
        // NICHOLAS
        if (count == 4) {
            let wantTag = UILabel(frame:CGRect(x: 30, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            wantTag.textAlignment = .center
            wantTag.layer.backgroundColor = UIColor.white.cgColor
            wantTag.layer.borderColor = UIColor.lightGray.cgColor
            wantTag.layer.borderWidth = 1
            wantTag.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST = NSMutableAttributedString(string: " Javascript ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag.attributedText = attributedST
            addSubview(wantTag)
            
            let wantTag2 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            wantTag2.textAlignment = .center
            wantTag2.layer.backgroundColor = UIColor.white.cgColor
            wantTag2.layer.borderColor = UIColor.lightGray.cgColor
            wantTag2.layer.borderWidth = 1
            wantTag2.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST2 = NSMutableAttributedString(string: " React ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag2.attributedText = attributedST2
            addSubview(wantTag2)
            
            let wantTag3 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 280, width: frame.size.width - 250, height: 45))
            wantTag3.textAlignment = .center
            wantTag3.layer.backgroundColor = UIColor.white.cgColor
            wantTag3.layer.borderColor = UIColor.lightGray.cgColor
            wantTag3.layer.borderWidth = 1
            wantTag3.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST3 = NSMutableAttributedString(string: " Agile ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag3.attributedText = attributedST3
            addSubview(wantTag3)
            
            let wantTag4 = UILabel(frame:CGRect(x: 30, y: frame.size.height - 210, width: frame.size.width - 250, height: 45))
            wantTag4.textAlignment = .center
            wantTag4.layer.backgroundColor = UIColor.white.cgColor
            wantTag4.layer.borderColor = UIColor.lightGray.cgColor
            wantTag4.layer.borderWidth = 1
            wantTag4.layer.cornerRadius = 4
            addSubview(wantTag)
            let attributedST4 = NSMutableAttributedString(string: " Java ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            wantTag4.attributedText = attributedST4
            addSubview(wantTag4)
            
            let haveTag = UILabel(frame:CGRect(x: 220, y: frame.size.height - 420, width: frame.size.width - 250, height: 45))
            haveTag.textAlignment = .center
            haveTag.layer.backgroundColor = UIColor.white.cgColor
            haveTag.layer.borderColor = UIColor.lightGray.cgColor
            haveTag.layer.borderWidth = 1
            haveTag.layer.cornerRadius = 4
            addSubview(haveTag)
            let attributedHT = NSMutableAttributedString(string: " C++ ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag.attributedText = attributedHT
            addSubview(haveTag)
            
            let haveTag2 = UILabel(frame:CGRect(x: 220, y: frame.size.height - 350, width: frame.size.width - 250, height: 45))
            haveTag2.textAlignment = .center
            haveTag2.layer.backgroundColor = UIColor.white.cgColor
            haveTag2.layer.borderColor = UIColor.lightGray.cgColor
            haveTag2.layer.borderWidth = 1
            haveTag2.layer.cornerRadius = 4
            addSubview(haveTag2)
            let attributedHT2 = NSMutableAttributedString(string: " Python ", attributes: [.foregroundColor: UIColor.black,.font:UIFont.systemFont(ofSize:20),])
            haveTag2.attributedText = attributedHT2
            addSubview(haveTag2)
        }
        
        let labelText = UILabel(frame:CGRect(x: 90, y: frame.size.height - 80, width: frame.size.width - 100, height: 60))
        let labelTextDept = UILabel(frame:CGRect(x:
            90, y: frame.size.height - 55, width: frame.size.width - 100, height: 60))
        let labelTextRole = UILabel(frame:CGRect(x: 90, y: frame.size.height - 105, width: frame.size.width - 100, height: 60))
        
        let attributedText = NSMutableAttributedString(string: NAMES[Int(count)] , attributes: [.foregroundColor: UIColor.white,.font:UIFont.boldSystemFont(ofSize: 25)])
        let attributedTextRole = NSAttributedString(string: ROLES[Int(count)], attributes: [.foregroundColor: UIColor.white,.font:UIFont.systemFont(ofSize: 15)])
        let attributedTextDept = NSMutableAttributedString(string: DEPTS[Int(count)], attributes: [.foregroundColor: UIColor.white,.font:UIFont.boldSystemFont(ofSize:16)])
        count += 1
        
        labelText.attributedText = attributedText
        labelTextDept.attributedText = attributedTextDept
        labelTextRole.attributedText = attributedTextRole
        
        labelText.numberOfLines = 3
        addSubview(labelText)
        addSubview(labelTextDept)
        addSubview(labelTextRole)
        
        imageViewStatus = UIImageView(frame: CGRect(x: (frame.size.width / 2) - 37.5, y: 25, width: 75, height: 75))
        imageViewStatus.alpha = 0
        addSubview(imageViewStatus)
        
        overLayImage = UIImageView(frame:bounds)
        overLayImage.alpha = 0
        addSubview(overLayImage)
    }
    
    @objc func beingDragged(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        xCenter = gestureRecognizer.translation(in: self).x
        yCenter = gestureRecognizer.translation(in: self).y
        switch gestureRecognizer.state {
        // Keep swiping
        case .began:
            originalPoint = self.center;
            break;
        //in the middle of a swipe
        case .changed:
            let rotationStrength = min(xCenter / UIScreen.main.bounds.size.width, 1)
            let rotationAngel = .pi/8 * rotationStrength
            let scale = max(1 - abs(rotationStrength) / SCALE_STRENGTH, SCALE_RANGE)
            center = CGPoint(x: originalPoint.x + xCenter, y: originalPoint.y + yCenter)
            let transforms = CGAffineTransform(rotationAngle: rotationAngel)
            let scaleTransform: CGAffineTransform = transforms.scaledBy(x: scale, y: scale)
            self.transform = scaleTransform
            updateOverlay(xCenter)
            break;
            
        // swipe ended
        case .ended:
            afterSwipeAction()
            break;
            
        case .possible:break
        case .cancelled:break
        case .failed:break
        }
    }
    func updateOverlay(_ distance: CGFloat) {
        
        imageViewStatus.image = distance > 0 ? #imageLiteral(resourceName: "btn_like_pressed") : #imageLiteral(resourceName: "btn_skip_pressed")
        overLayImage.image = distance > 0 ? #imageLiteral(resourceName: "overlay_like") : #imageLiteral(resourceName: "overlay_skip")
        imageViewStatus.alpha = min(abs(distance) / 100, 0.5)
        overLayImage.alpha = min(abs(distance) / 100, 0.5)
        delegate?.currentCardStatus(card: self, distance: distance)
    }
    
    func afterSwipeAction() {
        
        if xCenter > THERESOLD_MARGIN {
            rightAction()
        }
        else if xCenter < -THERESOLD_MARGIN {
            leftAction()
        }
        else {
            //reseting image
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: [], animations: {
                self.center = self.originalPoint
                self.transform = CGAffineTransform(rotationAngle: 0)
                self.imageViewStatus.alpha = 0
                self.overLayImage.alpha = 0
                self.delegate?.currentCardStatus(card: self, distance:0)
            })
        }
    }
    
    func rightAction() {
        
        let finishPoint = CGPoint(x: frame.size.width*2, y: 2 * yCenter + originalPoint.y)
        UIView.animate(withDuration: 0.5, animations: {
            self.center = finishPoint
        }, completion: {(_) in
            self.removeFromSuperview()
        })
        isLiked = true
        delegate?.cardGoesRight(card: self)
        print("WATCHOUT RIGHT")
    }
    
    func leftAction() {
        
        let finishPoint = CGPoint(x: -frame.size.width*2, y: 2 * yCenter + originalPoint.y)
        UIView.animate(withDuration: 0.5, animations: {
            self.center = finishPoint
        }, completion: {(_) in
            self.removeFromSuperview()
        })
        isLiked = false
        delegate?.cardGoesLeft(card: self)
        print("WATCHOUT LEFT")
    }
    
    // right click action
    func rightClickAction() {
        
        imageViewStatus.image = #imageLiteral(resourceName: "btn_like_pressed")
        overLayImage.image = #imageLiteral(resourceName: "overlay_like")
        let finishPoint = CGPoint(x: center.x + frame.size.width * 2, y: center.y)
        imageViewStatus.alpha = 0.5
        overLayImage.alpha = 0.5
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            self.center = finishPoint
            self.transform = CGAffineTransform(rotationAngle: 1)
            self.imageViewStatus.alpha = 1.0
            self.overLayImage.alpha = 1.0
        }, completion: {(_ complete: Bool) -> Void in
            self.removeFromSuperview()
        })
        isLiked = true
        delegate?.cardGoesRight(card: self)
        print("WATCHOUT RIGHT ACTION")
    }
    // left click action
    func leftClickAction() {
        
        imageViewStatus.image = #imageLiteral(resourceName: "btn_skip_pressed")
        overLayImage.image = #imageLiteral(resourceName: "overlay_skip")
        let finishPoint = CGPoint(x: center.x - frame.size.width * 2, y: center.y)
        imageViewStatus.alpha = 0.5
        overLayImage.alpha = 0.5
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            self.center = finishPoint
            self.transform = CGAffineTransform(rotationAngle: -1)
            self.imageViewStatus.alpha = 1.0
            self.overLayImage.alpha = 1.0
        }, completion: {(_ complete: Bool) -> Void in
            self.removeFromSuperview()
        })
        isLiked = false
        delegate?.cardGoesLeft(card: self)
        print("WATCHOUT LEFT ACTION")
    }
    
    // undoing  action
    func makeUndoAction() {
        
        imageViewStatus.image = isLiked ? #imageLiteral(resourceName: "btn_like_pressed") : #imageLiteral(resourceName: "btn_skip_pressed")
        overLayImage.image = isLiked ? #imageLiteral(resourceName: "overlay_like") : #imageLiteral(resourceName: "overlay_skip")
        imageViewStatus.alpha = 1.0
        overLayImage.alpha = 1.0
        UIView.animate(withDuration: 0.4, animations: {() -> Void in
            self.center = self.originalPoint
            self.transform = CGAffineTransform(rotationAngle: 0)
            self.imageViewStatus.alpha = 0
            self.overLayImage.alpha = 0
        })
        
        print("WATCHOUT UNDO ACTION")
    }
    
    func rollBackCard(){
        
        UIView.animate(withDuration: 0.5) {
            self.removeFromSuperview()
        }
    }
    
    func shakeAnimationCard(){
        
        imageViewStatus.image = #imageLiteral(resourceName: "btn_skip_pressed")
        overLayImage.image = #imageLiteral(resourceName: "overlay_skip")
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.center = CGPoint(x: self.center.x - (self.frame.size.width / 2), y: self.center.y)
            self.transform = CGAffineTransform(rotationAngle: -0.2)
            self.imageViewStatus.alpha = 1.0
            self.overLayImage.alpha = 1.0
        }, completion: {(_) -> Void in
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.imageViewStatus.alpha = 0
                self.overLayImage.alpha = 0
                self.center = self.originalPoint
                self.transform = CGAffineTransform(rotationAngle: 0)
            }, completion: {(_ complete: Bool) -> Void in
                self.imageViewStatus.image = #imageLiteral(resourceName: "btn_like_pressed")
                self.overLayImage.image =  #imageLiteral(resourceName: "overlay_like")
                UIView.animate(withDuration: 0.5, animations: {() -> Void in
                    self.imageViewStatus.alpha = 1
                    self.overLayImage.alpha = 1
                    self.center = CGPoint(x: self.center.x + (self.frame.size.width / 2), y: self.center.y)
                    self.transform = CGAffineTransform(rotationAngle: 0.2)
                }, completion: {(_ complete: Bool) -> Void in
                    UIView.animate(withDuration: 0.5, animations: {() -> Void in
                        self.imageViewStatus.alpha = 0
                        self.overLayImage.alpha = 0
                        self.center = self.originalPoint
                        self.transform = CGAffineTransform(rotationAngle: 0)
                    })
                })
            })
        })
        
        print("WATCHOUT SHAKE ACTION")
    }
}


