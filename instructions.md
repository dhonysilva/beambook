```erlang
c(foo).
```


```erlang
compile:file(foo).
```

```erlang
compile:file(foo, [binary]).
```

```erlang
c(foo, [to_core]).
```


```erlang
c(foo, ['P']).
```

Shows us what the Erlang source code looks like.


```erlang
compile:file(foo, [to_core, binary]).
```

```erlang
1> {ok, foo, Core} = compile:file(foo, [to_core, binary]).
2> io:put_chars(core_pp:format(Core)).
```


```erlang
1> {ok, foo, Core} = compile:file(foo, [to_core, binary]).
2> {ok, foo, Bin} = compile:forms(Core, [from_core, binary]).
```

```erland
1> c(world, ['S']).
2> {ok, BEAM_Code} = file:consult("world.S").
```

When tuning Erlang code, it's good to know what optimizations are applied when, and how you can look at generated code before and after optimizations.


## Processes

1st line - the process has been given a name.
2nd line - which function the process is currently executing or suspended (`current_function/0`) and the name of the function in which the process started executing.

```erlang
Ps = erlang:processes().
```

```erlang
lists:reverse(lists:keysort(2, [{P, element(2, erlang:process_info(P, total_heap_size))} || P <- erlang:processes()])).
```

```erlang
process_ingo(whereis(code_server), backtrace).
```

```erlang
1> {backtrace, Backtrace} = process_info(whereis(code_server), backtrace).
2> io:put_chars(Backtrace)
```

```erlang
erlang:process_display(self(), backtrace).
```
