package fun;

import java.sql.*;
import java.util.*;


public class OperateDBUtils {
	public static String url = "jdbc:sqlserver://172.17.0.14:1433;DatabaseName=AutoTest_Result";
	public static String user = "zhaopin_sa";
	public static String password = "zhaopin_sa";
	public static Connection conn;
	public static Statement stmt;
	public static ResultSet rs;
	
  
	
	//执行SQL语句
	public static void ExecuteSQL(String sql){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (ClassNotFoundException | SQLException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//返回数据库中某一列的值（列类型为Int）
	public  static ArrayList<Integer> ReadSQLInt(String sql,String column){
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int result = rs.getInt(column);
				list.add(result);
			}
		} catch (ClassNotFoundException | SQLException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//返回数据库中某一列的值（列类型为nvchar(MAX))
	public static ArrayList<String> ReadSQLStr(String sql,String column){
		ArrayList<String> list = new ArrayList<String>();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String result = rs.getString(column);
				list.add(result);
			}
		} catch (ClassNotFoundException | SQLException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
	
	//获取页面的元素标识及元素值，返回ArrayList类型
	public static ArrayList<String> getPageContent(String name){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select identify_By,identify_Keyword from pageContent where name='"+name+"'";
		ArrayList<String> list1 = ReadSQLStr(sql,"identify_By");
		ArrayList<String> list2 = ReadSQLStr(sql,"identify_Keyword");
		String identify_By = list1.get(0);
		String identify_Keyword = list2.get(0);
		list.add(identify_By);
		list.add(identify_Keyword);
		return list;
	}

//	public static void main(String[] args) {
//		OperateDBUtils opDB = new OperateDBUtils();
//		String now = DateUtil.getCurrentDate("yyyy/MM/dd HH:mm:ss");
//		String sql = "insert into apiResTime(ip,testContent,resTime,insertTime) values('192.168.1.1','aaa',0.5,'"+now+"')";
//		opDB.ExecuteSQL(sql);
//	}
}
