//
//  AlbumsViewController.swift
//  MVVMTry
//
//  Created by Suruchi Kumari on 24/10/20.
//  Copyright © 2020 Suruchi Kumari. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var albumViewModel : AlbumsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initilizeViewModel()
    }
    
    
    func initilizeViewModel(){
        albumViewModel = AlbumsViewModel()
        albumViewModel?.fetchAlbums()
        albumViewModel?.reloadTabledata = {
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
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
extension AlbumsViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.albumViewModel?.albumsCount())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AlbumCell  {
            let cellVidewModel = self.albumViewModel?.albumsCellViewModelArray[indexPath.row]
            cell.albumCellViewModel = cellVidewModel
            return cell
        }
        return UITableViewCell()
    }
    
    
    
}
