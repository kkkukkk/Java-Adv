package jdbc;

public class OrderDTO {
	private String oid = null;
	private String opid = null;
	private String ouid = null;
	private String opname = null;
	private String oprice = null;
	private String ostatus = null;
	private String odate = null;
	private String ograde = null;
	private String ocomm = null;
	
	
	public String getOid() {
		return oid;
	}
	public String getOpid() {
		return opid;
	}
	public String getOuid() {
		return ouid;
	}
	public String getOpname() {
		return opname;
	}
	public String getOprice() {
		return oprice;
	}
	public String getOstatus() {
		return ostatus;
	}
	public String getOdate() {
		return odate;
	}
	public String getOgrade() {
		return ograde;
	}
	public String getOcomm() {
		return ocomm;
	}
	public OrderDTO(String oid, String opid, String ouid, String opname, String oprice, String ostatus, String odate,
			String ograde, String ocomm) {
		this.oid = oid;
		this.opid = opid;
		this.ouid = ouid;
		this.opname = opname;
		this.oprice = oprice;
		this.ostatus = ostatus;
		this.odate = odate;
		this.ograde = ograde;
		this.ocomm = ocomm;
	}
	
}
