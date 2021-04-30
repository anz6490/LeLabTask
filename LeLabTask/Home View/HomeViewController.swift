//
//  HomeViewController.swift
//  LeLabTask
//
//  Created by Anees Mv on 29/04/21.
//

import UIKit


class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let homeVM = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
    }


}

// MARK: - UITableViewDelegate,UITableViewDataSource Methods
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = HomeTableViewCell.identifier
        guard let currentUser = homeVM.userList?[indexPath.row] else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                       for: indexPath) as? HomeTableViewCell
            else { return UITableViewCell() }
        
        cell.title?.text = currentUser.name
        cell.detailLabel.text = currentUser.phone
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = homeVM.userList?[indexPath.row] else { return }
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "UserDetailTableViewController") as! UserDetailTableViewController
        secondVc.userData = user
        
        present(secondVc,animated: true, completion: nil)
    }
    
    
}




