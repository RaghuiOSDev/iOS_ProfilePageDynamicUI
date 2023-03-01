//
//  ProfileViewController.swift
//  Profile_Navigation
//
//  Created by Raghu on 28/02/23.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    var profileDetailsData: [ProfileDetailsData]?
    var profileViewModel = ProfileViewModel()
    @IBOutlet weak var profileDetailsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        profileDetailsTableView.delegate = self
        profileDetailsTableView.dataSource = self
        profileDetailsTableView.register(UINib(nibName: "ProfileImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileImageTableViewCell")
        profileDetailsTableView.register(UINib(nibName: "ProfileUserDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileUserDetailsTableViewCell")
        self.fetchingAPIData()
        print("ssssss ===== \(self.profileDetailsData)")
//        self.profileViewModel.fetchingAPIData()
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchingAPIData()
//        self.profileViewModel.fetchingAPIData()
    }
}
extension ProfileViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return self.profileDetailsData?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImageTableViewCell", for: indexPath) as? ProfileImageTableViewCell else{return UITableViewCell()}
            return cell
        }
        if indexPath.section == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileUserDetailsTableViewCell", for: indexPath) as? ProfileUserDetailsTableViewCell else{return UITableViewCell()}
            if self.profileDetailsData?[indexPath.row].type == "input"{
                cell.LabelfirstName.text = self.profileDetailsData?[indexPath.row].label
                cell.textFieldFirstName.text = self.profileDetailsData?[indexPath.row].placeHolder
            }
            if self.profileDetailsData?[indexPath.row].type == "textinput"{
                cell.LabelfirstName.text = self.profileDetailsData?[indexPath.row].label
                cell.textFieldFirstName.text = self.profileDetailsData?[indexPath.row].placeHolder
            }
            return cell
        }
      return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.profileDetailsData?[indexPath.row].type == "textinput"{
            return 250
        }
        return UITableView.automaticDimension
    }
        func fetchingAPIData(){
            let url = "http://192.168.1.177:2033/json"
            
            AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
               
                switch response.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode(ProfileDetailsModel.self, from: data!)
                        self.profileDetailsData = jsonData.data
                        self.profileDetailsTableView.reloadData()
                        print("Success value \(jsonData)")
                    }catch{
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
}
