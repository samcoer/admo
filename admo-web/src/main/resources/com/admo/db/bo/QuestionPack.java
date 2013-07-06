package com.admo.db.bo;

import javax.xml.bind.annotation.XmlElement;

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
