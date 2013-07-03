package com.admo.db.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Index;

@Entity
@Table(name = "SUBJECT")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Subject {
	private Long id;
	// initialized early
	private String name;
	private String instruction;
	private int noOfQ;

	// Key = Difficulty, Value = No. of Question
	private Map<Integer, Integer> difficultyQuestionMap;
	// Key = Difficulty, Value = Marks
	private Map<Integer, Float> difficultyMarksMap;

	// populated at runtime
	private List<Question> questions = new ArrayList<Question>();
	
	private Paper paper;

	@Id
	@GeneratedValue
	@Column(name = "SUBJECT_ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Index(name = "IDX_SUBJECT_NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public int getNoOfQ() {
		return noOfQ;
	}

	public void setNoOfQ(int noOfQ) {
		this.noOfQ = noOfQ;
	}

	@ElementCollection
	@MapKeyColumn(name = "DIFFICULTY")
	@Column(name = "NO_OF_QUESTIONS")
	@CollectionTable(name = "DIFFICULTY_WEIGHTAGE", joinColumns = @JoinColumn(name = "SUBJECT_ID"))
	public Map<Integer, Integer> getDifficultyQuestionMap() {
		return difficultyQuestionMap;
	}

	public void setDifficultyQuestionMap(
			Map<Integer, Integer> difficultyQuestionMap) {
		this.difficultyQuestionMap = difficultyQuestionMap;
	}

	@Transient
	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	@ElementCollection
	@MapKeyColumn(name = "DIFFICULTY")
	@Column(name = "MARKS")
	@CollectionTable(name = "DIFFICULTY_MARKS", joinColumns = @JoinColumn(name = "SUBJECT_ID"))
	public Map<Integer, Float> getDifficultyMarksMap() {
		return difficultyMarksMap;
	}

	public void setDifficultyMarksMap(Map<Integer, Float> difficultyMarksMap) {
		this.difficultyMarksMap = difficultyMarksMap;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PAPER_FK")
	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
	

}
