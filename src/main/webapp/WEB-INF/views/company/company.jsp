<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warner Music Group Homepage</title>
    <link rel="stylesheet" href="/css/company.css">
</head>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var scrollArrow = document.querySelector('.scroll-arrow');

        scrollArrow.addEventListener('click', function (e) {
            e.preventDefault();
            var nextSection = document.querySelector(this.getAttribute('href'));
            nextSection.scrollIntoView({ behavior: 'smooth' });
        });
    });
</script>

<body>
    <header>
        <nav>
            <ul>
                <li><a href="#home">Logo</a></li>
            </ul>
        </nav>
    </header>

    <div class="wmg-section">
        <img src="../images/warner-music.jpg" alt="Concert crowd">
        <div class="wmg-content">
            <h2>WARNER MUSIC GROUP</h2>
            <h3>A GLOBAL COLLECTIVE OF MUSIC MAKERS AND MUSIC LOVERS</h3>
        </div>
        <a href="#next-section" class="scroll-arrow">↓</a>
    </div>

    <div id="next-section" class="info-section">
        <img src="../images/warner-music-banner.jpg" alt="Concert crowd">
        <div class="info-content">
            <h2>About WMG</h2>
            <p>WMG foster a culture of innovation and inclusion for our people, artists, and songwriters across the
                globe.<br>
                Striving to become a more ethical, equitable, and environmentally sustainable company is imperative, and
                important to our longterm creative and commercial success.
            </p>

        </div>
        <!-- <p>200년이 넘는 역사를 자랑하는 Warner Music Group은 오늘날 전 세계적으로 문화를 움직이는 독보적인 창의적인 아티스트, 작곡가 및 회사의 본거지입니다. Warner Music
            Group의 녹음 음악 사업부의 핵심에는 역사상 가장 상징적인 4개 회사인 Atlantic, Elektra, Parlophone 및 Warner Records가 있습니다. Asylum, Big
            Beat, Canvasback, East West, Erato, FFRR, Fueled by Ramen, Nonesuch, Reprise, Rhino, Roadrunner, Sire,
            Spinnin', Warner Classics 및 Warner Music Nashville과 같은 유명 레이블이 합류했습니다. 1811년 Chappell & Company의 창립으로 거슬러
            올라가는 Warner Chappell Music은 Great American Songbook의 표준에서 표준에 이르기까지 모든 음악 장르에 걸쳐 140만 개 이상의 저작권 카탈로그를 보유한 세계
            최고의 음악 출판사 중 하나입니다.</p> -->
    </div>

    <div class="location-section">
        <h2>Location</h2>
        <p>
            1633 Broadway, New York, NY 10019 United States
        </p>
        <img src="../images/map.jpg" alt="">
    </div>
    <footer>
        <p>a</p>
    </footer>
</body>

</html>