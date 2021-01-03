package offerDB;

public class OfferDto {
	//필드
	private int num;
	private String production;
	private String name;
	private String code;
	private int total;
	
	private String part1;
	private int count1;
	private int cost1;
	
	private String part2;
	private int count2;
	private int cost2;
	
	private String part3;
	private int count3;
	private int cost3;
	
	private String part4;
	private int count4;
	private int cost4;
	
	//디폴트 생성자
	public OfferDto() {}

	//생성자
	public OfferDto(int num, String production, String name, String code, int total, String part1, int count1,
			int cost1, String part2, int count2, int cost2, String part3, int count3, int cost3, String part4,
			int count4, int cost4) {
		super();
		this.num = num;
		this.production = production;
		this.name = name;
		this.code = code;
		this.total = total;
		this.part1 = part1;
		this.count1 = count1;
		this.cost1 = cost1;
		this.part2 = part2;
		this.count2 = count2;
		this.cost2 = cost2;
		this.part3 = part3;
		this.count3 = count3;
		this.cost3 = cost3;
		this.part4 = part4;
		this.count4 = count4;
		this.cost4 = cost4;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getProduction() {
		return production;
	}

	public void setProduction(String production) {
		this.production = production;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getPart1() {
		return part1;
	}

	public void setPart1(String part1) {
		this.part1 = part1;
	}

	public int getCount1() {
		return count1;
	}

	public void setCount1(int count1) {
		this.count1 = count1;
	}

	public int getCost1() {
		return cost1;
	}

	public void setCost1(int cost1) {
		this.cost1 = cost1;
	}

	public String getPart2() {
		return part2;
	}

	public void setPart2(String part2) {
		this.part2 = part2;
	}

	public int getCount2() {
		return count2;
	}

	public void setCount2(int count2) {
		this.count2 = count2;
	}

	public int getCost2() {
		return cost2;
	}

	public void setCost2(int cost2) {
		this.cost2 = cost2;
	}

	public String getPart3() {
		return part3;
	}

	public void setPart3(String part3) {
		this.part3 = part3;
	}

	public int getCount3() {
		return count3;
	}

	public void setCount3(int count3) {
		this.count3 = count3;
	}

	public int getCost3() {
		return cost3;
	}

	public void setCost3(int cost3) {
		this.cost3 = cost3;
	}

	public String getPart4() {
		return part4;
	}

	public void setPart4(String part4) {
		this.part4 = part4;
	}

	public int getCount4() {
		return count4;
	}

	public void setCount4(int count4) {
		this.count4 = count4;
	}

	public int getCost4() {
		return cost4;
	}

	public void setCost4(int cost4) {
		this.cost4 = cost4;
	}
}