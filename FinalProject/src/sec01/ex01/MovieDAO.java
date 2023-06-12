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
	
}