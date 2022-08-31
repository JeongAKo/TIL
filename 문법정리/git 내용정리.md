## 협업을 위한 Git 활용하기

```
git config --list
```

#### Git 설정

```
Git은 커밋을 수행할 때 마다 Author라는 속성에 사용자의 이름과 이메일 주소를 포한시킨다.
$: git config --global user.name  // Daisy
$: git config --global user.email  // dev.daisiee@gmail.com 

--global옵션은 현재 설정하는 속성을 컴퓨터의 모든 프로젝트에도 적용하라는 의미다.
```

#### 새 프로젝트 시작하기

```
$: git init  // 새로운 Git데이터베이스를 생성
```

#### Git Clone

```
$: git clone
```

#### Git Add (staging)

- 주어진 파일의 스냅샷을 만들어 저장소에 저장함으로써 나중에 커밋할 때 참조할 수 있게 한다. (추적)

- 로컬 초안을 작성한다.

스테이징 영역은 다른사람과 공유되거나 동기화하지 않으며 오직 로컬 컴퓨터에만 존재한다.

```
$: git add . 
```

#### Git Commit

```
$: git commit --message ""
$: git commit -m ""
```

#### Git Status

```
$: git status 
```

## Branch

#### Branch Structure

```bash
master (베포용 브랜치)
develop (작업한 코드를 모으는 브랜치)
fear (issue별 브랜치)
```

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

#### Local branch 지우기

```swift
git push origin --delete [지울 브랜치 이름]

//remote에 접근할 때에는 push 로 접근하여야 한다.
```

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

### 미리 branch 만들고 과거 땡기기

branch 를 먼저 만들고 그곳으로 체크아웃 

▻ git branch past b59b6e3bb623998f5854c1bdc2d555262e665276

#### Git 에는 동작하는 최소단위가 올라가야 한다.

※ [GIt Flow](https://danielkummer.github.io/git-flow-cheatsheet/index.ko_KR.html)

## Fork

issues 커밋할때 원본repo에(포크받은 repo) 가서 issues를 쓴다. 그럼 이슈넘버가 자동생성

브랜치따고 내용수정 후 커밋메세지 쓸 때 첫줄은 commitTitle

두번째 줄에 Resolved: #issueNum 쓰면 issue가 닫힌다. 단, master까지 올라가야 닫힌다.

첫번째 줄 ⇢ fix: somrthingsomthig

두번째 줄 ⇢ Resolved: #2

git 쓰고 mv

git mv README.md [변경하는장소]git

## pull

```
 $ git remote add upstream
https://github.com/final-project-team01/iOSHouseOfToday.git

 $ git pull upstream master

---
 $ git fetch upstream
 $ git merge upstream/master
```

Origin

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
* `fix` : 버그픽스
* `docs` : 문서 수정(README수정)
* `style` : 스타일 추가, 수정
* `refactor` : 코드 리펙토링
* `test` : 테스트 코드, 리펙토링 테스트 코드 추가

##### `Subject`

제목은 50자를 넘기지 않고, 대문자로 작성하고 마침표를 붙이지 않는다.

과거시제를 사용하지 않고 명령어로 작성한다.

- "Fixed → "Fix"
- "Added → Add "

## git commit message

> ### Categories
> 
> feat - feature(기능)
> docs - documentations(문서)
> fix - bug fix(픽스)
> conf - set configurations(설정)

commit message 는 제목은 구나 절로 쓰고 내용은 문장단위로 코드에 대한 설명

git init 으로 하는방법

git push -u origin master 처음에만 해주면 된당

git remote 하는것

 git remote add orign https://github.com/JeongAKo/git-practice.git

Origin 은 별명

별명 바꿀라면 git remote rename 현재이름 바꿀이름

```
$ git checkout HEAD^ //부모단계(1단계)로 올라가기
$ git checkout HEAD~4 //돌아가고싶은 커밋갯수를 `~`뒤의 숫자로 명시
$ git branch -f master c1 //강제로 브랜치 옮기기
```

```
git branch -f master c6
git checkout HEAD~1
git brnach -f bugFix HEAD~1
```

#### git 지울때

rm -rf .git

#### git reset

#### git revert

#### git cherry-pick <Commit1> <Commit2> <...>

#### git tag

---

라이센스 MIT로 

MIT라이센스는 OPEN

Apache 라이센스는 소유권 주장 가능

GNU General Public License 잘못 하면 오염된다???

---

#### git ignore

vi gitignore 안에 들어가서 무시할 파일 쓰기

`keyWord` - swift, Xcode, cocoaPods

## rebase

- 브랜치 합치기

    merge를 하면 커밋은 시간순으로 합쳐진다. rebase를 이용하면 브랜치의 커밋순사대로 히스토리를 볼 수 있다

- 특정 커밋만 삭제 가능

```swift
git rebase -i HEAD~3 // HEAD 기준으로 최근 3개의 내역을 볼 수 있다
```

<img width="842" alt="스크린샷 2022-08-22 오후 4 21 14" src="https://user-images.githubusercontent.com/47776915/185862808-8d5a33bc-fdcb-440f-96cf-f0f36527a04f.png">

앞에 `pick`을 `drop`으로 변경하면 해당 커밋만 삭제 된다.

##### 이미 공개 저장소에 Push 한 커밋을 Rebase 하지 마라 [참고](https://git-scm.com/book/ko/v2/Git-브랜치-Rebase-하기)

# Tags

##### 태그 붙이기

```
$ git tag [Tag Name]
```

##### 태그 삭제하기 `-d`

```
$ git tag -d v1.0.0
```

##### 나중에 태그 붙이기

특정 커밋에 태그하기 위해서 명령의 끝에 커밋 체크섬을 명시한다

```
$ git tag -a v1.2 9fceb02
```

# stash

```swift
$ git stash save  // 현재 작업을 일시적으로 저장
$ git stash list  // 일시적으로 저장해 둔 작업 목록
$ git stash clear  // 일시적으로 저장해 둔 작업을 모두 삭제
```

## squash

커밋의 내용을 합쳐서 하나의 커밋으로 만들 수 있다

## revert

sgit log에 이력이 남음

기존 버전들이 삭제 되지 않고 새로운 버전이 생성

```bash
git revert HEAD
```

git revert <commitID>는 해당 commitID 시점 이전의 상태로 파일을 되돌리는 명령어이기 때문에 그 이후에 수정사항들이 모두 사라져 버린다

## reset

git log에 이력이 남지 않음

HEAD의 포인터를 특정 버전으로 변경

```bash
git revert --hard [commitID]
```

## cherry pick

변경된 해당 커밋만 가져올 수 있다

[누구나 쉽게 이해할 수 있는 Git 관리](https://backlog.com/git-tutorial/kr/stepup/stepup1_1.html)
