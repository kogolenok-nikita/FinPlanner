//
//  DetailsView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct DetailsView: View {
    @State var isNotificationSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: -8) {
                    Text("82 200 $")
                        .cygre(.black, 27)
                        .foregroundStyle(.white)
                    Text("Кредит на айфон")
                        .cygre(.black, 16)
                        .foregroundStyle(.appYellow)
                }
                .padding(.vertical, 30)
                
                VStack(alignment: .leading, spacing: 26) {
                    VStack(alignment: .leading, spacing: 17) {
                        HStack(spacing: 16) {
                            InfoTagView(text: "60 200 $")
                            InfoTagView(text: "3 200 $")
                        }
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmoid tempor incididunt ut labire ert dolore manga. Ut emin minta vsipvcn")
                            .cygre(.regular, 14)
                            .foregroundStyle(.appMint)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Divider()
                            .background(.appGray)
                        
                        HStack {
                            Text("Ближайший платеж")
                                .cygre(.regular, 14)
                                .foregroundStyle(.appYellow)
                                .offset(y: -3)
                            Spacer()
                            HStack(spacing: 4) {
                                Text("оплачен")
                                    .cygre(.regular, 12)
                                    
                                Text("13.12")
                                    .cygre(.black, 12)
                                    
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 4)
                            .background(.appYellow)
                            .clipShape(Capsule())
                        }
                        .padding(.horizontal, 10)
                        
                        Divider()
                            .background(.appGray)
                        
                        HStack {
                            Text("Уведомление о платеже")
                                .cygre(.regular, 14)
                                .foregroundStyle(.appYellow)
                                .offset(y: -3)
                            Spacer()
                            RadioButtonView(isSeleceted: $isNotificationSelected)
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 18) {
                SolidButton(text: "Закрыть досрочно", solidСolor: .appYellow, textСolor: .appBlack, isFull: true)
                SolidButton(text: "Удалить последний платеж", solidСolor: .appYellow, textСolor: .appYellow)
            }
            
        }
        .padding(.horizontal, 20)
        .background(.appBlack)
    }
}

#Preview {
    DetailsView()
}


extension DetailsView {
    var header: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.appYellow)
                    .frame(width: 20, height: 20)
            }
            Spacer()
            Text("Детали платежа")
                .cygre(.black, 18)
                .foregroundStyle(.appYellow)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.appYellow)
                    .frame(width: 20, height: 20)
            }


        }
    }
}


