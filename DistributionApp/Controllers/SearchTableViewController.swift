//
//  SearchTableViewController.swift
//  DistributionApp
//
//  Created by Jordan Capa on 1/02/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit
import SVProgressHUD



class SearchTableViewController: UITableViewController, UISearchBarDelegate{
    
    var custommers:[Custommer] = []
    var filteredCustommers: [Custommer] = []
    var searchActive: Bool = false
    
    @IBOutlet weak var buscarSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        self.buscarSearchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SearchBar methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCustommers = searchText.isEmpty ? custommers : custommers.filter({(custommer:Custommer) -> Bool in
            return ((custommer.name?.range(of: searchText, options: .caseInsensitive)) != nil)
        })
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCustommers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredCustommers[indexPath.row].name
        cell.detailTextLabel?.text = "\(String(describing: filteredCustommers[indexPath.row].dni!))"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetailCustommer", sender: indexPath.row)
    }
    
    //MARK: - Own Methods
    
    func initView(){
        SVProgressHUD.show()
        RestApiData.sharedInstance.getCustommers { (custommers, error) in
            SVProgressHUD.dismiss()
            if(custommers != nil){
                self.custommers = custommers!
                self.filteredCustommers = self.custommers
                self.tableView.reloadData()
            }
            
        }
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as! Int
        let detailView:DetailViewController = segue.destination as! DetailViewController
        detailView.custommer = self.filteredCustommers[index]
        
     }
    
    
}
