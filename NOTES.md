# Code Review

Overall quite good.

## Deutsche Font

FYI: Good news is that you can often source these from Google fonts.  You can
leverage their CDN for fonts.

## CSS

Good.

## Testing

You didn't have any.  Start thinking about how to put this in.  Other groups
are blazing a trail here and you'll want to be on the same page.

## Migrations

None of your migrations are taking advantage of the constraints or defaults
available at the database layer.  Great developers let the DB do their work for
them.  Should a column ever be NULL?  Do you need 256 characters for a
username?  Think about these things.  Is a `deck_id` optional?

While you guard well against bad data in the code validations, what happens
when everyone decides Rails is no longer Cool and everything switches to Node
(or whatever **is** Cool)?  We can keep the DB and trust our data will stay
clean because Postgres knows the rules, not the application.

## Helpers

Good usage

## Controllers

Very skinny, focused methods.  Good.

## OO

You're missing some opportunities to let the objects work for you.  Check out
comments in round\_controller.  We'll get you there.  Now might be a good time
to re-read and work through POODR 2-6.  You've learned a lot but now is a time
to re-re-learn.

Look at in-line comments about how you could do this.

## Views

As a general principle when you `@each` something in the view.  You should make
sure that the data that is yielded is passed into a partial.  edit\_deck would
have benefitted here.
