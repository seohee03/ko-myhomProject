package com.myhome.www.util;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

public class FileUtil {

	public static void imageResize(String orgFilePath, String targetFilePath, String imageType) throws Exception{
		System.out.println("file resize make thumb");
		BufferedImage originalImage = ImageIO.read(new File(orgFilePath));

		int imgwidth = Math.min(originalImage.getHeight(),  originalImage.getWidth());
		int imgheight = imgwidth;

		BufferedImage scaledImage = Scalr.crop(originalImage, (originalImage.getWidth() - imgwidth)/2, (originalImage.getHeight() - imgheight)/2, imgwidth, imgheight);
		BufferedImage resizedImage = Scalr.resize(scaledImage, 200, 200);
		ImageIO.write(resizedImage, imageType, new File(targetFilePath));
		System.out.println("file resize make thumb4");
		
	}
}
