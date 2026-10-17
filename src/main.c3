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
module schecom;

import std::io;
import schecom::lexer;

fn int main(String[] args) {
    String testSource = "(f a b c)";
    LexTokenList testTokens = testSource.parse_scheme();
    defer testTokens.free();

    foreach (token : testTokens) {
        io::printn(token);
    }
    return 0;
}
