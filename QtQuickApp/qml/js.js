var m_counter = 0;
var m_homeCnt = 0;
var m_moCallCnt = 0;

function GotoHome() {
    m_homeCnt++;
}

function GetHomeCnt() {
    return m_homeCnt;
}

function GotoMOCall() {
    m_moCallCnt++;
}

function GetMOCallCnt() {
    return m_moCallCnt;
}

function GetCount() {
    return m_counter;
}

function Increase() {
    m_counter++;
}

function ResetCounter() {
    m_counter=0;
}
