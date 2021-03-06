package trainstation.model;

public class Question {
	private String question;
	private String answer;
	private String custid;
	private String repid;
	private Integer qid;
	
	public Question(Integer qid, String question, String custid, String answer, String repid) {
		this.qid = qid;
		this.question = question;
		this.custid = custid;
		this.answer = answer;
		this.repid = repid;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getRepid() {
		return repid;
	}

	public void setRepid(String repid) {
		this.repid = repid;
	}

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}
	
	
}
