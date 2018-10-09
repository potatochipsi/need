package entity;

/**
 * InstitutionInfo entity. @author MyEclipse Persistence Tools
 */

public class InstitutionInfo implements java.io.Serializable {

	// Fields

	private String institutionCoding;
	private String comAddress;
	private String name;
	private String netAddress;
	private String email;
	private String corporation;
	private String zipCoding;
	private String loction;
	private String linkMan;
	private String pwd;
	private String tel;
	private String phone;
	private String fax;
	private String attribute;
	private String manageDepartment;
	private String introduction;

	// Constructors

	/** default constructor */
	public InstitutionInfo() {
	}

	/** minimal constructor */
	public InstitutionInfo(String institutionCoding) {
		this.institutionCoding = institutionCoding;
	}

	/** full constructor */
	public InstitutionInfo(String institutionCoding, String comAddress,
			String name, String netAddress, String email, String corporation,
			String zipCoding, String loction, String linkMan, String pwd,
			String tel, String phone, String fax, String attribute,
			String manageDepartment, String introduction) {
		this.institutionCoding = institutionCoding;
		this.comAddress = comAddress;
		this.name = name;
		this.netAddress = netAddress;
		this.email = email;
		this.corporation = corporation;
		this.zipCoding = zipCoding;
		this.loction = loction;
		this.linkMan = linkMan;
		this.pwd = pwd;
		this.tel = tel;
		this.phone = phone;
		this.fax = fax;
		this.attribute = attribute;
		this.manageDepartment = manageDepartment;
		this.introduction = introduction;
	}

	// Property accessors

	public String getInstitutionCoding() {
		return this.institutionCoding;
	}

	public void setInstitutionCoding(String institutionCoding) {
		this.institutionCoding = institutionCoding;
	}

	public String getComAddress() {
		return this.comAddress;
	}

	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNetAddress() {
		return this.netAddress;
	}

	public void setNetAddress(String netAddress) {
		this.netAddress = netAddress;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCorporation() {
		return this.corporation;
	}

	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}

	public String getZipCoding() {
		return this.zipCoding;
	}

	public void setZipCoding(String zipCoding) {
		this.zipCoding = zipCoding;
	}

	public String getLoction() {
		return this.loction;
	}

	public void setLoction(String loction) {
		this.loction = loction;
	}

	public String getLinkMan() {
		return this.linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getAttribute() {
		return this.attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getManageDepartment() {
		return this.manageDepartment;
	}

	public void setManageDepartment(String manageDepartment) {
		this.manageDepartment = manageDepartment;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

}