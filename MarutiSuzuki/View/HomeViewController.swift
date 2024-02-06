//
//  ViewController.swift
//  MarutiSuzuki
//
//  Created by Sagar on 07/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    let logoView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#FFFFFF")
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "MarutiSuzukiLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "profile"))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let collectionViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#FFFFFF")
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoView)
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            logoView.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        // Add imageView inside myView
        logoView.addSubview(imageView)
        
        // Add constraints for imageView inside myView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 64),
            imageView.leadingAnchor.constraint(equalTo: logoView.leadingAnchor, constant: 22),
//            imageView.trailingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: logoView.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        logoView.addSubview(profileView)
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 95),
            profileView.trailingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: -22),
            profileView.widthAnchor.constraint(equalToConstant: 25),
            profileView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        
        
        // Add collectionViewContainer below myView
        view.addSubview(collectionViewContainer)
        
        // Add constraints for collectionViewContainer
        NSLayoutConstraint.activate([
            collectionViewContainer.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 0),
            collectionViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewContainer.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        collectionViewContainer.addSubview(monthLabel)
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: collectionViewContainer.topAnchor, constant: 10),
            monthLabel.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor,constant: 30),
            monthLabel.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor),
            monthLabel.heightAnchor.constraint(equalToConstant: 30) // Adjust the height of the label
        ])
        
        // Add collectionView inside collectionViewContainer
        collectionViewContainer.addSubview(collectionView)
        
        // Add constraints for collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 10), // Adjust spacing based on your requirement
            collectionView.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor,constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor,constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: collectionViewContainer.bottomAnchor)
        ])
        addShadow()
        // Register collection view cell
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    //MARK: - HELPER
    
    func addShadow() {
//        logoView.layer.shadowColor = UIColor.gray.cgColor
//        logoView.layer.shadowOpacity = 0.5
//        logoView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        logoView.layer.shadowRadius = 4
//        logoView.layer.masksToBounds = false
        
        collectionViewContainer.layer.shadowColor = UIColor.gray.cgColor
        collectionViewContainer.layer.shadowOpacity = 0.5
        collectionViewContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        collectionViewContainer.layer.shadowRadius = 4
        collectionViewContainer.layer.masksToBounds = false
        
    }


}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30 // Change the number of cells based on your requirement
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
            let month = Calendar.current.component(.month, from: Date()) // Get the current month
            let day = indexPath.item + 1 // Day of the month
            let monthName = DateFormatter().monthSymbols[(month - 1) % 12] // Get the month name
            
//            cell.monthLabel.text = monthName
            cell.dayLabel.text = "\(day)"
            let weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            let weekDayIndex = indexPath.item % weekDays.count
            cell.dayNameLbl.text = weekDays[weekDayIndex]
            monthLabel.text = "Febuary"
            
            return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust the cell size based on your requirement
        return CGSize(width: 50, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust the minimum line spacing based on your requirement
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Deselect previously selected item, if any
        if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
            collectionView.deselectItem(at: selectedIndexPath, animated: false)
            if let cell = collectionView.cellForItem(at: selectedIndexPath) as? CalendarCollectionViewCell {
                cell.isSelected = false
                cell.backgroundColor = UIColor(hexString: "#FFFFFF")
            }
        }
        
        // Select the newly selected item
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        if let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell {
            cell.isSelected = true
            cell.backgroundColor = UIColor(hexString: "#F1F2FC")
        }
    }
    
}


