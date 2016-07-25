//
//  ViewController.swift
//  face_detected
//
//  Created by Nguyenh on 7/26/16.
//  Copyright © 2016 Nguyen Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ciImage = CIImage(CGImage: (UIImage(named: "more_face")?.CGImage!)!)
        
        let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options)
        
        let faces = faceDetector.featuresInImage(ciImage)
        
        for i:CIFeature in faces {
            let face = i as! CIFaceFeature
            print("-- Found face at \(face.bounds)")
            
            if face.hasLeftEyePosition {
                print("   Found left eye at \(face.leftEyePosition)")
            }
            
            if face.hasRightEyePosition {
                print("   Found right eye at \(face.rightEyePosition)")
            }
            
            if face.hasMouthPosition {
                print("   Found mouth at \(face.mouthPosition)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

