package yoon.qget.model;

class QgetSQL {
	//질문 제보 리스트 (for paging)
	final static String QG_LIST = "select C.NUM, C.ID, C.NICK, C.CONTENT, C.GOOD, C.BAD, C.CTIME from ("
									+ "select A.NUM, A.ID, B.NICK, A.CONTENT, A.GOOD, A.BAD, DATE_FORMAT(A.RDATE, '%Y-%m-%d %T') "
									+ "as CTIME from R_QUESTION_GET A, R_MEMBER B where A.ID=B.ID order by A.NUM desc) "
									+ "C limit ?,10";
	//질문 제보 전체개수
	final static String QG_TOTAL = "select COUNT(*) as TOTALCOUNT from R_QUESTION_GET";
	
	//베스트 리스트
	final static String QG_BEST = "select C.NUM, C.ID, C.NICK, C.CONTENT, C.GOOD, C.BAD, DATE_FORMAT(C.RDATE, '%Y-%m-%d %T') "
									+ "as CTIME "
									+ "from (select A.NUM, A.ID, B.NICK, A.CONTENT, A.GOOD, A.BAD, A.RDATE "
									+ "from R_QUESTION_GET A, R_MEMBER B where A.GOOD>=1 and A.GOOD>A.BAD and A.ID=B.ID "
									+ "order by A.GOOD desc, A.BAD asc) C "
									+ "limit 0,10";
	//질문 제보(인서트)
	final static String QG_INSERT = "insert into R_QUESTION_GET values(NULL, ?, ?, 0, 0, NOW())";
	//질문 삭제(딜리트)
	final static String QG_DELETE = "delete from R_QUESTION_GET where NUM=?";
	//좋아요 싫어요 체크
	final static String QG_GB_CHECK = "select GB from R_QGET_GB where QNUM=? and ID=?";
	//좋아요 싫어요 버튼 클릭 후 디비저장
	final static String QG_GB_INSERT = "insert into R_QGET_GB values(NULL, ?, ?, ?, NOW())";
	//좋아요+1
	final static String QG_GOOD_UP = "update R_QUESTION_GET set GOOD=GOOD+1 where NUM=?";
	//싫어요+1
	final static String QG_DOWN_UP = "update R_QUESTION_GET set BAD=BAD+1 where NUM=?";
}
