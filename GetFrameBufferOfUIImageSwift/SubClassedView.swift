//
//  SubClassedView.swift
//  GetFrameBufferOfUIImageSwift
//
//  Created by Douglas Voss on 6/12/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//

import UIKit

class SubClassedView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    //let gifImg = UIImage(named: "egg_drop")!
    //let gifImg = UIImage(named: "TestColorShape")!
    //let img = UIImage(named: "TestColorShape")!
    let img = UIImage(named: "ghost")!
    let maskColor1 : [CGFloat] = [255.0, 255.0, 0.0, 0.0, 0.0, 0.0]
    let maskColor2 : [CGFloat] = [0.0, 0.0, 0.0, 0.0, 255.0, 255.0]
    
    override func drawRect(rect: CGRect) {
        var context : CGContextRef = UIGraphicsGetCurrentContext()!
        var CGImg : CGImageRef = img.CGImage
        
        var width = CGImageGetWidth(CGImg);
        var height = CGImageGetHeight(CGImg);
        let bytesPerPixel = 4;
        let bytesPerRow = bytesPerPixel * width
        let bitsPerComponent = 8
        
        var pixels : UnsafeMutablePointer<Void> = calloc(height * width, sizeof(UInt32))
        var colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitmapInfo = CGBitmapInfo(CGImageAlphaInfo.PremultipliedLast.rawValue | CGBitmapInfo.ByteOrder32Big.rawValue)
        
        var bmpContext = CGBitmapContextCreate(pixels, width, width, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo)
        
        //CGContextRef context = CGBitmapContextCreate(pixels, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
        
        CGContextDrawImage(bmpContext, CGRectMake(0.0, 0.0, CGFloat(width), CGFloat(height)), CGImg)
        CGContextDrawImage(context, rect, CGImg)
        
        var ptr = UnsafePointer<UInt32>(pixels)
        for var j=0; j < height; j++
        {
            for var i=0; i < width; i++
            {
                var color : UInt32 = ptr.memory
                print(String(format: "%x ", color))
                //print(String(format: "%x ", ptr))
                ptr++
            }
            println("")
            println(String(format:"j=%d", j))
        }
    }

}
