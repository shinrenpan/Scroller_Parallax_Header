//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main {
    final class VO {
        lazy var mainView = makeMainView()
        lazy var list = makeList()
        lazy var headerView = makeHeaderView()
        
        init() {
            addList()
        }
    }
}

// MARK: - Reload Somethig

extension Main.VO {
    func reloadHeaderView(offsetY: CGFloat) {
        headerView.reloadUI(offsetY: offsetY)
    }
}

// MARK: - Add Something

private extension Main.VO {
    func addList() {
        mainView.addSubview(list)
        
        NSLayoutConstraint.activate([
            list.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            list.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor),
            list.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor),
            list.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - Make Something

private extension Main.VO {
    func makeMainView() -> UIView {
        let result = UIView(frame: .zero)
        result.backgroundColor = .white
        return result
    }
    
    func makeList() -> UITableView {
        let result = UITableView(frame: .zero, style: .plain)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.rowHeight = 60
        result.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        result.tableHeaderView = headerView
        return result
    }
    
    func makeHeaderView() -> Main.Views.HeaderView {
        .init(frame: .init(x: 0, y: 0, width: 1000, height: Main.Views.HeaderView.height))
    }
}
