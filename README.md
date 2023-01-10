<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"  />
</head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viemport" content="width=device-width, initial-scale=1.0" />
    <title>Calculadora</title>
   
    <script src="steles.css" defer></script>
    <script src="app3.js" defer></script>
    

</head>
<body>
    
    <div id="calc">
        <h3>Calculadora</h3>
        <div id="operations">
        <div id="previous-operation">123 +</div>
        <div id="current-operation">412</div>
        
    </div>
    
    <div id="buttons-container" >
        <button>CE</button>
        <button>C</button>
        <button>DEL</button>
        <button>/</button>
        <button class="number">7</button>
        <button class="number">8</button>
        <button class="number">9</button>
        <button>*</button>
        <button class="number">4</button>
        <button class="number">5</button>
        <button class="number">6</button>
        <button>-</button>
        <button class="number">1</button>
        <button class="number">2</button>
        <button class="number">3</button>
        <button>+</button>
        <button class="number">0</button>
        <button class="number">.</button>
        <button class="number">=</button>
        <button id="equal-btn">=</button>

    </div>
    </div>

</body>
</html>

// Parte lógica em JavaScript

// CSS
import "./app.css";

// React
import {useCallback, useEffect, useState } from "react";

// Data
import{wordsList} from "./data/words";

// components
import Startcreen from "c:/Users/Pichau/Downloads/6_SECRET_WORD/StartScreen";

const stages = [
    {id: 1, name: "start"},
    {id: 2, name: "game"},
    {id: 3, name: "end"},
];

const guessesQty = 3

function App () {
    const [gameStage, setGameStage] = useState(stages[0].name);
    const [words] = usestate(wordsList);

    const [pickedWord, setPickedWord] = useState("");
    const [pickedCategory, setPickedcategory] = useState("");
    const [letters, setLetters] = euseState([]);

    const [guessedLetters, setGuessedLetters] = useState([]);
    const [wrongLetters, setWrongLetters] = useState([]);
    const [guesses, setGuesses] = useState(guessesQty);
    const [score, setscore] = useState(0);
    
    
    const pickWordAndCategory = () => {
        // pick a random category
        const categories = obejct.keys(words)
        const category = 
        categories[Math.floor(Math.random() *  Object.keys(categories).length)];

        console.log(category);
        // pick a random word
        const word = 
        words[category][Math.floor(Math.random() *  Object.keys(categories).length)];

        console.log(word);

        return [word, category];
    };

    // starts the secret word game
    const startGame = (() => {
        // clear all letters
        clearLettersStates();

        // pick word and pick category
        const {word, category } = pickWordandCategory();

        // create an array of letters
        let wordletters = word.split("");

        wordlatters = wordletters.map((l) => l.toLowercase());

        console.log(word, category);
        console.log(wordletters);

        // fill states
        setPickedWord(word);
        setPickedcategory(category);
        setLetters(Wordletters);
        
        setGameStage(stages[1].name);


    });

    // process the letter input
    const verifyletter = (letter) => {
     
        const normalizedLetter = letter.toLowerCase()

        // check if letter has already been utilized
        if(guessedLetters.includes(normalizedletter) 
        || wrongLetters.includes(normalizedLetter)
        ) {
            return;
    }
    
    // psh guesses letter or remove a guess
    if(letters.includes(normalizedLetter)) {
        setGuessedLetters((actualGuessedLetters) => [
            ...actualGuessedLetters,
            normalizedLetter
    ]);
} else {
    setWrongLetters((actualWrongLetters) => [
        ...actualWrongLetters,
        normalizedLetter,
    ]);

    setGuesses((actualGuesses) => actualGuesses -1);

}

    };

    // check if guesses ended
    useEffect(() => {

        if(guesses <= 0) {
            //reset all states 
            clearLettersStates();
            setGameStage(stages[2].name);   
      }

    }, [guesses]);

    // check win condition
    useEffect(() => {

       const uniquLetters = [... new Set(letters)];

       // win condition
       if(guessedLetters.length === uniqueLetters.length) {
        // add score
        seyScore((actualScore) => (actualScore += 100));

        // restart game with new word
        startGame();
       }

       console.log(uniqueLetters);
    }, [guessedLetters]);





    // restarts the game 
  const retry = () => {
    setScore(0);
    setGuesses(guessesQty);

    setGameStage(stage[0].name);
  };
       

  
    return (
        <div classname="App">
          {gamestage === "start" && <Startscreen />}
          {gamestage === "game"&& (
          <Game verifyLetter={verifyLetter}
           pickedWord={pickedWord}
           pickedCategory={pickedCategory} letters={letters}
           guessedLetters={guessedLetters}
           guesses={guesses}
           score={score}
        />
          )}

          {gamestage === "end" && <Gameover retry={retry} score={score} />}
        </div>
    

    );}
          


export default App;

// CSS

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family:  Helvetica;
}

body {

    background-color: #333;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 3em;

}

#calc {

    width: 400px;
    padding: .5em;
    background-color: #c4c4c4;
    color: #000;
    display: flex;
    flex-direction: column;

}

#calc h3 {

    font-size: .8em;
    font-weight: 300;
    color: #666;

}

#operations {
    text-align: right;
}

#previous-operation,
#current-operation {
    min-height: 1.6;
    padding: 0.2em;
    overflow-wrap: break-word;
}


#previous-operation {

    color: #777;
}

#current-operation {
    font-size: 3em;
    font-weight: 700;
}

#buttons-container button {

    border: 1px solid transparent;
    border-radius: 0;
    height: 4em;
    font-size: 1.2em;
    background-color: #dbdbdb;
    cursor: pointer;
}

#buttons-container .number {
    background-color: #bababa;
    border-color: #999;

}

#buttons-container #equal-btn {
    grid-column: sapn 2;
    background-color: #75a5cb;

}

#buttons-container #equal-btn {
  background-color: #3a91d8;
}


