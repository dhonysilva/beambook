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
