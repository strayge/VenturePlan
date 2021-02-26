local _, T = ...
-- See https://www.townlong-yak.com/addons/venture-plan/localization

local C, z, V, K = GetLocale(), nil
V =
    C == "deDE" and { -- 82/90 (91%)
      "\"%s mögliche Prognosen und Anrechnung...\"", "\"Kapitel 1: Magier müssen zum Nahkampf.\"", "\"Glaubt nicht seinen Lügen! Gleichgewichtsdruiden sind keine Notrationen.\"", "\"Alles geschah wie vorhergesagt.\"", "\"Nichts lief wie erwartet.\"", z, z, "\"Das Ergebnis war wie vorhergesagt.\"", "\"Gab es jemals Zweifel?\"", "\"Bei deinem Glück gibt es nur eine Möglichkeit, wie dies endet.\"",
      "%d |4Abenteuer:Abenteuer; verbleibend...", z, "%d |4Gruppe:Gruppen; verbleibend...", "(Nahkampf)", "(Fernkampf)", "1. Besuche:", "2. Kopiere den folgenden Text:", "Eine detaillierte Aufzeichnung eines Abenteuers, das deine Gefährten absolviert haben.", "Abenteuer läuft ab in:", "Abenteuerbericht",
      z, "Wird auch vergeben, wenn die Abenteurer besiegt wurden.", "Lösche alle vorläufigen Gruppen", "Zum Abschließen hier klicken", "Gesundheit der Gefährten hat sich geändert.", "Schließe alle ab", "Aktueller Fortschritt: %s", "Fluch der Ungewissheit", "Verfluchter Abenteurerführer", "Verfluchter taktischer Leitfaden",
      "Schwächt alle Feinde ab und verursacht in dieser Runde und in jeder der nächsten drei Runden {} Schaden.", "Besiegt", "Zum Scheitern verurteilter Lauf", "Dauer:", "Gruppe bearbeiten", "In jeder zweiten Runde wird ein zufälliger Feind für {}% seiner maximalen Gesundheit angegriffen.", "Wenn diese Mission fehlschlägt, erhält jeder Gefährte %s.", "Wird das erste Mal in Runde %d gewirkt.", "Gefährten XP", "Reduziert für zwei Runden den durch eingehende Angriffe verursachten Schaden um 1 und rächt sich für {}.",
      "Vollständig genesen in %s", "Zukünfte in Betracht gezogen:", z, "In der vorläufigen Gruppe - %s", "Eingehende Angriffe:", z, "Erhöht den Schaden, den der am nächsten gelegene Gegner erhält, für drei Runden um {}.", "Erhöht den Schaden, den der am nächsten gelegene Verbündete austeilt, für zwei Runden um {}.", "Fügt einem zufälligen Feind {} Schaden zu.", "Fügt allen Gegnern in Reichweite {} Schaden zu.",
      "Fügt allen Gegnern im Nahkampf {} Schaden zu und erhöht den eigenen verursachten Schaden drei Runden lang um 20%.", "Verursacht sich selbst {} Schaden.", "Nicht genug Anima.", "Es passiert nichts.", "Nicht alle Fähigkeiten wurden berücksichtigt.", "Nicht alle Ergebnisse wurden überprüft.", "Vorläufig:", "Menge: %s", "Reduziert den von einem zufälligen Verbündeten erlittenen Schaden um 50%. Für immer.", "Reduziert den vom nächsten Verbündeten erlittenen Schaden zwei Runden lang um {}%.",
      "Verringert in der nächsten Runde den verursachten Schaden aller Gegner um {}%.", z, "Reduziert den vom am weitesten entfernten Feind verursachten Schaden 3 Runden lang um 1.", "Reduziert den vom nächsten Verbündeten erlittenen Schaden für zwei Runden um 5000%.", "Verbleibende feindliche Gesundheit: %s", "Benötigt einen Gefährten in der Gruppe", "Abenteuerberichte zurücksetzen", z, "Belohnungen:", "Abenteurer auswählen",
      "Schicke vorläufige Gruppen", "Starte dieses Abenteuer", "Ziele:", "Teile diese Neulinge vorläufig diesem Abenteuer zu.", "Der verfluchte Abenteurerführer ist hungrig. Nur die Geschichten über die Abenteuer deiner Gefährten, die bis ins kleinste Detail erfasst werden, können diesen Hunger stillen.", "Der Leitfaden zeigt Dir eine Reihe möglicher Zukünfte. In einigen Fällen endet das Abenteuer mit einem Triumph. In anderen in einem besonders schrecklichen Misserfolg.", "Diese Gefährten wirken sich derzeit auf Deine Truppenstufe aus:", "Impulse:", "Um deine Abenteuerberichte einzureichen,", "Runden überlebt: %s",
      "Erfasste Runden: %s", "Benutzen: Füttere den verfluchten Abenteurerführer.", "Benutzen: Unterbricht die Beratung des Leitfadens.", "Benutzen: Lass das Buch die Truppen und Kampftaktiken auswählen.", "Benutzen: Lies den Leitfaden und bestimme das Schicksal deiner Abenteuergruppe.", "Siegreich", "Der Sieg konnte nicht garantiert werden.", "Gesucht: Abenteuerberichte", "Deine Truppenstufe ist die mittlere Stufe deiner Gefährten (%s), abgerundet.", "[CD: %dR]",
    }
    or C == "esES" and { -- 90/90 (100%)
      "\"%s futuros posibles y contando...\"", "\"Capítulo 1: Los magos deben ir a melé.\"", "\"¡No te creas sus mentiras! Los druidas equilibrio no son comidas de emergencia\".", "\"Todo salió como se predijo\".", "\"Nada salió como se esperaba\".", "\"¡Has arrebatado la victoria a las fauces de la derrota!\"", "\"Tan cerca y tan lejos.\"", "\"El resultado fue según lo predicho\".", "\"¿Hubo alguna vez alguna duda?\"", "\"Con tu suerte solo hay una forma en la que esto puede acabar\".",
      "%d |4aventura:aventuras; restantes...", "%d |4compañero está listo:compañeros están listos; para las aventuras.", "%d |4grupo:grupos; restantes...", "(melé)", "(a distancia)", "1. Visita:", "2. Copia el texto siguiente:", "Un historial detallado de una aventura completada por tus compañeros.", "La aventura expira en:", "Informe de la aventura",
      "Todos los compañeros están listos para las aventuras.", "Se otorga incluso si los aventureros han sido derrotados.", "Borrar todos los grupos tentativos", "Clica para completar", "La salud del compañero ha cambiado.", "Completar todo", "Progreso actual: %s", "Maldición de la incertidumbre", "Guía del Aventurero Maldito", "Guía Táctica Maldita",
      "Pone perjuicios a todos los enemigos, inflingiendo {} de daño este turno y durante cada uno de los siguientes tres turnos.", "Derrotado", "Misión condenada", "Duración:", "Editar grupo", "Cada dos turnos, un enemigo aleatorio es atacado por un {}% de su salud máxima.", "Fallar esta misión otorga %s a cada compañero.", "Primer lanzamiento durante el turno %d.", "Experiencia de compañero", "Durante dos turnos, reduce el daño sufrido por los ataques recibidos en 1 y contraataca con {}.",
      "Sanación completa en %s", "Futuros considerados:", "Cura al aliado más cercano para {}.", "En el grupo provisional - %s", "Ataques entrantes:", "Incrementa todo el daño recibido por el aliado más cercano un {}% durante dos turnos.", "Incrementa todo el daño recibido por el enemigo más cercano en {} durante tres turnos.", "Incrementa el daño inflingido por el aliado más cercano en {} durante dos turnos.", "Inflige {} de daño a un enemigo aleatorio.", "Inflige {} daño a todos los enemigos a distancia.",
      "Inflige {} de daño a todos los enemigos a melé, e incrementa el daño realizado un 20% durante tres turnos.", "Inflinge {} de daño a si mismo.", "Ánima insuficiente", "No hace nada.", "No se han tenido en cuenta todas las habilidades.", "No se han tenido en cuenta todas las posibilidades.", "Resultado Preliminar:", "Cantidad: %s", "Reduce el daño recibido por un aliado aleatorio un 50%. Para siempre.", "Reduce el daño recibido por el aliado más cercano un {}% durante dos turnos.",
      "Reduce el daño infligo por todos los enemigos {}% durante el siguiente turno.", "Reduce el daño realizado por todos los enemigos un {}% durante dos turnos.", "Reduce el daño infligido por el enemigo más lejano en 1 durante 3 turnos.", "Reduce el daño recibido por el aliado más cercano un 5000% durante dos turnos.", "Salud enemiga restante: %s", "Requiere un compañero en el grupo", "Borrar los informes de aventuras", "Volverán pronto:", "Recompensas:", "Selecciona aventureros",
      "Enviar grupos provisionales", "Comienza la aventura", "Objetivos:", "Asigna estas tropas provisionalmente a la aventura.", "La Guía del Aventurero Maldito tiene hambre. Solo los relatos de las aventuras de tus compañeros, transmitidos con un detalle insoportable, la dejarán satisfecha.", "La guía muestra algunos futuros posibles. En unos, la aventura acaba con éxito; en otros, fracasa de una manera particularmente horrible.", "Estos compañeros afectan actualmente a tu nivel de las tropas:", "Tics:", "Para enviar tus informes de aventuras,", "Turnos sobrevividos: %s",
      "Turnos empleados: %s", "Uso: alimenta a la Guía del Aventurero Maldito", "Uso: interrumpe las deliberaciones de la guía.", "Uso: deja que el libro seleccione las tropas y las tácticas de la batalla.", "Uso: lee la guía, la cual determinará el destino de tu grupo de aventureros.", "Victorioso", "No se puede garantizar la victoria.", "Se busca: informes de aventuras", "El nivel de tus tropas es la media de la de tus compañeros (%s), redondeando hacia abajo.", "[CD: %dT]",
    }
    or C == "esMX" and { -- 82/90 (91%)
      "\"%s futuros posibles y contando...\"", "\"Capítulo 1: Los Magos Deben ser Melé.\"", "\"¡No creas en sus mentiras! Los druidas equilibrio no son comida de emergencia.\"", "\"Todo ha ido según lo previsto.\"", "\"Nada salió como se esperaba\".", z, z, "\"El resultado fue según lo predicho\".", "\"¿Hubo alguna vez alguna duda?\"", "Con tu suerte, esto solo va acabar de una forma.",
      "%d |4aventura:aventuras; restantes...", z, "%d |4grupo:grupos; restantes...", "(melé)", "(a distancia)", "1. Visita:", "Copia el siguiente texto:", "Un registro detallado de una aventura completada por tus seguidores.", "La aventura expirará en:", "Reporte de Aventuras",
      z, "Obtenido incluso si los aventureros son derrotados.", "Borrar todos los grupos tentativos", "Clic para completar", "La vida del seguidor ha cambiado.", "Completar todo", "Progreso actual: %s", "Maldición de la Incertidumbre", "Guía del Aventurero Maldito", "Guía Táctica Maldita",
      "Pone perjuicios a todos los enemigos, inflingiendo {} de daño este turno y cada uno de los siguientes tres turnos.", "Derrotado", "Misión suicida", "Duración:", "Editar grupo", "En turnos alternos, un enemigo aleatorio es atacado, causándole {}% de su vida máxima.", "Fallar esta misión otorga %s a cada seguidor.", "Se lanza por primera vez en el turno %d.", "Experiencia del seguidor.", "Durante dos turnos, reduce el daño realizado por los ataques enemigos en 1 y contraataca con {}.",
      "Se recupera por completo en %s", "Futuros considerados:", z, "En el grupo provisional - %s", "Ataques enemigos:", z, "Incrementa todo el daño recibido por el enemigo más cercano en {} durante tres turnos.", "Incrementa el daño inflingido por el aliado más cercano en {} durante dos turnos.", "Inflige {} de daño a un enemigo aleatorio.", "Inflige {} daño a todos los enemigos a distancia.",
      "Inflige {} de daño a todos los enemigos a melé, e incrementa el daño realizado un 20% durante tres turnos.", "Inflinge {} de daño a si mismo.", "Ánima insuficiente", "No hace nada.", "No se han tenido en cuenta todas las habilidades.", "No se han tenido en cuenta todas las posibilidades.", "Resultado Preliminar:", "Cantidad: %s", "Reduce el daño recibido por un aliado aleatorio un 50%. Para siempre.", "Reduce el daño recibido por el aliado más cercano un {}% durante dos turnos.",
      "Reduce el daño infligo por todos los enemigos {}% durante el siguiente turno.", z, "Reduce el daño infligido por el enemigo más lejano en 1 durante 3 turnos.", "Reduce el daño recibido por el aliado más cercano un 5000% durante dos turnos.", "Salud enemiga restante: %s", "Requiere un compañero en el grupo", "Borrar los informes de aventuras", z, "Recompensas:", "Selecciona compañeros",
      "Enviar grupos provisionales", "Comienza la aventura", "Objetivos:", "Asigna estas tropas provisionalmente a la aventura.", "La Guía del Aventurero Maldito tiene hambre. Solo los relatos de las aventuras de tus compañeros, transmitidos con un detalle insoportable, la dejarán satisfecha.", "La guía muestra algunos futuros posibles. En unos, la aventura acaba con éxito; en otros, fracasa de una manera particularmente horrible.", "Estos compañeros afectan actualmente a tu nivel de las tropas:", "Ticks:", "Para enviar tus informes de aventuras,", "Turnos sobrevividos: %s",
      "Turnos empleados: %s", "Uso: alimenta a la Guía del Aventurero Maldito", "Uso: Interrumpe las deliberaciones de la guía.", "Uso: Deja que el libro seleccione las tropas y las tácticas de la batalla.", "Uso: lee la guía, la cual determinará el destino de tu grupo de aventureros.", "Victorioso", "No se puede garantizar la victoria.", "Se busca: informes de aventuras", "El nivel de tus tropas es la media de la de tus compañeros (%s), redondeando hacia abajo.", "[CD: %dT]",
    }
    or C == "frFR" and { -- 88/90 (97%)
      "\"%s futurs possibles, calculs en cours...\"", "\"Chapitre 1: Les mages doivent être au corps à corps.\"", "\"Ne croyez pas ses mensonges ! Les druides équilibre ne sont pas des rations d'urgence.\"", "\"Tout s'est déroulé comme prévu.\"", "\"Rien ne s'est déroulé comme prévu.\"", z, "\"Si proche, et pourtant si loin.\"", "\"Le résultat avait été prédit.\"", "\"Y a-t-il déjà eu un doute ?\"", "\"Avec votre chance, il n'y a qu'une seule façon que cela se termine.\"",
      "%d |4aventure restante:aventures restantes;...", "%d |4compagnons est: compagnons sont; pour pour l'aventure.", "%d |4groupe restant:groupes restants;...", "(corps à corps)", "(Distant)", "Visite :", "Copie du texte suivant :", "Enregistrement détaillé d'une aventure terminée par vos compagnons.", "L'aventure expire dans :", "Rapport d'aventure",
      "Tous les compagnons sont prêt pour l'aventure.", "Décerné même si les aventuriers sont vaincus.", "Effacer les groupes provisoires", "Cliquer pour terminer", "Les points de vie du combattant ont changé.", "Tout compléter", "Niveau actuel : %s", "Malédiction d'incertitude", "Guide de l'aventurier maudit", "Guide Tactique Maudit",
      "Affaiblit tous les ennemis, ce qui inflige {} dégâts par tour pendant 4 tours.", "Défaite", "Course condamnée", "Durée :", "Modifier groupe", "Un tour sur deux, un ennemi aléatoire est attaqué à raison de {}% de sa vie maximum.", "Échouer cette mission accorde %s à chaque compagnon.", "Premier sort pendant le tour %d.", "XP compagnon", "Pendant deux tours, réduit les dégâts infligés par les attaques subies de 1 et riposte pour {}.",
      "Rétablissement complet dans %s", "Scénarios analysés :", "Soigne l'allié le plus proche pour {}.", "Dans un groupe provisoire - %s", "Attaque en approche :", "Augmente tout les dégâts subis par l'allié le plus proche de {}% pendant 2 tours.", "Affaiblit l'ennemi le plus proche, ce qui augmente tous les dégâts subis de {} pendant 3 tours.", "Renforce l'allié le plus proche, ce qui augmente ses dégâts de {} pendant 2 tours.", "Inflige {} dégâts à un ennemi aléatoire.", "Inflige {} de dégâts à tous les ennemis à portée.",
      "Inflige {} dégâts à tous les ennemis au corps à corps, et augmente les dégâts faits de 20% pour trois tours", "Inflige {} des dommages à soi-même.", "Anima insuffisant", "Ça ne fait rien.", "Toutes les capacités n'ont pas été prises en compte.", "Toutes les possibilités n'ont pas été déterminées.", "Préliminaire :", "Quantité : %s", "Réduit les dégâts subis par un allié aléatoire de 50%. Permanent.", "Renforce l'allié le plus proche, ce qui réduit les dégâts subis de {}% pendant 2 tours.",
      "Réduit les dégâts infligés par tous les ennemis de {}% pendant le prochain tour.", "Réduit les dégâts infligé par tout les ennemis de {}% pendant 2 tours.", "Réduit les dégâts infligés par l'ennemi le plus éloigné de 1 pendant 3 tours.", "Réduit les dégâts subis par l'allié le plus proche de 5000% pendant deux tours.", "Vie restante des ennemis : %s", "Nécessite un aventurier dans le groupe", "Reset du rapport d'aventure", z, "Récompenses :", "Sélection des aventuriers",
      "Envoyer les groupes provisoires", "Commencer l'aventure", "Cible :", "Assigne provisoirement ces novices à cette aventure.", "Le guide de l'aventurier maudit a faim. Seuls les récits des aventures de vos compagnons, expliqués dans des détails atroces, le satisferont.", "Le guide vous montre un certain nombre de futurs possibles. Chez certains, l'aventure se termine par un triomphe ; dans d'autres, un échec particulièrement horrible.", "Ces compagnons affectent le niveau de vos troupes :", "Impulsion :", "Pour soumettre vos rapports d'aventure,", "Tours survécus : %s",
      "Tours effectués : %s", "Utiliser : Nourrissez le guide de l'aventurier maudit.", "Utiliser : Interrompre les délibérations du guide.", "Utiliser : Laissez le livre s'occuper des troupes et de la stratégie.", "Utiliser : Lisez le guide pour déterminer le sort de votre groupe d'aventures.", "Victorieux", "La victoire n'est pas assurée.", "Recherché : Rapports d'aventure", "Le niveau de vos troupes est égal à la médiane des niveaux de vos compagnons (%s), arrondi à l'entier inférieur.", "[CD: %dT]",
    }
    or C == "itIT" and { -- 82/90 (91%)
      "\"%s possibili futuri e sto ancora contando...\"", "\"Capitolo 1: I maghi devono essere in mischia.\"", "\"Non fidarti delle sue menzogne! I druidi dell'equilibrio non sono razioni di emergenza.\"", "\"Tutto è andato come predetto.\"", "\"Non è andato affatto come previsto.\"", z, z, "\"Il risultato era quello predetto.\"", "\"Ci sono mai stati dubbi?\"", "\"Con la tua fortuna, non può che finire in una sola maniera\"",
      "%d |4avventura rimanente:avventure rimanenti;...", z, "%d |4gruppo rimanente:gruppi rimanenti;...", "(mischia)", "(a distanza)", "1. Visita:", "2. Copia il seguente testo:", "Un registro dettagliato di un'avventura completata dai tuoi avventurieri.", "Avventura in scadenza:", "Rapporto dell'Avventura",
      z, "Ottenuto anche se gli avventurieri vengono sconfitti.", "Cancella tutti i gruppi provvisori", "Clicca per completare", "La salute dell'avventuriero è cambiata.", "Completa tutto", "Avanzamento corrente: %s", "Maledizione dell'incertezza", "Guida Maledetta dell'Avventuriero", "Guida Tattica Maledetta",
      "Penalizza tutti i nemici, infliggendo {} danni questo turno e durante ciascuno dei tre turni successivi.", "Sconfitta", "Avventura Spacciata", "Durata:", "Modifica gruppo", "Ogni altro turno, a un nemico casuale viene inflitto il {}% della sua salute massima.", "Fallire questa missione conferisce %s a ciascun avventuriero.", "Lanciato per la prima volta durante il turno %d.", "EXP per seguaci", "Per 2 turni, riduce di 1 il danno inflitto dagli attacchi in arrivo e si vendica di {}.",
      "Recupero vitale completo in %s", "Futuri esaminati:", z, "Nel gruppo provvisorio - %s", "Attacchi in arrivo:", z, "Aumenta tutti i danni subiti dal nemico più vicino di {} per tre turni.", "Aumenta i danni effettuati dall'alleato più vicino di {} per due turni.", "Infligge {} danni a un nemico casuale.", "Infligge {} danni a tutti i nemici a portata.",
      "Infligge {} danni a tutti i nemici in mischia e aumenta i propri danni inflitti del 20% per tre turni.", "Infligge {} danni a se stesso.", "Anima insufficiente", "Non fa nulla.", "Non tutte le abilità sono state prese in considerazione.", "Non tutti i risultati sono stati esaminati.", "Preliminare:", "Quantità: %s", "Riduce del 50% i danni subiti da un alleato casuale. Per sempre.", "Riduce i danni subiti dall'alleato più vicino del {}% per 2 turni.",
      "Riduce il danno inflitto da tutti i nemici del {}% durante il prossimo turno.", z, "Riduce di 1 il danno inflitto dal nemico più lontano per 3 turni.", "Riduce del 5000% i danni subiti dall'alleato più vicino per due turni.", "Salute rimanente dei nemici: %s", "Richiede un compagno nel gruppo", "Reimposta i Rapporti dell'Avventura", z, "Ricompense:", "Seleziona avventurieri",
      "Invia i Gruppi Provvisori", "Avvia l'avventura", "Bersagli:", "Assegna provvisoriamente questi novellini a questa avventura.", "La Guida Maledetta dell'Avventuriero ha fame. Solo i racconti delle avventure dei tuoi compagni, narrati nei minimi dettagli, la soddisferanno.", "La guida mostra una serie di possibili futuri. In alcuni, l'avventura finisce in trionfo; in altri, vedi un orribile fallimento.", "Questi avventurieri attualmente influenzano il livello delle tue truppe:", "Istanti:", "Per inviare i tuoi rapporti dell'avventura,", "Turni sopravvissuti: %s",
      "Turni richiesti: %s", "Uso: Alimenta la Guida Maledetta dell'Avventuriero.", "Usa: Interrompe le decisioni della guida.", "Usa: Lascia che il libro scelga truppe e tattiche di battaglia.", "Uso: Leggi la Guida, determinando il destino del tuo gruppo di avventurieri.", "Vittoria", "La vittoria potrebbe non essere garantita.", "Cercasi: Rapporti dell'Avventura", "Il livello delle tue truppe è il livello mediano dei tuoi avventurieri (%s), arrotondato per difetto.", "[CD: %d turni]",
    }
    or C == "koKR" and { -- 87/90 (96%)
      "\"%s가지 가능한 미래를 계산중...\"", "\"제 1 장: 마법사는 근접해야 한다.\"", "\"거짓에 속지 마세요! 조화 드루이드는 비상식량이 아닙니다.\"", "\"모든 것이 예견한 대로 이루어졌습니다.\"", "\"예상이 영 빗나갔네요.\"", "\"절망의 수렁에서 승리를 잡아냈습니다!\"", "\"아쉽게도 아직 멀었어.\"", "\"예상한 결과입니다.\"", "\"의심의 여지가 있을까요?\"", "\"당신의 운에 맡긴다면, 이 끝에는 오직 한가지 길 밖에 없습니다.\"",
      "%d |4개의 모험:개의 모험들; 남음...", z, "%d |4개 파티:개의 파티들; 남음...", "(근접)", "(원거리)", "1.방문하기:", "2.다음 문자열을 복사하세요:", "당신이 완료한 모험에 대한 세부 기록입니다.", "만료까지 남은 시간:", "모험 보고서",
      z, "동료들이 지더라도 받는 보상입니다.", "임시 편성 초기화", "완료", "동료의 생명력이 변경되었습니다.", "모두 완료", "현재 단계: %s", "불확실성의 저주", "저주받은 모험가의 안내서", "저주받은 전술 안내서",
      "모든 적에게 디버프를 남겨, 이번 턴과 다음 3턴 동안 {}만큼 피해를 줍니다.", "패배", "파멸의 임무", "소요시간:", "파티 편집", "두 턴에 한 번씩, 무작위 적군은 최대 체력의 {}% 만큼 피해를 입습니다.", "임무에 패하고 각 동료마다 %s을 받습니다.", "첫번째 시전은 %d라운드 동안 유지됩니다", "동료 경험치", "2라운드 동안, 받는 피해를 1만큼 감소시키고 {}만큼 반격합니다.",
      "%s 후 체력 모두 회복", "계산된 미래들:", "가장 가까운 아군을 {}만큼 치유합니다.", "임시 파티에 합류 중 - %s ", "공격 받음:", "2턴동안 가장 가까운 아군이 받는 모든 피해를 {}%만큼 증가시킵니다.", "또한 3턴 동안 가까운 적에게 받는 피해를 {}만큼 증가시킵니다.", "가까운 아군의 공격력이 2턴 동안 {}만큼 증가합니다.", "무작위 적에게 {}의 피해를 입힙니다.", "범위 내의 모든 적에게 {}의 피해를 입힙니다.",
      "근접 범위에 있는 모든 적에게 {} 의 피해를 주고 자신의 공격력을 3턴 동안 20%만큼 증가시킵니다.", "자신은 {}만큼 피해를 입습니다.", "령이 부족합니다.", "아무런 효과가 없습니다.", "계산에 포함되지 않은 능력이 있습니다.", "모든 결과가 반영되지 않았습니다.", "예상:", "수량: %s", "무작위 아군의 받는 피해를 영구적으로 50% 만큼 감소시킵니다.", "2턴 동안 가까운 아군이 받는 피해를 {}%만큼 감소시킵니다.",
      "다음 턴동안 모든 적의 피해를 {}%만큼 감소시킵니다.", "2턴동안 모든 적의 공격력을 {}% 만큼 감소시킵니다.", "가장 멀리 있는 적의 공격력을 3라운드 동안 1만큼 감소시킵니다.", "가장 가까운 아군이 받는 피해를 2라운드 동안 5000% 만큼 감소시킵니다.", "적의 남은 체력: %s", "최소 1명의 동료가 포함되어야 합니다", "모험 보고서 초기화", z, "보상:", "동료 선택",
      "임시 파티 보내기", "모험 시작", "대상:", "이 임무의 임시 편성에 아래 신참들을 배정합니다.", "저주받은 모험가 안내서가 굶주려 있습니다. 당신의 모험담만이 그것을 만족시킬 것입니다.", "안내서가 여러가지 가능성을 보여줍니다. 그 중엔 승리하는 미래도 있고, 끔찍하게 실패하는 미래도 있습니다.", "이 동료들이 부대 레벨에 영향을 줍니다:", "효과 적용 주기", "모험 보고서를 전송하려면,", "%s 턴 동안 생존",
      "%s 턴 소요됨", "사용: 저주받은 모험가의 안내서에 먹이를 줍니다.", "사용: 심사숙고중인 안내서를 멈춥니다.", "사용: 안내서가 병력과 전술을 선택합니다.", "사용: 안내서를 읽어, 모험을 떠날 동료들의 운명을 가늠합니다.", "승리", "승리가 확실치 않습니다.", "수배중: 모험가 보고서", "병력 레벨은 동료들 중 레벨순으로 중앙값에 해당하는 동료(%s)의 레벨을 내림한 값으로 결정됩니다.", "[재사용: %d라운드]",
    }
    or C == "ruRU" and { -- 82/90 (91%)
      "\"%s возможные последствия и расчеты...\"", "\"Глава 1: Маги идут в рукопашную\"", "\"Не верьте в эту ложь! Друиды баланса не сухпаёк.\"", "\"Все вышло так, как и было предсказано.\"", "\"Все пошло не так, как ожидалось.\"", z, z, "\"Исход оказался таким, как и было предсказано.\"", "\"Разве были какие-либо сомнения?\"", "\"С твоей удачей, существует лишь один исход\"",
      "%d |4приключение:приключений; осталось завершить...", z, "%d |4группа осталась:группы осталось:групп осталось;...", "(ближний бой)", "(дальний бой)", "1. Ссылка на сайт:", "2. Скопируйте следующий текст:", "Подробный отчет о приключениях ваших спутников.", "Приключение исчезнет через:", "Отчет о приключениях",
      z, "Получаемый опыт, даже если ваши спутники потерпят неудачу.", "Очистить все пробные группы", "Нажмите для завершения", "Здоровье соратника изменилось.", "Завершить все", "Текущий прогресс: %s", "Проклятие Неопределенности", "Проклятое Руководство Искателя приключений", "Проклятое Тактическое Руководство",
      "Ослабляет всех противников, нанося {} урона мгновенно и в течение трех последующих ходов.", "Поражение", "Обреченный поход", "Длительность:", "Изменить группу", "Каждый ход случайному противнику наносится урон в размере {}% его максимального запаса здоровья.", "Неудачное завершение этого задания даст %s каждому спутнику.", "Первое произнесение заклинания в течении хода %d.", "Опыт спутника", "На два хода снижает входящий урон от атак на 1 ед. и контратакует на {}.",
      "Полное восстановление через %s", "Вариантов просчитано:", z, "В пробной группе - %s", "Входящие атаки:", z, "Увеличивает урон по ближайшему противнику на {} на три хода.", "Увеличивает урон ближайшего союзника на {} на два хода.", "Наносит {} урона случайному противнику.", "Наносит {} урона всем противникам на расстоянии.",
      "Наносит {} урона всем противникам в ближнем бою и увеличивает собственный урон на 20% на три хода.", "Наносит {} урона себе.", "Недостаточно анимы", "Ничего не делает.", "Не все способности были приняты в расчет.", "Не все последствия были проанализированы.", "Предварительный:", "Количество: %s", "Снижает урон, получаемый случайным союзником, на 50% в течении боя.", "Уменьшает получаемый ближайшим союзником урон на {}% на два хода.",
      "Уменьшает урон всех противников на {}% во время следующего хода.", z, "Снижает урон, наносимый самым дальним противником на 1 ед. в течении 3-х ходов.", "Снижает урон, получаемый ближайшим союзником на 5000% на 2 хода.", "Оставшееся здоровье противника: %s", "Требуется спутник в группе", "Удалить отчеты о приключениях", z, "Награды:", "Выберите спутников",
      "Отправить пробные группы", "Начать приключение", "Цели:", "Назначить пробную группу новичков на эту миссию", "Проклятое Руководство Искателя Приключений жаждет знаний. Только рассказы о приключениях ваших спутников, переданные в мучительных подробностях, удовлетворят его.", "Руководство показывает вам возможные варианты исхода событий. В некоторых случаях приключение заканчивается победой, в других - ужасной неудачей.", "Эти спутники влияют на уровень ваших отрядов:", "Пульсация:", "Чтобы подтвердить отчеты о приключениях,", "Ходов выжили: %s",
      "Ходов прошло: %s", "Использование: Утолить жажду знаний Проклятого Руководства Искателя Приключений.", "Использование: прервать размышления Руководства", "Использование: позволить Руководству выбрать отряды и расстановку.", "Использование: Прочитать Руководство, которое определит судьбу ваших спутников.", "Победа", "Победа не гарантирована.", "Разыскивается: Отчеты о приключениях", "Уровень вашего отряда - это средний уровень ваших спутников (%s), округленный в меньшую сторону.", "[Перезарядка: %dХ]",
    }
    or C == "zhCN" and { -- 83/90 (92%)
      "\"有%s的未来可能性且继续计算中...\"", "“第一章：法师都是近战。”", "“不要相信谎言！咕咕不是应急食品。”", "“一切正如预言里所说那样。”", "“结果并不如预言的那样。”", z, "就差一点点就赢了", "“正如预言所说那样。”", "“有什么问题吗？”", "“走狗屎运的话可能会赢。”",
      "%d冒险剩余...", z, "%d 队伍持续中...", "（近战）", "（远程）", "1.访问：", "2.复制下面的代码：", "一份由你的伙伴完成的冒险的详细记录。", "过期时间：", "冒险报告",
      z, "即使失败也会获得奖励。", "清除所有预设队列", "点击以完成", "伙伴生命值发生了变化。", "全部完成", "当前等级：%s", "结果不确定", "受诅咒的冒险指南", "受诅咒的战术指南",
      "对所有敌人施加负面效果，在此轮和接下来的三轮中分别造成{}伤害", "失败", "团灭", "持续时间：", "编辑预设队列", "每隔一个回合，一个随机敌人会受到{}％最大生命值的攻击。", "每个伙伴可从此失败的任务中获取%s", "在第%d轮时先发", "伙伴经验", "在接下来的两回合内减少受到的伤害并且还击{}。",
      "%s后完全恢复", "考虑的可能性：", z, "预设队列中：%s", "受到的攻击：", z, "受到来自最近敌人的伤害提高{}，持续三轮", "由最近的盟友造成的伤害提高{}持续两轮", "对一个随机敌人造成{}的伤害。", "对所有远程敌人造成{}伤害。",
      "在近战中对所有敌人造成{}伤害，并在三回合内增加20%的自身伤害。", "对自己造成{}的伤害", "心能不足", "没什么效果。", "没有考虑到所有的技能。", "未检验全部结果", "预估：", "数量：%s", "永久使一个随机友方受到的伤害降低50%。", "最近的盟友受到的伤害降低{}%，持续两轮",
      "下回合所有敌人造成的伤害降低 {}%", z, "降低1点来自最远敌人的伤害，持续3回合。", "使最近盟友受到的伤害降低5000%，持续2回合。", "敌人剩余生命值：%s", "小队中需要一名英雄", "重置冒险报告", z, "奖励：", "选择伙伴",
      "开始预设队列", "开始冒险吧", "目标：", "尝试指派这些新手参加这次冒险", "被诅咒的冒险指南已经饥渴难耐，只有来自你的冒险者的传奇故事才能满足它。", "指南展示了一系列可能的结果，既有胜利，也有可怕的失败。", "伙伴等级会影响你的部队等级。", "持续轮数：", "如要提交冒险报告，", "存活回合：%s",
      "需要回合：%s", "喂食这个饱受诅咒的冒险指南。", "使用：打断指南的思考", "使用：让这本书选择阵型和战术", "用法：阅读指南，然后决定你的冒险小队的命运。", "胜利", "不保证一定胜利", "需求：冒险报告", "你的部队等级是你随从等级中位数的向下取整数值(%s)。", "[冷却：%d轮]",
    }
    or C == "zhTW" and { -- 90/90 (100%)
      "\"%s 可能的未來並計算中...\"", "\"第一章：法師必須近戰。\"", "不要相信這個謊話！平衡德不是應急口糧。", "\"一切都如預期。\"", "\"不如預期。\"", "\"從失敗的口中奪取勝利！\"", "\"到目前為止是如此平分秋色。\"", "\"結果如同預期。\"", "\"有什麼疑問嗎？\"", "\"看你的運氣囉\"",
      "%d個冒險尚待完成...", "%d個同伴已經準備好冒險。", "%d個隊伍尚待處理...", "(近戰)", "(遠程)", "1. 訪問", "複製以下的文字：", "詳細戰鬥紀錄", "冒險過期還有:", "冒險報告",
      "所有同伴都準備好出發冒險了。", "即使冒險失敗仍會獲得獎勵", "清除所有隊伍分派", "點擊完成", "同伴生命值已經改變。", "全部完成", "目前進度:%s", "不確定性", "被詛咒的冒險者指南", "被詛咒的戰術指南",
      "給所有敵人減益，並在接下來的三個回合中，每回合造成{}點傷害。", "失敗", "自殺式出擊\r\n", "持續時間", "編輯隊伍", "每隔一個回合，一個隨機敵人會受到{}％最大血量的傷害", "任務失敗使每個同伴獲得%s經驗值", "在%d回合第一次施放", "追隨者經驗值", "在接下來的兩回合內減少受到的傷害並且還擊{}",
      "%s後完全恢復", "考慮過的未來:", "治療最近的盟友{}。", "在分派隊伍中: %s", "即將受到攻擊：", "使最近的盟友承受的所有傷害提高{}％，持續兩回合。", "使最近的敵人受到的所有傷害提高{}三回合。", "使最接近的盟友造成的傷害提高{}，持續兩回合。", "對隨機敵人造成{}傷害", "對遠距離的所有敵人造成{}傷害。",
      "在近戰中對所有敵人造成{}傷害，並在三回合內增加20%的自身傷害。", "對自身造成{}傷害。", "靈魄不足", "無效", "並非所有技能都被計算。", "並非所有結果都經過審查。", "初步:", "數量：%s", "永久減少隨機同伴的50%承受傷害。", "使最近的盟友受到的傷害降低{}％，持續兩回合。",
      "使所有敵人的傷害降低{}％，持續到下一回合。", "使所有敵人的傷害降低{}％，持續兩回合。", "對距離最遠的敵人減傷1點持續三回合", "使最近的盟友減傷5000%，持續兩回合。", "敵方剩餘血量：%s", "需要有同伴在隊伍中", "重置冒險報告", "即將返回:", "獎勵：", "選擇冒險者",
      "派發分配隊伍", "開始冒險", "目標：", "暫時將這些菜鳥分配給這次冒險。", "需要冒險報告以改善這個冒險指南", "本指南提供你幾個可能的結果。其中一些冒險會凱旋歸來；其他的則會是可怕的失敗。", "這些追隨者目前會影響你的部隊等級:", "技能回合", "提交你的冒險報告，", "存活回合：%s",
      "需要回合：%s", "使用：提供冒險經歷。", "使用: 中斷指南的審慮。", "使用: 讓本書選擇部隊和戰鬥策略。", "使用：閱讀本指南，決定你的冒險隊伍的命運。", "勝利", "無法保證勝利。", "徵求：冒險報告", "您的部隊等級是追隨者等級的中位數(%s)取整數。", "[冷卻:%d 回合]",
    }
    or C == "ptBR" and { -- 90/90 (100%)
      "\"%s futuros possíveis e ainda mais...\"", "Capítulo 1: Magos Corpo a Corpo", "\"Não acredite nas suas mentiras! Druidas Equilíbrio não são rações de emergência.\"", "\"Tudo aconteceu como previsto.\"", "\"Nada foi como esperado.\"", "Vitória arrancada das garras da derrota!", "Tão perto mas tão longe.", "\"O resultado foi como previsto.\"", "\"Havia alguma dúvida?\"", "\"Com a sua sorte, só há um jeito de isso acabar.\"",
      "%d |4aventura:aventuras; restando...", "%d |4companheiro está pronto:companheiros estão prontos; para aventuras.", "%d |4grupo:grupos; restando...", "(corpo a corpo)", "(longo alcance)", "1. Visite:", "2. Copie o seguinte texto:", "Um registro detalhado de uma aventura realizada por seus companheiros.", "Aventura Expira em:", "Relatório da Aventura",
      "Todos os companheiros estão prontos para aventuras.", "Concedido mesmo que os aventureiros sejam derrotados.", "Limpar todos os grupos provisórios", "Clique para completar", "A vida do companheiro foi alterada.", "Completar Tudo", "Progresso Atual: %s", "Maldição da Incerteza", "Guia Amaldiçoado dos Aventureiros", "Guia Tático Amaldiçoado",
      "Penaliza todos os inimigos, causando {} de dano neste turno e durante os próximos três turnos.", "Derrota", "Operação Sentenciada", "Duração:", "Editar grupo", "A cada dois turnos, um inimigo aleatório é atacado com {}% de sua vida máxima.", "O fracasso nesta missão concede %s a cada companheiro.", "Primeiro lançamento durante o turno %d.", "EXP do Seguidor", "Por duas rodadas, reduz o dano causado pelos ataques recebidos em 1 e revida por {}.",
      "Recuperação total em %s", "Futuros considerados:", "Cura o aliado mais próximo por {}.", "Em Grupo Provisório - %s", "Ataques recebidos:", "Aumenta todo o dano tomado pelo aliado mais próximo em {}% por dois turnos.", "Aumenta todo o dano tomado pelo inimigo mais próximo em {} por três turnos.", "Aumenta o dano causado pelo aliado mais próximo em {} por dois turnos.", "Causa {} de dano a um inimigo aleatório.", "Causa {} de dano a todos os inimigos em alcance.",
      "Causa {} de dano a todos os inimigos em alcance corpo-a-corpo, e aumenta o próprio dano infligido em 20% por três turnos.", "Causa {} de dano a si mesmo.", "Anima insuficiente", "Não faz nada.", "Nem todas as habilidades foram levadas em consideração.", "Nem todos os resultados foram examinados.", "Preliminar:", "Quantidade: %s", "Reduz o dano recebido por um aliado aleatório em 50%. Para sempre.", "Reduz todo o dano recebido pelo aliado mais próximo em {}% por dois turnos.",
      "Reduz em {}% o dano causado por todos os inimigos no próximo turno.", "Reduz o dano causado por todos os inimigos em {}% por dois turnos.", "Reduz o dano causado pelo inimigo mais distante em 1 por 3 rodadas.", "Reduz o dano recebido pelo aliado mais próximo em 5000% por duas rodadas.", "Vida restante do inimigo: %s", "Requer um companheiro no grupo", "Resetar Relatórios de Aventura", "Retornando em breve:", "Recompensas:", "Selecione aventureiros",
      "Enviar Grupos Provisórios", "Comece a aventura", "Alvos:", "Indicar provisoriamente esses novatos a esta aventura.", "O Guia do Aventureiro Amaldiçoado tem fome. Somente as histórias das aventuras de seus companheiros, transmitidas em detalhes excruciantes, irão satisfazê-lo.", "O guia mostra vários futuros possíveis. Em alguns, a aventura termina em triunfo; em outros, uma derrota particularmente horrível.", "Estes companheiros atualmente afetam o nível das suas tropas:", "Pulso:", "Para enviar seus relatórios de aventura,", "Turnos sobrevividos: %s",
      "Turnos tomados: %s", "Uso: Alimente o Guia do Aventureiro Amaldiçoado.", "Uso: Interrompe as deliberações do guia.", "Uso: Deixe o livro selecionar tropas e táticas de batalha.", "Use: Leia o guia, determinando o destino do seu grupo de aventureiros.", "Vitória", "A vitória não pôde ser garantida.", "Procurado: Relatórios de Aventura", "O nível das suas tropas é a mediana do nível dos seus companheiros (%s), arrendodada para baixo.", "[Recarga: %dT]",
    } or nil

K = V and {
      "\"%s possible futures and counting...\"", "\"Chapter 1: Mages Must Melee.\"", "\"Do not believe its lies! Balance druids are not emergency rations.\"", "\"Everything went as foretold.\"", "\"Nothing went as expected.\"", "\"Snatch victory from the jaws of defeat!\"", "\"So close, and yet so far.\"", "\"The outcome was as foretold.\"", "\"Was there ever any doubt?\"", "\"With your luck, there is only one way this ends.\"",
      "%d |4adventure:adventures; remaining...", "%d |4companion is:companions are; ready for adventures.", "%d |4party:parties; remaining...", "(melee)", "(ranged)", "1. Visit:", "2. Copy the following text:", "A detailed record of an adventure completed by your companions.", "Adventure Expires In:", "Adventure Report",
      "All companions are ready for adventures.", "Awarded even if the adventurers are defeated.", "Clear all tentative parties", "Click to complete", "Companion health has changed.", "Complete All", "Current Progress: %s", "Curse of Uncertainty", "Cursed Adventurer's Guide", "Cursed Tactical Guide",
      "Debuffs all enemies, dealing {} damage this turn and during each of the next three turns.", "Defeated", "Doomed Run", "Duration:", "Edit party", "Every other turn, a random enemy is attacked for {}% of their maximum health.", "Failing this mission grants %s to each companion.", "First cast during turn %d.", "Follower XP", "For two turns, reduces the damage dealt by incoming attacks by 1 and retaliates for {}.",
      "Full recovery in %s", "Futures considered:", "Heals the closest ally for {}.", "In Tentative Group - %s", "Incoming attacks:", "Increases all damage taken by the closest ally by {}% for two turns.", "Increases all damage taken by the nearest enemy by {} for three turns.", "Increases damage dealt by the closest ally by {} for two turns.", "Inflicts {} damage to a random enemy.", "Inflicts {} damage to all enemies at range.",
      "Inflicts {} damage to all enemies in melee, and increases own damage dealt by 20% for three turns.", "Inflicts {} damage to self.", "Insufficient anima", "It does nothing.", "Not all abilities have been taken into account.", "Not all outcomes have been examined.", "Preliminary:", "Quantity: %s", "Reduces all damage taken by a random ally by 50%. Forever.", "Reduces all damage taken by the closest ally by {}% for two turns.",
      "Reduces all enemies' damage dealt by {}% during the next turn.", "Reduces all enemies' damage dealt by {}% for two turns.", "Reduces the damage dealt by the furthest enemy by 1 for three turns.", "Reduces the damage taken by the closest ally by 5000% for two turns.", "Remaining enemy health: %s", "Requires a companion in the party", "Reset Adventure Reports", "Returning soon:", "Rewards:", "Select adventurers",
      "Send Tentative Parties", "Start the adventure", "Targets:", "Tentatively assign these rookies to this adventure.", "The Cursed Adventurer's Guide hungers. Only the tales of your companions' adventures, conveyed in excruciating detail, will satisfy it.", "The guide shows you a number of possible futures. In some, the adventure ends in triumph; in others, a particularly horrible failure.", "These companions currently affect your troop level:", "Ticks:", "To submit your adventure reports,", "Turns survived: %s",
      "Turns taken: %s", "Use: Feed the Cursed Adventurer's Guide.", "Use: Interrupt the guide's deliberations.", "Use: Let the book select troops and battle tactics.", "Use: Read the guide, determining the fate of your adventuring party.", "Victorious", "Victory could not be guaranteed.", "Wanted: Adventure Reports", "Your troop level is the median level of your companions (%s), rounded down.", "[CD: %dT]",
}

local L = K and {}
for i=1,K and #K or 0 do
	L[K[i]] = V[i]
end

T.LT = L or nil