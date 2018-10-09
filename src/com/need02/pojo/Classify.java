package com.need02.pojo;

/**
 * Classify entity. @author MyEclipse Persistence Tools
 */

public class Classify implements java.io.Serializable
{

	// Fields

	private Double code;
	private String title;

	// Constructors

	/** default constructor */
	public Classify()
	{
	}

	/** full constructor */
	public Classify(String title)
	{
		this.title = title;
	}

	// Property accessors

	public Double getCode()
	{
		return this.code;
	}

	public void setCode(Double code)
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