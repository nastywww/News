//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import SwiftUI
import Foundation

struct NewsChannel: View {
    @State var isFavourite = true

    var title: String
    var description: String
    var id: String

    var body: some View {
        HStack {
            VStack {
                //star!!!!!!!
                Text(title).bold()
                Text(description)
            }
            Spacer()
            Button(action:{
                let config = Realm.Configuration(schemaVersion :1)
                do{
                    let realm = try Realm(configuration: config)
                    let newData = Channel()
                    let channel = realm.objects(Channel.self).filter("id = '\(self.id)'")

                    if (self.isFavourite){
                            try! realm.write {
                                realm.delete(channel)
                            }
                    } else {

                            newData.id = self.id
//                        newData.isFavourite = true
//                            newData.name = self.title
//                            newData.descriptionChannel = self.description

                            try realm.write({
                                realm.add(newData)
                                print("success")
                            })
                        }
                }
                catch{
                    print(error.localizedDescription)
                }

            }){
                //TODO on change
                if(isFavourite){
                    Image(systemName: "star.fill").font(.system(size: 16, weight: .regular))
                }
                else{
                    Image(systemName: "star").font(.system(size: 16, weight: .regular))
                }
            }
        }

    }
}


