//
//  ResultsAndCallbacks.swift
//  CallbackHelper
//
//  Created by Justin Heo on 4/15/20.
//

import Foundation

/// `R` is the result type that is passed to `block`
public class Callback<R> {
    public var queue: Dispatch.DispatchQueue?
    let block: ((R) -> Void)
    public init(on queue: Dispatch.DispatchQueue, perform block: @escaping (R) -> Void) {
        self.queue = queue
        self.block = block
    }
    fileprivate init(perform block: @escaping (R) -> Void) {
        self.block = block
    }
    public class func onMain(perform block: @escaping (R) -> Void) -> Callback<R> {
        return Callback(on: DispatchQueue.main, perform: block)
    }
    public class func onCurrent(perform block: @escaping (R) -> Void) -> Callback<R> {
        return Callback(perform: block)
    }
    public func withResult(_ result: R) {
        guard let queue = queue else {
            self.block(result)
            return
        }
        queue.async {
            self.block(result)
        }
    }
}
