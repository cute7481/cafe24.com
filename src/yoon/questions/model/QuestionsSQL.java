package yoon.questions.model;

class QuestionsSQL {
	//���� ����Ʈ  
	final static String LIST = "select * from R_PICTURE order by NUM desc";
	//����_��� ����Ʈ 
	final static String COMMENTLIST = "select * from R_PIC_REPLY order by NUM desc";
	//���� �ϳ� ����Ʈ
	final static String MAINQ = "select * from R_PICTURE where NUM=?";
	//���� ���� ����
	final static String TOTALQ = "select COUNT(*) as TOTALCOUNT from R_PICTURE";
	//������ ��������
	final static String QR_TOTAL = "select COUNT(*) as QRTOTAL from R_PIC_REPLY where PNUM=?";
	
	//final static String P_LIST = "select NUM, SUBJECT, RDATE from R_PICTURE order by NUM desc";
	//final static String P_SLIST = "select PIC, SUBJECT, AUTHOR, RDATE from R_PICTURE where NUM=?";
}
