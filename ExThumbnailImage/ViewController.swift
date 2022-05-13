//
//  ViewController.swift
//  ExThumbnailImage
//
//  Created by Jake.K on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {
  private enum Constant {
    static let thumbnailSize = 100.0
    static let thumbnailCGSize = CGSize(width: Constant.thumbnailSize, height: Constant.thumbnailSize)
    static let borderWidth = 2.0
    static let spacing = 4.0
  }
  
  private let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let imageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "dog")
    view.layer.cornerRadius = (Constant.thumbnailSize - Constant.spacing * 2) / 2.0
    view.clipsToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.containerView)
    self.containerView.addSubview(self.imageView)
    
    NSLayoutConstraint.activate([
      self.containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.containerView.heightAnchor.constraint(equalToConstant: Constant.thumbnailSize),
      self.containerView.widthAnchor.constraint(equalToConstant: Constant.thumbnailSize),
    ])
    NSLayoutConstraint.activate([
      self.imageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: Constant.spacing),
      self.imageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -Constant.spacing),
      self.imageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -Constant.spacing),
      self.imageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: Constant.spacing),
    ])
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    guard self.containerView.layer.sublayers?.contains(where: { $0 is CAGradientLayer }) == false else { return }

    let gradient = CAGradientLayer()
    gradient.frame = CGRect(origin: CGPoint.zero, size: Constant.thumbnailCGSize)
    gradient.colors = [UIColor.blue, UIColor.green].map(\.cgColor)

    let shape = CAShapeLayer()
    shape.lineWidth = Constant.borderWidth
    shape.path = UIBezierPath(
      roundedRect: self.containerView.bounds.insetBy(dx: Constant.borderWidth + 5, dy: Constant.borderWidth + 5),
      cornerRadius: Constant.thumbnailSize / 2.0
    ).cgPath
    shape.strokeColor = UIColor.black.cgColor
    shape.fillColor = UIColor.clear.cgColor
    gradient.mask = shape

    self.containerView.layer.addSublayer(gradient)
  }
}
