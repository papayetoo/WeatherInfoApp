//
//  ThirdViewController.swift
//  WeatherInfo
//
//  Created by 최광현 on 2020/03/29.
//  Copyright © 2020 최광현. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var detailWeatherInfo : DetailWeatherInfo? = nil
    
    let weatherImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    /* Label 간 패딩을 10으로 설정 예정임.*/
    let weatherLabel : UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temperatureLabel : UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rainfallLabel: UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(weatherImage)
        self.view.addSubview(weatherLabel)
        self.view.addSubview(temperatureLabel)
        self.view.addSubview(rainfallLabel)
        
        let constarints : [NSLayoutConstraint] = [
            weatherImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            weatherImage.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -50),
            weatherImage.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 50),
            weatherImage.bottomAnchor.constraint(equalTo: weatherImage.topAnchor, constant: 100),
            
            weatherLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 10),
            weatherLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 10),
            temperatureLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
            rainfallLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            rainfallLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
                
        ]
        
        NSLayoutConstraint.activate(constarints)
        
        self.navigationItem.title = detailWeatherInfo?.cityName
        if detailWeatherInfo?.state == 10 {
            self.weatherImage.image = UIImage(named: "sunny")
            self.weatherLabel.text = "맑음"
        }else if detailWeatherInfo?.state == 11{
            self.weatherImage.image = UIImage(named: "rainy")
            self.weatherLabel.text = "비"
        }else if detailWeatherInfo?.state == 12{
            self.weatherImage.image = UIImage(named: "cloudy")
            self.weatherLabel.text = "흐림"
        }else if detailWeatherInfo?.state == 13{
            self.weatherImage.image = UIImage(named: "snowy")
            self.weatherLabel.text = "눈"
        }
        
        guard let celsius: Double = detailWeatherInfo?.celsius else{
            return
        }
        let temperatureString : String = String(format: "섭씨 : %.1f도 / 화씨 : %.1f도", celsius, celsius * 1.8 + 32)
        self.temperatureLabel.text = temperatureString
        if celsius <= 10 {
            self.temperatureLabel.textColor = .blue
        }
        
        self.rainfallLabel.text = "강수 확률 \(String(describing: detailWeatherInfo!.rainfallProbability))%"
        if detailWeatherInfo!.rainfallProbability >= 50 {
            self.rainfallLabel.textColor = .orange
        }else{
            self.rainfallLabel.textColor = .blue
        }
        
        
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
