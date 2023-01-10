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
