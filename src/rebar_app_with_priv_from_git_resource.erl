-module(rebar_app_with_priv_from_git_resource).

-behaviour(rebar_resource).

-export([lock/2
        ,download/3
        ,needs_update/2
        ,make_vsn/1]).

-define(RESOURCE_TYPE, app_with_priv_from_git).

-spec lock(file:filename_all(), tuple()) ->
    rebar_resource:resource().
lock(AddDir, _) ->
    error(not_implemented).

-spec download(file:filename_all(), tuple(), rebar_state:t()) ->
    {tarball, file:filename_all()} | {ok, any()} | {error, any()}.
download(Dir, _, State) ->
    {error, not_implemented}.

-spec needs_update(file:filename_all(), tuple()) ->
    boolean().
needs_update(Dir, _) ->
    error(not_implemented).

-spec make_vsn(file:filename_all()) ->
    {plain, string()} | {error, string()}.
make_vsn(Dir) ->
    {error, "not_implemented"}.

%%% Internal functions




%% -module(rebar_resource).
%%
%% -export_type([resource/0
%%              ,type/0
%%              ,location/0
%%              ,ref/0]).
%%
%% -type resource() :: {type(), location(), ref()}.
%% -type type() :: atom().
%% -type location() :: string().
%% -type ref() :: any().
