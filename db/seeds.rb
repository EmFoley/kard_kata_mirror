# Create cards

cards = [{answer: "antworten", question:	"to answer", deck_id: 1},
				{answer: "arbeiten", question:	"to work", deck_id: 1},
# 				{answer: "bedeuten", question:	"to mean, signify", deck_id: 1},
# 				{answer: "beginnen", question:	"to begin", deck_id: 1},
# 				{answer: "bekommen", question:	"to get, receive", deck_id: 1},
# 				{answer: "bestellen", question:	"to order", deck_id: 1},
# 				{answer: "besuchen", question:	"to visit", deck_id: 1},
# 				{answer: "bezahlen", question:	"to pay", deck_id: 1},
# 				{answer: "bleiben", question:	"to stay, remain", deck_id: 1},
# 				{answer: "bringen", question:	"to bring, take", deck_id: 1},
# 				{answer: "danken", question:	"to thank", deck_id: 1},
# 				{answer: "denken", question:	"to think", deck_id: 1},
# 				{answer: "essen", question:	"to eat", deck_id: 1},
# 				{answer: "fahren", question:	"to travel", deck_id: 1},
# 				{answer: "drive", question: "go", deck_id: 1},
# 				{answer: "finden", question:	"to find", deck_id: 1},
# 				{answer: "fliegen", question:	"to fly", deck_id: 1},
# 				{answer: "fragen", question:	"to ask", deck_id: 1},
# 				{answer: "geben", question:	"to give", deck_id: 1},
# 				{answer: "gehen", question:	"to go", deck_id: 1},
# 				{answer: "helfen", question:	"to help", deck_id: 1},
# 				{answer: "kaufen", question:	"to buy", deck_id: 1},
# 				{answer: "kommen", question:	"to come", deck_id: 1},
# 				{answer: "kosten", question:	"to cost", deck_id: 1},
				{answer: "lesen", question:	"to read", deck_id: 1},
				# {answer: "lieben", question:	"to love", deck_id: 1},
				{answer: "machen", question:	"to make, do", deck_id: 1}]
				# {answer: "nehmen", question:	"to take", deck_id: 1},
				# {answer: "probieren", question:	"to try (out)", deck_id: 1},
				# {answer: "regnen", question:	"to rain", deck_id: 1},
				# {answer: "reisen", question:	"to travel", deck_id: 1},
				# {answer: "sagen", question:	"to say, tell", deck_id: 1},
				# {answer: "schlafen", question:	"to sleep", deck_id: 1}]



cards.each do |card|
	Card.create(card)
end
