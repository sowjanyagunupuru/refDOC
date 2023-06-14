package main.Model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EmployeeRefDocuments")
public class EmployeeRefDocuments {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "erfd_id")
	private int id;

	@Column(name = "erfd_docname")
	private String docName;

	@Column(name = "erfd_category")
	private String category;

	@Column(name = "erfd_desc")
	private String description;

	@Column(name = "erfd_ludate")
	private Date lastUpdatedDate;

	@Column(name = "erfd_luser")
	private int lastUpdatedUser;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public int getLastUpdatedUser() {
		return lastUpdatedUser;
	}

	public void setLastUpdatedUser(int lastUpdatedUser) {
		this.lastUpdatedUser = lastUpdatedUser;
	}
}
