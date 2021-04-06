//
//  ResultExtension.swift
//  KinsaKit
//
//  Created by Jon Trainer on 5/7/19.
//  Copyright © 2019 Kinsa, Inc. All rights reserved.
//

import Foundation

public extension Result where Success == Void {

    /// Convenience to allow returning `.success` instead of `.success(())` or `.success    (Void())`
    static var success: Result {
        return .success(())
    }
}
