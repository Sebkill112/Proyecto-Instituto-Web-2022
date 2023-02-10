let btn = document.querySelector("#btn");
let containerAdmin = document.querySelector(".paqueteAdmin");
let searchBtn = document.querySelector(".bx-search");

btn.onclick = function () {
    containerAdmin.classList.toggle("active");
}

searchBtn.onclick = function () {
    containerAdmin.classList.toggle("active");
}