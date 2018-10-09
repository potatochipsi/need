package whw;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import entity.HibernateSessionFactory;
import entity.SubjectInfo;
import entity.UserInfo;

public class SubjectLevel {
	
	private static List<SubjectInfo> subjectList;
	
	//查询出所有的学科分类信息
	static
	{
		Session session = HibernateSessionFactory.getSession();  
		Criteria criteria = session.createCriteria(SubjectInfo.class);
		subjectList = criteria.list();
		System.out.println("总共查到了"+subjectList.size()+"个学科");
	}
	
	//判读是否是一级学科
	public static boolean isFirstLevel(String subjectCode)
	{
		
		if(subjectCode == null)
		{
			return false;
		}
		else
		{
			char[] charArray = subjectCode.toCharArray();
			//后6位全部是0就是一级学科
			for(int i = 2;i < subjectCode.length();i++)
			{
				if('0' != charArray[i])
				{
					return false;
				}
			}
			return true;
		}
	}
	
	//以String的形式把一级学科返回回去
	public static String getFirstSubject()
	{
		//存放所有的一节学科的信息
		String firLevel = new String();
		Iterator it = subjectList.iterator();
		//遍历学科列表 把一级学科按照列表的形式保存起来
		while(it.hasNext())
		{
			SubjectInfo subject = (SubjectInfo)it.next();
			if(isFirstLevel(subject.getCode()))
			{
				firLevel = firLevel + "," + subject.getTitle();
			}
		}
		System.out.println("返回的一级学科字符串是"+firLevel.substring(1));
		//最前面是一个多余的,
		return firLevel.substring(1);
		
	}
	
	//检测是否 是这个一级学科的二级学科
	public static boolean isMatchFirAndSec(String firCode,String secCode)
	{
		System.out.println("检查二级学科是否匹配 一级学科的Code"+firCode+"     二级学科的Code"+secCode);
		//防止一级学科把自己当作自己的二级学科
		if(firCode.equals(secCode))
		{
			return false;
		}
		else
		{
			String beginStr = firCode.substring(0,2);
			//要比较的学科和一级学科的前两位是相等的
			if((secCode.substring(0,2).equals(beginStr)))
			{
				//要比较的学科的后三位必须全部是0
				for(int i = secCode.length(),j = 0;j < 3;j++,i--)
				{
					if('0' != secCode.charAt(i-1))
					{
						return false;
					}
				}
				return true;
			}
			else
			{
				return false;
			}
		}
	}
	
	//根据一级学科的编号返回对应的二级学科
	public static String getSecLevelByFirCode(String firLevelCode)
	{
		//存放一级学科所对应二级学科的信息
		String secLevel = new String();
		Iterator it = subjectList.iterator();
		//遍历学科列表 把一级学科按照列表的形式保存起来
		while(it.hasNext())
		{
			SubjectInfo subject = (SubjectInfo)it.next();
			if(isMatchFirAndSec(firLevelCode,subject.getCode()))
			{
				secLevel = secLevel + "," + subject.getTitle();
			}
		}
		System.out.println("返回的二级学科字符串是"+secLevel.substring(1));
		//前面有一个,
		return secLevel.substring(1);		
	}
	
	//检测是否 是这个二级学科的三级学科
	public static boolean isMatchSecAndTir(String secCode,String tirCode)
	{
		//防止二级学科把自己当作自己的三级学科
		if(secCode.equals(tirCode))
		{
			return false;
		}
		else
		{
			String beginStr = secCode.substring(0,5);
			//要比较的学科和一级学科的前两位是相等的
			if((tirCode.substring(0,5).equals(beginStr)))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}	
		
	//根据二级学科的编号返回对应的三级学科
	public static String getTirLevelBySecCode(String secLevelCode)
	{
		//存放二级学科所对应三级学科的信息
		String tirLevel = new String();
		Iterator it = subjectList.iterator();
		//遍历学科列表 把一级学科按照列表的形式保存起来
		while(it.hasNext())
		{
			SubjectInfo subject = (SubjectInfo)it.next();
			if(isMatchSecAndTir(secLevelCode,subject.getCode()))
			{
				tirLevel = tirLevel + "," + subject.getTitle();
			}
		}
		System.out.println("返回的三级学科字符串是"+tirLevel.substring(1));  
		
		//前面有一个,
		return tirLevel.substring(1);		
	}	

	//根据学科名称返回学科的编号
	public static String getSubjectCode(String subjectTitle)
	{
		Iterator it = subjectList.iterator();
		//遍历学科列表 把一级学科按照列表的形式保存起来
		while(it.hasNext())
		{
			SubjectInfo subject = (SubjectInfo)it.next();
			if(subject.getTitle().equals(subjectTitle))
			{
				return subject.getCode();
			}
		}
		return null;
	}
}
