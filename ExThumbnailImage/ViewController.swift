//
//  ViewController.swift
//  ExThumbnailImage
//
//  Created by Jake.K on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {
  private enum Constant {
    static let thumbnailSize = CGSize(width: 100, height: 100)
    static let borderWidth = 3.0
  }
  
  private let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = Constant.thumbnailSize.width / 2.0
    view.layer.borderWidth = Constant.borderWidth
    view.layer.borderColor = UIColor.green.cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let imageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "dog")
    view.layer.cornerRadius = Constant.thumbnailSize.width / 2.0
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
      self.containerView.heightAnchor.constraint(equalToConstant: Constant.thumbnailSize.height),
      self.containerView.widthAnchor.constraint(equalToConstant: Constant.thumbnailSize.width),
    ])
    NSLayoutConstraint.activate([
      self.imageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 4),
      self.imageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -4),
      self.imageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -4),
      self.imageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 4),
    ])
  }
}
