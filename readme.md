# ActiveSong

I was following the #songsincode meme on twitter, and finding it hilarious. Then [John][] recorded himself singing his [songincode][] which gave me an idea.

[John]: http://johnleach.co.uk/
[songincode]: http://johnleach.co.uk/words/archives/2009/08/21/394/song-in-code-ramones-i-wanna-be-sedated

`ActiveSong` searches for lyrics to a song you specify, and can then *"play"* them using OS X's `say` command.

	Julius:active_song(master) caius$ irb
	>> require "active_song"
	=> true
	>> song = ActiveSong.find(:artist => "Moby", :track => "Another Woman")
	=> "You leave your home for days and days\nAnd I know, said I know\nYou leave your home for\n weekly access temporary API limited free lyricsfly.com "
	>> song.play!
	{{ Sound comes out the speakers here }}

### Licence

Do what you want with it and don't sue me.
