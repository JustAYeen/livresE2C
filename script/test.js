let number1 = document.querySelector('#Number1');
let number2 = document.querySelector('#Number2');
let calculate = document.querySelector('#calculate');
let resultHtml = document.querySelector('#result');



function makeCalcul() {
    let nombre1 = parseInt(Number1.value);
    
    let nombre2 = parseInt(Number2.value);
    
    let resultat = nombre1 + nombre2;
    let messageAddition = `<p>Le résultat de l'addition de ${nombre1} et de ${nombre2} est ${resultat}</p>`;
    resultHtml.innerHTML = messageAddition;
            
    resultat = nombre1 - nombre2;
    let messageSoustraction = `<p>Le résultat de la soustraction de ${nombre1} et de ${nombre2} est ${resultat}</p>`;
    resultHtml.innerHTML += messageSoustraction;
            
    resultat = nombre1 * nombre2;
    let messageMultiplication = `<p>Le résultat de la multiplication de ${nombre1} et de ${nombre2} est ${resultat}</p>`;
    resultHtml.innerHTML += messageMultiplication;
            
    resultat = nombre1 / nombre2;
    let messageDivision = `<p>Le résultat de la division de ${nombre1} et de ${nombre2} est ${resultat}</p>`;
    resultHtml.innerHTML += messageDivision;
}

calculate.addEventListener("click", makeCalcul)