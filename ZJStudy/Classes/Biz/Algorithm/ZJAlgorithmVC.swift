//
//  ZJAlgorithmVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/6.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import RxSwiftExt

class ZJAlgorithmVC: ZJBaseVC {

    private let datas = BehaviorRelay(value: [SectionModel(model: "", items: ["排序算法"])])
    
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<String, String>>!
    
    private lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.registerCell(UITableViewCell.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindDataSource()
        bindActions()
    }

}

private extension ZJAlgorithmVC {
    
    func setupViews() {
        
        self.navigationItem.title = "算法"
        
        tableView.add(to: view).snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func bindDataSource() {
        
        dataSource = .init(configureCell: { dataSource, tableView, indexPath, element in
            let cell: UITableViewCell = tableView.dequeueReuseableCell(forIndexPath: indexPath)
            cell.textLabel?.text = element
            return cell
        })
        
        datas.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
    }
    
    func bindActions() {
        
        tableView.rx.modelSelected(String.self).subscribeNext(weak: self, ZJAlgorithmVC.elementClick).disposed(by: disposeBag)
        
    }
    
}

private extension ZJAlgorithmVC {
    
    func elementClick(_ text: String) {
        
        switch text {
        case "排序算法":
            let vc = ZJSortVC()
            vc.navigationItem.title = text
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
}
