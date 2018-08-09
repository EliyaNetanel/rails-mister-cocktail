const search = document.querySelector("#search");
const results = document.querySelector("#results");

search.addEventListener("keyup", (event) => {
  fetch(`https:wagon-dictionary.herokuapp.com/autocomplete/${search.value}`)
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = '';
      data.words.forEach((result) => {
        const item = `<li>${result}</li>`;
        results.insertAdjacentHTML("beforeend", item);
      });
    });
});
