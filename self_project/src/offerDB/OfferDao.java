package offerDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DbcpBean;

public class OfferDao {
	// 1. 자신의 객체를 담을 static 필드 선언
	private static OfferDao dao;
	// 2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private 로
	private OfferDao(){}
	// 3. 자신의 참조값을 리턴해주는 public static 메소드 정의
	public static OfferDao getInstance() {
		if(dao==null) { //getInstance() 메소드가 최초 호출되는 경우
			dao=new OfferDao(); //객체를 생성해서 참조값을 static 필드에 저장한다.
		}
		//static 필드에 저장된 참조값을 리턴해준다.
		return dao;
	}//getInstance END
		
	public List<OfferDto> getList(){
		List<OfferDto> list=new ArrayList<OfferDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			//select 문 작성
			String sql="SELECT num, production, name, code, total, part1, count1, cost1,"
					+ " part2, count2, cost2, part3, count3, cost3, part4, count4, cost4 FROM offer"
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
				OfferDto dto2=new OfferDto();
				//select 된 ResultSet 에 담긴 내용을 담고
				dto2.setNum(rs.getInt("num"));
				dto2.setProduction(rs.getString("production"));
				dto2.setName(rs.getString("name"));
				dto2.setCode(rs.getString("code"));
				dto2.setTotal(rs.getInt("total"));
				dto2.setPart1(rs.getString("part1"));
				dto2.setCount1(rs.getInt("count1"));
				dto2.setCost1(rs.getInt("cost1"));

				dto2.setPart2(rs.getString("part2"));
				dto2.setCount2(rs.getInt("count2"));
				dto2.setCost2(rs.getInt("cost2"));
				
				dto2.setPart3(rs.getString("part3"));
				dto2.setCount3(rs.getInt("count3"));
				dto2.setCost3(rs.getInt("cost3"));
				
				dto2.setPart4(rs.getString("part4"));
				dto2.setCount4(rs.getInt("count4"));
				dto2.setCost4(rs.getInt("cost4"));
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
	
	public boolean insert(OfferDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql ="INSERT INTO offer" 
			     + " VALUES(offer_seq.NEXTVAL, ?, ?, 'G'||TO_CHAR(LPAD(offer_seq.NEXTVAL,5,0)),"
			     + " (SELECT SUM((SELECT cost*? FROM materiallist where name=?)+" 
			     + " (SELECT cost*? FROM materiallist where name=?)+" 
			     + " (SELECT cost*? FROM materiallist where name=?)+" 
			     + " (SELECT cost*? FROM materiallist where name=?)) FROM dual)," 
				 + " ?, ?, (SELECT cost FROM materiallist where name=?)," 
				 + " ?, ?, (SELECT cost FROM materiallist where name=?)," 
				 + " ?, ?, (SELECT cost FROM materiallist where name=?)," 
				 + " ?, ?, (SELECT cost FROM materiallist where name=?))"; 

			/*
			 *	"INSERT INTO todo" 
			 * + " (num, content, regdate)"
			 * + " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
			 */

			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			//pstmt.setInt(1,num);
			//pstmt.setString(2, dto.getContent());
			pstmt.setString(1, dto.getProduction());
			pstmt.setString(2, dto.getName());
			
			pstmt.setInt(3, dto.getCount1());
			pstmt.setString(4, dto.getPart1());

			pstmt.setInt(5, dto.getCount2());
			pstmt.setString(6, dto.getPart2());
			
			pstmt.setInt(7, dto.getCount3());
			pstmt.setString(8, dto.getPart3());
			
			pstmt.setInt(9, dto.getCount4());
			pstmt.setString(10, dto.getPart4());
			
			pstmt.setString(11, dto.getPart1());
			pstmt.setInt(12, dto.getCount1());
			pstmt.setString(13, dto.getPart1());
			
			pstmt.setString(14, dto.getPart2());
			pstmt.setInt(15, dto.getCount2());
			pstmt.setString(16, dto.getPart2());

			pstmt.setString(17, dto.getPart3());
			pstmt.setInt(18, dto.getCount3());
			pstmt.setString(19, dto.getPart3());

			pstmt.setString(20, dto.getPart4());
			pstmt.setInt(21, dto.getCount4());
			pstmt.setString(22, dto.getPart4());
			
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
	
	public boolean update(OfferDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 작성
			String sql = "UPDATE offer"					
					+ " SET production=?"
					+ " SET name=?"
					+ " SET part1=?"
					+ " SET count1=?"
					+ " SET part2=?"
					+ " SET count2=?"
					+ " SET part3=?"
					+ " SET count3=?"
					+ " SET part4=?"
					+ " SET count4=?"
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
			
			pstmt.setString(1, dto.getProduction());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPart1());
			pstmt.setInt(4, dto.getCount1());
			pstmt.setString(5, dto.getPart2());
			pstmt.setInt(6, dto.getCount2());
			pstmt.setString(7, dto.getPart3());
			pstmt.setInt(8, dto.getCount3());
			pstmt.setString(9, dto.getPart4());
			pstmt.setInt(10, dto.getCount4());
			pstmt.setInt(11, dto.getNum());
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
			String sql = "DELETE FROM offer WHERE num=?";
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
}//class END
