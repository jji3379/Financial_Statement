package costDB;

public class MaterialDto {
	//필드
	private String name;
	private String code;
	private String category;
	private int cost;

	//디폴트 생성자
	public MaterialDto() {}

	public MaterialDto(String name, String code, String category, int cost) {
		super();
		this.name = name;
		this.code = code;
		this.category = category;
		this.cost = cost;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}
}
