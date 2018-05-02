<template>
  <div class="about">
    <div class="padding">
        <div id="carouselExampleControls" class="carousel slide" data-interval="10000" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <h1>Hallo, wir sind JOBme!</h1>
            <h4>Lukas Kern, Stefan Elsenhuber,
              Lukas Gruber, Wolfgang Robert Hausch,
              Maria Anna Sewald, Emad Abaskhairoun FAWZI,
              Anna Braunegger, Richard Mahlmann und Anneli Eddy.</h4>
            <img class="d-block w-100" src="https://jobme.herokuapp.com/system/uploads/jobme/jobmeTEAM.jpeg" alt="First slide">
          </div>

          <div class="carousel-item">
            <h1>Unsere Vision</h1>
            <h3 class="container">
              JOBme hilft jungen Menschen, ihren Traum-Lehrberuf anhand ihrer persönlichen Interessen zu finden.
            </h3>
          </div>
          <div class="carousel-item">
            <h1>Ressourcen</h1>
            <h3 class="container">
              <a href="http://www.freepik.com/">
              Icons designed by Freepik.
              </a><br>
              <a href="https://giphy.com/">
              Animated pictures by Giphy.
              </a><br>
              <a href="https://www.bic.at/">
              Jobs & Descriptions by Wirtschaftskammer Österreich.
              </a>
            </h3>
          </div>

        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
  </div>
  </template>

<style lang="scss" scoped>
  h4 {
    margin-top: 0;
    margin-bottom: 2em;
  }
  a {
    color: $grey;
    &:hover {
      color: $blue;
    }
  }
</style>
