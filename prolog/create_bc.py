import pandas as pd
from datetime import datetime

xls = pd.ExcelFile('Dataset.xlsx')
df1 = pd.read_excel(xls, 'PublicBuilding')
df2 = pd.read_excel(xls, 'Total Consumers')
df3 = pd.read_excel(xls, 'Total Producers')
consumers=['Consumer1','Consumer2','Consumer3','Consumer4','Consumer5',
            'Consumer6','Consumer7','Consumer8','Consumer9','Consumer10',
            'Consumer11','Consumer12','Consumer13','Consumer14','Consumer15',
            'Consumer16','Consumer17','Consumer18','Consumer19','Consumer20',
            'Consumer21','Consumer22','Consumer23','Consumer24','Consumer25',
            'Consumer26','Consumer27','Consumer28','Consumer29','Consumer30',
            'Consumer31','Consumer32','Consumer33','Consumer34','Consumer35',
            'Consumer36','Consumer37','Consumer38','Consumer39','Consumer40',
            'Consumer41','Consumer42','Consumer43','Consumer44','Consumer45',
            'Consumer46','Consumer47','Consumer48','Consumer49','Consumer50']
i=0
iP=1
iPeriod=0
iBuilding=df1.columns.get_loc('Total Consumption')
totalConsumption=0
totalProduction=0
f = open("bc.pl", "a")
with open("bc.pl", "r") as f:
    nrFactos=len(f.readlines())
totalP=5#len(df2.index)
totalD=len(df1.columns)
firstDeviceIloc=3
firstDevice=0
firstPlayer=1
with open("bc.pl", "a") as f:
    while iP <= totalP: 
        for c, p in zip(df2.iloc[i,:], df3.iloc[i:,]):            
            if c>0 and p ==0:
                typeP='consumer'
            elif c==0 and p>0:
                typeP='producer'
            else:
                typeP='prosumer'    
    
            nrFactos=nrFactos+1
            rule='facto ('+str(nrFactos)+', participant('+str(firstPlayer)+','+str(iPeriod)+','+str(p)+','+str(c)+','+typeP+')).\n'
            f.write(rule)
            firstPlayer=firstPlayer+1
            totalConsumption=totalConsumption+c
            totalProduction=totalProduction+p
        i=i+1
        firstPlayer=1
        b=df1.iloc[iPeriod,iBuilding]    
        nrFactos=nrFactos+1
        rule2='facto ('+str(nrFactos)+', participant('+str(0)+','+str(iPeriod)+','+str(0)+','+str(b)+',consumer)).\n'
        f.write(rule2)
        totalConsumption=totalConsumption+b
        nrFactos=nrFactos+1
        rule3= 'facto ('+str(nrFactos)+', community('+str(iPeriod)+','+str(totalConsumption)+','+str(totalProduction)+')).\n'
        f.write(rule3)
        totalConsumption=0
        totalProduction=0
        iPeriod=iPeriod+1
        iP=iP+1
    newdf= df1.iloc[:,firstDeviceIloc:]
    iPB=0
    i=0
    iPeriod=0
    while iPB <= totalP:
        for bD in newdf.iloc[i,:]: 
            name=newdf.columns[firstDevice]
            nrFactos=nrFactos+1
            rule1='facto ('+str(nrFactos)+', device('+str(iPeriod)+','+str(name)+','+str(bD)+')).\n'
            f.write(rule1)
            firstDevice=firstDevice+1
        firstDevice=0
        i=i+1
        iPeriod=iPeriod+1
        iPB=iPB+1
    iPC=0
    i=0
    iPeriod=0
    for consumer in consumers:
        df = pd.read_excel(xls, consumer)
        df= df.iloc[:,firstDeviceIloc:]
        while iPC <= totalP:
            for cD in df.iloc[i,:]:
                nrFactos=nrFactos+1
                name=df.columns[firstDevice]            
                rule1='facto ('+str(nrFactos)+', device('+str(iPeriod)+','+str(name)+','+str(cD)+')).\n'
                f.write(rule1)
                firstDevice=firstDevice+1
            firstDevice=0
            iPeriod=iPeriod+1
            i=i+1
            iPeriod=0
            iPC=iPC+1

#facto(D, period(ID,Parti,Weather,Pricing))
#facto(E, batteryPeriod(IDP,B_Act, B_Max))
#facto(F, sell(M, P,V))
print("«««BC sucessfull created!»»»")