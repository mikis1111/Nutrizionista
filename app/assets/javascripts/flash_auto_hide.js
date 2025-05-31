document.addEventListener("DOMContentLoaded", function () {
    setTimeout(function () {
      const flashMessages = document.querySelectorAll(".flash-message");
      flashMessages.forEach(el => el.style.display = "none");
    }, 3000);
  });
  