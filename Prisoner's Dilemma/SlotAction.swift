//
//  SlotAction.swift
//  act-r
//
//  Created by Niels Taatgen on 3/25/15.
//  Copyright (c) 2015 Niels Taatgen. All rights reserved.
//

import Foundation

struct SlotAction: Printable {
    let slot: String
    let value: Value
    var description: String {
        get {
            return "      \(slot) \(value)"
        }
    }
    init(slot: String, value: Value) {
        self.slot = slot
        self.value = value
    }
    
    func fire(inst: Instantiation, bufferChunk: Chunk) {
        if isVariable(value) {
            bufferChunk.setSlot(slot, value: inst.mapping[value.text()!]!) // assumption: no syntax errors in production
        } else {
            bufferChunk.setSlot(slot, value: value)
        }
    }
}