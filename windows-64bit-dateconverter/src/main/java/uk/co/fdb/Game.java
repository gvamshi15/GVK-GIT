package uk.co.fdb;


public class Game {
    private MinesBoard board;
    boolean finish = false;
    boolean win = false;
    int turn=0;
    
    public Game(){
        board = new MinesBoard();
        Play(board);
    }
    
    public void Play(MinesBoard board){
        do{
            turn++;
            System.out.println("Turn "+turn);
            board.show();
            finish = board.setPosition();
            
            if(!finish){
                board.openNeighbors();
                finish = board.win();
            }
            
        }while(!finish);
        
        if(board.win()){
            System.out.println("Congratulations, you let the 10 fields with the mines in "+turn+" turns");
            board.showMines();
        } else {
            System.out.println("Mine! You lost!");
            board.showMines();
        }
    }
}
