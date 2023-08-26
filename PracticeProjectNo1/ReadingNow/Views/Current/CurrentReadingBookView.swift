//
//  CurrentReadingBookView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class CurrentReadingBookView: UIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var instructorButton: UIButton!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var completionPercentLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var circleBadgeIcon: UIImageView!
    
    private var darkBottomGradientLayer: CAGradientLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inialisingState()
        addParent(customView: selfView)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        inialisingState()
        addParent(customView: selfView)
        configureUI()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        darkBottomGradientLayer?.frame = rect
    }
    
    func inialisingState() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
    }
    
    func addParent(customView: UIView) {
        customView.frame = bounds
        addSubview(customView)
    }
    
    func configureUI() {
        configureInstructorButton()
        separatorView.backgroundColor = .systemGray5
        currentLabel.attributedText = NSAttributedString.getMainBoldFont(text: "Current", size: 18, color: .black)
        
        bookCoverImageView.clipsToBounds = false
        bookCoverImageView.backgroundColor = .clear
        bookCoverImageView.image = UIImage(named: "swiftexpert")
        bookCoverImageView.layer.setBookShadow()
        
        let interaction = UIContextMenuInteraction(delegate: self)
        bookCoverImageView.isUserInteractionEnabled = true
        bookCoverImageView.addInteraction(interaction)
        
        bookTitleLabel.attributedText = NSAttributedString.getSystemFont(text: "Expert_Swift_v1.0.0", size: 14, color: .black)
        
        completionPercentLabel.attributedText = NSAttributedString.getSystemFont(text: "42%", size: 12, color: UIColor.systemGray)
        
        moreButton.setTitle("", for: .normal)
        moreButton.tintColor = UIColor.systemGray
        
        darkBottomGradientLayer = CAGradientLayer()
        darkBottomGradientLayer?.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.1).cgColor]
        darkBottomGradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
        darkBottomGradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        darkBottomGradientLayer?.frame = bounds
        selfView.layer.insertSublayer(darkBottomGradientLayer ?? CALayer(), at: 0)
        
        set(model: nil)
        
    }
    
    private func configureInstructorButton() {
        circleBadgeIcon.tintColor = UIColor.systemGray
        instructorButton.setImage(nil, for: .normal)
        instructorButton.setAttributedTitle(NSAttributedString.getSystemFont(text: "New! Read nore with daily reading goals.", size: 12, color: .systemBlue), for: .normal)
        instructorButton.contentMode = .left
        
    }
    
    
    @IBAction func instructorButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func moreButtonTapped(_ sender: UIButton) {
        
    }
    
    func set(model: CurrentModel?) {
        
        guard let model else {
            startLoading()
            return
        }
        
        endLoading()
        
        bookCoverImageView.downloadImage(from: model.coverUrl)
        bookTitleLabel.attributedText = NSAttributedString.getSystemFont(text: model.title, size: 14, color: .black)
        completionPercentLabel.attributedText = NSAttributedString.getSystemFont(text: "\(model.completed)%", size: 12, color: UIColor.systemGray)
        
    }
    
}

extension CurrentReadingBookView: UIContextMenuInteractionDelegate {
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let shareAction = UIAction(title: "Share PDF", image: UIImage(systemName: "square.and.arrow.up")) { action in
            print(action.title)
        }
        let wantRead = UIAction(title: "Add to Want to Read", image: UIImage(systemName: "list.star")) { action in
            print(action.title)
        }
        let addToCollection = UIAction(title: "Add to Collections", image: UIImage(systemName: "list.star")) { action in
            print(action.title)
        }
        let markAsFinished = UIAction(title: "Mark as Finished", image: UIImage(systemName: "checklist.checked")) { action in
            print(action.title)
        }
        let rename = UIAction(title: "Rename...", image: UIImage(systemName: "character.cursor.ibeam")) { action in
            print(action.title)
        }
        let remove = UIAction(title: "Remove", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
            print(action.title)
        }
        
        let shareMenu = UIMenu(options: .displayInline, children: [shareAction])
        let simpleMenu = UIMenu(options: .displayInline, children: [wantRead, addToCollection, markAsFinished])
        let renameMenu = UIMenu(options: .displayInline, children: [rename])
        let removeMenu = UIMenu(options: .displayInline, children: [shareMenu, simpleMenu, rename, remove])

        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            removeMenu
        }
        
    }
    
}
