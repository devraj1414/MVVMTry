//
//  AlbumsViewModel.swift
//  MVVMTry
//
//  Created by Suruchi Kumari on 24/10/20.
//  Copyright © 2020 Suruchi Kumari. All rights reserved.
//

import Foundation

struct Album : Decodable  {
    let title : String
    let artist : String
    let thumbnail_image : String
}
extension Album : Equatable{
    static func ==(lhs : Album, rhs : Album)->Bool{
        return lhs.title == rhs.title && lhs.artist == rhs.artist && lhs.thumbnail_image == rhs.thumbnail_image
    }
}
extension Album : CustomStringConvertible{
    var description: String{
        return ("\(title) Artist = \(artist) ThumbNail = \(thumbnail_image)")
    }
}

class AlbumsViewModel{
    
    let dataService : DataServiceProtocol
    
    var reloadTabledata : (()->())?
    var albumsArray : [Album]? = []{
        didSet{
            if let albumsArray = albumsArray{
            self.loadAlbumCellViewModels(albumsArray: albumsArray)
            }
        }
    }
    
    var albumsCellViewModelArray : [AlbumCellViewModel] = []{
        didSet{
            if let reloadTabledata = self.reloadTabledata{
                reloadTabledata()
            }
        }
    }
    
    func albumsCount()-> Int{
        return self.albumsArray?.count ?? 0
    }
    
    init(dataService : DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
    
    func loadAlbumCellViewModels(albumsArray : [Album]){
        for album in albumsArray{
            
            self.albumsCellViewModelArray.append(AlbumCellViewModel(artist: album.artist, title: album.title, thumbnailImage: URL(string: album.thumbnail_image)!))
        }
    }
    
    func fetchAlbums(){
        guard let url = URL(string:"https://rallycoding.herokuapp.com/api/music_albums")else{
            return
        }
        self.dataService.fetch(url: url) {[weak self] (res : Result<[Album], FetchError>) in
            switch res{
            case .success(let albums ):
                self?.albumsArray = albums
                print(albums)
            case .failure(let error) :
                print(error)
            
            }
            
        }
    }
    
}
