//
//  Avatar.swift
//  SwiftUIAnimation
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI


enum PetType {
    case cat
    case dog
    case fish
    
    var name: String {
        switch self {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        case .fish:
            return "fish"
        }
    }
    
}


struct Pet {
    var type: PetType
}


struct Avatar: View {
    
    var pet: Pet
    
    @Binding var selected: Bool
    
    
    var body: some View {
        
//        VStack {
////            Image(pet.type.name)
////                .aspectRatio(contentMode: .fit)
//            Label(
//                title: { Text(pet.type.name) },
//                icon: { Image(systemName: "42.circle") }
//            )
//            .frame(width: 100, height: 100)
//            .background(.orange)
//            .cornerRadius(50)
//            .scaleEffect(selected ? 1.5 : 1.0)
//            .onTapGesture {
//                withAnimation(.bouncy) {
//                    selected.toggle()
//                }
//            }
//        }
//        
//        
//        VStack {
//            Label(
//                title: { Text(pet.type.name) },
//                icon: { Image(systemName: "42.circle") }
//            )
//            .frame(width: 100, height: 100)
//            .background(.orange)
//            .cornerRadius(50)
//            .shadow(radius: selected ? 12 : 8) // 阴影
//            .animation(.smooth, value: selected) // 修饰符让阴影动画变化更加柔和
//            .scaleEffect(selected ? 1.5 : 1.0)
//            .animation(.bouncy, value: selected) // value用于指定动画对象
//            .onTapGesture {
//                selected.toggle()
//            }
//        }
        
        
        VStack {
            Label(
                title: { Text(pet.type.name) },
                icon: { Image(systemName: "42.circle") }
            )
            .frame(width: 100, height: 100)
            .background(.orange)
            .cornerRadius(50)
            .animation(.smooth) {
                $0.shadow(radius: selected ? 12 : 8) // 阴影
            }
            .animation(.bouncy) {
                $0.scaleEffect(selected ? 1.5 : 1.0)
            }
            .onTapGesture {
                selected.toggle()
            }
        }
        
        
        
    }
}

#Preview {
    Avatar(pet: Pet(type: .cat), selected: .constant(false))
}
