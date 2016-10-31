package yoon.questions.model;

import javax.naming.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

class QuestionsDAO {
	
	private DataSource ds;
	
	QuestionsDAO(){
		try{
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne){
			System.out.println("ne : " + ne);
		}
	}
	QuestionsDTO mPic(int n){
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs_total = null;
		ResultSet rs = null;
		try{
			//전체 갯수 받아오고
			con = ds.getConnection();
			stmt =  con.createStatement();
			rs_total = stmt.executeQuery(QuestionsSQL.TOTALQ);
			if(rs_total.next()){
				int rnum = 0;
				int cnt = rs_total.getInt(1);
				if(n == 0){
					Random r = new Random();
					rnum = r.nextInt(cnt) + 1; //0~9 if total=10
				}else{//if total=10
					rnum = n + 1;
					if(rnum>cnt) rnum = 1;
				}
				pstmt = con.prepareStatement(QuestionsSQL.MAINQ);
				pstmt.setInt(1, rnum);
				rs = pstmt.executeQuery();
				if(rs.next()){
					String pic = rs.getString(2);
					String subject = rs.getString(3);
					String auth = rs.getString(4);
					java.sql.Date rdate = rs.getDate(5);
					QuestionsDTO dto = new QuestionsDTO(rnum, pic, subject, auth, rdate);
					System.out.println("dto : " + dto);
					return dto;
				}else return null;
			}else return null;
		}catch(SQLException se){
			System.out.println("se : " + se);
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(rs_total != null) rs_total.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se){
			}
		}
	}
	ArrayList<QuestionsDTO> list(){
		Connection con = null;
		Statement stmt =null;
		ResultSet rs = null;
		ArrayList<QuestionsDTO> list = new ArrayList<QuestionsDTO>();
		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(QuestionsSQL.LIST);
			while(rs.next()){
				int num = rs.getInt(1);
				String pic = rs.getString(2);
				String subject =  rs.getString(3);
				String auth = rs.getString(4);
				java.sql.Date rdate = rs.getDate(5);
				int qrtotal = qrTotal(num);
				list.add(new QuestionsDTO(num, pic, subject, auth, rdate, qrtotal));
				//list.add(new QuestionsDTO(num, pic, subject, auth, rdate));
			}
			return list;
		}catch(SQLException se){
			System.out.println("se : " + se);
			return null;
		}finally{
			try{
				if(rs != null)rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();				
			}catch(SQLException se){
			}
		}
		
	}
	QuestionsDTO qselected(int qnum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(QuestionsSQL.MAINQ);
			pstmt.setInt(1, qnum);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int num = rs.getInt(1);
				String pic = rs.getString(2);
				String subject = rs.getString(3);
				String author = rs.getString(4);
				java.sql.Date rdate = rs.getDate(5);
				int qrtotal = qrTotal(num);
				QuestionsDTO dto = new QuestionsDTO(num, pic, subject, author, rdate, qrtotal);
				//QuestionsDTO dto = new QuestionsDTO(num, pic, subject, author, rdate);
				return dto;
			}else return null;
		}catch(SQLException se){
			System.out.println("se : " + se);
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)con.close();
			}catch(SQLException se){
			}
		}
	}
	int qrTotal(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(QuestionsSQL.QR_TOTAL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				total = rs.getInt(1);
			}
		}catch(SQLException se){
			System.out.println("se : " + se);
			total = -1;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){
				total = -1;
			}
		}
		return total;
	}
}
