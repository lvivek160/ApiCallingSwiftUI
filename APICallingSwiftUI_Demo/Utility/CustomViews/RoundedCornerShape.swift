//
//  a.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 25/11/24.
//

import SwiftUI

// Custom Shape for specific corners
struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct RoundedCornerShape_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 24)
    }
}
