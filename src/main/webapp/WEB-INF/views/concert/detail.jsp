<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
        />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
            rel="stylesheet"
        />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- <script
            type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a70e0dd474d89c900bdb45af4b197e32"
        ></script> -->
        <title>세부사항</title>
        <link rel="stylesheet" href="/css/detail.css" />
    </head>
    <body>
        <div class="container">
            <h2>${dto.date} | ${dto.location}</h2>
            <h1>${dto.name}</h1>
            <button
                type="button"
                class="custom-btn btn-10 mt-5"
                data-toggle="modal"
                data-target="#myModal"
            >
                Buy_Tickets
            </button>

            <div class="con row mt-5">
                <div class="conc mb-5">
                    <h1>Time / Location</h1>
                    <hr />
                    <p>
                        ${dto.date}, ${dto.time}
                        <br />
                        ${dto.location}
                    </p>
                </div>

                <div class="conc row">
                    <h1>Tickets</h1>
                    <hr />
                    <div class="conc col">
                        <p class="type">
                            Ticket type<br />
                            Regular Ticket
                        </p>
                    </div>
                    <div class="conc col">
                        <p>${dto.price}<br />+$0.75 service fee</p>
                    </div>
                    <hr />
                </div>

                <!-- <div id="map" style="width: 500px; height: 400px"></div> -->
                <img
                    class="col my_img mt-5"
                    width="1100px"
                    height="300px"
                    src="/images/concert/map.jpg"
                />
            </div>
            <div class="share mt-5">
                <h1>Share this event</h1>
                <hr />
                <i class="icon bi bi-instagram"></i>
                <i class="icon bi bi-threads"></i>
                <i class="icon bi bi-youtube"></i>
                <i class="icon bi bi-facebook"></i>
            </div>
        </div>

        <div class="modal" id="myModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">GO TO SHOP</h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <button class="hvr-hollow">INTERPARK</button>
                        <button class="hvr-hollow">TICKETBAY</button>
                        <button class="hvr-hollow">TICKETLINK</button>
                        <button class="hvr-hollow">YES24</button>
                    </div>
                    <!-- <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal"
                        >
                            Close
                        </button>
                        <button type="button" class="btn btn-primary">
                            Save changes
                        </button>
                    </div> -->
                </div>
            </div>
        </div>

        <script src="detail.js"></script>
    </body>
</html>
