let url = 'js/quotes.json';
let quote;
let  author;
let randomInt;

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}

fetch(url)
    .then(res => res.json())
    .then((out) => {
        randomInt = getRandomInt(0, out.length);
        quote = out[randomInt]["quote"];
        author = out[randomInt]["author"];
        let paragraph = document.getElementById("quote");
        let quoteText = document.createTextNode(quote);
        let authorText = document.createTextNode("— " + author);

        paragraph.appendChild(quoteText);
        paragraph.appendChild(document.createElement("br"));
        paragraph.appendChild(document.createElement("br"));
        paragraph.appendChild(authorText);

    })
    .catch(err => { throw err });


