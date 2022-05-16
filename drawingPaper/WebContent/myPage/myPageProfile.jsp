<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="myProfilePageWrapper">
    <div class="profileInfoContainer">

        <div class="profileSettingForm">
            <div class="profileLabelButtonSet">
                <label class="profileLabel">프로필 사진</label>
                <div>
                    <button id="profileToggleBtn1" class="profileToggleBtn" onclick="toggleChange(1)" value="n">변경</button>
                </div>
            </div>
            <div id="profileContentImageContainer">
                <div id="profileContentImage" class="profileSmallImageWrapper">
                    <div class="myPageProfileImageWrapper">
                        <div class="myPageProfileImageBox">
                            <div class="myPageProfileImage">박</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="profileSettingForm">
            <div class="profileLabelButtonSet">
                <label class="profileLabel">이름</label>
                <div>
                    <button id="profileToggleBtn2" class="profileToggleBtn" onclick="toggleChange(2)" value="n">변경</button>
                </div>
            </div>
            <div class="profileContent" id="profileContentName">이름입니다</div>
        </div>

        <div class="profileSettingForm">
            <div class="profileLabelButtonSet">
                <label class="profileLabel">사용자 url</label>
                <div>
                    <button id="profileToggleBtn3" class="profileToggleBtn" onclick="toggleChange(3)" value="n">변경</button>
                </div>
            </div>
            <div class="profileContent" id="profileContentUrl">http://www.tumblbug.com/u/<strong>satjtammvyhtxpqs</strong></div>
        </div>

        <div class="profileSettingForm">
            <div class="profileLabelButtonSet">
                <label class="profileLabel">소개</label>
                <div>
                    <button id="profileToggleBtn4" class="profileToggleBtn" onclick="toggleChange(4)" value="n">변경</button>
                </div>
            </div>
            <div class="profileContent" id="profileContentIntro">등록된 소개가 없습니다.</div>
        </div>

        <div class="profileSettingForm">
            <div class="profileLabelButtonSet">
                <label class="profileLabel">웹사이트</label>
                <div>
                    <button id="profileToggleBtn5" class="profileToggleBtn" onclick="toggleChange(5)" value="n">변경</button>
                </div>
            </div>
            <div class="profileContent" id="profileContentWebPage">등록된 웹페이지가 없습니다.</div>
        </div>

        <div>
            <div class="profileLabelButtonSet">
                <label class="profileLabel">프로젝트 공개</label>
                <div>
                    <button id="profileToggleBtn6" class="profileToggleBtn" onclick="toggleChange(6)" value="n">변경</button>
                </div>
            </div>
            <div class="profileContent" id="profileContentProjectOpen">
                <input type="checkbox" class="profileProjectOpenButton" id="profileProjectOpenButton" checked disabled><label class="openCheckButtonLabel">등록한 프로젝트를 공개합니다.</label>
            </div>
        </div>
    </div>

    <div class="profileExplanation">
        <label class="profileLabel">어떤 정보가 프로필에 공개되나요?</label>
        <div class="profileExplanationContent">
            프로필 사진과, 이름, 사용자 이름, 소개글, 웹사이트 및 회원님과 관련된 프로젝트 등이 프로필 페이지에 공개 됩니다. 프라이버시 설정을 활성화하시면 후원한 프로젝트 목록을 숨길 수 있습니다.
            <span>
                <a href="#">내 프로필 바로가기</a>
            </span>
        </div>
    </div>
</div>