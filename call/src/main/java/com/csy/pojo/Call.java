package com.csy.pojo;

public class Call {
	private Integer id;
	private String name;
	private String pwd;
	private String tel;
	private String site;
	private Integer ismanager;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public Integer getIsmanager() {
		return ismanager;
	}

	public void setIsmanager(Integer ismanager) {
		this.ismanager = ismanager;
	}

	public Call(Integer id, String name, String pwd, String tel, String site, Integer ismanager) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.tel = tel;
		this.site = site;
		this.ismanager = ismanager;
	}

	public Call() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Call [id=" + id + ", name=" + name + ", pwd=" + pwd + ", tel=" + tel + ", site=" + site + ", ismanager="
				+ ismanager + "]";
	}

}
