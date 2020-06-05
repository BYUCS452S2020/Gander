//
//  Font.swift
//  GanderClient
//
//  Created by Joseph Koetting on 6/4/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//

import Foundation
import SwiftUI

struct ScaledFont {
    var name: String

    func body() -> Text {
        return Text(name)
    }
}
