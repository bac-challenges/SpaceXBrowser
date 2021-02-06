//
//  RocketController.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit
import RxCocoa
import RxSwift

final class RocketController: UIViewController, RocketViewModelInjected {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    public var rocket = ""
    
    private var item: Rocket? {
        didSet {
            update()
        }
    }
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.load(rocket: rocket)
    }

}

// MARK: - Rx Bindings
extension RocketController {
    private func configureBinding() {
        viewModel.item.observe(on: MainScheduler.instance)
            .debug()
            .subscribe ( onNext: { [weak self] item in
                self?.item = item
        }).disposed(by: disposeBag)
        
        viewModel.image.bind(to: imageView.rx.image)
            .disposed(by: disposeBag)
    }
}

// MARK: - Update UI
extension RocketController {
    private func update() {
        nameLabel.text = item?.name
        descrLabel.text = item?.descr
        viewModel.load(image: item?.image ?? "")
    }
}

// MARK: - Actions
extension RocketController {
    @IBAction private func openLink(_ sender: Any) {
        viewModel.open(item?.link ?? "")
    }
}
