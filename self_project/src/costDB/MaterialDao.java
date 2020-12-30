package costDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DbcpBean;

public class MaterialDao {
	// 1. 자신의 객체를 담을 static 필드 선언
	private static MaterialDao dao;
	// 2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private 로
	private MaterialDao(){}
	// 3. 자신의 참조값을 리턴해주는 public static 메소드 정의
	public static MaterialDao getInstance() {
		if(dao==null) { //getInstance() 메소드가 최초 호출되는 경우
			dao=new MaterialDao(); //객체를 생성해서 참조값을 static 필드에 저장한다.
		}
		//static 필드에 저장된 참조값을 리턴해준다.
		return dao;
	}//getInstance END
		
	public List<MaterialDto> getList(){
		List<MaterialDto> list=new ArrayList<MaterialDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			//select 문 작성
			String sql="SELECT name, code, cost, category"
					+ " FROM materialList"
					+ " ORDER BY code ASC";
					
			/*
			 *	"SELECT num, name, regdate" 
			 * + " FROM todo"
			 * + " ORDER BY num DESC";
			 */
			
			pstmt=conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			
			//select 문 수행하고 ResultSet 받아오기
			rs=pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data 추출
			while(rs.next()) {
				//SalesDto 객체를 생성해서
				MaterialDto dto=new MaterialDto();
				//select 된 ResultSet 에 담긴 내용을 담고
				dto.setName(rs.getString("name"));
				dto.setCode(rs.getString("code"));
				dto.setCost(rs.getInt("cost"));
				dto.setCategory(rs.getString("category"));
				//ArrayList 객체에 누적 시킨다.
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return list;
	}//getList END	
	
	public boolean insert(MaterialDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql = "INSERT INTO materiallist"
					+ " VALUES(?,'F'||TO_CHAR(LPAD(material_seq.NEXTVAL,5,0)), ?, ?)";
			/*
			 *	"INSERT INTO todo" 
			 * + " (num, content, regdate)"
			 * + " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
			 */

			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getCost());
			pstmt.setString(3, dto.getCategory());
			//sql 문 실행하고 변화된 row 개수 리턴 받기
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}//Insert END
}//Class END
