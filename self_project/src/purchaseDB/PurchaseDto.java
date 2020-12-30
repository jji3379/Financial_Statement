package purchaseDB;

public class PurchaseDto {
	//필드
	private String regdate;
	private String code;
	private String name;
	private String server;
	private int num;
	private int cost;
	private int amount;
	private int unit;
	
	//보여줄 페이지의 시작 ROWNUM
	private int startRowNum;
	//보여줄 페이지의 끝 ROWNUM
	private int endRowNum;
	
	//디폴트 생성자
	public PurchaseDto() {}

	//생성자
	public PurchaseDto(String regdate, String code, String name, String server, int num, int cost, int amount, int unit,
			int startRowNum, int endRowNum) {
		super();
		this.regdate = regdate;
		this.code = code;
		this.name = name;
		this.server = server;
		this.num = num;
		this.cost = cost;
		this.amount = amount;
		this.unit = unit;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getUnit() {
		return unit;
	}

	public void setUnit(int unit) {
		this.unit = unit;
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