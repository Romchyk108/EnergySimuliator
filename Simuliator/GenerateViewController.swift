//
//  GenerateViewController.swift
//  Simuliator
//
//  Created by Roman Shestopal on 26.04.2022.
//

import UIKit

class GenerateViewController: UIViewController {
    
    let scrolView = UIScrollView()
    var sunPower = UIImageView()
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(CustomCellGenerateVC.self, forCellReuseIdentifier: CustomCellGenerateVC.identifire)
        return tableView
    }()
    let imagesForTableView = ["solarPanelOnTheRoof","solarPanelOnGround","wind-energie-low","ГЕС","ТЕС","АЕС"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sunPower.image = UIImage(named: "solarPanelOnTheRoof")
        view.addSubview(sunPower)
        sunPower.snp.makeConstraints { make in
            make.height.equalTo(250)
            make.width.equalTo(350)
            make.centerX.equalToSuperview().offset(0)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
//            make.bottom.equalTo(tableView.snp.top).offset(10)
        }
        sunPower.isUserInteractionEnabled = true
        sunPower.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToMainVC)))
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(sunPower.snp.bottom).offset(10)
            make.bottom.equalTo(0)
        }
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func goToMainVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "Main") as? MainViewController{
            dismiss(animated: true, completion: nil)
        }
    }
}

extension GenerateViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellGenerateVC.identifire, for: indexPath) as! CustomCellGenerateVC

        cell.priceLabel.text = "price \(indexPath.row + 1) $"
        cell.countLabel.text = "count \(indexPath.row + 1)"
        cell.totalGainLabel.text = "gain \(indexPath.row + 1) kW/h"
        cell.image.image = UIImage(named: "\(imagesForTableView[indexPath.row])")
        return cell
    }
    
}

class CustomCellGenerateVC: UITableViewCell {
    static var identifire = "CustomeCellGenerateVC"

    let image: UIImageView = {
        let img = UIImageView()
        return img
    }()
    let iconInform:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "info.circle")
        icon.tintColor = .systemBlue
        icon.isUserInteractionEnabled = true
        icon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapInfo)))
        return icon
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.gray.cgColor
        label.textColor = .black
        return label
    }()
    let countLabel: UILabel = {
       let count = UILabel()
        count.font = .systemFont(ofSize: 14)
        count.textAlignment = .center
        count.layer.borderWidth = 1
        count.layer.borderColor = UIColor.gray.cgColor
        count.textColor = .black
        return count
    }()
    let totalGainLabel: UILabel = {
       let gain = UILabel()
        gain.font = .systemFont(ofSize: 14)
        gain.textAlignment = .center
        gain.layer.borderWidth = 1
        gain.layer.borderColor = UIColor.gray.cgColor
        gain.textColor = .black
        return gain
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(80)
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(10)
        }
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(25)
            make.top.equalTo(10)
            make.leading.equalTo(image.snp.trailing).offset(15)
        }
        
        contentView.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(25)
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.leading.equalTo(image.snp.trailing).offset(15)
        }
        
        contentView.addSubview(totalGainLabel)
        totalGainLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(25)
            make.top.equalTo(countLabel.snp.bottom).offset(5)
            make.leading.equalTo(image.snp.trailing).offset(15)
        }
        
        contentView.addSubview(iconInform)
        iconInform.snp.makeConstraints { make in
            make.height.width.equalTo(25)
            make.top.equalTo(10)
            make.trailing.equalTo(30)
//            make.leading.equalTo(priceLabel.snp.trailing).offset(25)
        }
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapInfo() {
        
    }
}
