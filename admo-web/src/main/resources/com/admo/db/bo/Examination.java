package com.admo.db.bo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Index;

import com.admo.db.bo.sample.Paper;

@Entity
@Table(name = "EXAMINATION")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Examination {
	private Long id;
	private String name;
	private List<Paper> papers = new ArrayList<Paper>();

	@Id
	@GeneratedValue
	@Column(name = "EXAM_ID")
	public Long getId() {

		return id;
	}

	public void setId(Long id) {

		this.id = id;
	}

	@Index(name = "IDX_EXAM_NAME")
	public String getName() {

		return name;
	}

	public void setName(String name) {

		this.name = name;
	}

	@OneToMany(mappedBy = "exam", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("name")
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<Paper> getPapers() {

		return papers;
	}

	public void setPapers(List<Paper> papers) {

		this.papers = papers;
	}

}
