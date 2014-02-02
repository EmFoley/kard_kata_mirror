# Create cards

cards = [{answer: "antworten", question:	"to answer"},
				{answer: "arbeiten", question:	"to work"},
				{answer: "bedeuten", question:	"to mean, signify"},
				{answer: "beginnen", question:	"to begin"},
				{answer: "bekommen", question:	"to get, receive"},
				{answer: "bestellen", question:	"to order"},
				{answer: "besuchen", question:	"to visit"},
				{answer: "bezahlen", question:	"to pay"},
				{answer: "bleiben", question:	"to stay, remain"},
				{answer: "bringen", question:	"to bring, take"},
				{answer: "danken", question:	"to thank"},
				{answer: "denken", question:	"to think"},
				{answer: "essen", question:	"to eat"},
				{answer: "fahren", question:	"to travel"},
				{answer: "drive", question: "go"},
				{answer: "finden", question:	"to find"},
				{answer: "fliegen", question:	"to fly"},
				{answer: "fragen", question:	"to ask"},
				{answer: "geben", question:	"to give"},
				{answer: "gehen", question:	"to go"},
				{answer: "helfen", question:	"to help"},
				{answer: "kaufen", question:	"to buy"},
				{answer: "kommen", question:	"to come"},
				{answer: "kosten", question:	"to cost"},
				{answer: "lesen", question:	"to read"},
				{answer: "lieben", question:	"to love"},
				{answer: "machen", question:	"to make, do"},
				{answer: "nehmen", question:	"to take"},
				{answer: "probieren", question:	"to try (out)"},
				{answer: "regnen", question:	"to rain"},
				{answer: "reisen", question:	"to travel"},
				{answer: "sagen", question:	"to say, tell"},
				{answer: "schlafen", question:	"to sleep"}]



cards.each do |card|
	card[:deck_id] = rand(1..3)
	Card.create(card)
end

(1..3).each do |num| Deck.create(name: "German #{num}", user_id: 1) end