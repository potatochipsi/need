package whw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBOperation {
	/**
	 * 获取连接对象
	 * @return 连接对象
	 *
	private static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/yybbs";
			conn = DriverManager.getConnection(url, "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	*/
	
	private static Connection conn;
	private static Statement stmt;
	public static void getConnection() {
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("驱动注册成功");
			String url = "jdbc:sqlserver://localhost:1434;DatabaseName=ImportantTechnologyNeed";
			conn = DriverManager.getConnection(url, "sa", "123456");
			System.out.println("数据库获取连接成功");
			stmt = conn.createStatement();
			System.out.println("语句对象创建成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 设置预编译上下文对象参数的方法
	 * @param pst 要设置参数的编译对象
	 * @param obj 参数列表
	 
	private static void setParameters(PreparedStatement pst,Object...obj) {
		try {
			if(obj != null) {
				for(int i=0;i<obj.length;i++) {
					pst.setObject(i+1, obj[i]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	/**
	 * 释放操作数据库的相关对象
	 * @param obj 要释放的对象列表
	 
	private static void closeObject(Object...obj) {
		try {
			for(Object value : obj) {
				if(value instanceof ResultSet) {
					((ResultSet)value).close();
				}
				if(value instanceof PreparedStatement) {
					((PreparedStatement)value).close();
				}
				if(value instanceof Connection) {
					Connection conn = (Connection)value;
					if(!conn.isClosed()) {
						conn.close();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	/**
	 * 执行简单SQL的增，删，改命令
	 * @param sql 执行的SQL指令
	 * @param obj 接受SQL的参数列表
	 * @return 返回操作受影响的行数
		public static int executeUpdate(String sql,Object...obj) {
		int row = 0;
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = getConnection();
			pst = conn.prepareStatement(sql);
			// 调用设置参数的方法
			setParameters(pst, obj);
			// 执行指令并处理返回结果
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeObject(pst,conn);
		}
		return row;
	}
	 */

	/**
	 * 执行所有对象的查询方法
	 * @param sql 执行的SQL指令
	 * @param obj 接受SQL的参数列表
	 * @return 返回查询的结果集合对象
	 
	public static List<Map<Object,Object>> queryObject(String sql,Object... obj) {
		List<Map<Object,Object>> table = new ArrayList<Map<Object,Object>>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pst = conn.prepareStatement(sql);
			// 调用设置参数的方法
			setParameters(pst, obj);
			// 执行查询并处理返回结果
			rs = pst.executeQuery();
			// 判断是否存在查询结果
			if(rs != null) {
				// 把结果集合转换为虚拟的表格
				ResultSetMetaData rsd = rs.getMetaData();
				// 获取当前查询的表有多少列
				int cloumns = rsd.getColumnCount();
				while(rs.next()) {
					// 创建存储当前循环行的集合对象
					Map<Object, Object> row = new HashMap<Object, Object>();
					// 循环当前遍历行的所有列
					for(int i=1;i<=cloumns;i++) {
						// 把当前遍历列和列对应值存储在行的集合中
						row.put(rsd.getColumnName(i), rs.getObject(i));
					}
					
					// 把每遍历的行添加到表格的集合对象中
					table.add(row);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeObject(rs,pst,conn);
		}
		
		return table;
	}
	*/
	
	public static int executeUpdate(String s) {
		int result = 0;
		try {
			System.out.println("传递过来的更新语句为:"+s);
			result = stmt.executeUpdate(s);
			System.out.println("执行更新成功");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.out.println("执行更新错误");
		}
		return result;
	}

	public static ResultSet executeQuery(String s) {
		System.out.println("传递过来的查询语句为:"+s);
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
			System.out.println("执行查询成功");
		} catch (Exception e) {
			
			System.out.println(e.getStackTrace());
			System.out.println(e.getClass());
			System.out.println("执行查询错误！");
		}
		return rs;
	}
	
	public static void close()
	{
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
