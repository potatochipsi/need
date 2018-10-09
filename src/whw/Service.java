package whw;

import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import entity.AuthInfo;
import entity.InstitutionInfo;
import entity.RequirementInfo;
import entity.HibernateSessionFactory;
import entity.RoleInfo;

import java.util.Calendar;
public class Service {
	
	//当向数据库添加一条新的需求信息时该函数可以自动生成需求信息的编号
	public static String getRequirementNum()
	{
		String requNum = "";
		//根据当前系统时间来生成字符串的前半部分
		Calendar c = Calendar.getInstance();
		//添加当前年份
		requNum = requNum + c.get(Calendar.YEAR);
		
		//添加当前月份     月份长度够两位直接加上去       月份长度不够两位在月份前面加一个0
		if((c.get(Calendar.MONTH)+1) >= 10)
		{
			requNum = requNum + (c.get(Calendar.MONTH)+1);
		}
		else
		{
			requNum = requNum + "0" + (c.get(Calendar.MONTH)+1);
		}
		
		//添加日期 日期长度够两位直接加上去 日期长度不够两位在日期前面加个0
		if((c.get(Calendar.DATE)) >= 10)
		{
			requNum = requNum + c.get(Calendar.DATE);
		}
		else
		{
			requNum = requNum + "0" + c.get(Calendar.DATE);
		}
		
		
		
		//生成需求编号的后半部分
		Session session = HibernateSessionFactory.getSession();  
		//使用模糊查询来找出当天入库的所有需求
		Criteria criteria = session.createCriteria(RequirementInfo.class);
		criteria.add(Restrictions.like("requirementCoding",requNum,MatchMode.ANYWHERE));
		List<RequirementInfo> allRequ = criteria.list();
		session.close();
		int maxNum = 1;
		if(allRequ.size() > 0)
		{
			Iterator it = allRequ.iterator();
			//记录编号后四位数最大值的字符串
			String strMaxNum = null;
			
			while(it.hasNext())
			{
				strMaxNum = ((RequirementInfo)it.next()).getRequirementCoding();
				int num = Integer.parseInt(strMaxNum.substring(strMaxNum.length()-4,strMaxNum.length()));
				if(num >= maxNum)           
				{
					maxNum = num + 1;
				}
			}
		}
		
		
		
		//根据maxNum的位数确定前面加0的个数
		if(maxNum < 10)
		{
			requNum = requNum + "000" + maxNum;
		}
		else if(maxNum < 100)
		{
			requNum = requNum + "00" + maxNum;
		}
		else if(maxNum < 1000)
		{
			requNum = requNum + "0" + maxNum;
		}
		else
		{
			requNum = requNum + maxNum;
		}
		System.out.println("获得的需求编号是"+requNum);
		return requNum;
	}
	
	//根据权限的编号获取权限的名称
	public static String getAuthNameById(String authId)
	{
		Session session = HibernateSessionFactory.getSession();
		Criteria criteria = session.createCriteria(AuthInfo.class);
		criteria.add(Restrictions.eq("authId",authId));
		AuthInfo auth = (AuthInfo)criteria.list().get(0);
		session.close();
		String authName = null;
		authName = auth.getAuthName();
		return authName;
	}
	
	//检测一个字符串是否存在于一个字符串数组
	public static boolean isExit(String[] strArray,String ele)
	{
		for(int i = 0;i < strArray.length;i++)
		{
			if(ele.equals(strArray[i]))
			{
				return true;
			}
		}
		return false;
	}
	
	//根据角色的id查找该角色所对应的所有权限的编号
	public static String[] getAuthIdsByRoleId(String roleId)
	{
		Session session = HibernateSessionFactory.getSession();
		Criteria criteria = session.createCriteria(RoleInfo.class);
		criteria.add(Restrictions.eq("roleId",Integer.valueOf(roleId)));
		RoleInfo roleInfo = (RoleInfo)criteria.list().get(0);
		String authIds = roleInfo.getAuthIds();
		String[] authIdsArray = authIds.split(",");
		return authIdsArray;
	}
	
	//根据权限编号获取该权限下面的所有的直接子权限
	public static JSONArray getAuthByParentId(String parentId,String[] authArray)
	{
		Integer[] authArrayInt = new Integer[authArray.length];
		//先要把传递过来的String[] 转化成Integer[]
		for(int i = 0;i < authArray.length;i++)
		{
			authArrayInt[i] = Integer.valueOf(authArray[i]);
		}
		JSONArray jsonArray = new JSONArray();
		Session session = HibernateSessionFactory.getSession();
		Criteria criteria = session.createCriteria(AuthInfo.class);
		criteria.add(Restrictions.eq("parentId",Integer.valueOf(parentId)));
		//criteria.add(Restrictions.in("authId",authArrayInt));
		List authList = criteria.list();
		Iterator it = authList.iterator();
		while(it.hasNext())
		{
			AuthInfo authInfo = (AuthInfo)it.next();
			JSONObject jsonObject = new JSONObject();
			System.out.println("一个jsonObject已经生成");
			jsonObject.put("id",authInfo.getAuthId());
			System.out.println("id      "+jsonObject.getInt("id"));
			jsonObject.put("text",authInfo.getAuthName());
			System.out.println("text      "+jsonObject.getString("text"));
			jsonObject.put("state1",authInfo.getAuthState());
			System.out.println("设置的值是"+authInfo.getAuthState()+"                 state1      "+jsonObject.getString("state1"));
			jsonObject.put("iconCls",authInfo.getAuthIcon());
			System.out.println("iconCls      "+jsonObject.getString("iconCls"));
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
	
	//根据权限编号获取该权限下面的所有子权限
	public static JSONArray getAuthIdsByParentId(String parentId,String[] authArray)
	{
		JSONArray jsonArray = getAuthByParentId(parentId,authArray);
		for(int i = 0;i < jsonArray.size();i++)
		{
			JSONObject jsonObject = (JSONObject)jsonArray.get(i);
			if("open".equals(jsonObject.getString("state1")))
			{
				continue;
			}
			else
			{
				jsonObject.put("children", getAuthIdsByParentId(jsonObject.getString("id"),authArray));
			}
		}
		return jsonArray;
	}
	
	//根据用户创建角色时选择的角色返回这些角色和他们的父角色的id
	public static String getAuthIDs(String authId)
	{
		String[] authIds = authId.split(",");
		//权限中包含  查看基础信息  或   编辑基础信息   把用户基础信息管理加进去
		if((isExit(authIds,"3")) || (isExit(authIds,"4")))
		{
			// 用户基础信信息管理没有被选择 把用户基础信息管理加进去
			if(!isExit(authIds,"2"))
			{
				authId = authId + ",2";
			}
		}
		//权限中包含  查看需求基础信息  或   添加需求   把需求基础信息管理加进去
		if((isExit(authIds,"6")) || (isExit(authIds,"7")))
		{
			// 需求基础信息管理没有被选择 把需求基础信息管理加进去
			if(!isExit(authIds,"5"))
			{
				authId = authId + ",5";
			}
		}
		//权限中包含  查看所有已提交需求  或   审核需求   把需求审核管理加进去
		if((isExit(authIds,"9")) || (isExit(authIds,"10")) || (isExit(authIds,"20")))
		{
			// 需求审核管理管理没有被选择 把需求审核管理管理加进去
			if(!isExit(authIds,"8"))
			{
				authId = authId + ",8";
			}
		}
		//权限中包含  查看所有角色  或   添加角色   编辑角色
		if((isExit(authIds,"12")) || (isExit(authIds,"13")) || (isExit(authIds,"14")))
		{
			// 角色管理没有被选择 把角色管理加进去
			if(!isExit(authIds,"11"))
			{
				authId = authId + ",11";
			}
		}
		//权限中包含  查看所有用户  或   添加用户   编辑用户
		if((isExit(authIds,"16")) || (isExit(authIds,"17")) || (isExit(authIds,"18")))
		{
			// 角色管理没有被选择 把角色管理加进去
			if(!isExit(authIds,"15"))
			{
				authId = authId + ",15";
			}
		}
		
		return authId;
	}
	
	//根据角色名称获取角色id
	public static int getRoleIdByName(String roleName)
	{
		Session session = HibernateSessionFactory.getSession();
		Criteria criteria = session.createCriteria(RoleInfo.class);
		criteria.add(Restrictions.eq("roleName",roleName));
		RoleInfo role = (RoleInfo)criteria.list().get(0);
		session.close();
		return role.getRoleId().intValue();
	}
	
	//根据组织机构代码获取机构的名称
	public static String getInsNameByInsCoding(String institutionCoding)
	{
		System.out.println("Service的参数是"+institutionCoding);
		Session session = HibernateSessionFactory.getSession();
		Criteria criteria = session.createCriteria(InstitutionInfo.class);
		criteria.add(Restrictions.eq("institutionCoding",institutionCoding));
		InstitutionInfo ins = (InstitutionInfo)criteria.list().get(0);
		session.close();
		return ins.getName();
	}
}
