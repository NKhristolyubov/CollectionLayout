//
//  ViewController.swift
//  CollectionLayout
//
//  Created by Nikolai Khristoliubov on 10.01.23.
//

import UIKit

// UICollectionViewFlowLayout

class FlowViewController: UIViewController {

    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = #colorLiteral(red: 0.9024995565, green: 0.89966923, blue: 0.9256250262, alpha: 1)
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension FlowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: 50)
    }

}

import SwiftUI
struct FlowProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable{

        let tabBar = MainTabBarController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<FlowProvider.ContainerView>) -> MainTabBarController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: CompositionalProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<FlowProvider.ContainerView>) {
            
        }
    }
}

