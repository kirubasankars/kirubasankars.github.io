---
title: Exploring Cellular Automata with the Game of Life in p5.js
date: 2023-10-26
---

Introduction:

Conway's Game of Life, a zero-player game devised by John Horton Conway in 1970, is a classic example of cellular automata. This game uses a two-dimensional grid of cells that evolve over time based on a set of simple rules. In this blog post, we'll delve into its mechanics and create a visual representation using the p5.js library.


Rules:
  1. Any live cell with fewer than two live neighbors dies, as if by underpopulation.
  2. Any live cell with two or three live neighbors lives on to the next generation.
  3. Any live cell with more than three live neighbors dies, as if by overpopulation.
  4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

Implementation in p5.js:

Now that we have a basic understanding of the Game of Life, let's discuss the provided p5.js implementation.

### 1. Setting Up the Canvas:
```javascript
function setup() {
  createCanvas(600, 600);
  frameRate(5);
  
  for (let i = 0; i < n * n; i++) {
     board[i] = floor(random(2));
     nextBoard[i] = 0;
  }
}
```
In the setup function, we create a 600x600 canvas and set the frame rate to 5 to slow down the animation. We also initialize the `board` array with random live and dead cells, and the `nextBoard` array with dead cells.

### 2. Drawing the Cells:
```javascript
function draw() {
  background(220);
  
  let bw = width / n, bh = height / n;
  
  for (let row = 0; row < n; row++) {
    for (let col = 0; col < n; col++) {
      let pos = (row * n) + col; 
      let x = col * bw;
      let y = row * bh;
      
      if (board[pos] == 1) {
        fill(51);
      } else {
        noFill();
      }
      noStroke();
      rect(x, y, bw, bh);
    }
  }
  
  // ...
}
```

In the draw function, we iterate through each cell in the `board` array and draw a filled square if the cell is alive, and an empty square if it is dead.

### 3. Applying the Rules:
```javascript
for (let row = 0; row < n; row++) {
  for (let col = 0; col < n; col++) {
    let pos = (row * n) + col;        
    let sum = 0;

    for (let i = -1; i <= 1; i++) {
      for (let j = -1; j <= 1; j++) {
        if (i === 0 && j === 0) continue;
        let neighborRow = (row + i + n) % n;
        let neighborCol = (col + j + n) % n;          
        sum += board[(neighborRow * n) + neighborCol];
      }
    }
    
    if ((board[pos] === 1 && (sum === 2 || sum === 3)) 
        || (board[pos] === 0 && sum === 3)) {
      nextBoard[pos] = 1;
    } else {
      nextBoard[pos] = 0;
    }
  }
}
```

In this section, we apply the rules of the Game of Life to each cell, determining its state in the next generation.

### 4. Swapping the Boards:
```javascript
[board, nextBoard] = [nextBoard, board];
```

After applying the rules, we swap the `board` and `nextBoard` arrays to prepare for the next iteration.

### 5. Monitoring the Sum of Live Cells:
```javascript
let sum = 0;
for (let i = 0; i < n * n; i++) {
   sum += board[i]      
}
```


We calculate the sum of live cells in the current generation. This can be used to monitor the activity in the game, detect stable states, or implement further features.

Conclusion:

The Game of Life is a fascinating example of emergent complexity, demonstrating how complex patterns and behaviors can arise from simple rules. The implementation in p5.js provides a visual and interactive way to explore this complexity, allowing users to see the evolution of the game over time and gain a deeper understanding of cellular automata.