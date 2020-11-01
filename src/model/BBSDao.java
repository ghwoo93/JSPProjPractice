package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class BBSDao {
	//dao 싱글턴으로 만들면 안됨?
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public BBSDao(ServletContext context,String user,String pwd) {
		try {
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),user,pwd);
			System.out.println("DB 연결 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(conn!=null) conn.close();
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
		} catch (SQLException e) {
		
		} 
	}
	
	public boolean isMember(String user,String password) {
		String sql="SELECT COUNT(*) FROM member WHERE id=? AND pwd=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			
			rs.next();
			if(rs.getInt(1)==0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	/*
		이름                                      널?      유형
	 ----------------------------------------- -------- ----------------------------
	 NO                                        NOT NULL NUMBER
	 ID                                                 VARCHAR2(10)
	 TITLE                                     NOT NULL NVARCHAR2(50)
	 CONTENT                                   NOT NULL NVARCHAR2(2000)
	 VISITCOUNT                                         NUMBER
	 POSTDATE                                           DATE
	 */
	public int insertBBS(BBSDto dto) {
		int flag=0;
		String sql=
				"INSERT INTO bbs(no,id,title,content) "
				+ "VALUES(SEQ_BBS.NEXTVAL,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			flag = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("생성오류:"+e.getMessage());
		} finally {
			close();
		}
		return flag;
	}
	
	public List<BBSDto> selectBBSList(Map<String,String> map){
		List<BBSDto> list = new Vector<BBSDto>();
		//페이징 적용 前 쿼리- 전체 쿼리
		//String sql="SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ORDER BY no DESC";
		//페이징 적용-구간쿼리로 변경
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM "
				+ "(SELECT b.*,name FROM bbs b "
				+ "JOIN member m ON b.id=m.id ORDER BY no DESC) T) "
				+ "WHERE R BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정]
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				BBSDto dto = new BBSDto();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitCount(rs.getString(5));
				dto.setName(rs.getString(7));
				list.add(dto);
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		return list;
	}///////////selectList
	
	public BBSDto selectBBSOne(String no) {
		BBSDto dto = null;
		String sql = "SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id "
				+ "WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs!=null) updateBBSViews(no);
			if(rs.next()) {
				dto = new BBSDto();
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));	
				dto.setVisitCount(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setName(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public int updateBBSViews(String no) {
		int flag = 0;
		String sql = "UPDATE bbs SET visitcount=visitcount+1 WHERE no=?";
		try {
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			flag = psmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return flag;
	}
	
	public int updateBBS(BBSDto dto) {
		int flag =0;
		if(dto==null) return flag;
		String sql = "UPDATE bbs SET title=?,content=? WHERE no=?";
		try {
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNo());
			flag = psmt.executeUpdate();
			if(flag!=0) conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return flag;
	}
	
	public int deleteBBS(String no) {
		int flag =0;
		String sql = "DELETE FROM bbs WHERE no=?";
		try {
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			flag = psmt.executeUpdate();
			if(flag!=0) conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return flag;
	}
}
