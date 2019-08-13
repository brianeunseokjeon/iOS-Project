//
//  fakeData.swift
//  Yanolja
//
//  Created by Chunsu Kim on 09/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation


struct ThemeMenu {
    let menu: String
    let items: [Pool]
}

struct Pool {
    let title: String
    let imageUrl: String
    let price: String
}

var listMenuTitles = ["모든 숙소","모텔","호텔", "펜션/풀빌라", "게스트하우스", "#무한쿠폰룸", "프랜차이즈", "#신축/리모델링", "#초특가호텔", "#인기숙소", "#파티룸", "#무료영화", "#스파펜션"]

let themeTitle = "첨벙첨벙 물놀이하러 Go!"
let themeTitleDiff = "핫썸머 핫캉스"

let themeMenus: [ThemeMenu] = [
    ThemeMenu(menu: "풀빌라", items: [
        Pool(title: "가평 하버하우스풀빌라", imageUrl: "pool1", price: "180,000"),
        Pool(title: "경주 에디스풀빌라펜션", imageUrl: "pool2", price: "69,000"),
        Pool(title: "여수 까사413펜션", imageUrl: "pool3", price: "100,000"),
        Pool(title: "경주 비버리힐펜션", imageUrl: "pool4", price: "80,000")
        ]
    ),
    
    ThemeMenu(menu: "해수욕장", items: [
        Pool(title: "강릉 진배네", imageUrl: "pool4", price: "150,000"),
        Pool(title: "속초 은석이네", imageUrl: "pool3", price: "180,000"),
        Pool(title: "대천 천수네", imageUrl: "pool2", price: "300,000"),
        Pool(title: "울산 업스네", imageUrl: "pool1", price: "210,000")
        
        ]
    ),
    
    ThemeMenu(menu: "수영장", items: [
        Pool(title: "엠버서드 해운대", imageUrl: "pool2", price: "210,000"),
        Pool(title: "콘티넨탈 삼성", imageUrl: "pool1", price: "160,000"),
        Pool(title: "라마다 경주", imageUrl: "pool4", price: "200,000"),
        Pool(title: "휘슬락 호텔", imageUrl: "pool3", price: "270,000")
        
        ]
    ),
    
    ThemeMenu(menu: "계곡핫플", items: [
        Pool(title: "히든베이", imageUrl: "pool4", price: "190,000"),
        Pool(title: "강릉 세인트존스호텔", imageUrl: "pool3", price: "230,000"),
        Pool(title: "스카이베이", imageUrl: "pool2", price: "300,000"),
        Pool(title: "마리나 베이 서울", imageUrl: "pool1", price: "210,000")
        
        ]
    )
]


struct ThemeMenuDiff {
    let menu: String
    let items: [PoolDiff]
}

struct PoolDiff {
    let title: String
    let imageName: String
    let price: String
}

let themeMenusDiff: [ThemeMenuDiff] = [
    ThemeMenuDiff(menu: "수영장", items: [
        PoolDiff(title: "히든베이", imageName: "pool4", price: "190,000"),
        PoolDiff(title: "강릉 세인트존스호텔", imageName: "pool3", price: "230,000"),
        PoolDiff(title: "스카이베이", imageName: "pool2", price: "300,000"),
        PoolDiff(title: "마리나 베이 서울", imageName: "pool1", price: "210,000")
        ]
    ),
    
    ThemeMenuDiff(menu: "인피니티", items: [
        PoolDiff(title: "가평 하버하우스풀빌라", imageName: "pool1", price: "180,000"),
        PoolDiff(title: "경주 에디스풀빌라펜션", imageName: "pool2", price: "69,000"),
        PoolDiff(title: "여수 까사413펜션", imageName: "pool3", price: "100,000"),
        PoolDiff(title: "경주 비버리힐펜션", imageName: "pool4", price: "80,000")
        ]
    ),
    
    ThemeMenuDiff(menu: "오션뷰", items: [
        PoolDiff(title: "엠버서드 해운대", imageName: "pool2", price: "210,000"),
        PoolDiff(title: "콘티넨탈 삼성", imageName: "pool1", price: "160,000"),
        PoolDiff(title: "라마다 경주", imageName: "pool4", price: "200,000"),
        PoolDiff(title: "휘슬락 호텔", imageName: "pool3", price: "270,000")
        
        ]
    ),
    
    ThemeMenuDiff(menu: "해수욕장", items: [
        PoolDiff(title: "강릉 진배네", imageName: "pool4", price: "150,000"),
        PoolDiff(title: "속초 은석이네", imageName: "pool3", price: "180,000"),
        PoolDiff(title: "대천 천수네", imageName: "pool2", price: "300,000"),
        PoolDiff(title: "울산 업스네", imageName: "pool1", price: "210,000")
        ]
    )
]

struct PopData {
    let imageName: String
}

struct PopDataManager {
    static let shared = PopDataManager()
    init() {}
    
    let pops: [PopData] = [
        PopData(imageName: "pop1"),
        PopData(imageName: "pop2"),
        PopData(imageName: "pop3"),
        PopData(imageName: "pop4"),
        PopData(imageName: "pop5"),
        PopData(imageName: "pop6"),
        PopData(imageName: "pop7"),
        PopData(imageName: "pop8")
    ]
}


struct keyWord {
    let rank: String
    let word: String
}

let keyWords: [keyWord] = [
    keyWord(rank: "1", word: "서울호캉스"),
    keyWord(rank: "2", word: "서울수영장호텔"),
    keyWord(rank: "3", word: "전은석"),
    keyWord(rank: "4", word: "징배공기배"),
    keyWord(rank: "5", word: "코타키나발루호텔")
    ]

let loginMenuTitle = ["야놀자 로그인", "간편 로그인"]

let numberOne = "서울호캉스"
let numberTwo = "서울수영장호텔"
let numberThree = "전은석"
let numberFour = "징배공기배"
let numberFive = "코타키나발루호텔"
