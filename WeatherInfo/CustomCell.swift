//
//  CustomCell.swift
//  WeatherInfo
//
//  Created by 최광현 on 2020/03/23.
//  Copyright © 2020 최광현. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    let weatherlImage: UIImageView = {
        let imgView : UIImageView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    let cityName : UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let rainfallLabel : UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.addSubview(cityName)
        self.contentView.addSubview(weatherlImage)
        self.contentView.addSubview(temperatureLabel)
        self.contentView.addSubview(rainfallLabel)
        self.accessoryType = .disclosureIndicator
        // Autolayout
        
        NSLayoutConstraint.activate([
            
            weatherlImage.leftAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leftAnchor, constant: 10),
            weatherlImage.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 15),
            weatherlImage.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            weatherlImage.rightAnchor.constraint(equalTo: weatherlImage.leftAnchor, constant: 70),
            
            /* 도시 이름 레이아웃 설정*/
            cityName.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            cityName.leftAnchor.constraint(equalTo: weatherlImage.rightAnchor, constant: 20),
            
            /* 온도(섭씨, 화씨) 레이아웃 설정*/
            temperatureLabel.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 10),
            temperatureLabel.leftAnchor.constraint(equalTo: weatherlImage.rightAnchor, constant: 20),
            
            /* 강수 확률 레이아웃 설정*/
            rainfallLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            rainfallLabel.leftAnchor.constraint(equalTo: weatherlImage.rightAnchor, constant: 20)
//
            /* 이미지 뷰의 크기를 정해주지 않으면 resize 되지 않음.
            nationalImage.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nationalImage.centerYAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.centerYAnchor),
            nationalImage.heightAnchor.constraint(equalToConstant: 80),
            nationalImage.widthAnchor.constraint(equalToConstant: 40),
             */
            
//            weatherlImage.heightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.heightAnchor, constant: 0.1),
//            weatherlImage.widthAnchor.constraint(equalTo: self.weatherlImage.heightAnchor, constant: 1),
        ])
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
