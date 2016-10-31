package yoon.board.model;

class BoardSQL {
	//�Խ��� ��� ����
	//final static String LIST = "select * FROM R_BOARD order by NUM desc";
	//����¡�� ���� ������
	final static String LIST = "select A.* from ("
			+ "select B.*, "
			+ "(select COUNT(*) as CNT from R_BOA_REPLY C where C.BNUM=B.NUM), "
			+ "D.NICK from R_BOARD B, R_MEMBER D where B.ID=D.ID order by B.NUM desc)A "
			+ "limit ?,15";
	//�˻� ��������
	//����
	final static String L_SUBJ = "select A.* from ("
			+ "select B.*, (select COUNT(*) as CNT from R_BOA_REPLY C where C.BNUM=B.NUM), D.NICK"
			+ " from R_BOARD B, R_MEMBER D where B.ID=D.ID and B.SUBJECT like ? order by B.NUM desc"
			//+ "select * from R_BOARD where SUBJECT like ? order by NUM desc" //where subject like '%������%' 
			+ ") A limit ?,15";
	//����
	final static String L_CONT = "select A.* from ("
			+"select B.*, (select COUNT(*) as CNT from R_BOA_REPLY C where C.BNUM=B.NUM), D.NICK"
			+ " from R_BOARD B, R_MEMBER D where B.ID=D.ID and B.CONTENT like ? order by B.NUM desc"
			//+ "select * from R_BOARD where CONTENT like ? order by NUM desc"
			+ ") A limit ?,15";
	//����+����
	final static String L_CONT_SUBJ = "select A.* from ("
			+ "select B.*, (select COUNT(*) as CNT from R_BOA_REPLY C where C.BNUM=B.NUM), D.NICK" 
			+ " from R_BOARD B, R_MEMBER D where B.ID=D.ID and (CONTENT like ? or SUBJECT like ?) order by B.NUM desc"
			//+ "select * from R_BOARD where CONTENT like ? or SUBJECT like ? order by NUM desc"
			+ ") A limit ?,15";
	//�۾���
	final static String L_ID = "select A.* from ("
			+ "select B.*, (select COUNT(*) as CNT from R_BOA_REPLY C where C.BNUM=B.NUM), D.NICK" 
			+ " from R_BOARD B, R_MEMBER D where B.ID=D.ID and D.NICK like ? order by B.NUM desc"
			//+ "select * from R_BOARD where ID like ? order by NUM desc"
			+ ") A limit ?,15";
	//��ü �Խñ� ��
	final static String TOTALNUM = "select COUNT(*) as TOTALCOUNT FROM R_BOARD";
	//�˻� �Խñ� ��
	final static String T_CONT = "select COUNT(*) as TOTALCOUNT FROM R_BOARD where CONTENT like ?";
	final static String T_SUBJ = "select COUNT(*) as TOTALCOUNT FROM R_BOARD where SUBJECT like ?";
	final static String T_CONT_SUBJ = "select COUNT(*) as TOTALCOUNT FROM R_BOARD where CONTENT like ? or SUBJECT like ?";
	final static String T_ID = "select COUNT(*) as TOTALCOUNT FROM R_BOARD where ID like ?";
	//���� ����
	final static String CONTENT = "select B.* , A.NAME from R_BOARD B, R_MEMBER A where B.NUM=? and B.ID=A.ID";
	//��ȸ�� ����
	final static String READNUMBER = "update R_BOARD set READNUM=READNUM+1 where NUM=?";
	//�� ����(�����ư Ŭ�� ��)
	final static String WRITE = "insert into R_BOARD values(null, ?, ?, ?, ?, NOW())";
	//�� ����(������ư Ŭ���� ����Ʈ ��� ����)
	final static String EDIT = "select B.SUBJECT, B.CONTENT, B.ID, A.NAME from R_BOARD B, R_MEMBER A where B.NUM=? and B.ID=A.ID ";
	//������Ʈ (���� ��ư Ŭ�� ��)
	final static String UPDATE = "update R_BOARD set SUBJECT=?, CONTENT=? where NUM=?";
	//�� ����
	final static String DEL = "delete from R_BOARD where NUM=?";
}
