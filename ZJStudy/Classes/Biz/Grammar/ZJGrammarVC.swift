//
//  ZJGrammarVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/6.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ZJGrammarVC: ZJBaseVC {
    
    private let datas = BehaviorRelay(value: [SectionModel(model: "", items: ["BasePart（基础部分）", "Function（函数）", "Closures（闭包）"])])
    
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

private extension ZJGrammarVC {
    
    func setupViews() {
        
        self.navigationItem.title = "Grammar"
        
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
        
        tableView.rx.modelSelected(String.self).subscribeNext(weak: self, ZJGrammarVC.rowClick).disposed(by: disposeBag)
        
    }
    
}

private extension ZJGrammarVC {
    
    func rowClick(_ text: String) {
        
        switch text {
        case "BasePart（基础部分）":
            let vc = ZJBasePartVC()
            vc.navigationItem.title = text
            self.navigationController?.pushViewController(vc, animated: true)
        case "Function（函数）":
            let vc = ZJFunctionVC()
            vc.navigationItem.title = text
            self.navigationController?.pushViewController(vc, animated: true)
        case "Closures（闭包）":
            let vc = ZJClosuresVC()
            vc.navigationItem.title = text
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
}
