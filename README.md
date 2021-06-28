# MTKTextureLoaderBug
Demonstration of a bug in MTKTextureLoaderBug.

One image decodes into a texture, and one doesn't. "Image2" is the original image I found that does not load correctly - however everything I've tried will happily open that image. I accidentally hit CMD-S in the Acorn image editor at one point and discovered that the re-saved version ("Image1") now loads just fine!

This was filed with Apple as: FB9216874