package jdbc;

public class BoardDTO {

	private String bid;
	private String btitle;
	private String bcontent;
	private String buser;
	private String bdate;
	private String bimage;
	private String baddr;
	
	public BoardDTO(String bid, String btitle, String bcontent, String buser, String bdate, String bimage, String baddr) {
		super();
		this.bid = bid;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.buser = buser;
		this.bdate = bdate;
		this.bimage = bimage;
		this.baddr = baddr;
	}
	public String getBid() {
		return bid;
	}
	public String getBtitle() {
		return btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public String getBuser() {
		return buser;
	}
	public String getBdate() {
		return bdate;
	}
	public String getBimage() {
		return bimage;
	}
	public String getBaddr() {
		return baddr;
	}
	
}
