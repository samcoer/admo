package com.admo.db.bo.sample;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Index;

import com.admo.db.bo.Examination;

@Entity
@Table(name = "PAPER")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Paper {
	// initialized at starting with names
	private String name;
	private String instructions;
	private List<Subject> subjects = new ArrayList<Subject>();
	private int maxMarks;
	private int durationMinutes;
	private boolean randomize;
	private Long id;
	private Examination exam;

	@OneToMany(mappedBy = "paper", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("name")
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<Subject> getSubjects() {

		return subjects;
	}

	public void setSubjects(List<Subject> subjects) {

		this.subjects = subjects;
	}

	public int getMaxMarks() {

		return maxMarks;
	}

	public void setMaxMarks(int maxMarks) {

		this.maxMarks = maxMarks;
	}

	public int getDurationMinutes() {

		return durationMinutes;
	}

	public void setDurationMinutes(int durationMinutes) {

		this.durationMinutes = durationMinutes;
	}

	public boolean isRandomize() {

		return randomize;
	}

	public void setRandomize(boolean randomize) {

		this.randomize = randomize;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "EXAM_FK")
	public Examination getExam() {
		return exam;
	}

	public void setExam(Examination exam) {
		this.exam = exam;
	}

	@Id
	@GeneratedValue
	@Column(name = "PAPER_ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Index(name = "IDX_PAPER_NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	
}
