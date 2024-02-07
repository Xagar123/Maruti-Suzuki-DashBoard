//
//  CustomTableViewCell.swift
//  MarutiSuzuki
//
//  Created by Sagar on 07/02/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // Subview for the cell
     let customView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .clear // Set your desired background color
         // Add any other configurations you want for the subview
         return view
     }()
    
    let secondCustomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear// Set your desired background color
        // Add any other configurations you want for the second subview
        return view
    }()
    
    let progressImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear // Set your desired background color
        // Add any other configurations you want for the image view
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "#5057A6")
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        // Add any other configurations you want for the label
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "#5057A6")
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        // Add any other configurations you want for the label
        return label
    }()
    
    let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear // Set your desired background color
        // Add any other configurations you want for the second image view
        return imageView
    }()
    
    let customSubview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red // Set your desired background color
        // Add any other configurations you want for the custom subview
        return view
    }()
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
    private func setupUI() {
           addSubview(customView)
           
           NSLayoutConstraint.activate([
               customView.topAnchor.constraint(equalTo: topAnchor),
               customView.leadingAnchor.constraint(equalTo: leadingAnchor),
               customView.trailingAnchor.constraint(equalTo: trailingAnchor),
               customView.heightAnchor.constraint(equalToConstant: 50)
           ])
           
           customView.addSubview(progressImage)
           
           NSLayoutConstraint.activate([
//            progressImage.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            progressImage.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            progressImage.widthAnchor.constraint(equalToConstant: 25),
            progressImage.heightAnchor.constraint(equalToConstant: 25),
            progressImage.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 25)
           ])
        
        customView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: progressImage.trailingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 150) // Set the width of the label
        ])
        
        customView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
//            timeLabel.trailingAnchor.constraint(equalTo: .trailingAnchor,constant: -35),
            timeLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 150) // Set the width of the label
        ])
        
        addSubview(secondCustomView)
        
        NSLayoutConstraint.activate([
            secondCustomView.topAnchor.constraint(equalTo: customView.bottomAnchor),
            secondCustomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondCustomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondCustomView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        secondCustomView.addSubview(secondImageView)
        
        NSLayoutConstraint.activate([
            secondImageView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 2),
            secondImageView.leadingAnchor.constraint(equalTo: secondCustomView.leadingAnchor, constant: 22),
            secondImageView.centerYAnchor.constraint(equalTo: secondCustomView.centerYAnchor),
            secondImageView.widthAnchor.constraint(equalToConstant: 30),
//            secondImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        secondCustomView.addSubview(customSubview)
        
        NSLayoutConstraint.activate([
            customSubview.leadingAnchor.constraint(equalTo: secondImageView.trailingAnchor, constant: 15),
            customSubview.trailingAnchor.constraint(equalTo: secondCustomView.trailingAnchor, constant: -18),
            customSubview.topAnchor.constraint(equalTo: secondCustomView.topAnchor, constant: 10),
            customSubview.bottomAnchor.constraint(equalTo: secondCustomView.bottomAnchor, constant: -10)
        ])
        
    }
    
    // Function to set the image for the UIImageView
    func setImage(_ image: UIImage?) {
        progressImage.image = image
    }
    
    // Function to set the text for the label
    func setText(_ text: String?) {
        label.text = text
    }
    
    func setTimeText(_ text: String?) {
        timeLabel.text = text
    }
    
    func setSecondImage(_ image: UIImage?) {
        secondImageView.image = image
    }
 }
