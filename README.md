Projet de Base de Données pour une Plateforme de Cinéphiles 

Introduction

Pour notre deuxième projet de la session d'automne 2024, nous avons entrepris une mission passionnante : développer une base de données relationnelle pour une plateforme en ligne dédiée aux cinéphiles. Cette plateforme vise à révolutionner la gestion des informations sur les films et les avis des utilisateurs, actuellement stockées de manière inefficace. Les données incluent des détails sur les films (titres et genres), les commentaires des utilisateurs et les dates d'ajout de ces avis, mais leur organisation actuelle limite l'analyse des préférences des utilisateurs et la fourniture de statistiques utiles.

Nous avons utilisé le jeu de données MovieLens, fourni par le laboratoire GroupLens Research, une référence incontournable dans le domaine des systèmes de recommandation. Ce jeu de données contient des évaluations anonymes de films par des utilisateurs, ainsi que des informations détaillées sur les films. Notre objectif était de concevoir une base de données relationnelle qui organise ces données de manière cohérente et permet de faire des recommandations basées sur des observations statistiques. De plus, nous voulions obtenir des informations sur les préférences générales des utilisateurs concernant les films.


Structure de la Base de Données

La base de données est composée des tables suivantes :
- `Utilisateurs : Contient les informations des utilisateurs.
- `Films: Contient les informations des films.
- `Genres : Contient les différents genres de films.
- `Film_Genres: Associe les films à leurs genres respectifs.
- `Appreciations : Contient les avis des utilisateurs sur les films.
- `Appreciation_Tags : Contient les tags descriptifs des avis des utilisateurs.

Fonctions et Vues

Fonctions

1. FilmVues : Retourne l'ensemble des films qu'un utilisateur a regardés, avec les détails et les votes attribués.
2. Collaborateurs: Retourne l'ensemble des utilisateurs ayant visionné au moins un film en commun avec un utilisateur donné, avec les détails des films et les votes.
3. RecommanderFilm : Vérifie si un film peut être recommandé à un utilisateur en fonction de plusieurs critères.
4. GenrePopulaire: Retourne les 5 films les plus regardés dans un genre donné, avec les totaux des votes.

Vue

FilmsPopulairesEtRecommandations : Affiche les 5 films les plus populaires par genre et la liste des utilisateurs à qui on pourrait recommander ces films.

Conclusion

Ce projet a été une aventure enrichissante qui nous a permis de repousser les limites de nos compétences en conception de bases de données. En partant d'un jeu de données complexe et riche comme MovieLens, nous avons pu démontrer comment une base de données relationnelle bien structurée peut transformer des informations éparses en un outil puissant pour les cinéphiles.

Grâce à notre approche méthodique, nous avons non seulement organisé les données de manière cohérente, mais aussi créé un système capable de fournir des recommandations personnalisées et des analyses précieuses sur les préférences des utilisateurs. Cette expérience a mis en lumière l'importance cruciale d'une base de données bien conçue pour la prise de décision et l'amélioration de l'expérience utilisateur.

En conclusion, ce projet a été l'occasion de mettre en pratique et de perfectionner nos compétences en conception de bases de données, en nous confrontant à des défis réels et en trouvant des solutions innovantes. Nous avons prouvé que, même face à des données initialement désorganisées, il est possible de créer une structure qui non seulement répond aux besoins actuels, mais ouvre également la voie à des possibilités futures. Cette compétence est essentielle dans le monde professionnel d'aujourd'hui, où la gestion efficace des données est synonyme de succès et d'innovation.
