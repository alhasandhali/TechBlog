package Helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class PhotoHelper {
	public static boolean deleteFile(String path) {
		boolean f = false;
		
		try {
			File file = new File(path);
			f = file.delete();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return f;
	}
	
	public static boolean saveFile(InputStream is, String path) {
		boolean f = false;
		
		try {
			byte b[] = new byte[is.available()];
			
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			
			fos.write(b);
			
			fos.flush();
			fos.close();
			f = true;
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return f;
	}
}
