# Linguistics and Data Science HW03 (deadline: 2024-09-19 13:00)
BEGIN{
    RS="\r?\n\r?\n(\r?\n)+" # record separator: 줄바꿈 문자 3개 이상
    FS="\r?\n\r?\n" # field separator: 줄바꿈 문자 2개
}
# 레코드가 "[번호]" 꼴로 시작하는 경우
/^\[[0-9]+\]/{
    # Q1. $1(이름 필드)에서 라틴어 이름 제거하기
    # WRITE SOME CODE HERE
    split($1, name, "\r?\n +")
    title = name[1]
    
    # Q2. $2(본문 필드)에서 줄바꿈 문자를 공백(띄어쓰기)으로 바꾸기
    # WRITE SOME CODE HERE
    gsub(/\r?\n/, " ", $2)

    # Q3. $0(모든 필드)에서 각주 번호 없애기
    # WRITE SOME CODE HERE

    # 제목에서 맨 앞에 있는 요리 번호를 제외한 각주 번호 없애기
    if (match(title, /^\[([0-9]+)\]/, number)) {
        title_number = number[0] # 요리 번호
        gsub(/\s*\[[0-9]+\]/, "", title) # 제목에서 모든 "[번호]" 꼴을 제거
        title = title_number " " title # 요리 번호와 "[번호]"가 제거된 요리 이름을 조합
    }

    #본문에서 각주 번호 제거
    gsub(/\s*\[[0-9]+\]/, "", $2)
    
    # Q4. 본문을 "data/apicius/recipes-new/[번호] 영어 이름.txt" 파일로 쓰기
    # WRITE SOME CODE HERE
    OUTPUTFILENAME = "data/apicius/recipes-new/" title ".txt" # [번호] 영어 이름
    print $2 > OUTPUTFILENAME 
}