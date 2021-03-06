<h1 align="center">
	<img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A1%9C%EA%B3%A0%EC%9D%B4%EB%AF%B8%EC%A7%80.PNG?raw=true" width="500">
</h1>

<h3 align="center" >
  '나만의 향수를 찾을 수 있는 향수 리뷰 사이트'
</h3><br>

<p align="center">
	<img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A9%94%EC%9D%B8%20%EC%A0%84%EC%B2%B4.png?raw=true" width="800">
</p><br>

## 목차
1. <a href="#1">개요</a><br>
2. <a href="#2">주요기능</a><br>
3. <a href="#3">사용기술</a><br>
4. <a href="#4">예정작업</a><br>
5. <a href="#5">개발진</a><br>

## <h2 id="1">1. 개요</h2>

- **브랜드별 향수 조회 기능 구현** 브랜드별로 향수를 조회할 수 있습니다.

- **유저 데이터베이스 기반 향수 추천** 자신이 좋아하는 노트(베이스 향)와 관련된 향수와 인기있는 향수를 추천 받을 수 있습니다.

- **유저별 선호향수 리스트 관리** 자신이 선호하는 향수를 리스트화 할 수 있고, 그 데이터를 바탕으로 인기 향수를 추천합니다.

- **향수별 리뷰 기능 구현** 향수에 대한 리뷰를 댓글로 작성할 수 있습니다.
  
## <h2 id="2">2. 주요기능</h2>

- **메인 페이지 _ DB기반 추천기능 및 더보기** <br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A9%94%EC%9D%B8%20%EC%B6%94%EC%B2%9C%20%ED%96%A5%EC%88%98.png?raw=true" width="800px"></img><br>
'LIKE'데이터를 기반으로 추천 향수 표시, 회원 DB를 기반으로 선호노트(향) 향수 추천 
</kbd></p><br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%8D%94%EB%B3%B4%EA%B8%B0%20%EA%B8%B0%EB%8A%A5-1.png?raw=true" width="800px"></img><br>
더보기 버튼 구현
</kbd></p><br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A9%94%EC%9D%B8%20%EB%A6%AC%EC%8A%A4%ED%8A%B8.png?raw=true" width="800px"></img><br>
마지막 데이터일 경우 버튼 삭제
</kbd>
</p><br>

- **상세 페이지 _ 댓글** <br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%94%94%ED%85%8C%EC%9D%BC%20%ED%8E%98%EC%9D%B4%EC%A7%80.png?raw=true" width="800px"></img><br>
향수 상세정보 표시
</kbd></p><br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%8C%93%EA%B8%80%20%ED%8E%98%EC%9D%B4%EC%A7%95.png?raw=true" width="800px"></img><br>
댓글 기능 및 리스트 페이징 기능 구현
</kbd>
</p><br>

- **마이 페이지 _ 정보수정 및 선호향수관리** <br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80%20%EC%A0%95%EB%B3%B4%20%EC%88%98%EC%A0%95%20%EB%B0%8F%20%EC%B0%9C%ED%95%9C%20%ED%96%A5%EC%88%98.png?raw=true" width="800px"></img><br>
정보 수정 및 선호하는 향수 리스트 
</kbd></p><br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%84%A0%ED%98%B8%20%EB%85%B8%ED%8A%B8%20%ED%99%95%EC%9D%B8%20%EB%B0%8F%20%EC%88%98%EC%A0%95.png?raw=true" width="800px"></img><br>
선호하는 노트(향) 추가 및 삭제
</kbd></p>

- **관리자 페이지 _ 권한 관리 및 향수 추가/삭제** <br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%96%B4%EB%93%9C%EB%AF%BC%20%EA%B6%8C%ED%95%9C%20%EB%B6%80%EC%97%AC.png?raw=true" width="800px"></img><br>
관리자 권한 부여 및 제거 
</kbd></p><br>
<p align="center">
<kbd align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%96%B4%EB%93%9C%EB%AF%BC%20%ED%96%A5%EC%88%98%20%EC%B6%94%EA%B0%80.png?raw=true" width="800px"></img><br>
향수 추가 및 삭제
</kbd></p><br>

### <h2 id="3">3. 사용기술</h2>
<p align="center">
<kbd><img src="https://user-images.githubusercontent.com/39155839/96409876-f5fa3100-1220-11eb-8424-4ae63207094c.jpg" height="100px" title="이클립스" alt="eclipse"></img></kbd>
<kbd><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbBLVn5%2FbtqCQ31hFxc%2FOWrBnpuGJiMMQg9JnJAz3K%2Fimg.png" height="100px" title="MySQL" alt="MySQL"></img></kbd>
<kbd><img src="https://user-images.githubusercontent.com/39155839/96410394-cd266b80-1221-11eb-8cc1-355ce5642ce6.png" height="100px" title="아파치 톰켓" alt="Apache Tomcat"></img></kbd>
<kbd><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20%EA%B8%B0%EC%88%A0%20%EC%82%AC%EC%A7%84/spring.png?raw=true" height="100px" title="spring" alt="spring"></img></kbd></p><br>
<p align="center">
<kbd><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20%EA%B8%B0%EC%88%A0%20%EC%82%AC%EC%A7%84/ajax.png?raw=true" height="100px" title="Ajax" alt="Ajax"></img></kbd>
<kbd><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20%EA%B8%B0%EC%88%A0%20%EC%82%AC%EC%A7%84/json.png?raw=true" height="100px" title="JSON" alt="Jackson & JSON"></img></kbd>
<kbd><img src="https://user-images.githubusercontent.com/39155839/96410198-7ae54a80-1221-11eb-91e7-b36fe8943a11.jpg" height="100px" title="JDK" alt="JDK"></img></kbd>
<kbd><img src="https://user-images.githubusercontent.com/39155839/96420264-4036de80-1230-11eb-9555-3309ea641db7.png" height="100px" title="JSP" alt="JSP"></img></kbd></p><br>

### <h2 id="4">4. 예정작업</h2>

- **향수 데이터베이스 추가** _타 사이트 추가 크롤링 작업 예정

- **관리자 권한 부여방식 변경** _select 방식에서 search 방식으로 변경 예정

- **메인페이지에서 LIKE 기능 구현** _toggle방식으로 기능 구현 예정

- **향수 검색 및 필터 기능 구현** _검색바 및 필터 기능 추가

<br>

### <h2 id="5">5. 개발진</h2>
<div align="center">
<table align="center">
  <tr>
    <th align="center"><strong>주경덕</strong></th>
    <th align="center"><strong>석유빈</strong></th>
    <th align="center"><strong>김재섭</strong></th>
  </tr>
  <tr>
    <td align="center">kyondoku@naver.com</td>
    <td align="center">tjrdbqls3@naver.com</td>
    <td align="center">dkfzm3221@naver.com</td>
  </tr>
  <tr>
    <td align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%ED%95%84%20%EC%9D%B4%EB%AF%B8%EC%A7%80/JooKyeongdeok.jpg?raw=true" width="250px" height="250px" title="주경덕" alt="주경덕"></img></td>
    <td align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%ED%95%84%20%EC%9D%B4%EB%AF%B8%EC%A7%80/SeokYoubin.jpg?raw=true" width="250px" height="250px" title="석유빈" alt="석유빈"></img></td>
    <td align="center"><img src="https://github.com/powerhorang2/FindYourPerfume_Doc/blob/main/%ED%94%84%EB%A1%9C%ED%95%84%20%EC%9D%B4%EB%AF%B8%EC%A7%80/KimJaeseop.jpg?raw=true" width="250px" height="250px" title="김재섭" alt="김재섭"></img></td>
  </tr>
  <tr>
    <td align="center">마이페이지, 관리자페이지, CSS</td>
    <td align="center">데이터베이스, 상품정보 페이지</td>
    <td align="center">메인페이지, 로그인 및 회원가입</td>
  </tr>
</table>
</div>

