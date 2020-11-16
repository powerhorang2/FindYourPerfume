# FindYourPerfume

[담당자]

- 석유빈 : 데이터베이스, 상품정보 페이지
- 주경덕 : 마이페이지, 관리자페이지, CSS
- 김재섭 : 로그인 및 회원가입, 메인페이지

[예정작업]
(각 담당자들은 예정 작업이 누락되지 않게 기록해주세요.)

- 주경덕
1. 권한부여 select -> search

- 김재섭
1. 메인페이지에서 찜 추가/삭제 구현
2. 회원가입_선호노트리스트 배열로
3. 더보기 오류 

- 석유빈


# FindYourPerfume
------------------
나만의 향수를 찾을 수 있는 향수 리뷰 사이트

## 목차
1. <a href="#1">개요</a><br>
2. <a href="#2">주요기능</a><br>
3. <a href="#3">사용기술</a><br>
4. <a href="#4">개발진</a><br>

### <h2 id="1">1. 개요</h2>
* 자신이 좋아하는 노트에 관련된 향수를 추천받고 그 향수들의 리뷰를 확인할 수 있는 웹 서비스.
  - 브랜드의 향수를 검색하는 기능을 이용할 수 있다.
  - 자신이 좋아하는 노트(베이스 향)와 관련된 향수를 추천 받을 수 있고, 인기있는 향수도 추천받을 수 있다.
  - 자신이 좋아요를 누른 향수들의 리스트를 확인할 수 있다.
  - 향수들의 리뷰들을 확인 할 수 있다.
  
### <h2 id="2">2. 주요기능</h2>
- 메인 페이지<br>
 <img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A9%94%EC%9D%B8%20%EC%A0%84%EC%B2%B4.png?raw=true" width="200px" height="200px"></img>

 - 기능 1<br>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EC%A1%B0%ED%9A%8C1.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EC%A1%B0%ED%9A%8C2.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EC%A1%B0%ED%9A%8C3.jpg?raw=true" width="200px" height="200px"></img>

 - 기능 2<br>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%ED%8F%89%EA%B0%801.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%ED%8F%89%EA%B0%802.jpg?raw=true" width="200px" height="200px"></img>

 - 기능 3<br>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EB%94%94%ED%85%8C%EC%9D%BC1.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EB%94%94%ED%85%8C%EC%9D%BC2.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EB%94%94%ED%85%8C%EC%9D%BC3.jpg?raw=true" width="200px" height="200px"></img>

 - 기능 4<br>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%801.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/Team_Project/blob/master/All%EC%9B%B9%ED%88%B0%20%EA%B8%B0%EB%8A%A5/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%802.jpg?raw=true" width="200px" height="200px"></img>

### <h2 id="3">3. 사용기술</h2>
 - IDE<br>
 <img src="https://user-images.githubusercontent.com/39155839/96409876-f5fa3100-1220-11eb-8424-4ae63207094c.jpg" width="250px" height="150px" title="이클립스" alt="eclipse"></img>
 - DB<br>
 <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbBLVn5%2FbtqCQ31hFxc%2FOWrBnpuGJiMMQg9JnJAz3K%2Fimg.png" width="250px" height="150px" title="MySQL" alt="MySQL"></img>
 - Server<br>
 <img src="https://user-images.githubusercontent.com/39155839/96410394-cd266b80-1221-11eb-8cc1-355ce5642ce6.png" width="250px" height="150px" title="아파치 톰켓" alt="Apache Tomcat"></img>
 - Language & Other<br>
 <img src="https://www.logicbig.com/tutorials/misc/jackson/images/jackson.png" widht="250px" height="180px" title="JSON" alt="Jackson & JSON"></img>
 <img src="https://user-images.githubusercontent.com/39155839/96410197-7a4cb400-1221-11eb-9801-d1731636a39c.png" widht="250px" height="150px" title="Gson" alt="Gson"></img>
 <img src="https://user-images.githubusercontent.com/39155839/96410198-7ae54a80-1221-11eb-91e7-b36fe8943a11.jpg" widht="250px" height="150px" title="JDK" alt="JDK"></img>
 <img src="https://user-images.githubusercontent.com/39155839/96420264-4036de80-1230-11eb-9555-3309ea641db7.png" widht="250px" height="150px" title="JSP" alt="JSP"></img>

### <h2 id="4">4. 개발진</h2>
<table>
  <tr>
    <td>주경덕(kyondoku@naver.com)</td>
    <td>석유빈(tjrdbqls3@naver.com)</td>
    <td>김재섭(dkfzm3221@naver.com)</td>
  </tr>
  <tr>
    <th><img src="" width="200px" height="150px" title="주경덕" alt="주경덕"></img></th>
    <th><img src="" width="200px" height="150px" title="석유빈" alt="석유빈"></img></th>
    <th><img src="" width="200px" height="200px" title="김재섭" alt="김재섭"></img></th>
  </tr>
