package yoon.reply.model;

class ReplySQL {
	//���� �����ֱ� (�� ���� ���� ��)
	final static String LIST  = "select A.NUM,A.BNUM, A.ID, A.REPLY, DATE_FORMAT(A.RDATE, '%Y-%m-%d %T') "
			+ "as ctime, B.NICK, B.PIC from R_BOA_REPLY A,R_MEMBER B where A.BNUM=? and A.ID=B.ID order by A.NUM desc";
	
	//��� �ޱ� ���� ��												NUM					   ,BNUM, ID,REPLY,DATE 
	final static String REPLY = "insert into R_BOA_REPLY values(NULL, ?  ,  ?, ?   , NOW())";
	
	//��� ����
	final static String DEL = "delete from R_BOA_REPLY where NUM=?";
	
	final static String GET_NICK = "select NICK from R_MEMBER where ID=?";
	
	//��� ���� â���� ���� �Ϸ� ��
	//final static String UPDATE = "update R_BOA_REPLY set REPLY=?";
}
