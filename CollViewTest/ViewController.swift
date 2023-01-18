//
//  ViewController.swift
//  CollViewTest
//
//  Created by Никита Попов on 17.01.23.
//

import UIKit

class ViewController: UIViewController {
    var colView:UICollectionView!
    
    var layout:UICollectionViewFlowLayout!
    var button = UIButton()
    var netwMen = CreateInfo()
    var arrId = [Int]()
    var buttonRefr = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collViewSetup()  //add collectionView
        buttonSettup()   //add button orientation
        buttonCreate()   //add button refresh
        addIDArray()     //create array ID pers
        self.title = "Rick And Mory"
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrId.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollViewCell else { return UICollectionViewCell() }
        
        netwMen.allPers = {res in
            guard let url = URL(string: res[indexPath.item].image) else { return }
            DispatchQueue.main.async {
                URLSession.shared.dataTask(with: url, completionHandler: {data, resp, err in
                    guard let data = data else { return }
                    let im = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imView.image = im
                    }
                }).resume()
            }
        }
        netwMen.createData(idPers: arrId)
        return cell
    }
    
    //Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        netwMen.allPers = {res in
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Info", message: "name: \(res[indexPath.item].name)", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(action)
                self.present(alertController, animated: true)
            }
        }
        netwMen.createData(idPers: arrId)
        
    }
    
}

