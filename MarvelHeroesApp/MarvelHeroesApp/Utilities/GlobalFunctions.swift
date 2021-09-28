//
//  GlobalFunctions.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 28/9/21.
//

import Foundation

func runOnMainThread(_ action: @escaping (() -> Void)) {
    DispatchQueue.main.async {
        action()
    }
}

func runOnMainThreadAfter(_ seconds: Double, action:  @escaping (() -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: {
        action()
    })
}
