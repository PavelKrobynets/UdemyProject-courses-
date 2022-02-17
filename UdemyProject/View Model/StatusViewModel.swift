//
//  StatusViewModel.swift
//  UdemyProject
//
//  Created by mac on 01.09.2021.
//

import SwiftUI

class StatusViewModel : ObservableObject{
    @Published var status: UserStatus = .notConfigured
    
    func upgradeStatus(_ status: UserStatus) {
        self.status = status
        AuthViewModel.shared.addStatus(status.title)
    }
}

enum UserStatus : Int, CaseIterable{
    case notConfigured
    case available
    case busy
    case school
    case movies
    case work
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String {
        switch self {
        
        case .notConfigured:
            return "Click here to upgrade your status"
        case .available:
            return "Available"
        case .busy:
            return "Busy"
        case .school:
            return "At school"
        case .movies:
            return "At the movies"
        case .work:
            return "At work"
        case .batteryLow:
            return "Battery about to die"
        case .meeting:
            return "In a meeting"
        case .gym:
            return "At the gym"
        case .sleeping:
            return "Sleeping"
        case .urgentCallsOnly:
            return "Urgent calls only"
        }
    }
}

