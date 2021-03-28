//
//  ContentView.swift
//  Calculator
//
//  Created by  generic on 2021/3/25.
//

import SwiftUI

struct ContentView: View {
    
    let scale:CGFloat = UIScreen.main.bounds.width / 414
    
    var body: some View {
        VStack(spacing:12) {
            Spacer()
            Text("0")
                .foregroundColor(.primary)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(
                    minWidth:0,
                    maxWidth: .infinity,
                    alignment: .trailing
                )
            CalculatorButtonPad()
            .padding(.bottom)
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.colorScheme, .light)
        }
    }
}

struct CalculatorButton: View {
    let fontSize:CGFloat = 38
    let title:String
    let size:CGSize
    let backgroundColorName:String
    let foregroundColor:Color
    let action:()->Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .foregroundColor(foregroundColor)
                .font(.system(size: fontSize))
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        })
    }
}

struct CalculatorButtonRow:View {
    
    let row:[CalculatorButtonItem]
    var body: some View {
        HStack{
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName,
                    foregroundColor: item.foregroundColor) {
                    print("Button:\(item.title)")
                }
            }
        }
    
    }
}

struct CalculatorButtonPad:View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [.digit(4),.digit(5),.digit(6),.op(.multiply)],
        [.digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing:8) {
            ForEach(pad,id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}
