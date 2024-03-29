package com.follow_up.utility;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import com.follow_up.model.SH.board.ReplyMapper;

public class Utility {
	/**
	 * 날짜 비교 (오늘, 어제, 그제)
	 * 
	 * @param wdate - 등록일
	 * @return - true:오늘,어제,그제중 등록날짜와 같음 false:오늘,어제,그제 날짜가 등록날짜와 다 다름
	 */
	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
			flag = true;
		}

		return flag;
	}

	/**
	 * 오늘,어제,그제 날짜 가져오기
	 * 
	 * @return List- 날짜들 저장 SimpleDateFormat("yyyy-MM-dd")
	 */
	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		for (int j = 0; j < 3; j++) {
			list.add(sd.format(cal.getTime()));
			cal.add(Calendar.DATE, -1);
		}

		return list;
	}

	public static String checkNull(String str) {
		if (str == null) {
			str = "";
		}

		return str;
	}

	/**
	 * @param totalRecord   전체 레코드수
	 * @param nowPage       현재 페이지
	 * @param recordPerPage 페이지당 레코드 수
	 * @param col           검색 컬럼
	 * @param word          검색어
	 * @param url           이동할 페이지
	 * @return 페이징 생성 문자열
	 */
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word, String url) {
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<ul class='pagination justify-content-center'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append("<li class='page-item'><a class='btn btn-dark btn-sm' href='" + url + "?col=" + col + "&word="
					+ word + "&nowPage=" + _nowPage + "'>prev</A></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='page-item active'><a class='btn btn-dark btn-sm disabled' href=#>" + i + "</a></li>");
			} else {
				str.append("<li class='page-item'><a class='btn btn-dark btn-sm' href='" + url + "?col=" + col + "&word="
						+ word + "&nowPage=" + i + "'>" + i + "</a></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append("<li class='page-item'><a class='btn btn-dark btn-sm' href='" + url + "?col=" + col + "&word="
					+ word + "&nowPage=" + _nowPage + "'>next</A></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}

	public static String saveFileSpring(MultipartFile mf, String basePath) {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		String filename = "";
		long filesize = mf.getSize();
		String originalFilename = mf.getOriginalFilename();
		try {
			if (filesize > 0) { // 파일이 존재한다면
				// 인풋 스트림을 얻는다.
				inputStream = mf.getInputStream();

				File oldfile = new File(basePath, originalFilename);

				if (oldfile.exists()) {
					for (int k = 0; true; k++) {
						// 파일명 중복을 피하기 위한 일련 번호를 생성하여
						// 파일명으로 조합
						oldfile = new File(basePath, "(" + k + ")" + originalFilename);

						// 조합된 파일명이 존재하지 않는다면, 일련번호가
						// 붙은 파일명 다시 생성
						if (!oldfile.exists()) { // 존재하지 않는 경우
							filename = "(" + k + ")" + originalFilename;
							break;
						}
					}
				} else {
					filename = originalFilename;
				}
				String os = System.getProperty("os.name").toLowerCase();
				System.out.println("os: " + os); // windows 10, linux, mac os x
				String serverFullPath = null;
				if (os.equals("mac os x")) { // Mac
					System.out.println("맥");
					serverFullPath = basePath + "/" + filename;
				} else if (os.equals("windows 10")) {
					System.out.println("os: " + os);
					serverFullPath = basePath + "\\" + filename;
				} else if (os.equals("linux")) {
					System.out.println("리눅스");
					serverFullPath = basePath + "/" + filename;
				}

				System.out.println("fileName: " + filename);
				System.out.println("serverFullPath: " + serverFullPath);

				outputStream = new FileOutputStream(serverFullPath);

				// 버퍼를 만든다.
				int readBytes = 0;
				byte[] buffer = new byte[8192];

				while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return filename;
	}

	public static void deleteFile(String upDir, String oldfile) {
		File file = new File(upDir, oldfile);
		if (file.exists())
			file.delete();

	}

	public static String paging(int total, int nowPage, int recordPerPage, String col, String word, String url,
			int nPage, int bnum) {
		// TODO Auto-generated method stub
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) total / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<ul class='pagination justify-content-center'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock; // 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append("<li class='page-item'><a class='btn btn-dark btn-sm' href='" + url + "?col=" + col + "&word="
					+ word + "&nowPage=" + nowPage + "&nPage=" + _nowPage + "&bnum=" + bnum + "'>prev</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nPage == i) {
				str.append("<li class='page-item active'><a class='btn btn-dark btn-sm disabled' href='#section1'>" + i
						+ "</a></li>");
			} else {
				str.append("<li class='page-item'><a class='btn btn-dark btn-sm' href='" + url + "?col=" + col + "&word="
						+ word + "&nowPage=" + nowPage + "&nPage=" + i + "&bnum=" + bnum + "'>" + i + "</a></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append("<li class='page-item'><a class='btn btn-dark btn-sm' href='" + url + "?col=" + col + "&word="
					+ word + "&nowPage=" + nowPage + "&nPage=" + _nowPage + "&bnum=" + bnum + "'>next</a></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}

	public static int rcount(int bnum, ReplyMapper rmapper) {
		return rmapper.total(bnum);
	}

} // class end
