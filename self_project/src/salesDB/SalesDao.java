package salesDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DbcpBean;

public class SalesDao {
	// 1. 자신의 객체를 담을 static 필드 선언
	private static SalesDao dao;
	// 2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private 로
	private SalesDao(){}
	// 3. 자신의 참조값을 리턴해주는 public static 메소드 정의
	public static SalesDao getInstance() {
		if(dao==null) { //getInstance() 메소드가 최초 호출되는 경우
			dao=new SalesDao(); //객체를 생성해서 참조값을 static 필드에 저장한다.
		}
		//static 필드에 저장된 참조값을 리턴해준다.
		return dao;
	}//getInstance END
		
	public List<SalesDto> getList(SalesDto dto){
		List<SalesDto> list=new ArrayList<SalesDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			//select 문 작성
			String sql="SELECT *" + 
					"FROM" + 
					"	(SELECT result1.*, ROWNUM AS rnum" + 
					"	FROM" + 
					"		(SELECT num, TO_CHAR(regdate, 'YYYYMMDD') AS regdate, code, job, parts, cost, count" + 
					"		FROM sales" + 
					"		ORDER BY num DESC) result1)" + 
					"WHERE rnum BETWEEN ? AND ?";
					
			/*
			 *	"SELECT num, name, regdate" 
			 * + " FROM todo"
			 * + " ORDER BY num DESC";
			 */
			
			pstmt=conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			
			//select 문 수행하고 ResultSet 받아오기
			rs=pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data 추출
			while(rs.next()) {
				//SalesDto 객체를 생성해서
				SalesDto dto2=new SalesDto();
				//select 된 ResultSet 에 담긴 내용을 담고
				dto2.setNum(rs.getInt("num"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setCode(rs.getString("code"));
				dto2.setJob(rs.getString("job"));
				dto2.setParts(rs.getString("parts"));
				dto2.setCost(rs.getInt("cost"));
				dto2.setCount(rs.getInt("count"));
				//ArrayList 객체에 누적 시킨다.
				list.add(dto2);
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
	
	public boolean insert(SalesDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql = "INSERT INTO sales"
					+ " VALUES(sales_seq.NEXTVAL, SYSDATE, ?, ?, ?, ?, ?)";
			/*
			 *	"INSERT INTO todo" 
			 * + " (num, content, regdate)"
			 * + " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
			 */

			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			pstmt.setString(1, dto.getCode());
			pstmt.setString(2, dto.getJob());
			pstmt.setString(3, dto.getParts());
			pstmt.setInt(4, dto.getCost());
			pstmt.setInt(5, dto.getCount());
			
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
	
	public boolean update(SalesDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql = "UPDATE sales"					
					+ " SET regdate=?"
					+ " SET code=?"
					+ " SET job=?"
					+ " SET parts=?"
					+ " SET cost=?"
					+ " SET count=?"
					+ " WHERE num=?";
					
			/*
			 *	"INSERT INTO todo" 
			 * + " (num, content, regdate)"
			 * + " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
			 */

			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			pstmt.setString(1, dto.getRegdate());
			pstmt.setString(2, dto.getCode());
			pstmt.setString(3, dto.getJob());
			pstmt.setString(4, dto.getParts());
			pstmt.setInt(5, dto.getCost());
			pstmt.setInt(6, dto.getCount());
			pstmt.setInt(7, dto.getNum());
			
			//sql 문 실행하고 변화된 row 개수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}//Update END
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql = "DELETE FROM sales WHERE num=?";
			/*
			 *	"INSERT INTO todo" 
			 * + " (num, content, regdate)"
			 * + " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
			 */

			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			pstmt.setInt(1, num);
			//sql 문 실행하고 변화된 row 개수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}//Delete END
	
	public SalesDto getData(int num) {
		//SalesDto 객체를 담을 지역 변수 미리 만들기
		SalesDto dto=null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT regdate,code, job, parts, cost, count"
					+ " FROM sales"
					+ " WHERE num=?";
			/*
			 *	"SELECT num, name, regdate" 
			 * + " FROM todo"
			 * + " ORDER BY num DESC";
			 */

			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			pstmt.setInt(1, num);
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data 추출
			while (rs.next()) {

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}//getData END
	
	//전체 row 의 개수를 리턴하는 메소드
	public int getCount() {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT NVL(MAX(ROWNUM),0) AS num" 
			+ " FROM sales";
			/*
			 *	"SELECT num, name, regdate" 
			 * + " FROM todo"
			 * + " ORDER BY num DESC";
			 */

			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());

			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data 추출
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return count;
	}//getCount END
}//class END
