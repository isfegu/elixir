defmodule Morse do
    @moduledoc "Transforma texto a morse o morse a texto"
    @morse %{
            'a' => ".-",
            'b' => "-..."
    }

    @doc "Transforma texto a morse"
    @spec text2morse(charlist) :: charlist
    def text2morse (text) do
        textlist = String.split(text, "")
        #Enum.each(textlist, &IO.puts &1)
        Enum.each(textlist, &IO.puts @morse[&1])
    end

    @doc "Transforma morse a texto"
    @spec morse2text(charlist) :: charlist
    def morse2text (morse) do
        IO.puts("morse2text")
    end

end

IO.puts Morse.text2morse "ab"