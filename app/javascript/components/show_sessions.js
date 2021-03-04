const showSessions = () => {
  const buttons = document.querySelectorAll(".sessions-button");


  if (buttons) {
    buttons.forEach((button) => {
      button.addEventListener("click", (event) => {
        const id = event.currentTarget.dataset.activityId;
        const dropdown = document.querySelector(`#${id}`);
        dropdown.classList.toggle("d-none");
      });
    });
  }
}

export { showSessions }