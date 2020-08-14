<%
    rosterStatusKey = {
        "ACT": "Active",
        "DEV": "Development Squad",
        "CUT": "Cut",
        "RES": "Reserved",
        "SUS": "Suspended",
        "RSN": "?",
        "TRD": "Traded to another division",
        "TRT": "Traded from Team",
        "TRC": "Traded to another Conference",
        "EXE": "Exempt",
        "NWT": "Not with team",
        "PUP": "Physically Unable to Perform",
        "UDF": "Unsigned Draft Pick",
        "RFA": "Restricted Free Agent",
        "UFA": "Unrestricted Free Agent",
        "NON": "Non football related injured reserve",
        "RET": "Retired",
    }
    excludeRosterStatus = ["ACT", "DEV", "CUT", "TRD", "TRT", "TRC", "UDF", "RFA", "UFA", "RET"]
    myInactives = [x for x in data["myTeam"]["roster"]["data"] if x["activeRole"] == "PLAYER" and x["player"]["rosterStatus"] not in excludeRosterStatus]
    oppInactives = [x for x in data["oppTeam"]["roster"]["data"] if x["activeRole"] == "PLAYER" and x["player"]["rosterStatus"] not in excludeRosterStatus]
%>\
% if len(myInactives):
${'##'} ${data["myTeam"]["nickName"]} Inactives & Injury Status
% for x in set(x["player"]["rosterStatus"] for x in myInactives):
* ${f"{rosterStatusKey[x]}: {', '.join([p['player']['position']['abbr'] + ' ' + p['displayName'] for p in myInactives if p['player']['rosterStatus'] == x])}"}
% endfor
% endif

% if len(myInactives):
${'##'} ${data["oppTeam"]["nickName"]} Inactives & Injury Status
% for x in set(x["player"]["rosterStatus"] for x in myInactives):
* ${f"{rosterStatusKey[x]}: {', '.join([p['player']['position']['abbr'] + ' ' + p['displayName'] for p in myInactives if p['player']['rosterStatus'] == x])}"}
% endfor
% endif