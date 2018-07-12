package fun;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class common {
	
	/**
	 * 功能描述：显示等待
	 *   参数：等待时间
	 *  返回值：无
	 */
	public static void waitTime(int t){
		try {
			Thread.sleep(t);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 功能描述：判断一个日期是否在一个日期段内
	 *   参数：date 被判断日期
	 *       dateBefore 小日期
	 *       dateAfter  大日期
	 *  返回值：boolean值（true or false）
	 */
	public static boolean dateCompare(Date date,Date dateBefore,Date dateAfter){
		if(date.before(dateAfter)&&date.after(dateBefore)){
			return true;
		}else{
		return false;
		}
	}
	
	/**
	 * 功能描述：产生一个随机数
	 *    参数：int型整数
	 *   返回值：小宇number的正整数
	 */
	public static int getRandom(int number) {
		Random rnd = new Random();
		if (number == 1 || number == 0) {
			return number;
		} else {
			int i = rnd.nextInt(number);
			return i;
		}
	}
	
	/**
	 * 功能描述：获取本机的IP地址
	 *  返回值：本机IP地址
	 */
	public static String getIp(){
			InetAddress address = null;
			try {
				address = InetAddress.getLocalHost();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return address.getHostAddress();
	}

	/**
	 * 功能描述：获取当前系统日期
	 *
	 *  返回值：当前系统日期
	 */
	public static String getCurrentDate() {
			Date now = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyy/MM/dd HH:mm:ss");// 可以方便地修改日期格式
			String currentDate = dateFormat.format(now);
			return currentDate;
	}

	/**
	 * 功能描述：将当前系统日期转化为字符串
	 *  返回值： 当前系统日期的字符串（如：20140906120500）
	 */
	public  static String getCurrentDateStr() {
			Calendar cal = Calendar.getInstance();
			int y, m, d, h, mi, s;
			String strM = null, strD = null, strH = null, strMi = null, strS = null;
			y = cal.get(Calendar.YEAR);
			m = cal.get(Calendar.MONTH)+1;
			d = cal.get(Calendar.DATE);
			h = cal.get(Calendar.HOUR_OF_DAY);
			mi = cal.get(Calendar.MINUTE);
			s = cal.get(Calendar.SECOND);
			if (m < 10) {
				strM = "0" + String.valueOf(m);
			} else {
				strM = String.valueOf(m);
			}
			if (d < 10) {
				strD = "0" + String.valueOf(d);
			} else {
				strD = String.valueOf(d);
			}
			if (h < 10) {
				strH = "0" + String.valueOf(h);
			} else {
				strH = String.valueOf(h);
			}
			if (mi < 10) {
				strMi = "0" + String.valueOf(mi);
			} else {
				strMi = String.valueOf(mi);
			}
			if (s < 10) {
				strS = "0" + String.valueOf(s);
			} else {
				strS = String.valueOf(s);
			}
			String newStr = String.valueOf(y) + strM + strD + strH + strMi + strS;
			return newStr;
	}

	/**
	 * 功能描述：去掉字符串中的"\"
	 *   参数：str 字符串
	 *  返回值：去掉"\"的字符串
	 */
	public static String getStrNoQuot(String str) {
			String newStr = str.replace("\"", "");
			return newStr;
	}
	
	/**
	 * 复制数组
	 * @param arr
	 * @param begin
	 * @param length
	 * @return
	 */
	public static String[] arrayCopy(String[] arr, int begin, int length){
		String reArray[] = new String[length];
		for(int i=0; i<length; i++){
			reArray[i] = arr[begin++];
		}
		
		return reArray;
	}
	
}
