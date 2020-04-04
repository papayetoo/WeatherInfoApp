
//
//  SecondViewController.swift
//  WeatherInfo
//
//  Created by 최광현 on 2020/03/25.
//  Copyright © 2020 최광현. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let detailLabel: UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView : UITableView = {
        let table : UITableView = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var korName : String = ""
    var assetName : String = ""
    
    
    var detailInfoList : [DetailWeatherInfo] = []
    
    func readJSON(){
        let decoder : JSONDecoder = JSONDecoder()
        
        print("Asset :\(assetName)")
        guard let detailData = NSDataAsset(name: assetName) else {
            return
        }
        
        do{
            self.detailInfoList = try decoder.decode([DetailWeatherInfo].self, from: detailData.data)
        }catch{
            print(error.localizedDescription)
        }
        
    }
        
    func addUIElems(){
        self.view.addSubview(tableView)
    }
    
    func initializeView(){
        self.navigationController?.navigationBar.topItem?.title = korName
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    func tableSetUp(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "detailCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readJSON()
        addUIElems()
        initializeView()
        tableSetUp()
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

extension SecondViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? CustomCell else{
            return CustomCell()
        }
        

        if detailInfoList[indexPath.row].state == 10 {
//            cell.imageView?.image = UIImage(named: "sunny")
            cell.weatherlImage.image = UIImage(named: "sunny")
        }else if detailInfoList[indexPath.row].state == 11 {
//            cell.imageView?.image = UIImage(named:"rainy")
            cell.weatherlImage.image = UIImage(named: "rainy")
        }else if detailInfoList[indexPath.row].state == 12{
//            cell.imageView?.image = UIImage(named:"cloudy")
            cell.weatherlImage.image = UIImage(named: "cloudy")
        }else if detailInfoList[indexPath.row].state == 13{
//            cell.imageView?.image = UIImage(named:"snowy")
            cell.weatherlImage.image = UIImage(named: "snowy")
        }
        
        cell.cityName.text = detailInfoList[indexPath.row].cityName
        let celsius = detailInfoList[indexPath.row].celsius
        let strTemperature : String = String(format: "섭씨 : %.1f도/ 화씨 :  %.1f도", celsius, celsius * 1.8 + 32)
        cell.temperatureLabel.text? =  strTemperature
        if celsius <= 10 {
            cell.temperatureLabel.textColor = .blue
        }
        
        let rainfall = detailInfoList[indexPath.row].rainfallProbability
        cell.rainfallLabel.text? = "강수 확률 \(rainfall)%"
        if rainfall >= 50 {
            cell.rainfallLabel.textColor = .orange
        }else{
            cell.rainfallLabel.textColor = .blue
        }
        
        
        return cell
    }
}

extension SecondViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(detailInfoList[indexPath.row].cityName)")
        let tvc : ThirdViewController = ThirdViewController()
        tvc.detailWeatherInfo = detailInfoList[indexPath.row]
        self.navigationController?.pushViewController(tvc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
