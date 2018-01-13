class MyString {

    constructor(string) {
        string == null ? this.str = "Hello, World!" : this.str = string;      
        this.letters = {};
    }
    
    frequency() {
        this.letters = {};
        let string = this.str.toLowerCase().replace(/\W/g, '');            
        for (let i = 0; i < string.length; i++) {
            let x = string[i];
            this.letters[x] = (this.letters[x] || 0) + 1;
        }
    }
    
    histogram() {
        this.frequency();
        let start = "a", end = "z";
        for (let i = start.charCodeAt(0); i <= end.charCodeAt(0); i++) {
            let output = String.fromCharCode(i) + ": ";
            let x = String.fromCharCode(i);
            for (let j = 0; j < this.letters[x]; j++) {
                output += "*";
            }
            console.log(output);
        }
    }
}