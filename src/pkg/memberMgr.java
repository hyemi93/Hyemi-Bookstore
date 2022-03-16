package pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class memberMgr {
	private DBConnectionMgr pool;

	   public memberMgr() {
	      try {
	         pool = DBConnectionMgr.getInstance();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	
	 //회원가입
	   public boolean memberjoin (memberBean bean) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="insert into member(id, pwd, name, email, zip_num, address, phone) values(?, ?, ?, ?, ?, ?, ?)";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, bean.getId());
			   pstmt.setString(2, bean.getPwd());
			   pstmt.setString(3, bean.getName());
			   pstmt.setString(4, bean.getEmail());
			   pstmt.setString(5, bean.getZip_num());
			   pstmt.setString(6, bean.getAddress()+bean.getAddress2());
			   pstmt.setString(7, bean.getPhone());
			   if (pstmt.executeUpdate()==1)
		            flag=true;
		      } catch (Exception e) {
		         e.printStackTrace();
		         System.out.print(e);
		      } finally {
		         pool.freeConnection(con, pstmt);
		      }
		      return flag;
		   }
	   
	   //아이디 중복체크
	   public boolean idcheck(String id) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      boolean flag = false;
		      try {
		         con = pool.getConnection();
		         sql = "select id from member where id = ?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, id);
		         flag = pstmt.executeQuery().next();
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		      return flag;
		   }
	   
	   //우편번호 찾기
	   public ArrayList<zipnumBean> zipnumsearch(String dong) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      ArrayList<zipnumBean> zlist = new ArrayList<zipnumBean>();
		      try {
		         con = pool.getConnection();
		         sql = "select * from address where dong like ?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, "%" + dong + "%");
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		        	 zipnumBean bean = new zipnumBean();
		            bean.setZip_num(rs.getString("zip_num"));
		            bean.setSido(rs.getString("sido"));
		            bean.setGugun(rs.getString("gugun"));
		            bean.setDong(rs.getString("dong"));
		            bean.setZip_code(rs.getString("zip_code"));
		            bean.setBunji(rs.getString("bunji"));
		            zlist.add(bean);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		      return zlist;
		   }
	   
	 //로그인
	   public boolean memberlogin (String id, String pwd) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   ResultSet rs = null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="select id from member where id=? and pwd=?";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, id);
			   pstmt.setString(2, pwd);
			   rs = pstmt.executeQuery();
		         flag = rs.next();
		      } catch (Exception e) {
		         e.printStackTrace();
		         System.out.print(e);
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		      return flag;
		   }
	   
	   //유저 정보
	   public memberBean memberSelect(String sssid) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      memberBean bean=null;
		      try {
		         con=pool.getConnection();
		         String sql="select * from member where id=?";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setString(1, sssid);
		         rs = pstmt.executeQuery();
		         if (rs.next()) {
		        	 bean = new memberBean();
			            bean.setId(rs.getString("id"));
			            bean.setPwd(rs.getString("pwd"));
			            bean.setName(rs.getString("name"));
			            bean.setEmail(rs.getString("email"));
			            bean.setZip_num(rs.getString("zip_num"));
			            bean.setAddress(rs.getString("address"));
			            bean.setPhone(rs.getString("phone"));
			            bean.setUseyn(rs.getString("useyn"));
			            bean.setIndate(rs.getString("indate"));
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return bean;
		    }
	   
	 //아이디 찾기
	   public ArrayList<memberBean> idFind(String name, String phone) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      ArrayList<memberBean> list = new ArrayList<memberBean>();
		      try {
		         con = pool.getConnection();
		         sql = "select id from member where name=? and phone=?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, name);
		         pstmt.setString(2, phone);
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		        	 memberBean bean = new memberBean();
		            bean.setId(rs.getString("id"));
		            list.add(bean);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		      return list;
		   }
	   
		 //비밀번호 찾기
	   public ArrayList<memberBean> pwdFind(String id, String name) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      ArrayList<memberBean> list = new ArrayList<memberBean>();
		      try {
		         con = pool.getConnection();
		         sql = "select pwd from member where id=? and name=?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, id);
		         pstmt.setString(2, name);
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		        	 memberBean bean = new memberBean();
		            bean.setPwd(rs.getString("pwd"));
		            list.add(bean);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		      return list;
		   }
	   
	 //관리자 로그인
	   public boolean adminlogin (String id, String pwd) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   ResultSet rs = null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="select id from worker where id=? and pwd=?";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, id);
			   pstmt.setString(2, pwd);
			   rs = pstmt.executeQuery();
		         flag = rs.next();
		      } catch (Exception e) {
		         e.printStackTrace();
		         System.out.print(e);
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		      return flag;
		   }
}
