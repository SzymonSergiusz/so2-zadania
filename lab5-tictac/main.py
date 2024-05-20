from studentA import new_board, is_game_over, print_board
from studentB import is_player_starting, get_user_move, ai_move, announce_outcome

board = new_board()
players_move = is_player_starting()
while not is_game_over(board):
    print_board(board)
    board = players_move and get_user_move(board) or ai_move(board)
    players_move = not players_move
announce_outcome(board, players_move)
