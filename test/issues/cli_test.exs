defmodule Issues.CLITest do
    use ExUnit.Case
    doctest Issues

    test ":help returned by option parsing with -h and --help options" do
        assert Issues.CLI.parse_args(["-h"]) == :help
        assert Issues.CLI.parse_args(["--help"]) == :help
    end

    test "three values returned if three given"  do
        assert Issues.CLI.parse_args(["user", "project", "99"]) == {"user", "project", 99}
    end
    
    test "count is defaulted if two values given"  do
        assert Issues.CLI.parse_args(["user", "project"]) == {"user", "project", 4}
    end

    test "sort descending orders the correct way" do
        result = Issues.CLI.sort_into_descending_order(fake_created_at_list(["c","a","b"]))
        #Create a list of values from value of created_at map received
        issues = for issue <- result, do: Map.get(issue, "created_at")
        assert issues == ["c","b","a"] # issues == ~w{c b a}
    end

    defp fake_created_at_list(values) do
        # Create a list of maps with a key created_at
        for value <-values,
        do: %{"created_at"=>value, "other_key"=>"xxx"}
    end

end