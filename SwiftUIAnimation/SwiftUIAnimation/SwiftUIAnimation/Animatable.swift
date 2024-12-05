//
//  Animatable.swift
//  SwiftUIAnimation
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI

public protocol Animatable {
    associatedtype AnimatableData: VectorArithmetic
    
    var animatableData: AnimatableData { get set }
    
}


public protocol VectorArithmetic: AdditiveArithmetic {
    mutating func scale(by rhs: Double)
    
    var magnitudeSquare: Double { get }
    
}


