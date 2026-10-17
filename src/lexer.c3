/**
* Entry point
* Copyright (C) 2026  Alexandr Putenikhin
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation version 3 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module schecom::lexer;

import std::collections::list;

constdef LexTokenType {
    NONE,
    EXPRESSION_START,
    EXPRESSION_END
}

alias TokenPosition = int[<2>];

struct LexToken {
    LexTokenType type;
    TokenPosition pos;
}

alias LexTokenList = List{LexToken};

fn LexTokenList String.parse_scheme(&self) {
    LexTokenList tokens;
    tokens.init(mem);

    TokenPosition currentPos = {1,1};

    foreach (ch : self) {
        LexToken token;
        switch (ch) {
            case '(':
            token.type = EXPRESSION_START;
            case ')':
            token.type = EXPRESSION_END;
            case '\n':
            currentPos.x = 0;
            currentPos.y++;
            default:
        }
        if (token.type != NONE) {
            token.pos = currentPos;
            tokens.push(token);
        }
        currentPos.x++;
    }

    return tokens;
}
