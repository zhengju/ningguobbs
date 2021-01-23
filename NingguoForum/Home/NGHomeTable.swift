//
//  NGHomeTable.swift
//  NingguoForum
//
//  Created by zhengsw on 2021/1/23.
//  Copyright © 2021 zhengsw. All rights reserved.
//

import UIKit

class NGHomeTable: UITableView {


}

extension NGHomeTable:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {

        return false
    }
}
