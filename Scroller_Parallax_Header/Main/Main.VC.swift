//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import Combine
import UIKit

extension Main {
    final class VC: UIViewController {
        var vo = Main.VO()
        var vm = Main.VM()
        var router = Main.Router()
        var binding = Set<AnyCancellable>()
        
        override func loadView() {
            self.view = vo.mainView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSelf()
            setupBinding()
            setupVO()
        }
    }
}

// MARK: - UITableViewDataSource

extension Main.VC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Index: \(indexPath.row)"
        return cell
    }
}

// MARK: - UITableViewDelegate

extension Main.VC: UITableViewDelegate {}

// MARK: - UIScrollViewDelegate

extension Main.VC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        vo.reloadHeaderView(offsetY: scrollView.contentOffset.y)
    }
}

// MARK: - Setup Something

private extension Main.VC {
    func setupSelf() {
        router.vc = self
    }
    
    func setupBinding() {
        vm.$state.receive(on: DispatchQueue.main).sink { [weak self] state in
            switch state {
            case .none:
                self?.stateNone()
            }
        }.store(in: &binding)
    }
    
    func setupVO() {
        vo.list.dataSource = self
        vo.list.delegate = self
    }
}

// MARK: - Handle State

private extension Main.VC {
    func stateNone() {}
}
