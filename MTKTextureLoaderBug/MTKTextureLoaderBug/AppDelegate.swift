//
//  AppDelegate.swift
//  MTKTextureLoaderBug
//
//  Created by Sean on 6/28/21.
//

import Cocoa
import MetalKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		let device = MTLCreateSystemDefaultDevice()!
		let textureLoader = MTKTextureLoader(device: device)

		// WELCOME!
		//
		// As you'll see in the console, "Image1" loads and decodes and returns an MTLTexture instance.
		// However "Image2" instead throws an error: Error Domain=MTKTextureLoaderErrorDomain Code=0 "Image decoding failed"
		//
		// I spent SO MANY HOURS on this assuming my entire Metal project setup was all wrong until I FINALLY switched
		// out my original image ("Image2") for a different one. When that worked, I started trying to figure out what might
		// be wrong with my original image. I was opening it in every image editor I could find on my system and everything
		// opened it fine. Nothing reported any problems with "Image2" and it was always displayed as expected. I accidently
		// hit CMD-S while I had it open in Acorn and Acorn re-saved the file which is how "Image1" was created.
		// MTKTextureLoader was then able to load that saved version just fine. Luckily I still had a copy of the original
		// so I could file this bug.
		//
		// I suspect that "Image2" is in some weird PNG format, but it must be a valid PNG format because literally everything
		// else I've tried to use to open it has opened it without issue - except MTKTextureLoader.
		
		for imageName in ["Image1", "Image2"] {
			do {
				if let textureURL = Bundle.main.urlForImageResource(imageName) {
					let texture = try textureLoader.newTexture(URL: textureURL)
					print("Loaded texture for", imageName, " => ", texture)
				} else {
					print("Could not find", imageName)
				}
			} catch {
				print("Error creating texture for", imageName, " => ", error)
			}
			print()
		}
	}
}

