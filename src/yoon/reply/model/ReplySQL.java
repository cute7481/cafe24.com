package yoon.reply.model;

class ReplySQL {
	//리플 보여주기 (글 보기 했을 때)
	final static String LIST  = "select A.NUM,A.BNUM, A.ID, A.REPLY, DATE_FORMAT(A.RDATE, '%Y-%m-%d %T') "
			+ "as ctime, B.NICK, B.PIC from R_BOA_REPLY A,R_MEMBER B where A.BNUM=? and A.ID=B.ID order by A.NUM desc";
	
	//댓글 달기 눌른 후												NUM					   ,BNUM, ID,REPLY,DATE 
	final static String REPLY = "insert into R_BOA_REPLY values(NULL, ?  ,  ?, ?   , NOW())";
	
	//댓글 삭제
	final static String DEL = "delete from R_BOA_REPLY where NUM=?";
	
	final static String GET_NICK = "select NICK from R_MEMBER where ID=?";
	
	//댓글 수정 창에서 수정 완료 후
	//final static String UPDATE = "update R_BOA_REPLY set REPLY=?";
}
