package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.ksmart.dto.Member;

public class Mdao {
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<Member> alm = null; 

	// default 생성자 메서드 선언
	public Mdao() {
		try {
			Context init = new InitialContext();
			System.out.println(init + "<-- init BoardDAO() ");
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	//08 로그인 처리 후 세션 저장 정보
	
	public Member mLoginSession(String oraId) throws ClassNotFoundException, SQLException {
		System.out.println("08 mLoginSession Mdao.java");
		Member re = null;
		con = ds.getConnection();
		pstmt = con.prepareStatement("SELECT ORA_ID,ORA_LEVEL,ORA_NAME FROM oracle_member WHERE ORA_ID = ?");
		pstmt.setString(1, oraId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			re = new Member();
			re.setOra_id(rs.getString(1));
			re.setOra_level(rs.getString(2));
			re.setOra_name(rs.getString(3));
		}
		
		return re;
	}
	
	//07 로그인 확인
		public String mLoginCheck(String oraId, String oraPw) throws ClassNotFoundException, SQLException {
			System.out.println("07 mLoginCheck Mdao.java");
			String re = null;
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT * FROM oracle_member WHERE ORA_ID = ?");
			pstmt.setString(1, oraId);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(oraPw.equals(rs.getString("ORA_PW"))) {
					re = "01로그인성공";
					System.out.println(re);
				}else {
					re = "03비번불일치";
					System.out.println(re);
				}
			}else {
				re = "02아이디불일치";
				System.out.println(re);
			}
			pstmt.close();
			con.close();
			
			return re;
		}
	
	//06 검색 메서드 선언
		public ArrayList<Member> mSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
			System.out.println("06 mSearch Mdao.java");
			System.out.println(sk + "<- sk mSearch Mdao.java");
			System.out.println(sv + "<- sv mSearch Mdao.java");
			alm = new ArrayList<Member>();
			con = ds.getConnection();
			System.out.println(con + "<-- conn");

			if(sk == null & sv == null){
				System.out.println("01조건_sk null sv null");
				pstmt = con.prepareStatement("SELECT * FROM oracle_member");
			}else if(sk != null & sv.equals("")){
				System.out.println("02조건_sk 있고 sv 공백");
				pstmt = con.prepareStatement("SELECT * FROM oracle_member");
			}else if(sk != null & sv != null){
				System.out.println("03조건_둘다 값이 있다");
				pstmt = con.prepareStatement("SELECT * FROM oracle_member WHERE " + sk +"=?");
				pstmt.setString(1, sv);
			}
			
			rs = pstmt.executeQuery();
			
			Member m = null;
			
			while(rs.next()) {
				m = new Member();
				m.setOra_id(rs.getString("ORA_ID"));
				m.setOra_pw(rs.getString("ORA_PW"));
				m.setOra_level(rs.getString("ORA_LEVEL"));
				m.setOra_name(rs.getString("ORA_NAME"));
				m.setOra_email(rs.getString("ORA_EMAIL"));
				
				System.out.println(m + "<-- m mAllSelect Mdao.java");
				System.out.println(alm + "<-- alm mAllSelect Mdao.java");
				
				alm.add(m);
			}
			
			pstmt.close();
			con.close();
			
			return alm;
		}
	
	//03 삭제(탈퇴)처리 메서드선언
		public void mDelete(String mid) throws ClassNotFoundException, SQLException {
			System.out.println("03 mDelete Mdao.java");
			con = ds.getConnection();
			pstmt = con.prepareStatement("DELETE FROM ORACLE_MEMBER WHERE ORA_ID=?");
			System.out.println(pstmt + "<-- pstmt 1");
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}
	
	//02 수정처리 메서드 선언
		public void mUpdate(Member member) throws ClassNotFoundException, SQLException {
			System.out.println("02 mUpdate Mdao.java");
			con = ds.getConnection();
			pstmt = con.prepareStatement(
					"UPDATE ORACLE_MEMBER SET ORA_PW=?,ORA_LEVEL=?,ORA_NAME=?,ORA_EMAIL=? WHERE ORA_ID=?");
			pstmt.setString(1, member.getOra_pw());
			pstmt.setString(2, member.getOra_level());
			pstmt.setString(3, member.getOra_name());
			pstmt.setString(4, member.getOra_email());
			pstmt.setString(5, member.getOra_id());
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();	

		}
	
	//04 한명의 회원 조회 메서드 선언(수정화면위함)
		public Member mSelectforUpdate(String sendId) throws ClassNotFoundException, SQLException {
			System.out.println("04 mSelectforUpdate Mdao.java");
			System.out.println("아이디값:" + sendId);
			Member m = null;
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT * FROM ORACLE_MEMBER WHERE ORA_ID = ?");
			pstmt.setString(1, sendId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setOra_id(rs.getString("ora_id"));
				m.setOra_pw(rs.getString("ora_pw"));
				m.setOra_level(rs.getString("ora_level"));
				m.setOra_name(rs.getString("ora_name"));
				m.setOra_email(rs.getString("ora_email"));
			}
			pstmt.close();
			con.close();
			return m;
		}
	
	//05 전체회원 조회 메서드 선언
		public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException{
			System.out.println("05 mAllSelect Mdao.java");
			con = ds.getConnection();
			alm = new ArrayList<Member>();
			pstmt = con.prepareStatement("SELECT * FROM ORACLE_MEMBER");
			rs = pstmt.executeQuery();
			Member m = null;
			while(rs.next()) {
				m = new Member();
				m.setOra_id(rs.getString("ora_id"));
				m.setOra_pw(rs.getString("ora_pw"));
				m.setOra_level(rs.getString("ora_level"));
				m.setOra_name(rs.getString("ora_name"));
				m.setOra_email(rs.getString("ora_email"));
				System.out.println(m + "<-- m mAllSelect Mdao.java");
				System.out.println(alm + "<-- alm mAllSelect Mdao.java");
				alm.add(m);
			}
			pstmt.close();
			con.close();
			return alm;
		}
		
	//01입력처리 메서드 선언
		public void mInsert(Member member) throws SQLException{
			//3단계 쿼리실행준비 부터 시작
			System.out.println("01_01 mInsert Mdao.java");
			con = ds.getConnection();
			pstmt = con.prepareStatement(
					"insert into oracle_member values (?, ?, ?, ?, ?)");
			pstmt.setString(1, member.getOra_id());
			pstmt.setString(2, member.getOra_pw());
			pstmt.setString(3, member.getOra_level());
			pstmt.setString(4, member.getOra_name());
			pstmt.setString(5, member.getOra_email());
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}
}
