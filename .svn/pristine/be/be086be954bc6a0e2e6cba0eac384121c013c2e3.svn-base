package fun;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StrHelper {

	/**
	 * 删除指定位置的字符串
	 * @param json
	 * @param start
	 * @param end
	 * @return
	 */
	public static String get_newJsonStr(String str, String reg, String value) {
		String newJson = str;
		Pattern pattern = Pattern.compile(reg);
		Matcher matcher = pattern.matcher(str);
		while(matcher.find()) {
			newJson = newJson.replace(matcher.group(),value);
			matcher = pattern.matcher(newJson);
		}
		return newJson;
	}
	
	/**
	 * 判断字符串是不是数字
	 * @param str
	 * @return
	 */
	public static boolean isNum(String str){
		return str.matches("^[-+]?(([0-9]+)([.]([0-9]+))?|([.]([0-9]+))?)$");
	}
	
	/**
	 * 从职位扩展编号中取出公司id
	 * @param organId
	 * @return
	 */
	public static String getOrganId(String jobnum){
		String organId = jobnum.substring(jobnum.indexOf("CZ")+2, jobnum.indexOf("J"));
		while(organId.charAt(organId.length()-1) == '0'){
			organId = organId.substring(0, organId.length()-1);
		}
		while(organId.charAt(0) == '0'){
			organId = organId.substring(1, organId.length());
		}
		return organId;
	}
	
	/**
	 * 从职位扩展编号中取出职位id
	 * @param jobnum
	 * @return
	 */
	public static String getJobId(String jobnum){
		String organId = jobnum.substring(jobnum.indexOf("J")+1, jobnum.length());
		while(organId.charAt(organId.length()-1) == '0'){
			organId = organId.substring(0, organId.indexOf(organId.length()-1));
		}
		while(organId.charAt(0) == '0'){
			organId = organId.substring(1, organId.length());
		}
		return organId;
	}
	
}
