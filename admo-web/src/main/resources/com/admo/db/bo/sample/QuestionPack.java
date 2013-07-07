package com.admo.db.bo.sample;

import javax.xml.bind.annotation.XmlElement;

import com.admo.db.bo.Examination;

public class QuestionPack {
	@XmlElement(name="question")
	private Examination exam;
	//User
	
	public Examination getExam() {
	
		return exam;
	}
	public void setExam(Examination exam) {
	
		this.exam = exam;
	}
	
}
