# Vapor와 Postgre를 활용해 DB를 만들어보자

#### NEW Project

```bash
vapor new [project-name] -n // 프로젝트 생성
```

First, open the project in Xcode then Play project.  run target— "My Mac".

Open your web browser, and visit [http://127.0.0.1:8080](http://127.0.0.1:8080/)  You should see the following page.

`Hello, world!`



// FileMiddleware???



##### PostgreSQL 설치

```bash
 brew install postgresql  //설치
```

```bash
pg_ctl -D /usr/local/var/postgres start //실행
```

```bash
brew services start postgresql   //brew 환경에서 postgresql을 시작
```

```bash
 psql postgres //PostgreSql 접속
```

```swift
postgres=# CREATE DATABASE dddd TEMPLATE template0; //DATABASE 설치 
```

##### Database 설치

```bash
createdb [데이터_베이스_이름]
```

##### Project내에 의존성 추가

```swift
// Package.swift 내에 작성

.package(url: "https://github.com/vapor/fluent.git", from: "4.0.0-rc"),
.package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0")
// package.swift 파일에 의존성 추가

.product(name: "Fluent", package: "fluent"),
.product(name: "FluentPostgresDriver", package: "fluent-postgres-driver")
// package.swift 파일에 target 추가
```

```swift
// configure.swift 내에 작성

import Fluent
import FluentPostgresDriver

public func configure(_ app: Application) throws {
  app.databases.use(.postgres(hostname: "localhost", username: "daisy", password: "", database: "데이터_베이스_이름"), as: .psql)
  //만들어둔 데이터베이스 등록
  //username은 터미널에서 정확한 이름을 확인해서 넣어준다

  try routes(app)
}
```

#### 모델생성

##### 마이그레이션

Model타입을 정의했는데 이 Model이 Table화가 되어서 database에 적용 되는게 아니다

적용시키려면 마이그레이션을 해주어야 한다!

**방법1:** vapor 프로젝트가 저장된 위치로 가서 설정

![스크린샷 2022-07-18 오후 2.44.30.png](/var/folders/bh/lsgcmpkd3dg14y7gdlypkx600000gn/T/TemporaryItems/NSIRD_screencaptureui_9sPUoy/스크린샷%202022-07-18%20오후%202.44.30.png)

```bash
vapor run migrate
```

**방법2:** `build scheme` add `migrate` under **Arguments Passed On Launch**.

![스크린샷 2022-07-15 오전 10.52.04.png](/var/folders/bh/lsgcmpkd3dg14y7gdlypkx600000gn/T/TemporaryItems/NSIRD_screencaptureui_V7967l/스크린샷%202022-07-15%20오전%2010.52.04.png)

#### PostgreSql 기본 문법

`psql` command line interface

```bash
\c [DBNAME]   //choose database
```

Then, this shows all tables in the current schema:

```bash
\dt   //show tables
```

```bash
\l   //show databases
```

```bash
\q   //quit psql
```

##### Postico 활용해서 GUI환경으로 관리

![스크린샷 2022-07-15 오전 11.19.49.png](/var/folders/bh/lsgcmpkd3dg14y7gdlypkx600000gn/T/TemporaryItems/NSIRD_screencaptureui_js4er4/스크린샷%202022-07-15%20오전%2011.19.49.png)

```bash
// To undo a migration on your database, run migrate with the --revert flag.
vapor run migrate --revert
```

  



C : POST

R : GET

U : PUT, PATCH

D : DELETE





참고 https://docs.vapor.codes/
