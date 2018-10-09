package com.need02.action;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;
import com.need02.pojo.Classify;
import com.need02.pojo.Industry;
import com.opensymphony.xwork2.ActionSupport;
import com.need02.service.ClassifyService;

@SuppressWarnings("serial")
public class ClassifyAction extends ActionSupport
{
	private ClassifyService classifyService;
	private List<Classify> firstid;
	private List<Classify> secondid;
	private List<Classify> thirdid;
	private List<Industry> first;
	private List<Industry> second;
	private List<Industry> third;
	private String xkCode2;
	private String xkCode3;
	private String GmCode2;
	private String GmCode3;
	
	@JSON(serialize=false)
	
	public List<Classify> getFirstid()
	{
		return firstid;
	}
	
	public ClassifyService getClassifyService()
	{
		return classifyService;
	}

	public void setClassifyService(ClassifyService classifyService)
	{
		this.classifyService = classifyService;
	}

	public void setFirstid(List<Classify> firstid)
	{
		this.firstid = firstid;
	}
	
	public List<Classify> getSecondid()
	{
		return secondid;
	}

	public void setSecondid(List<Classify> secondid)
	{
		this.secondid = secondid;
	}
	
	public List<Classify> getThirdid()
	{
		return thirdid;
	}
	
	public void setThirdid(List<Classify> thirdid)
	{
		this.thirdid = thirdid;
	}
	
	public List<Industry> getFirst()
	{
		return first;
	}

	public void setFirst(List<Industry> first)
	{
		this.first = first;
	}

	public List<Industry> getSecond()
	{
		return second;
	}
	
	public void setSecond(List<Industry> second)
	{
		this.second = second;
	}

	public List<Industry> getThird()
	{
		return third;
	}
	
	public void setThird(List<Industry> third)
	{
		this.third = third;
	}

	public String getXkCode2() {
		return xkCode2;
	}

	public void setXkCode2(String xkCode2) {
		this.xkCode2 = xkCode2;
	}

	public String getXkCode3() {
		return xkCode3;
	}

	public void setXkCode3(String xkCode3) {
		this.xkCode3 = xkCode3;
	}

	public String getGmCode2() {
		return GmCode2;
	}

	public void setGmCode2(String gmCode2) {
		GmCode2 = gmCode2;
	}

	public String getGmCode3() {
		return GmCode3;
	}

	public void setGmCode3(String gmCode3) {
		GmCode3 = gmCode3;
	}

	//���񾭼õ�һ��������
	public String FirstGm()
	{
		System.out.println(11);
		this.first=classifyService.getFirstGmjjhys();
		System.out.println("A执行getFirstGmjjhys()");
		System.out.println(first.size());
		return "Success";
	}

	public String SecondGm()
	{
		second=classifyService.getSecondGmjjhys(GmCode2);
		System.out.println(second.size());
		return "Success";
	}

	public String ThirdGm()
	{
		third=classifyService.getThirdGmjjhys(GmCode3);
		System.out.println(third.size());
		return "Success";
	}
	
	//ѧ�Ʒ����һ��������	
	public String FirstSubject()
	{
		firstid=classifyService.getFirstXkfls();
		System.out.println(firstid.size());
		return "Success";
	}

	public String SecondSubject()
	{
		secondid=classifyService.getSecondXkfls(xkCode2);
		System.out.println(secondid.size());
		return "Success";
	}

	public String ThirdSubject()
	{
		thirdid=classifyService.getThirdXkfls(xkCode3);
		System.out.println(thirdid.size());
		return "Success";
	}    
}
