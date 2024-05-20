import random
from studentA import print_board

temp_board = [[]]


def announce_outcome(board, players_move):
    outcome = ''
    winner = who_won(board)
    if winner == 'O':
        outcome += 'Gre wygrał uzytkownik\n'
    elif winner == 'X':
        outcome += 'Gre wygrał komputer\n'
    elif winner == 'remis':
        outcome += 'Gra zakonczyla sie remisem\n'
    print(outcome)
    print('------')
    print_board(board)


def ai_move(board):
    size = 2
    while True:
        move = [random.randint(0, size), random.randint(0, size)]
        if board[move[0]][move[1]] == ' ':
            board[move[0]][move[1]] = 'X'
            return board


def get_user_move(board):
    valid_moves = [0, 1, 2]

    while True:
        x = int(input('Podaj y:\n'))
        y = int(input('Podaj x:\n'))

        if x in valid_moves and y in valid_moves:
            if board[x][y] == ' ':
                board[x][y] = 'O'
                return board
            else:
                print('Podane pole jest zajęte')
        else:

            print('Podaj poprawne koordynaty')


def who_won(board):
    # Sprawdź rzędy
    for row in board:
        if row.count(row[0]) == len(row) and row[0] != ' ':
            return row[0]

    # Sprawdź kolumny
    for col in range(len(board[0])):
        check_col = [row[col] for row in board]
        if check_col.count(check_col[0]) == len(check_col) and check_col[0] != ' ':
            return check_col[0]

    # Sprawdź przekątne
    if board[0][0] == board[1][1] == board[2][2] and board[0][0] != ' ':
        return board[0][0]
    if board[0][2] == board[1][1] == board[2][0] and board[0][2] != ' ':
        return board[0][2]

    # Sprawdź, czy wszystkie pola są zajęte
    if all(' ' not in row for row in board):
        return 'remis'

    # Jeśli żadne z powyższych warunków nie jest spełnione, gra nie jest jeszcze skończona
    return None


# def who_won(board):
#     plansza = 3
#     remis = True
#     winner = '' # X albo O
#     # table[i][j]
#     for i in range(0, plansza):
#         if board[i][0] == board[i][1] == board[i][0]:
#             winner = board[i][0]
#             return winner
#         for j in range(0, plansza):
#             if board[0][j] == board[1][j] == board[2][j]:
#                 winner = board[0][j]
#                 return winner
#             if board[i][j] == ' ':
#                 remis = False
#
#     if (board[0][0] == board[1][1] == board[2][2]) or (board[0][2] == board[1][1] == board[2][0]):
#         winner = board[1][1]
#         return winner
#
#     if remis:
#         return 'remis'

def is_player_starting():
    coin_sides = ['Orzel', 'Reszka']
    winning_side = random.choice(coin_sides)
    print(winning_side)
    while True:
        coin_side = input('Orzel czy reszka?')

        if coin_side in coin_sides:
            if winning_side == coin_side:
                print('\nGre rozpoczyna uzytkownik\n')
                return True
            else:
                print('\nGre rozpoczyna komputer\n')
                return False
        else:
            print('Podano niepoprawną stronę monety')
