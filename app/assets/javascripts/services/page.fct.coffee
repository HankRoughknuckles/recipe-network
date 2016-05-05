angular.module('app.services')
  .factory "Page", [
    ->
      title = "Recipes"

      return {
        title: -> return title
        setTitle: (newTitle) -> title = newTitle
      }
  ]
