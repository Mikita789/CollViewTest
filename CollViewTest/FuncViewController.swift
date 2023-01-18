//
//  FuncViewController.swift
//  CollViewTest
//
//  Created by Никита Попов on 17.01.23.
//

import Foundation
import UIKit


extension ViewController {
    
    
    //func create array ID person
    func addIDArray(){
        for _ in 0...Int.random(in: 0...20){
            arrId.append(Int.random(in: 1...700))
        }
    }
    
    //create button
    func buttonSettup() {
        button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //constraints
        button.topAnchor.constraint(equalTo: colView.bottomAnchor, constant: 5).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        
        button.setTitle("Orient", for:.normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
    }
    @objc func buttonAction() {
        layout.scrollDirection = layout.scrollDirection == .horizontal ? .vertical : .horizontal
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    //create collectionView
    func collViewSetup (){
        
        layout = setupCollViewLayout()
        colView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(colView)
        colView.translatesAutoresizingMaskIntoConstraints = false
        colView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        colView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        colView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        colView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
        colView.dataSource = self
        colView.delegate = self
        
        colView.register(CollViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    func setupCollViewLayout()-> UICollectionViewFlowLayout {
        let layour = UICollectionViewFlowLayout()
        layour.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layour
    }
    
    //create button
    func buttonCreate(){
        buttonRefr = UIButton(type: .custom)
        self.view.addSubview(buttonRefr)
        buttonRefr.translatesAutoresizingMaskIntoConstraints = false
        buttonRefr.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        buttonRefr.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        buttonRefr.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonRefr.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonRefr.addTarget(self, action: #selector(refrButtonAction), for: .touchUpInside)
        
        buttonRefr.setImage(UIImage(named: "refr"), for: .normal)
        buttonRefr.contentMode = .scaleAspectFit
        buttonRefr.setTitleColor(.black, for: .normal)
    }
    @objc func refrButtonAction(){
        addIDArray()
        colView.reloadData()
    }
    
}
