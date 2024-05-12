//
//  StarStore.swift
//  The Starry Night
//
//  Created by 이재승 on 5/2/24.
//

import FirebaseFirestore

final class StarStore: ObservableObject {
    // 1. 메인뷰에서 랜덤으로 n개 불러오기, 2. 마이페이지에서 자기 star 불러오기
    @Published var stars: [StarModel] = []
    @Published var myStars: [StarModel] = []
    
    let db = Firestore.firestore()
    
    // 랜덤으로 n개의 Star를 가져오는 함수
    func randomFetchStars(n: Int) {
        db.collection("stars").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                if let error = error {
                    print(error)
                    return
                }
                return
            }
            
            var fetchData = [StarModel] ()
            
            for document in documents.shuffled().prefix(n) {
                do {
                    let temp = try document.data(as: StarModel.self)
                    fetchData.append(temp)
                } catch {
                    print("error is \(error)")
                }
            }
            self.stars = fetchData
        }
    }
    
    // User에 저장된 StarsID에 맞는 star만 가져오는 함수
    func fetchMyStars(starsID: [String]) {
        var stars = [StarModel] ()
        
        for starID in starsID {
            db.collection("stars").document(starID).getDocument { snapshot, error in
                
                if let error = error {
                    print(error)
                    return
                }
            
                guard let document = snapshot else {
                    print("Star with ID \(starID) does not exist")
                    return
                }
                
                do {
                    let star = try document.data(as: StarModel.self)
                    stars.append(star)
                } catch {
                    print("Error decoding star document with ID \(starID): \(error.localizedDescription)")
                }
                
            }
            
        }
        myStars = stars
    }
    
    // Star 파베저장
    func saveStar(star: StarModel) {
        do {
            try db.collection("stars").document(star.id).setData(from: star)
        } catch {
            print("Error saving star to Firestore: \(error.localizedDescription)")
        }
    }
    
}
