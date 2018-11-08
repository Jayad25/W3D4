def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.

  Movie.select(:id,:title,:yr,:score).where(score: 3..5,yr:1980..1989)

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie.group(:yr).having('MAX(score) < 8').pluck(:yr).sort
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor.select(:id,:name).joins(:movies).where('title like (?)',title).order('ord ASC')
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie.select('movies.id, movies.title, actors.name')
    .joins(:actors) # this combines actor and movie tables
    .where('castings.ord=1')  # this filters for leading actors
    .where('movies.director_id = castings.actor_id') # this filters for directors after the first filter

end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor.select('actors.id,actors.name,COUNT(*) as supporting_roles')
  .joins(:castings)
end
