package fun;

import fun.Filter.WXFilter;
import org.apache.commons.io.FileUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;




/**
 * 文件处理类
 * 
 * @author zhaokaicheng
 * 
 */
public class OperateFileUtils {
	
	public static String touser = "";
	public static String toparty = "";
	public static String projectAfterName = "";
	
	/**
	 * 写文件
	 */
	public static void writeFile(String filePath,String content){
		FileWriter writer = null;
        try {     
            // 打开一个写文件器，构造函数中的第二个参数true表示以追加形式写文件     
            writer = new FileWriter(filePath, true);
            writer.write(content);
        } catch (IOException e) {     
            e.printStackTrace();     
        } finally {     
            try {     
                if(writer != null){  
                    writer.close();     
                }  
            } catch (IOException e) {     
                e.printStackTrace();     
            }     
        }
	}
	
	public static void writeErrLog(String filePath,String errName, String err_url, String err_type, String err_param, String err_json, String explain){
		writeFile(filePath, errName+"\r\n"+"URL: " + err_url
				+ "\r\n" + "参数: " + err_param + "\r\n" + "请求类型: "
				+ err_type + "\r\n" + "返回值: " + err_json + "\r\n"
				+explain+"\r\n"+"\r\n" );
		Pattern pet = Pattern.compile("\\{[\\w]+\\}");
        Matcher match = pet.matcher(err_url+err_param+explain);
        //收件人和收件组为空、前置接口报错、接口参数报错中带有未替换的变量时  不发微信报错
        if(match.find() || WXFilter.parentHasErr(err_url) || (0 == touser.length() && 0 == toparty.length())) {
        	return;
        }
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		//url+param
		map = new HashMap<String, String>();
		map.put("title", "Moblie"+projectAfterName+" url:"+err_url);
		map.put("description", "参数:"+err_param);
		map.put("url", err_url+err_param);
		map.put("picurl", "");
		list.add(map);
		//result
		map = new HashMap<String, String>();
		map.put("title", "返回结果:"+err_json);
		map.put("description", "");
		map.put("url", err_json);
		map.put("picurl", "");
		list.add(map);
		//err
		map = new HashMap<String, String>();
		map.put("title", errName + "\n" + explain);
		map.put("description", "");
		map.put("url", errName + "\n" + explain);
		map.put("picurl", "");
		list.add(map);
		new Weixin(touser, toparty).sendNews(list);
	}

	/**
	 * 删除文件
	 * 
	 * @param filePath
	 */
	public static void deleteFile(String filePath) {
		File file = new File(filePath);
		if (file.exists()) {
			if (file.isFile()) {
				file.delete();
			}
		}
	}

	/**
	 * 读取cucumber生成的report js文件
	 * 
	 * @param filePath
	 * @return
	 */
	public static Map<Integer, String> readReportJSFile(String filePath) {
		Map<Integer, String> resultMap = new HashMap<Integer, String>();
		File file = new File(filePath);
		BufferedReader reader = null;

		String tempStr = null;
		int i = 0;
		try {
			reader = new BufferedReader(new InputStreamReader(
					new FileInputStream(file), "UTF-8"));
			while ((tempStr = reader.readLine()) != null) {
				if (tempStr.equalsIgnoreCase("\"status\": \"passed\"")
						|| tempStr.equalsIgnoreCase("\"status\": \"failed\",")) {
					resultMap.put(i, tempStr.split("\"")[3]);
					i++;
				}
			}
			reader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("report.js文件没有找到!!!");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}

		return resultMap;
	}

	/**
	 * 修改文件名
	 * 
	 * @param newFileName
	 */
	public static void renameFile(String filePath, List<String> newFileName) {
		File file = new File(filePath);
		for(int i = 0; i < newFileName.size(); i++) {
			File new_file = new File(filePath + newFileName.get(i) + ".png");
			file.listFiles()[i].renameTo(new_file);
		}
	}

	/**
	 * 将byte[]转换成File
	 * 
	 * @param b
	 * @param outputFile
	 * @return
	 */
	public static File getFileFromBytes(byte[] b, String outputFile) {
		BufferedOutputStream stream = null;
		File file = null;
		try {
			file = new File(outputFile);
			FileOutputStream fstream = new FileOutputStream(file);
			stream = new BufferedOutputStream(fstream);
			stream.write(b);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stream != null) {
				try {
					stream.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		return file;
	}

	/**
	 * 获取目录里以某个后缀结尾的所有文件
	 * 
	 * @param filePath
	 * @param data
	 * @return
	 */
	public static List<File> getFile(String filePath, List<File> data,
			String suffixName) {
		File file = new File(filePath);
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) {
				data = getFile(files[i].getPath(), data, suffixName);
			}
		} else if (file.getName().endsWith(suffixName)) {
			data.add(file);
		}
		return data;
	}

	/**
	 * 复制文件到某个文件夹里
	 */
	public static void copyFile() {
		// 将截图的image复制到指定的文件夹里
		String relativelyPath = System.getProperty("user.dir"); // 获取项目的根目录
		String src_file_path = relativelyPath + "/build/cucumber";
		List<File> data = new ArrayList<File>();
		data = OperateFileUtils.getFile(src_file_path, data, ".png");
		String new_path = "D:/SeleniumImage";
		File new_file = new File(new_path);
		if (!new_file.isDirectory()) {
			new_file.mkdir();
		}
		for (int i = 0; i < data.size(); i++) {
			File file = new File(new_path + "/" + i + ".png");
			try {
				FileUtils.copyFile(data.get(i), file);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}
	
	/**
	 * copy目录
	 * 
	 * @param dirPath
	 * @param newDirPath
	 * @return
	 */
	public static void copyDir(String dirPath, String newDirPath) {
		File dir = new File(dirPath);
		File new_dir = new File(newDirPath);
		if (!new_dir.exists() || new_dir.isFile()) {
			new_dir.mkdir();
		}
		try {
			FileUtils.copyDirectory(dir, new File(newDirPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	 public static void main(String[] args) {
//		 List<String> list = new ArrayList<String>();
//		 list.add("test01");
//		 renameFile("D:\\SeleniumImage", );
//	 String path =
//	 "D:/Selenium自动化测试/自动售卖平台/sell-platform-online-autoTest/build/cucumber";
//	 List<File> data = new ArrayList<File>();
//	 data = getFile(path, data, ".png");
//	
//	 for(int i = 0; i < data.size(); i++ ) {
//	 System.out.println(data.get(i).getName());
//	 }
//	 String new_path = "D:/SeleniumImage";
//	 File new_file = new File(new_path);
//	 if (!new_file.isDirectory()) {
//	 new_file.mkdir();
//	 }
//	
//	 for (int i = 0; i < data.size(); i++) {
//	 File file = new File(new_path + "/" + i + ".png");
//	 try {
//	 FileUtils.copyFile(data.get(i), file);
//	 } catch (IOException e) {
//	 e.printStackTrace();
//	 throw new RuntimeException(e);
//	 }
//	 }
//	 }
}
