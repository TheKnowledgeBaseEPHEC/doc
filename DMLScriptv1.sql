INSERT INTO User (`Nom`, `Prenom`, `AdresseMail`, `ConfirmAdMail`, `Password`, `ConfirmPasswd`, `Tuteur`, `Tutoré`) 
								VALUES('Sabbatini', 'Simon', 'simonsabbatini@hotmail.com', 'simonsabbatini@hotmail.com','simon', 'simon', 1, 1);
/*select * from User;*/
INSERT INTO Tuteur (`Nom`, `Prenom`, `AdMail`, `User_idUser`)
								VALUES('Sabbatini', 'Simon', 'simonsabbatini@hotmail.com', 1);
/*select * from Tuteur;*/
INSERT INTO Tutore (`Nom`, `Prenom`, `AdMail`, `User_idUser`)
								VALUES('Sabbatini', 'Simon', 'simonsabbatini@hotmail.com', 1);
/*select * from Tutore;*/
INSERT INTO Activation (`DateActiv`, `ExpActiv`,`User_idUser`)
								VALUES(NOW(), NOW(),1);
/*select * from Activation;*/
INSERT INTO Verification (`Nom`, `Prenom`, `User_idUser`)
								VALUES('Sabbatini', 'Simon', 1);
/*select * from Verification;*/
INSERT INTO Message (`User_idUser`, `SujetMessage`, `ContenuMessage`, `DateMessage`)
								VALUES(1, 'test', 'voici le contenu du test', NOW());
/*select * from Message;*/

INSERT INTO Ecole (`NomEcole`, `Image`, `AdEmail`)
								VALUES('UCL', 'https://www.google.be/', 'students.uclouvain.be');
/*select * from Ecole;*/
INSERT INTO Fac (`NomFac`, `Image`, `Ecole_idEcole`)
								VALUES('SCINF', 'https://www.google.be/', 1);
/*select * from Fac;*/
INSERT INTO Cours (`idTutore`, `IntituleCours`, `Tuteur_idTuteur`, `Fac_Ecole_idEcole`)
								VALUES(1, 'Programmation',1,1 );
/*select * from Cours;*/
INSERT INTO Sceance (`idTuteur`, `Duree`, `Tutore_idTutore`)
								VALUES(1, 60, 1);
/*select* from Sceance;*/
INSERT INTO Rating (`Description`, `idTuteur`, `idTutore`, `Sceance_idSceance`)
								VALUES('La sceance s est bien deroulee', 1, 1, 1);
/*select * from Rating;*/
INSERT INTO Transaction (`Prix`, `Sceance_idSceance`, `Sceance_Tutore_idTutore`)
								VALUES(20.00, 1,1);
/*select * from Transaction;*/
				
