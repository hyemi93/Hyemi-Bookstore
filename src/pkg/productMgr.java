package pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class productMgr {
	private DBConnectionMgr pool;

	   public productMgr() {
	      try {
	         pool = DBConnectionMgr.getInstance();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	
	   //신상품 리스트
	   public ArrayList<productBean>newitemList() {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      productBean bean=null;
		      ArrayList<productBean> list = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select * from new_pro_view";
		         pstmt=con.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new productBean();
		        	bean.setPseq(rs.getInt("pseq"));
		        	bean.setName(rs.getString("name"));
		        	bean.setPrice2(rs.getInt("price2"));
		        	bean.setWriter(rs.getString("writer"));
		        	bean.setImage(rs.getString("image"));
		            list.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list;
		    }
	   
	   //베스트상품 리스트
	   public ArrayList<productBean>bestitemList() {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      productBean bean=null;
		      ArrayList<productBean> list2 = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select * from best_pro_view";
		         pstmt=con.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new productBean();
		        	bean.setPseq(rs.getInt("pseq"));
		        	bean.setName(rs.getString("name"));
		        	bean.setPrice2(rs.getInt("price2"));
		        	bean.setWriter(rs.getString("writer"));
		        	bean.setImage(rs.getString("image"));
		            list2.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list2;
		    }
	   
	 //상품 정보 가져오기
	   public productBean productSelect(int pseq) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      productBean bean=null;
		      try {
		         con=pool.getConnection();
		         String sql="select * from product where pseq=?";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setInt(1, pseq);
		         rs = pstmt.executeQuery();
		         if (rs.next()) {
		        	bean = new productBean();
		            bean.setPseq(rs.getInt("pseq"));
		            bean.setName(rs.getString("name"));
		            bean.setKind(rs.getString("kind"));
		            bean.setPrice1(rs.getInt("price1"));
		            bean.setPrice2(rs.getInt("price2"));
		            bean.setWriter(rs.getString("writer"));
		            bean.setPublisher(rs.getString("publisher"));
		            bean.setContent(rs.getString("content"));
		            bean.setImage(rs.getString("image"));
		            bean.setUseyn(rs.getString("useyn"));
		            bean.setBestyn(rs.getString("bestyn"));
		            bean.setIndate(rs.getString("indate"));
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return bean;
		    }
	   
	   //메뉴별 상품 정보 가져오기
	   public ArrayList<productBean>menuitemList(String kind) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      productBean bean=null;
		      ArrayList<productBean> list3 = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select * from product where kind=?";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setString(1, kind);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new productBean();
		        	bean.setPseq(rs.getInt("pseq"));
		            bean.setName(rs.getString("name"));
		            bean.setKind(rs.getString("kind"));
		            bean.setPrice1(rs.getInt("price1"));
		            bean.setPrice2(rs.getInt("price2"));
		            bean.setWriter(rs.getString("writer"));
		            bean.setPublisher(rs.getString("publisher"));
		            bean.setContent(rs.getString("content"));
		            bean.setImage(rs.getString("image"));
		            bean.setUseyn(rs.getString("useyn"));
		            bean.setBestyn(rs.getString("bestyn"));
		            bean.setIndate(rs.getString("indate"));
		            list3.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list3;
		    }
	   
	 //메뉴 정보 가져오기
	   public productBean menuSelect(String kind) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      productBean bean=null;
		      try {
		         con=pool.getConnection();
		         String sql="select * from product where kind=?";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setString(1, kind);
		         rs = pstmt.executeQuery();
		         if (rs.next()) {
		        	bean = new productBean();
		            bean.setPseq(rs.getInt("pseq"));
		            bean.setName(rs.getString("name"));
		            bean.setKind(rs.getString("kind"));
		            bean.setPrice1(rs.getInt("price1"));
		            bean.setPrice2(rs.getInt("price2"));
		            bean.setWriter(rs.getString("writer"));
		            bean.setPublisher(rs.getString("publisher"));
		            bean.setContent(rs.getString("content"));
		            bean.setImage(rs.getString("image"));
		            bean.setUseyn(rs.getString("useyn"));
		            bean.setBestyn(rs.getString("bestyn"));
		            bean.setIndate(rs.getString("indate"));
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return bean;
		    }
	   
	   //장바구니 저장
	   public boolean cartInsert (cartBean bean) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="insert into cart(cseq, id, pseq, quantity) values(cart_seq.nextval, ?, ?, ?)";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, bean.getId());
			   pstmt.setInt(2, bean.getPseq());
			   pstmt.setInt(3, bean.getQuantity());
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
	   
	 //장바구니 삭제
	   public boolean cartDelete(int cseq) {
			  Connection con=null;
			   PreparedStatement pstmt=null;
			   boolean flag=false;
			   try {
				   con=pool.getConnection();
				   String sql="delete from cart where cseq=?";
				   pstmt = con.prepareStatement(sql);
			       pstmt.setInt(1, cseq);
			       if (pstmt.executeUpdate()==1)
			            flag=true;
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt);
		      }
		      return flag;
		   }
	   
	   //장바구니 리스트
	   public ArrayList<cartBean>cartList(String sssid) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      cartBean bean=null;
		      ArrayList<cartBean> list = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select cseq, id, pseq, mname, pname, quantity, to_char(indate, 'yyyy-MM-dd') indate, price2, result, image from cart_view where id=?";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setString(1, sssid);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new cartBean();
		        	bean.setCseq(rs.getInt("cseq"));
		        	bean.setId(rs.getString("id"));
		        	bean.setPseq(rs.getInt("pseq"));
		        	bean.setMname(rs.getString("mname"));
		        	bean.setPname(rs.getString("pname"));
		        	bean.setQuantity(rs.getInt("quantity"));
		        	bean.setIndate(rs.getString("indate"));
		        	bean.setPrice2(rs.getInt("price2"));
		        	bean.setResult(rs.getString("result"));
		        	bean.setImage(rs.getString("image"));
		            list.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list;
		    }
	   
	 //장바구니 result 수정
	   public boolean cartUpdate(cartBean bean) {
			  Connection con=null;
			   PreparedStatement pstmt=null;
			   boolean flag=false;
			   try {
				   con=pool.getConnection();
				   String sql="update cart set result=2, oseq=? where result=1 and id=?";
				   pstmt = con.prepareStatement(sql);
			       pstmt.setInt(1, bean.getOseq());
			       pstmt.setString(2, bean.getId());
			       int count = pstmt.executeUpdate();
			         if (count > 0)
			            flag = true;
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt);
		      }
		      return flag;
		   }
	   
	 //주문 목록 저장
	   public boolean orderInsert (orderBean bean) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="insert into orders(oseq, id, name, price, count2) values(?, ?, ?, ?, ?)";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setInt(1, bean.getOseq());
			   pstmt.setString(2, bean.getId());
			   pstmt.setString(3, bean.getPname());
			   pstmt.setInt(4, bean.getPrice2());
			   pstmt.setInt(5, bean.getCount2());
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
	   
	 //즉시 구매
	   public boolean orderDirect (cartBean bean) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="insert into cart(cseq, oseq, id, pseq, quantity, result) values(cart_seq.nextval, ?, ?, ?, ?, 2)";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setInt(1, bean.getOseq());
			   pstmt.setString(2, bean.getId());
			   pstmt.setInt(3, bean.getPseq());
			   pstmt.setInt(4, bean.getQuantity());
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
	   
	   
	   //주문 번호 가져오기
	   public orderBean orderSelect() {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      orderBean bean=null;
		      try {
		         con=pool.getConnection();
		         String sql="select MAX(oseq) as oseq from orders";
		         pstmt=con.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         if (rs.next()) {
		        	bean = new orderBean();
		            bean.setOseq(rs.getInt("oseq"));
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return bean;
		    }
	   
	 //마이페이지 리스트
	   public ArrayList<orderBean>mypageList(String sssid) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      orderBean bean=null;
		      ArrayList<orderBean> list = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select oseq, name pname, to_char(indate, 'yyyy-MM-dd') indate, price price2, count2 from orders where id=? order by oseq desc";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setString(1, sssid);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new orderBean();
		        	bean.setOseq(rs.getInt("oseq"));
		        	bean.setPname(rs.getString("pname"));
		        	bean.setIndate(rs.getString("indate"));
		        	bean.setPrice2(rs.getInt("price2"));
		        	bean.setCount2(rs.getInt("count2"));
		            list.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list;
		    }
	   
	 //주문 상세 리스트
	   public ArrayList<cartBean>orderList(int oseq) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      cartBean bean=null;
		      ArrayList<cartBean> list = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select cseq, oseq, id, pseq, mname, pname, quantity, to_char(indate, 'yyyy-MM-dd') indate, price2, result, image from order_view where oseq=?";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setInt(1, oseq);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new cartBean();
		        	bean.setCseq(rs.getInt("cseq"));
		        	bean.setOseq(rs.getInt("oseq"));
		        	bean.setPseq(rs.getInt("pseq"));
		        	bean.setId(rs.getString("id"));
		        	bean.setMname(rs.getString("mname"));
		        	bean.setPname(rs.getString("pname"));
		        	bean.setQuantity(rs.getInt("quantity"));
		        	bean.setIndate(rs.getString("indate"));
		        	bean.setPrice2(rs.getInt("price2"));
		        	bean.setResult(rs.getString("result"));
		        	bean.setImage(rs.getString("image"));
		            list.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list;
		    }
	   
	 //게시판 리스트(회원)
	   public ArrayList<qnaBean>qnaList(String sssid) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      qnaBean bean=null;
		      ArrayList<qnaBean> list = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select qseq, subject, content, reply, id, decode(rep, '1', 'no', '2', 'yes') rep, to_char(indate, 'yyyy-MM-dd') indate"
		        		 	+ " from qna where id=? order by qseq desc";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setString(1, sssid);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new qnaBean();
		        	bean.setQseq(rs.getInt("qseq"));
		        	bean.setSubject(rs.getString("subject"));
		        	bean.setContent(rs.getString("content"));
		        	bean.setReply(rs.getString("reply"));
		        	bean.setId(rs.getString("id"));
		        	bean.setRep(rs.getString("rep"));
		        	bean.setIndate(rs.getString("indate"));
		            list.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list;
		    }
	   
	 //게시판 리스트(관리자)
	   public ArrayList<qnaBean>adminqnaList() {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      qnaBean bean=null;
		      ArrayList<qnaBean> list = new ArrayList<>();
		      try {
		         con=pool.getConnection();
		         String sql="select qseq, subject, content, reply, id, decode(rep, '1', 'no', '2', 'yes') rep, to_char(indate, 'yyyy-MM-dd') indate"
		        		 	+ " from qna order by qseq desc";
		         pstmt=con.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         while(rs.next()){
		        	bean = new qnaBean();
		        	bean.setQseq(rs.getInt("qseq"));
		        	bean.setSubject(rs.getString("subject"));
		        	bean.setContent(rs.getString("content"));
		        	bean.setReply(rs.getString("reply"));
		        	bean.setId(rs.getString("id"));
		        	bean.setRep(rs.getString("rep"));
		        	bean.setIndate(rs.getString("indate"));
		            list.add(bean);
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return list;
		    }
	   
	 //문의글 작성
	   public boolean qnaWrite (qnaBean bean) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="insert into qna (qseq, subject, content, id) values(qna_seq.nextval, ?, ?, ?)";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, bean.getSubject());
			   pstmt.setString(2, bean.getContent());
			   pstmt.setString(3, bean.getId());
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
	   
	   //문의글 답글 작성
	   public boolean replyUpdate(qnaBean bean) {
			  Connection con=null;
			   PreparedStatement pstmt=null;
			   boolean flag=false;
			   try {
				   con=pool.getConnection();
				   String sql="update qna SET reply=?, rep=2 where qseq=?";
				   pstmt = con.prepareStatement(sql);
				   pstmt.setString(1, bean.getReply());
			       pstmt.setInt(2, bean.getQseq());
			       int count = pstmt.executeUpdate();
			         if (count > 0)
			            flag = true;
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt);
		      }
		      return flag;
		   }
	   
	   //문의글 상세보기
	   public qnaBean qnaSelect(int qseq) {
		   Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      qnaBean bean=null;
		      try {
		         con=pool.getConnection();
		         String sql="select * from qna where qseq=?";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setInt(1, qseq);
		         rs = pstmt.executeQuery();
		         if (rs.next()) {
		        	bean = new qnaBean();
		            bean.setQseq(rs.getInt("qseq"));
		        	bean.setSubject(rs.getString("subject"));
		        	bean.setContent(rs.getString("content"));
		        	bean.setReply(rs.getString("reply"));
		        	bean.setId(rs.getString("id"));
		        	bean.setRep(rs.getString("rep"));
		        	bean.setIndate(rs.getString("indate"));
		         }
		      		} catch (Exception e) {
		      			e.printStackTrace();
		      		} finally {
		      			pool.freeConnection(con);
		      		}
		       return bean;
		    }
	   
	   //상품 등록
	   public boolean productInsert (productBean bean) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="insert into product (pseq, name, kind, price2, writer, publisher, content, image) values(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, bean.getName());
			   pstmt.setString(2, bean.getKind());
			   pstmt.setInt(3, bean.getPrice2());
			   pstmt.setString(4, bean.getWriter());
			   pstmt.setString(5, bean.getPublisher());
			   pstmt.setString(6, bean.getContent());
			   pstmt.setString(7, bean.getImage());
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
	   
	   //상품 수정
	   public boolean productUpdate (productBean bean) {
		   Connection con=null;
		   PreparedStatement pstmt=null;
		   boolean flag=false;
		   try {
			   con=pool.getConnection();
			   String sql="update product set name=?, kind=?, price2=?, writer=?, publisher=?, content=?, image=? where pseq=?";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, bean.getName());
			   pstmt.setString(2, bean.getKind());
			   pstmt.setInt(3, bean.getPrice2());
			   pstmt.setString(4, bean.getWriter());
			   pstmt.setString(5, bean.getPublisher());
			   pstmt.setString(6, bean.getContent());
			   pstmt.setString(7, bean.getImage());
			   pstmt.setInt(8, bean.getPseq());
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
	   
	   //상품 삭제
	   public boolean productDelete(int pseq) {
			  Connection con=null;
			   PreparedStatement pstmt=null;
			   boolean flag=false;
			   try {
				   con=pool.getConnection();
				   String sql="delete from product where pseq=?";
				   pstmt = con.prepareStatement(sql);
			       pstmt.setInt(1, pseq);
			       if (pstmt.executeUpdate()==1)
			            flag=true;
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt);
		      }
		      return flag;
		   }

}
