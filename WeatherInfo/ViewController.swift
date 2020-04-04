//
//  ViewController.swift
//  WeatherInfo
//
//  Created by 최광현 on 2020/03/23.
//  Copyright © 2020 최광현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Country 라는 구조체 정의하고
    // coutries를 Coutry의 배열로 선언.
    var coutries : [Country] = []
    
    // 국가정보 담는 tableview 선언
    let tableView : UITableView = {
        let table : UITableView = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // JSON 정보를 읽는 부분.
    func readJSON(){
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "countries") else {
            return
        }
        do{
            try self.coutries = decoder.decode([Country].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        
        for c in coutries{
            print(c.assetName)
        }
    }
    
    func addUIElems(){
        self.view.addSubview(tableView)
    }
    
    func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 기본 UITableCell을 사용해도 됨.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func setAutolayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.navigationController?.navigationBar.topItem?.title = "세계 날씨"
        self.navigationItem.title = "세계 날씨"
        readJSON()
        addUIElems()
        setAutolayout()
        setupTableView()
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coutries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage(named: "flag_\(coutries[indexPath.row].assetName)")
        cell.imageView?.layer.borderWidth = 1
        cell.textLabel?.text = coutries[indexPath.row].koreanName
        cell.accessoryType = .disclosureIndicator
        
        /* UIImageView 를 원형으로 표현하기 위한 코드*/
        cell.imageView?.layer.cornerRadius = 20
        cell.imageView?.clipsToBounds = true
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.imageView?.image = UIImage(named: "flag_\(coutries[indexPath.row].assetName)")
//        cell.textLabel?.text = coutries[indexPath.row].koreanName
//        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell 이 눌러졌을 때
        let svc : SecondViewController = SecondViewController()
        // Optional 변수가 없으면 생성됨?
        svc.korName = coutries[indexPath.row].koreanName
        svc.assetName = coutries[indexPath.row].assetName
        self.navigationController?.pushViewController(svc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
