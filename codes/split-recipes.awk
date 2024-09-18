BEGIN {
    RS="\r?\n\r?\n(\r?\n)+" #줄바꿈 세 개 이상
    FS="\r?\n\r?\n" # 줄바꿈 두 개
}
# 레코드가 "[번호]" 꼴로 시작하는 경우
/^\[[0-9]+\]/{
    # 제목 ($1)에서 라틴어 지우기
    split($1, name, "\r?\n +")

    # 본문($2)에서 줄바꿈 문자를 공백으로 바꾸기
    gsub("\r?\n", " ", $2)

    OUTPUTFILENAME = "data/apicius/recipes/" name[1] ".txt" # [번호] 영어 이름
    print $2 > OUTPUTFILENAME # 줄바꿈이 제거된 본문 
}