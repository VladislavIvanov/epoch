-module(rebar_git_deps).

-export([init/1]).

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    ResourceType = app_with_priv_from_git,
    ResourceModule = rebar_app_with_priv_from_git_resource,
    {ok, rebar_state:add_resource(State, {ResourceType, ResourceModule})}.
