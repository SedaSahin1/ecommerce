//
//  BaseViewController.swift
//  ECommerce
//
//  Created by Seda Şahin on 27.08.2023.
//

import UIKit

protocol BaseViewControllerProtocol: AnyObject {
    associatedtype T
    init(viewModel: T)
}

public class BaseViewController<U>: UIViewController {
    typealias T = U
    var viewModel: T?
}
