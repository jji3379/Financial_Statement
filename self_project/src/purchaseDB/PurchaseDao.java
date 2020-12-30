package purchaseDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import salesDB.SalesDto;
import util.DbcpBean;

public class PurchaseDao {
	// 1. 자신의 객체를 담을 static 필드 선언
	private static PurchaseDao dao;
	// 2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private 로
	private PurchaseDao(){}
	// 3. 자신의 참조값을 리턴해주는 public static 메소드 정의
	public static PurchaseDao getInstance() {
		if(dao==null) { //getInstance() 메소드가 최초 호출되는 경우
			dao=new PurchaseDao(); //객체를 생성해서 참조값을 static 필드에 저장한다.
		}
		//static 필드에 저장된 참조값을 리턴해준다.
		return dao;
	}//getInstance END
		
	public List<PurchaseDto> getList(PurchaseDto dto){
		List<PurchaseDto> list=new ArrayList<PurchaseDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			//select 문 작성
			String sql="SELECT *" + 
					" FROM(SELECT result1.*, ROWNUM AS rnum" + 
					"	FROM (SELECT TO_CHAR(regdate, 'YYYYMMDD') AS regdate, code, name, cost, amount, unit, server, num" + 
					"		FROM purchase" + 
					"		ORDER BY num DESC) result1)" + 
					"		WHERE rnum BETWEEN ? AND ?";
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
				PurchaseDto dto2=new PurchaseDto();
				//select 된 ResultSet 에 담긴 내용을 담고
				dto2.setNum(rs.getInt("num"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setCode(rs.getString("code"));
				dto2.setName(rs.getString("name"));
				dto2.setCost(rs.getInt("cost"));
				dto2.setAmount(rs.getInt("amount"));
				dto2.setUnit(rs.getInt("unit"));
				dto2.setServer(rs.getString("server"));
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
	
	public boolean insert(PurchaseDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql = "INSERT INTO purchase"
					+ " VALUES(SYSDATE, (SELECT code FROM materiallist" 
					+ " where name=?), ?, ?, ?, ?, ?,purchase_seq.NEXTVAL)";
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
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getCost());
			pstmt.setInt(4, dto.getAmount());
			pstmt.setInt(5, dto.getUnit());
			pstmt.setString(6, dto.getServer());
			
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
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql = "DELETE FROM purchase WHERE num=?";
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
				+ " FROM purchase";
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
