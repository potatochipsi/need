package entity;

import java.sql.Timestamp;

/**
 * RequirementInfo entity. @author MyEclipse Persistence Tools
 */

public class RequirementInfo implements java.io.Serializable {

	// Fields

	private String requirementCoding;
	private String name;
	private String introMainProblem;
	private String introTechnologyKey;
	private String introExceptGoal;
	private String timeLimited;
	private String keyWord;
	private String studyType;
	private String subjectType;
	private String technologyArea;
	private String dealWay;
	private String applyIndustry;
	private String cooperationIndustry;
	private String moneyNeed;
	private String selfInvestment;
	private String institutionCoding;
	private String nowState;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public RequirementInfo() {
	}

	/** minimal constructor */
	public RequirementInfo(String requirementCoding) {
		this.requirementCoding = requirementCoding;
	}

	/** full constructor */
	public RequirementInfo(String requirementCoding, String name,
			String introMainProblem, String introTechnologyKey,
			String introExceptGoal, String timeLimited, String keyWord,
			String studyType, String subjectType, String technologyArea,
			String dealWay, String applyIndustry, String cooperationIndustry,
			String moneyNeed, String selfInvestment, String institutionCoding,
			String nowState, Timestamp addTime) {
		this.requirementCoding = requirementCoding;
		this.name = name;
		this.introMainProblem = introMainProblem;
		this.introTechnologyKey = introTechnologyKey;
		this.introExceptGoal = introExceptGoal;
		this.timeLimited = timeLimited;
		this.keyWord = keyWord;
		this.studyType = studyType;
		this.subjectType = subjectType;
		this.technologyArea = technologyArea;
		this.dealWay = dealWay;
		this.applyIndustry = applyIndustry;
		this.cooperationIndustry = cooperationIndustry;
		this.moneyNeed = moneyNeed;
		this.selfInvestment = selfInvestment;
		this.institutionCoding = institutionCoding;
		this.nowState = nowState;
		this.addTime = addTime;
	}

	// Property accessors

	public String getRequirementCoding() {
		return this.requirementCoding;
	}

	public void setRequirementCoding(String requirementCoding) {
		this.requirementCoding = requirementCoding;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroMainProblem() {
		return this.introMainProblem;
	}

	public void setIntroMainProblem(String introMainProblem) {
		this.introMainProblem = introMainProblem;
	}

	public String getIntroTechnologyKey() {
		return this.introTechnologyKey;
	}

	public void setIntroTechnologyKey(String introTechnologyKey) {
		this.introTechnologyKey = introTechnologyKey;
	}

	public String getIntroExceptGoal() {
		return this.introExceptGoal;
	}

	public void setIntroExceptGoal(String introExceptGoal) {
		this.introExceptGoal = introExceptGoal;
	}

	public String getTimeLimited() {
		return this.timeLimited;
	}

	public void setTimeLimited(String timeLimited) {
		this.timeLimited = timeLimited;
	}

	public String getKeyWord() {
		return this.keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getStudyType() {
		return this.studyType;
	}

	public void setStudyType(String studyType) {
		this.studyType = studyType;
	}

	public String getSubjectType() {
		return this.subjectType;
	}

	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}

	public String getTechnologyArea() {
		return this.technologyArea;
	}

	public void setTechnologyArea(String technologyArea) {
		this.technologyArea = technologyArea;
	}

	public String getDealWay() {
		return this.dealWay;
	}

	public void setDealWay(String dealWay) {
		this.dealWay = dealWay;
	}

	public String getApplyIndustry() {
		return this.applyIndustry;
	}

	public void setApplyIndustry(String applyIndustry) {
		this.applyIndustry = applyIndustry;
	}

	public String getCooperationIndustry() {
		return this.cooperationIndustry;
	}

	public void setCooperationIndustry(String cooperationIndustry) {
		this.cooperationIndustry = cooperationIndustry;
	}

	public String getMoneyNeed() {
		return this.moneyNeed;
	}

	public void setMoneyNeed(String moneyNeed) {
		this.moneyNeed = moneyNeed;
	}

	public String getSelfInvestment() {
		return this.selfInvestment;
	}

	public void setSelfInvestment(String selfInvestment) {
		this.selfInvestment = selfInvestment;
	}

	public String getInstitutionCoding() {
		return this.institutionCoding;
	}

	public void setInstitutionCoding(String institutionCoding) {
		this.institutionCoding = institutionCoding;
	}

	public String getNowState() {
		return this.nowState;
	}

	public void setNowState(String nowState) {
		this.nowState = nowState;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}