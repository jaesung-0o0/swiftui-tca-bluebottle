//
//  Cafe.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation

struct Cafe: Identifiable, Equatable {
    var id: String { address }
    var name: String {
        "블루보틀 \(branch) \(theme ?? "카페")"
    }
    let branch: String
    let address: String
    let imageURL: String
    let theme: String?
    let hours: [WorkingHour]
    let information: String? = nil
    
    enum WorkingHour: Equatable {
        case mon(String, String)
        case tue(String, String)
        case wed(String, String)
        case thu(String, String)
        case fri(String, String)
        case sat(String, String)
        case sun(String, String)
        
        var text: String {
            switch self {
            case let .mon(openedTime, closedTime):
                return "월요일 \(openedTime) - \(closedTime)"
            case let .tue(openedTime, closedTime):
                return "화요일 \(openedTime) - \(closedTime)"
            case let .wed(openedTime, closedTime):
                return "수요일 \(openedTime) - \(closedTime)"
            case let .thu(openedTime, closedTime):
                return "목요일 \(openedTime) - \(closedTime)"
            case let .fri(openedTime, closedTime):
                return "금요일 \(openedTime) - \(closedTime)"
            case let .sat(openedTime, closedTime):
                return "토요일 \(openedTime) - \(closedTime)"
            case let .sun(openedTime, closedTime):
                return "일요일 \(openedTime) - \(closedTime)"
            }
        }
    }
}

extension Cafe {
    static var mock: [Cafe] {
        [
            Cafe(
                branch: "성수",
                address: "서울시 성동구 아차산로 7",
                imageURL: "https://www.bluebottlecoffeekorea.com/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcqfze8rg%2Fproduction%2F268e98db85005f8df7635bd9376286b858c846ba-4500x3000.jpg&w=1200&q=75",
                theme: nil,
                hours: [
                    .mon("08:00", "20:30"),
                    .tue("08:00", "20:30"),
                    .wed("08:00", "20:30"),
                    .thu("08:00", "20:30"),
                    .fri("08:00", "20:30"),
                    .sat("08:00", "20:30"),
                    .sun("08:00", "20:30"),
                ]
            ),
            Cafe(
                branch: "삼청",
                address: "서울시 종로구 북촌로5길 76",
                imageURL: "https://www.bluebottlecoffeekorea.com/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcqfze8rg%2Fproduction%2Fee6d6b850270a0bc8ae0b90efffb06127f4a3a38-2000x1052.jpg&w=1200&q=75",
                theme: nil,
                hours: [
                    .mon("09:00", "20:30"),
                    .tue("09:00", "20:30"),
                    .wed("09:00", "20:30"),
                    .thu("09:00", "20:30"),
                    .fri("09:00", "20:30"),
                    .sat("09:00", "20:30"),
                    .sun("09:00", "20:30"),
                ]
            ),
            Cafe(
                branch: "삼청",
                address: "서울시 종로구 삼청로2길 40-3",
                imageURL: "https://www.bluebottlecoffeekorea.com/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcqfze8rg%2Fproduction%2F5e00be969b23061a73569d1ab512478f2e41aa57-8688x5792.jpg&w=1200&q=75",
                theme: "한옥",
                hours: [
                    .mon("11:00", "20:00"),
                    .tue("11:00", "20:00"),
                    .wed("11:00", "20:00"),
                    .thu("11:00", "20:00"),
                    .fri("11:00", "20:200"),
                    .sat("11:00", "20:00"),
                    .sun("11:00", "20:00"),
                ]
            )
        ]
    }
}
