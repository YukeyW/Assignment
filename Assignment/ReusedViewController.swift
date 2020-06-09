//
//  MyViewController.swift
//  Assignment
//
//  Created by yukey on 5/6/20.
//  Copyright © 2020 Yukey. All rights reserved.
//

import UIKit

protocol ReusedViewControllerDelegate: class {
    func labelContent(content: String)
}

class ReusedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    weak var reusedViewControllerDelegate: ReusedViewControllerDelegate?
    private let myData = ["red", "yellow", "green", "grey", "orange", "black", "white", "pink", "blue", "purple"]
    
    class func show(delegate: UIViewController & ReusedViewControllerDelegate) {
        let mvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReusedViewController") as! ReusedViewController
        mvc.reusedViewControllerDelegate = delegate
        delegate.present(mvc, animated: true, completion: nil)
    }

    internal override func viewDidLoad() {
        super.viewDidLoad()
        configurationTableView()
    }
    
    private func configurationTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myData[indexPath.row]
        return cell
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: { self.reusedViewControllerDelegate?.labelContent(content: self.myData[indexPath.row])
        })
    }
}
