package dao;

import java.util.LinkedHashMap;

public class StatisticsDAO extends DAO {

	// 성별 통계를 위한 데이터를 불러오는 함수(전체)
	public LinkedHashMap<String, Integer> getDataBySex() {
		LinkedHashMap<String, Integer> data = new LinkedHashMap<String, Integer>();
		
		try {
			String sql = " select sex, count(*) "
					+ " from orders o, members m "
					+ " where o.id = m.id "
					+ " group by sex ";
			
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString(1).equals("M")) {
					data.put("남", rs.getInt(2));
				} else if(rs.getString(1).equals("F")) {
					data.put("여", rs.getInt(2));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}

	// 성별 통계를 위한 데이터를 불러오는 함수(아티스트별)
	public LinkedHashMap<String, Integer> getDataBySex(String artist) {
		LinkedHashMap<String, Integer> data = new LinkedHashMap<String, Integer>();
		
		try {
			String sql = " select sex, count(*) "
					+ " from orders o, members m, concerts c "
					+ " where o.id = m.id and o.concerts_no = c.no and c.artist = ? "
					+ " group by sex ";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, artist);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString(1).equals("M")) {
					data.put("남", rs.getInt(2));
				} else if(rs.getString(1).equals("F")) {
					data.put("여", rs.getInt(2));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	// 연령별 통계를 위한 데이터를 불러오는 함수(전체)
	public LinkedHashMap<String, Integer> getDataByAge() {
		LinkedHashMap<String, Integer> data = new LinkedHashMap<String, Integer>();
		
		try {
			String sql = " select age, count(*) "
					+ " from (select floor((to_char(sysdate, 'YYYY') - to_char(m.birthdate, ' YYYY')) / 10) * 10 as age "
					+ "		from orders o, members m where o.id = m.id) "
					+ " group by age "
					+ " order by age asc ";
			
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				data.put(rs.getString(1), rs.getInt(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	// 연령별 통계를 위한 데이터를 불러오는 함수(아티스트별)
	public LinkedHashMap<String, Integer> getDataByAge(String artist) {
		LinkedHashMap<String, Integer> data = new LinkedHashMap<String, Integer>();
		
		try {
			String sql = " select age, count(*) "
					+ " from (select floor((to_char(sysdate, 'YYYY') - to_char(m.birthdate, ' YYYY')) / 10) * 10 as age "
					+ "		from orders o, members m, concerts c "
					+ "		where o.id = m.id and o.concerts_no = c.no and c.artist = ?) "
					+ " group by age "
					+ " order by age asc ";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, artist);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				data.put(rs.getString(1), rs.getInt(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
}
