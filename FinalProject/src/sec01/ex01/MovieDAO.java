package sec01.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public MovieDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<MovieVO> listmovies() {
		List<MovieVO> movieList = new ArrayList<MovieVO>();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from movie_info";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String movie_num = rs.getString("movie_num");
				String movie_name = rs.getString("movie_name");
				String movie_content = rs.getString("movie_content");
				String member_id = rs.getString("member_id");
				MovieVO movieVO = new MovieVO(movie_num, movie_name, movie_content, member_id);
				movieList.add(movieVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movieList;
	}
	
	public void addMovie(MovieVO mo) {
		try {
			conn = dataFactory.getConnection();
			String movie_num = mo.getMovie_num();
			String movie_name = mo.getMovie_name();
			String movie_content = mo.getMovie_content();
			String member_id = mo.getMember_id();
			String query = "INSERT INTO movie_info(movie_num, movie_name, movie_content, member_id)" + "VALUES(?, ?, ?, ?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,movie_num);
			pstmt.setString(2,movie_name);
			pstmt.setString(3,movie_content);
			pstmt.setString(4, member_id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MovieVO findMovie(String _movie_num) {
		MovieVO movInfo = null;
		try {
			conn = dataFactory.getConnection();
			String query = "select * from movie_info where movie_num=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, _movie_num);
			System.out.println(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String movie_num = rs.getString("movie_num");
				String movie_name = rs.getString("movie_name");
				String movie_content = rs.getString("movie_content");
				String member_id = rs.getString("member_id");
				movInfo = new MovieVO(movie_num, movie_name, movie_content, member_id);
			}
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movInfo;
	}
	
	public void modMovie(MovieVO movieVO) {
		String movie_num = movieVO.getMovie_num();
		String movie_name = movieVO.getMovie_name();
		String movie_content = movieVO.getMovie_content();
		try {
			conn = dataFactory.getConnection();
			String query = "update movie_info set movie_name=?,movie_content=?  where movie_num=?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, movie_name);
			pstmt.setString(2, movie_content);
			pstmt.setString(3, movie_num);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delmovie(String movie_num) {
		try {
			conn = dataFactory.getConnection();
			String query = "delete from movie_info where movie_num=?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,movie_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MovieVO> viewmovie(String view_num) {
		List<MovieVO> viewsmovie = new ArrayList<MovieVO>();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from movie_info where movie_num=?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,view_num);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String movie_num = rs.getString("movie_num");
				String movie_name = rs.getString("movie_name");
				String movie_content = rs.getString("movie_content");
				String member_id = rs.getString("member_id");
				MovieVO viewmovieVO = new MovieVO(movie_num, movie_name, movie_content, member_id);
				viewsmovie.add(viewmovieVO);
			}
			pstmt.executeUpdate();
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewsmovie;
	}
	
}