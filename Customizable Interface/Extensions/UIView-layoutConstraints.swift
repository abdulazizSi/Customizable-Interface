//
//  UIView-layoutConstraints.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

extension UIView {
    
    @discardableResult
    func anchor(_ constraints: layoutConstraint ...) -> [layoutConstraint : NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var addedConstraints = [layoutConstraint : NSLayoutConstraint]()
        constraints.forEach { constraint in
            switch constraint {
            case let .top(anchor, padding):
                addedConstraints[.top(anchor: anchor, padding: padding)] = topAnchor.constraint(equalTo: anchor, constant: padding )

            case let .bottom(anchor, padding):
                addedConstraints[.bottom(anchor: anchor, padding: padding)] = bottomAnchor.constraint(equalTo: anchor, constant: -padding )

            case let .leading(anchor, padding):
                addedConstraints[.leading(anchor: anchor, padding: padding)] = leadingAnchor.constraint(equalTo: anchor, constant: padding )

            case let .trailing(anchor, padding):
                addedConstraints[.trailing(anchor: anchor, padding: padding)] = trailingAnchor.constraint(equalTo: anchor, constant: -(padding))

            case let .right(anchor, padding):
                addedConstraints[.right(anchor: anchor, padding: padding)] = leadingAnchor.constraint(equalTo: anchor, constant: padding )

            case let .left(anchor, padding):
                addedConstraints[.left(anchor: anchor, padding: padding)] = leadingAnchor.constraint(equalTo: anchor, constant: padding )

            case let .width(dimension):
                switch dimension {
                case let .constant(width):
                    addedConstraints[.width(.constant(width))] = widthAnchor.constraint(equalToConstant: width)
                    
                case let .equalTo(toWidth, multiplier):
                    addedConstraints[.width(.equalTo(toWidth, multiplier: multiplier))] = widthAnchor.constraint(equalTo: toWidth, multiplier: multiplier)
                }

            case let .height(dimension):
                switch dimension {
                case let .constant(height):
                    addedConstraints[.height(.constant(height))] = heightAnchor.constraint(equalToConstant: height)
                    
                case let .equalTo(toHeight, multiplier):
                    addedConstraints[.height(.equalTo(toHeight, multiplier: multiplier))] = heightAnchor.constraint(equalTo: toHeight, multiplier: multiplier)
                }
                
            case let .centerX(anchor, offset):
                addedConstraints[.centerX(anchor, offset: offset)] = centerXAnchor.constraint(equalTo: anchor, constant: offset)
                
            case let .centerY(anchor, offset):
                addedConstraints[.centerY(anchor, offset: offset)] = centerYAnchor.constraint(equalTo: anchor, constant: offset)
            }
        }
        
        let constraintsArray = Array<NSLayoutConstraint>(addedConstraints.values)
        NSLayoutConstraint.activate(constraintsArray)
        return addedConstraints
    }
    
    func anchorSubviews(_ subviews: [UIView], constraints: layoutConstraint...) {
        subviews.forEach { subview in
            constraints.forEach{subview.anchor($0)}
        }
    }
    
    func fillToSuperview(_ fillingMode: FillingMode) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            switch fillingMode {
            case let .fullSpace(padding):
                let leading = leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left)
                let trailing = trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right)
                let top = topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top)
                let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom)
                NSLayoutConstraint.activate([leading, trailing, top, bottom])
                
            case let .pinToTopSafeArea(padding):
                let leading = leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left)
                let trailing = trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right)
                let top = topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding.top)
                let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom)
                NSLayoutConstraint.activate([leading, trailing, top, bottom])
                
            case let .pinToTopBottomSafeArea(padding):
                let leading = leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left)
                let trailing = trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right)
                let top = topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding.top)
                let bottom = bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -padding.bottom)
                NSLayoutConstraint.activate([leading, trailing, top, bottom])
                
            case let .pinToBottomSafeArea(padding):
                let leading = leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left)
                let trailing = trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right)
                let top = topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top)
                let bottom = bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -padding.bottom)
                NSLayoutConstraint.activate([leading, trailing, top, bottom])
            }
        }
    }
}

enum FillingMode {
    case fullSpace(padding: UIEdgeInsets = .zero)
    case pinToTopSafeArea(padding: UIEdgeInsets = .zero)
    case pinToTopBottomSafeArea(padding: UIEdgeInsets = .zero)
    case pinToBottomSafeArea(padding: UIEdgeInsets = .zero)
}

enum layoutConstraint: Hashable {
    case top(anchor: NSLayoutYAxisAnchor, padding: CGFloat = .zero)
    case bottom(anchor: NSLayoutYAxisAnchor, padding: CGFloat = .zero)
    case leading(anchor: NSLayoutXAxisAnchor, padding: CGFloat = .zero)
    case trailing(anchor: NSLayoutXAxisAnchor, padding: CGFloat = .zero)
    case right(anchor: NSLayoutXAxisAnchor, padding: CGFloat = .zero)
    case left(anchor: NSLayoutXAxisAnchor, padding: CGFloat = .zero)
    case width(Dimension)
    case height(Dimension)
    case centerX(NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat = .zero)
    case centerY(NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat = .zero)
}

enum Dimension: Hashable {
    case constant(CGFloat)
    case equalTo(NSLayoutDimension, multiplier: CGFloat)
}

