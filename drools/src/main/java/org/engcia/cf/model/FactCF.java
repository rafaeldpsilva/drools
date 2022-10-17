package org.engcia.cf.model;

import org.kie.api.runtime.rule.FactHandle;
import org.engcia.cf.listeners.TrackingAgendaListener;

public class FactCF implements Comparable<FactCF>, Uncertainty {
	private double cf;
	private String description;
	private String value;

	public FactCF(double cf, String description, String value) {
		super();
		this.cf = cf;
		this.description = description;
		this.value = value;
	}
	
	public FactCF() {
		this(0, "", "");
	}

	public double getCf() {
		return cf;
	}

	public void setCf(double cf) {
		this.cf = cf;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}

	public String getValue() {
		return this.value;
	}
	
	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public int compareTo(FactCF f) {
		if(this.getCf() < f.getCf()) {
			return -1;
		}
		else if(this.getCf() > f.getCf()) {
			return 1;
		}
		return 0;
	}
	
	@Override
	public String toString() {
		return this.getClass().getName() + 
				"[CF=" + cf + " ; " + 
				"description=" + description + " ; " + "Value=" + value + "]";
	}
	
	@Override
	public void update() {
		
		// get conclusion fact handle
		FactHandle fHandle = TrackingAgendaListener.getKieSession().getFactHandle(this);
		
		double lhsCF = TrackingAgendaListener.getLHSminimumCF(this);
		
		// update this object (Rule conclusion)
		
		// calculate newCF
		double newCF = lhsCF * TrackingAgendaListener.getRuleCF();

		// update conclusion object in working memory
		this.updateCF(newCF);;
		TrackingAgendaListener.getKieSession().update(fHandle, this);
		
		/*
		// update this object (Rule conclusion)
		
		// remove conclusion object from activations list
		TrackingAgendaListener.getActivations().remove(this);
		
		// get the minimum CF value from LHS (considering only the "and" operator)
		TrackingAgendaListener.getActivations().sort(null);
		FactCF f = (FactCF)TrackingAgendaListener.getActivations().get(0);
		double lhsCF = f.getCf();
		
		// calculate newCF
		double newCF = lhsCF * TrackingAgendaListener.getRuleCF();

		// update conclusion object in working memory
		this.updateCF(newCF);;
		TrackingAgendaListener.getKieSession().update(fHandle, this);
		*/
	}
	
	private void updateCF(double newCF) {
		double combinedCF = combineCF(this.getCf(), newCF);
		this.setCf(combinedCF);
	}
	
	private double combineCF(double oldCF, double newCF) {
		double combinedCF;
		if(oldCF >= 0 && newCF >=0) {
			combinedCF = oldCF + newCF * (1 - oldCF);
		} else if(oldCF <= 0 && newCF <= 0) {
			combinedCF = oldCF + newCF * (1 + oldCF);
		} else {
			combinedCF = (oldCF + newCF) / (1 - Math.min(Math.abs(oldCF), Math.abs(newCF)));
		}
		return combinedCF;
	}
	
}
