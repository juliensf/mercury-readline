%---------------------------------------------------------------------------%
% vim: ft=mercury ts=4 sw=4 et wm=0 tw=0
%---------------------------------------------------------------------------%
% Copyright (C) 2024 Julien Fischer.
% See the file COPYING for license details.
%
% Author: Julien Fischer <juliensf@gmail.com>
%
% This module provides basic Mercury interface to the GNU Readline Library.
%
%---------------------------------------------------------------------------%

:- module readline.
:- interface.

:- import_module io.

%---------------------------------------------------------------------------%

    % readline(Line, !IO):
    %
    % Read Line using readline. If Line is non-empty, it will be added
    % to the history.
    %
:- pred readline(string::out, io::di, io::uo) is det.

    % readline(Prompt, Line, !IO):
    %
    % As above, but display the provided Prompt.
    %
:- pred readline(string::in, string::out, io::di, io::uo) is det.

%---------------------------------------------------------------------------%
%---------------------------------------------------------------------------%

:- implementation.

:- import_module require.

%---------------------------------------------------------------------------%

:- pragma foreign_decl("C", "

#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>
#include \"mercury_string.h\"
").

%---------------------------------------------------------------------------%

readline(Line, !IO) :-
    readline("", Line, !IO).

:- pragma foreign_proc("C",
    readline(Prompt::in, Line::out, _IO0::di, _IO::uo),
    [will_not_call_mercury, promise_pure, tabled_for_io],
"
    char *raw_line = readline(Prompt);
    if (raw_line == NULL || raw_line[0] == '\\0') {
        Line = MR_make_string_const(\"\");
    } else {
        MR_make_aligned_string_copy(Line, raw_line);
        add_history(raw_line);
        MR_free(raw_line);
    }
").

readline(_, _, _, _) :-
    error("readline() is not supported on this backend").

%---------------------------------------------------------------------------%
:- end_module readline.
%---------------------------------------------------------------------------%
