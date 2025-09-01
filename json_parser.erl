-module(json_parser).
-export([parse_transform/2]).

parse_transform(AST, _Options) ->
    io:format("~p~n", [AST]),
    AST.
