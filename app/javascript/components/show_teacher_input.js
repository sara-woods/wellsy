
const showTeacherInput = () => {
  
  const trainer = document.querySelector("#user_trainer");

  if (trainer) {
    trainer.addEventListener("change", (event) => {
      const inputs = document.querySelector(".extra-inputs");
      inputs.classList.toggle("d-none");
    });
  }
}


export { showTeacherInput }