//
//  CameraViewController.swift
//  Nabit 1.1
//
//  Created by Michael Manchakowski on 2015-06-04.
//  Copyright (c) 2015 Michael Manchakowski. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class CameraViewController: UIViewController {
    
    let captureSession = AVCaptureSession()
    let captureConnection = AVCaptureConnection()
    var previewLayer : AVCaptureVideoPreviewLayer?
    var imageData: NSData!
     var stillImageOutput = AVCaptureStillImageOutput()

    
    // If we find a device we'll store it here for later use
    var captureDevice : AVCaptureDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        authorizeCamera()
        
        let devices = AVCaptureDevice.devices()
        
        // Loop through all the capture devices on this phone
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                    if captureDevice != nil {
                        println("Capture device found")
                        beginSession()
                    }
                }
            }
        }
        
    }
    
    func focusTo(value : Float) {
        if let device = captureDevice {
            if(device.lockForConfiguration(nil)) {
                device.setFocusModeLockedWithLensPosition(value, completionHandler: { (time) -> Void in
                    //
                })
                device.unlockForConfiguration()
            }
        }
    }
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var anyTouch = touches.first as! UITouch
        var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
        focusTo(Float(touchPercent))
    }
    
  
    @IBAction func NabitPressed(sender: AnyObject) {
    
    }
    
    func captureStillImageAsynchronouslyFromConnection(connection: AVCaptureConnection!,
        completionHandler handler: ((CMSampleBuffer!,
        NSError!) -> Void)!){}
    
    func authorizeCamera() {
        AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo, completionHandler: {
            (granted: Bool) -> Void in
            // If permission hasn't been granted, notify the user.
            if !granted {
                dispatch_async(dispatch_get_main_queue(), {
                    UIAlertView(
                        title: "Could not use camera!",
                        message: "This application does not have permission to use camera. Please update your privacy settings.",
                        delegate: self,
                        cancelButtonTitle: "OK").show()
                })
            }
        });
    }
    

    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        var anyTouch = touches.first as! UITouch
        var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
        focusTo(Float(touchPercent))
    }
    
    func configureDevice() {
        if let device = captureDevice {
            device.lockForConfiguration(nil)
            device.focusMode = .Locked
            device.unlockForConfiguration()
        }
        
    }
    
    func beginSession() {
        
        configureDevice()
        
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.insertSublayer(previewLayer, atIndex: 0)
        previewLayer?.frame = self.view.layer.frame
        captureSession.startRunning()

    }
    
    func hardProcessingWithString(input: String, completion: (result: String) -> Void) {
            completion(result: "we finished!")
    }
    

    
    
    
    
}
