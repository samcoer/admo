package com.admo.db.bo;

import java.util.Set;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "QUESTION")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Question {
	private Long id;
	private String statement;
	private String questionType;
	private boolean isSCQ;
	private boolean isMCQ;
	// Answer section
	private Set<String> choices;
	private Set<String> answers;

	private String eduLevel;

	private Set<Subject> subjects;
	// better searching
	private Set<Examination> exams;
	private Set<Paper> papers;

	// Calculated by job
	private Integer difficulty;
	// calculated at runtime
	private Float marks;

	@Id
	@GeneratedValue
	@Column(name = "QUESTION_ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public boolean isSCQ() {
		return isSCQ;
	}

	public void setSCQ(boolean isSCQ) {
		this.isSCQ = isSCQ;
	}

	public boolean isMCQ() {
		return isMCQ;
	}

	public void setMCQ(boolean isMCQ) {
		this.isMCQ = isMCQ;
	}

	public Integer getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(Integer difficulty) {
		this.difficulty = difficulty;
	}

	public Float getMarks() {
		return marks;
	}

	public void setMarks(Float marks) {
		this.marks = marks;
	}

	@ElementCollection
	@CollectionTable(name = "QUESTION_CHOICES", joinColumns = @JoinColumn(name = "QUESTION_ID"))
	@Column(name = "CHOICE")
	public Set<String> getChoices() {
		return choices;
	}

	public void setChoices(Set<String> choices) {
		this.choices = choices;
	}

	@ElementCollection
	@CollectionTable(name = "QUESTION_ANSWERS", joinColumns = @JoinColumn(name = "QUESTION_ID"))
	@Column(name = "ANSWER")
	public Set<String> getAnswers() {
		return answers;
	}

	public void setAnswers(Set<String> answers) {
		this.answers = answers;
	}

	public String getEduLevel() {
		return eduLevel;
	}

	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}

	@ElementCollection
	@CollectionTable(name = "QUESTION_SUBJECTS", joinColumns = @JoinColumn(name = "QUESTION_ID"))
	@AttributeOverrides({
			@AttributeOverride(name = "id", column = @Column(name = "SUBJECT_ID")),
			@AttributeOverride(name = "name", column = @Column(name = "SUBJECT_NAME")) })
	public Set<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}

	@ElementCollection
	@CollectionTable(name = "QUESTION_EXAMS", joinColumns = @JoinColumn(name = "QUESTION_ID"))
	@AttributeOverrides({ @AttributeOverride(name = "id", column = @Column(name = "EXAM_ID")) })
	public Set<Examination> getExams() {
		return exams;
	}

	public void setExams(Set<Examination> exams) {
		this.exams = exams;
	}

	@ElementCollection
	@CollectionTable(name = "QUESTION_PAPERS", joinColumns = @JoinColumn(name = "QUESTION_ID"))
	@AttributeOverrides({ @AttributeOverride(name = "id", column = @Column(name = "PAPER_ID")) })
	public Set<Paper> getPapers() {
		return papers;
	}

	public void setPapers(Set<Paper> papers) {
		this.papers = papers;
	}
}
