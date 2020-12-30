package salesDB;

public class SalesDto {
	//필드
	private int num;
	private String regdate;
	private String code;
	private String job;
	private String parts;
	private int cost;
	private int count;
	//보여줄 페이지의 시작 ROWNUM
	private int startRowNum;
	//보여줄 페이지의 끝 ROWNUM
	private int endRowNum;
	
	//디폴트 생성자
	public SalesDto() {}

	//생성자
	public SalesDto(int num, String regdate, String code, String job, String parts, int cost, int count,
			int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.regdate = regdate;
		this.code = code;
		this.job = job;
		this.parts = parts;
		this.cost = cost;
		this.count = count;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getParts() {
		return parts;
	}

	public void setParts(String parts) {
		this.parts = parts;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
}