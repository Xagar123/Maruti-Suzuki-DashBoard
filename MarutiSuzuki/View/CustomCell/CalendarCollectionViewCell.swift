import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    // Label for month name
    let dayNameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    // Label for day of the month
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    // Colored view at the bottom of the cell
    let selectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        view.layer.masksToBounds = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add monthLabel to cell
        addSubview(dayNameLbl)
        NSLayoutConstraint.activate([
            dayNameLbl.topAnchor.constraint(equalTo: topAnchor,constant: 4),
            dayNameLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayNameLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            dayNameLbl.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Add dayLabel to cell
        addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: dayNameLbl.bottomAnchor, constant: 0), // Adjust spacing between month label and day label
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15)
        ])
        
        // Add selectionView to cell
        addSubview(selectionView)
        NSLayoutConstraint.activate([
            selectionView.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            selectionView.trailingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            selectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            selectionView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        if isSelected {
            selectionView.isHidden = false
            backgroundColor = UIColor(hexString: "#F1F2FC")
            
        }else {
            selectionView.isHidden = true
            backgroundColor = UIColor(hexString: "#FFFFFF")
        }
        selectionView.layer.cornerRadius = 10
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = false
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        isSelected = false
    }

    
    override var isSelected: Bool {
        didSet {
            // Show or hide selectionView based on cell selection
            selectionView.isHidden = !isSelected
            backgroundColor = UIColor(hexString: "#FFFFFF")
        }
    }
}
