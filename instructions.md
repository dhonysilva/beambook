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

### 3.5 Milboxes and Message Passing

Process communication is done throught message passing. A process send is implemented so that a sending process copies the message from its own heap to the mailbox of the receiving process.

### 3.6 Lock Free Message Passing

### 3.7 The Process Dictionay

```erlang
1> Ps = erlang:processes()
2> P = self().
3> erlang:process_info(P).
4> lists:keysort(2, [{P, element(2, erlang:process_info(P, total_heap_size))} || P <- Ps]).
```

## The Erlang Type System and Tags

### 4.3 Lists

Since each cons cell is identified by the tag in the pointer to the cell, there is no need for a separate header word, and a cons cell `[A|B]` thus uses 33% less memorey than a boxed 2-tuple `{A, B}`. This is also reflcted by a corresponding speed improvement, since only two heap words need to be initialized rather than three. Therefore, lists are the preferred temporary data structure for sequences of times.

## Boxed Terms

Subtags:

```
0000 00 ARITYVAL (Tuples)
0001 00 BINARY_AGGREGATE                  |
001s 00 BIGNUM with sigh bit              |
0100 00 REF                               |
0101 00 FUN                               | THINGS
0110 00 FLONUM                            |
0111 00 EXPORT                            |
1000 00 REFC_BINARY     |                 |
1001 00 HEAP_BINARY     | BINARIES        |
1010 00 SUB_BINARY      |                 |
1011 00   [UNUSED]
1100 00 EXTERNAL_PID    |                 |
1101 00 EXTERNAL_PORT   | EXTERNAL THINGS |
1110 00 EXTERNAL_REF    |                 |
1111 00 MAP
```

### 4.5.1 Tuples

I'll come back to this subject later as it very important to understand it. Focus on larn how to draw the memory allocation.

## 5 The Erlang Virtual Machine: BEAM

## 6 Modules and The BEAM File Format

Erlang's distribution model and hot code loading feature make it possible to update code across multiple nodes in a distributed system. It's a complex task that requires careful coordination.

```erlang
1> c(beamfile1). # generate the beamfile.beam
2> beamfile1:read("beamfile1.beam").
```

## 7 Generic BEAM Instructions

specific
generic

### 7.3


## 8 Different Types of Calls, Linking and Hot Code Loading

A common way of wrigin server loops is to have a local call for the main loop and a code upgrade handler which dos a remote call possibily a stage upgrade:

```erlang
loop(Stage) ->
    receive
        upgrade ->
            NewState = ?MODULE:code_upgrade(State),
            ?MODULE:loop(NewState);
        Msg ->
            NewState = handle_msg(Msg, State),
            loop(NewState)
    end.
```

This is basically what `gen_server` does.

### 8.5 Closure calls

Closures in Erlang are functions to be passed as values, capturing variables from their defining scope.

Closures enable dynamic execution and are commonly used in higher-order functions.

### Higher-order functions

Higher-order functions allow passing behavior dinamically.


## 11 The Memory Subsystem: Stacks, Heaps and Allocators

The atom table

Atoms in Erlang are unique identifiers represented as integers internally. All atoms are stored in a global structure known as the atom table. The atom table is a fixed -size structure, meaning there's an upper limit to how many atoms can exist in a running Erlang system.

* `atom_text`: contains the string representation of the atoms
* `atom_tab`: stores the atom table itself
* `atom_entry`: allocates memory for each atom's metadata
