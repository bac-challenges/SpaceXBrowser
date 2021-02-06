//
//  LaunchController.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit
import RxCocoa
import RxSwift

final class LaunchController: UITableViewController, LaunchViewModelInjected {
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBinding()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.load()
    }
}

// MARK: - Rx Bindings
extension LaunchController {
    private func configureBinding() {
        tableView.delegate = nil
        tableView.dataSource = nil
        
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "CellCustom", cellType: LaunchCell.self)) {  (row, item, cell) in
            cell.configure(item)
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [unowned self] indexPath in
            let item: Launch = try! self.tableView.rx.model(at: indexPath)
            self.viewModel.itemSelected(item)
        }).disposed(by: disposeBag)
    }
}
