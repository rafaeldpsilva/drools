package org.engcia.cf.model;

import java.util.ArrayList;
import java.util.List;

public class Justification {
    private String rule;
    private List<FactCF> lhs;
    private FactCF conclusion;

    public Justification(String rule, List<FactCF> lhs, FactCF conclusion) {
        this.rule = rule;
        this.lhs = new ArrayList<FactCF>(lhs);
        this.conclusion = conclusion;
    }

    public String getRuleName() {
        return this.rule;
    }

    public List<FactCF> getLhs() {
        return this.lhs;
    }

    public FactCF getConclusion() {
        return this.conclusion;
    }
}

