## 협업을 위한 Git 활용하기 (branch)

git branch 

git branch -r 리모트에 대해서 알려줌 

git branch -a 로컬과 브랜치의 갯수와 리스트git 

git checkout[+브랜치명] 브랜치로 변경



git remote -v 별명 내역을 볼 수 있다 

### remote에 local 에서 만든 branch 추가하기

로컬에서 작업한 branch 를 stem 으로 remote 에서도 만들면서(별명과 함께) 업스트링한다.

▻ git push -u origin[별명] stem[브랜치명]

 Remote

###브랜치 지우기

▻ git branch -D stem[지우려는 브랜치]   *※대문자 조심*



### 로컬에서 지운 브랜치 다시 리모트에서 다운받기

리모트브랜치의 이름과 같은 브랜치 하나 로컬에서 만들기

▻ 브랜치로 checkout 하고 git pull [브랜치 별명] [브랜치명] ► 가져온다



### merge

반영할 곳으로 가서 거기서 머지~

▻ git merge [stem/마스터에 합칠 브랜치이름]



### 브랜치를 만드는 동시에 과거 땡기기

커밋 아이디를 이용하여 (시간이동) 과거로 돌아가기

ID Ex) b59b6e3bb623998f5854c1bdc2d555262e665276

▻ git checkout b59b6e3bb623998f5854c1bdc2d555262e665276 

↑ 위의 방식으로 하면 brnach 명이 ID로 되니까 아래방식을 권장

▻ git checkout -b <new-branch-name>

↑ "-b"를 활용하여 새로운 이름을 만들면서 과거 커밋시점으로 땡겨오기



###   미리 branch 만들고 과거 땡기기 

branch 를 먼저 만들고 그곳으로 체크아웃 

▻ git branch past b59b6e3bb623998f5854c1bdc2d555262e665276



#### *** Vim 이 두번뜨는데 (세번 뜰수도 있다.)

1번째 Vim 머지에 대한 설명

2번째 Vim 버전에 대한 설명

(3번째 Vim 머지에 대한 설명)

------------------------------------------------------------------------------------------------------------------------

➜  git-practice git:(master) git flow init

➜  git-practice git:(develop) git flow feature start hello

➜  git-practice git:(feature/hello) ✗ git status

➜  git-practice git:(feature/hello) ✗ git add .

➜  git-practice git:(feature/hello) ✗ git commit -m "feat: add Hello.py"

➜  git-practice git:(feature/hello) git push -u orign feature/hello

➜  git-practice git:(feature/hello) git flow feature finish hello

➜  git-practice git:(develop) git branch

➜  git-practice git:(develop) git flow release start v0.0.1.00190627 → 여기서 테스트와 배포과정을 거친다.

➜  git-practice git:(release/v0.0.1.00190627) git flow release finish → ***

➜  git-practice git:(develop) git push orign develop

➜  git-practice git:(develop) git checkout master

➜  git-practice git:(master) git push orign master

------

##### How to name your supporting branch prefixes?

Feature branches? [feature/]
Bugfix branches? [bugfix/]
Release branches? [release/]
Hotfix branches? [hotfix/]
Support branches? [support/]
Version tag prefix? []



![스크린샷 2019-06-27 오전 11 57 19](https://user-images.githubusercontent.com/47776915/60230989-c0666180-98d2-11e9-928f-f59eedf3eb8a.png)



##### Git 에는 동작하는 최소단위가 올라가야 한다.

※ Git flow 참고

https://danielkummer.github.io/git-flow-cheatsheet/index.ko_KR.html



## Fork

issues 커밋할때 원본repo에(포크받은 repo) 가서 issues를 쓴다. 그럼 이슈넘버가 자동생성

브랜치따고 내용수정 후 커밋메세지 쓸 때 첫줄은 commitTitle

두번째 줄에 Resolved: #issueNum 쓰면 issue가 닫힌다. 단, master까지 올라가야 닫힌다.



첫번째 줄 ⇢ fix: somrthingsomthig

두번째 줄 ⇢ Resolved: #2



------

### 강사님 강의 녹화 영상

https://asciinema.org/a/QmgWXWwf8VhBfS0pF7jxrCv8Y

https://asciinema.org/a/207171



git 쓰고 mv

git mv README.md [변경하는장소]git



#### Local branch 지우기

~~~swift
git push origin --delete [지울 브랜치 이름]

//remote에 접근할 때에는 push 로 접근하여야 한다.
~~~



## continuos pull

```
 $ git remote add upstream
https://github.com/final-project-team01/iOSHouseOfToday.git

 $ git pull upstream master
 
---
 $ git fetch upstream
 $ git merge upstream/master
```



Origin?

> $ git pull upstream develop → main remote에 변경 된 자료 내 local로 땡기기
>
> $ git push origin develop  → 나의 remote에 local에서 땡긴 자료 업데이트



기본적으로 커밋 메세지는
* Subject (제목)
* Body (본문)
* Footer (꼬리말) 로 구성한다.



### `Type` : `Subject`

##### `Type` 

* `feat` : 새로운 기능 추가
* `fix` : 버그 수정
* `docs` : 문서 수정
* `style` : 파일 그룹화, 세미콜론 누락, 코드 변경이 없는 경우
* `refactor` : 코드 리펙토링
* `test` : 테스트 코드, 리펙토링 테스트 코드 추가
* `chore` : 빌드 업무 수정, 패키지 매니저 수정



##### `Subject` 

제목은 50자를 넘기지 않고, 대문자로 작성하고 마침표를 붙이지 않는다.

과거시제를 사용하지 않고 명령어로 작성한다.

- "Fixed → "Fix"
- "Added → Add "