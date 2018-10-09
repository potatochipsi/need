package com.need02.pojo;

/**
 * Industry entity. @author MyEclipse Persistence Tools
 */

public class Industry implements java.io.Serializable
{

	// Fields

	private String code;
	private String title;

	// Constructors

	/** default constructor */
	public Industry()
	{
	}

	/** full constructor */
	public Industry(String title)
	{
		this.title = title;
	}

	// Property accessors

	public String getCode()
	{
		return this.code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getTitle()
	{
		return this.title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

}