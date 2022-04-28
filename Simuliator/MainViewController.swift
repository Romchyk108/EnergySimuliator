//
//  MainViewController.swift
//  Simuliator
//
//  Created by Roman Shestopal on 26.04.2022.
//

import UIKit
import SnapKit
import EasyTipView

class MainViewController: UIViewController {
    
    let btnGenerate = UIImageView()
    let viewForProperty = ViewForProperty()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnGenerate.image = UIImage(named: "generateEnergy")
        btnGenerate.isUserInteractionEnabled = true
        btnGenerate.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToGenerateVC)))
        view.addSubview(btnGenerate)
        
        viewForProperty.layer.borderWidth = 1
        viewForProperty.layer.borderColor = UIColor.black.cgColor
        view.addSubview(viewForProperty)
        viewForProperty.translatesAutoresizingMaskIntoConstraints = false
        viewForProperty.snp.makeConstraints { make in
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        btnGenerate.snp.makeConstraints { make in
            make.width.equalTo(275)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(viewForProperty.snp.bottom).offset(20)
        }
    }
    
    @objc func goToGenerateVC() {
        let storyboard = UIStoryboard(name: "Generate", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "Generate") as? GenerateViewController{
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}

extension MainViewController {
    
}

class ViewForProperty: UIView {
    var moneyLabel = UILabel()
    var timeLabel = UILabel()
    var stackView = UIStackView()
    var workersLabel = UILabel()
    var populationLabel = UILabel()
    var priceEnergyLabel = UILabel()
    var consumedEnergyLabel = UILabel()
    var generatedEnergyLabel = UILabel()
    var btnPause = UIButton()
    var btnPlay = UIButton()
    var btnSpeedUp = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.gray.cgColor
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(25)
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        
        btnPause = createButton(name: "pause.circle")
        btnPlay = createButton(name: "play.circle")
        btnSpeedUp = createButton(name: "forward.circle")
        
        moneyLabel = createLabel(name: "money:")
        addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.trailing.equalTo(stackView.snp.leading).offset(-10)
            make.leading.equalTo(10)
            make.top.equalToSuperview().offset(10)
        }
        
        workersLabel = createLabel(name: "workers:")
        addSubview(workersLabel)
        workersLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.trailing.equalTo(stackView.snp.leading).offset(-10)
            make.leading.equalTo(10)
            make.top.equalTo(moneyLabel.snp.bottom).offset(10)
        }
        
        populationLabel = createLabel(name: "population:")
        populationLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.trailing.equalTo(stackView.snp.leading).offset(-10)
            make.leading.equalTo(10)
            make.top.equalTo(workersLabel.snp.bottom).offset(10)
        }
        
        timeLabel = createLabel(name: "Date/time")
        timeLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.trailing.equalTo(-10)
            make.leading.equalTo(stackView.snp.trailing).offset(10)
            make.top.equalTo(10)
        }
        
        generatedEnergyLabel = createLabel(name: "generate")
        generatedEnergyLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.trailing.equalTo(-10)
            make.leading.equalTo(stackView.snp.trailing).offset(10)
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
        }
        
        consumedEnergyLabel = createLabel(name: "consume")
        consumedEnergyLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.trailing.equalTo(-10)
            make.leading.equalTo(stackView.snp.trailing).offset(10)
            make.top.equalTo(generatedEnergyLabel.snp.bottom).offset(10)
        }
        
        priceEnergyLabel = createLabel(name: "price")
        priceEnergyLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(10)
        }
    }
    
    func createLabel(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        addSubview(label)
        return label
    }
    
    func createButton(name: String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: name), for: .normal)
        btn.tintColor = .blue
        btn.setTitle(name, for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(tappedButton(btn:)), for: .touchUpInside)
        stackView.addArrangedSubview(btn)
        btn.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        return btn
    }
    
    @objc func tappedButton(btn: UIButton) {
        if let text = btn.titleLabel?.text {
            print("\(text)")
        }
        btnPause.tintColor = .blue
        btnPlay.tintColor = .blue
        btnSpeedUp.tintColor = .blue
        btn.tintColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
