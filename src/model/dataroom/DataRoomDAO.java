package model.dataroom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

/*
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL NVARCHAR2(10)
 TITLE                                     NOT NULL NVARCHAR2(50)
 CONTENT                                   NOT NULL NVARCHAR2(2000)
 POSTDATE                                           DATE
 ATTACHFILE                                NOT NULL VARCHAR2(50)
 DOWNCOUNT                                          NUMBER
 PASSWORD                                  NOT NULL VARCHAR2(10)
 */
public class DataRoomDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public DataRoomDAO(
			ServletContext context, String user) {
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(
					context.getInitParameter("JNDI_ROOT")+"/"+user);
			conn = source.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<DataRoomDTO> selectList(){
		List<DataRoomDTO> list = new Vector<DataRoomDTO>();
		DataRoomDTO dto = null;
		String sql = "SELECT * FROM DATAROOM ORDER BY NO DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new DataRoomDTO();
				dto.setNo(rs.getString(1));
				dto.setName(rs.getNString(2));
				dto.setTitle(rs.getNString(3));
				dto.setContent(rs.getNString(4));
				dto.setPostDate(rs.getDate(5));;
				dto.setAttachFile(rs.getString(6));
				dto.setDownCount(rs.getString(7));
				dto.setPassword(rs.getString(8));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void close() {
		try {
			if(conn!=null)conn.close();
			if(psmt!=null)psmt.close();
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
