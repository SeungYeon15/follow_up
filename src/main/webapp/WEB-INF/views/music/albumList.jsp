<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Music</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="/css/musicStyles.css">
<style>
  body{
    background-image: url(/images/5005082-dua-lipa-music-celebrities-girls-hd-4k-5k.jpg);
    
    height: 100vh;
    width: 100vw;
    background-repeat : no-repeat;
   
    background-size : cover;
    background-attachment: fixed;
  }
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div id="app">
  <ul id="albums">
    <li class="full">
      <figure>
        <img src="/images/album/Club Future Nostalgia.webp" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>Club Future Nostalgia <span class="release-year">(2020)</span></h2>
        </figcaption>
      </figure>
    </li>
    <li class="mini">
      <figure>
        <img src="/images/album/future nostalgia.webp" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>Future Nostalgia <span class="release-year">(2020)</span></h2>
        </figcaption>
      </figure>
    </li>    
    <li class="single">
      <figure>
        <img src="/images/album/Deezer Sessions.jpg" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>Deezer Sessions <span class="release-year">(2019)</span></h2>
        </figcaption>
      </figure>
    </li>
    <li class="repackage">
      <figure>
        <img src="/images/album/Live Acoustic EP.jpg" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>Live Acoustic EP <span class="release-year">(2017)</span></h2>
        </figcaption>
      </figure>
    </li>
    <li class="full">
      <figure>
        <img src="/images/album/New Rules (Remixes).jpg" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>New Rules (Remixes) <span class="release-year">(2017)</span></h2>
        </figcaption>
      </figure>
    </li>
    <li class="mini">
      <figure>
        <img src="/images/album/dua lipa.jpg" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>Dua Lipa <span class="release-year">(2017)</span></h2>
        </figcaption>
      </figure>
    </li>
    <li class="single">
      <figure>
        <img src="/images/album/the only ep.webp" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>The Only EP <span class="release-year">(2017)</span></h2>
        </figcaption>
      </figure>
    </li>
    <li class="repackage">
      <figure>
        <img src="/images/album/Spotify Sessions.jpg" alt="Map of the Soul: Persona">
        <figcaption>
          <h2>Spotify Sessions.jpg <span class="release-year">(2016)</span></h2>
        </figcaption>
      </figure>
    </li>
    <!-- <album-item v-for="(album, index) in albums" v-bind:album="album" v-bind:key="index"></album-item> -->
  </ul>
 </div>
<!-- partial -->
  <!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17-beta.0/vue.js'></script><script  src="./script.js"></script> -->

</body>
</html>
