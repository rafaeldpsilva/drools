package org.engcia.cf.listeners;

import org.drools.core.event.DefaultAgendaEventListener;
import org.engcia.cf.model.FactCF;
import org.engcia.cf.model.Justification;
import org.engcia.cfsample.DroolsTest;
import org.kie.api.definition.rule.Rule;
import org.kie.api.event.rule.*;
import org.kie.api.runtime.rule.Match;

import java.util.ArrayList;
import java.util.List;

public class TrackingAgendaEventListener extends DefaultAgendaEventListener {
    private List<Match> matchList = new ArrayList<Match>();
    private List<FactCF> lhs = new ArrayList<FactCF>();
    private List<FactCF> rhs = new ArrayList<FactCF>();

    public void resetLhs() {
        lhs.clear();
    }

    public void addLhs(FactCF f) {
        lhs.add(f);
    }

    public void resetRhs() {
        rhs.clear();
    }

    public void addRhs(FactCF f) {
        rhs.add(f);
    }

    @Override
    public void matchCreated(MatchCreatedEvent event) {
    }
    @Override
    public void matchCancelled(MatchCancelledEvent event) {
    }
    @Override
    public void beforeMatchFired(BeforeMatchFiredEvent event) {
    }
    @Override
    public void agendaGroupPushed(AgendaGroupPushedEvent event) {
    }
    @Override
    public void agendaGroupPopped(AgendaGroupPoppedEvent event) {
    }
    @Override
    public void afterMatchFired(AfterMatchFiredEvent event) {
        Rule rule = event.getMatch().getRule();
        String ruleName = rule.getName();

        //System.out.println("LHS:");
        List <Object> list = event.getMatch().getObjects();
        for (Object e : list) {
            if (e instanceof FactCF) {
                lhs.add((FactCF)e);
            }
        }

        /*
        for (FactCF f : lhs) {
            //System.out.println(f.getId() + ":" + f);
        }
        */

        //System.out.println("RHS:");
        for (FactCF f: rhs) {
            //System.out.println(f.getId() + ":" + f);
            Justification j = new Justification(ruleName, lhs, f);
            DroolsTest.justifications.put(f.getId(), j);
        }

        resetLhs();
        resetRhs();

        /*
        matchList.add(event.getMatch());
        StringBuilder sb = new StringBuilder();
        sb.append("Rule fired: " + ruleName);

        if (ruleMetaDataMap.size() > 0) {
            sb.append("\n  With [" + ruleMetaDataMap.size() + "] meta-data:");
            for (String key : ruleMetaDataMap.keySet()) {
                sb.append("\n    key=" + key + ", value=" + ruleMetaDataMap.get(key));
            }
        }
        */
        //System.out.println(sb.toString());
    }
}

