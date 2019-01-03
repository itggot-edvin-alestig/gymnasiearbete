class LetterRack {

    constructor(letters) {
        this.width   = 100;
        this.height  = 100;
        this.letters = [];
        this.colour  = (33, 33, 33);
        this.xPos    = 70;
        this.yPos    = 40;
    }

    show() {

        for (let i = this.yPos; i <= this.height * 9; i+= this.height + 28.5) {
            fill(this.colour);
            strokeWeight(0);
            rect(this.xPos, i, this.width, this.height, 10);
            //letter();
        }
    }
    
    letter() {
        fill(255);
        text(letter, this.xPos, this.yPos);
    }
    
    manageLetters() {
        this.letters = gameObject.game.you.rack;
        console.log(this.letters);
    }
}
