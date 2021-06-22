package dao;

import java.util.ArrayList;

import vo.ArtistVO;

public class ArtistDAO extends DAO {

	// 지원 작성
	// 아티스트 전체 리스트
	public ArrayList<ArtistVO> getList() {
		ArrayList<ArtistVO> list = new ArrayList<ArtistVO>();
		String sql = "select name, content, simg, no from artists order by no";

		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ArtistVO vo = new ArtistVO();
				vo.setName(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setSimg(rs.getString(3));

				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}

	// 아티스트 삭제
	public boolean getDeleteResult(String name) {
		boolean result = false;
		String sql = "delete from artists where name=? ";

		getPreparedStatement(sql);

		try {
			pstmt.setString(1, name);

			int value = pstmt.executeUpdate();
			if (value != 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();

		return result;
	}

	// insert -> 아티스트 추가
	public boolean getInsertResult(ArtistVO vo) {
		boolean result = false;
		try {
			String sql = "insert into artists values(artists_no_seq.nextval, ?, ?, ?, ?)";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getImg());
			pstmt.setString(4, vo.getSimg());

			int val = pstmt.executeUpdate();

			if (val == 1) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();
		return result;
	}

	// select -> 상세 정보
	public ArtistVO getContent(String name) {
		ArtistVO vo = new ArtistVO();

		try {
			String sql = " select name, content, img, simg from artists where name = ? ";
			getPreparedStatement(sql);

			pstmt.setString(1, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setName(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setSimg(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	// update -> 게시글 수정
	public boolean getUpdateResult(ArtistVO vo) {
		boolean result = false;
		try {
			String sql = " update artists set content = ?, img = ?, simg = ? where name = ? ";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getImg());
			pstmt.setString(3, vo.getSimg());
			pstmt.setString(4, vo.getName());

			int val = pstmt.executeUpdate();
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public boolean getUpdateResultNofile(ArtistVO vo) {
		System.out.println("dao 들어옴");
		System.out.println(vo.getContent());
		System.out.println(vo.getName());
		boolean result = false;
		try {
			System.out.println(222);
			String sql = " update artists set content = ? where name = ? ";
			getPreparedStatement(sql);
			System.out.println(333);

			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getName());

			System.out.println(444);
			int val = pstmt.executeUpdate();
			System.out.println("val:" + val);
			if (val == 1) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
