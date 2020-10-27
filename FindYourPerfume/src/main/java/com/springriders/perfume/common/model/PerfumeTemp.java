package com.springriders.perfume.common.model;

import java.util.List;

public class PerfumeTemp {
	private int rowAllCnt;
	private List<PerfumeDMI> selBrandAlpahbet;
	
	public int getRowAllCnt() {
		return rowAllCnt;
	}
	public void setRowAllCnt(int rowAllCnt) {
		this.rowAllCnt = rowAllCnt;
	}
	public List<PerfumeDMI> getSelBrandAlpahbet() {
		return selBrandAlpahbet;
	}
	public void setSelBrandAlpahbet(List<PerfumeDMI> selBrandAlpahbet) {
		this.selBrandAlpahbet = selBrandAlpahbet;
	}
}
