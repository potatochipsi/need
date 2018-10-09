package com.need02.service;

import java.util.List;

import com.need02.dao.ClassifyDAO;
import com.need02.pojo.Classify;
import com.need02.pojo.Industry;

public class ClassifyService
{
	private ClassifyDAO classify;

	public ClassifyDAO getClassify()
	{
		return classify;
	}

	public void setClassify(ClassifyDAO classify)
	{
		this.classify = classify;
	}

	//获取国民经济行业的第一个下拉框
	public List<Industry> getFirstGmjjhys()
	{
		System.out.println("Service执行getFirstGmjjhys()");
		System.out.println(classify.getFirstGmjjhys());
		return classify.getFirstGmjjhys();
	}
	
	//获取国民经济行业的第二个下拉框
	public List<Industry> getSecondGmjjhys(String secondCode)
	{
		return classify.getSecondGmjjhys(secondCode);
	}
	
	//获取国民经济行业的第三个下拉框
	public List<Industry> getThirdGmjjhys(String thirdCode)
	{
		return classify.getThirdGmjjhys(thirdCode);
	}
	
	//获取学科分类第一个下拉框
	public List<Classify> getFirstXkfls()
	{
		return classify.getFirstXkfls();
	}

	//获取学科分类的第二个下拉框
	public List<Classify> getSecondXkfls(String secondXcode)
	{
		return classify.getSecondXkfls(secondXcode);
	}

	//获取学科分类的第三个下拉框的值
	public List<Classify> getThirdXkfls(String thirdXcode)
	{
		return classify.getThirdXkfls(thirdXcode);
	}
}
