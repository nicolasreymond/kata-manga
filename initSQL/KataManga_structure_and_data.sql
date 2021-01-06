DROP DATABASE `KataManga`;
CREATE DATABASE IF NOT EXISTS `KataManga` DEFAULT CHARACTER SET utf8mb4;
USE `KataManga`;
SET
  NAMES utf8;
SET
  character_set_client = utf8;
SET
  SESSION sql_mode = '';
--
  -- Table structure for table `author`
  --
  DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
    `id` int(11) NOT NULL,
    `first_name` varchar(50) NOT NULL,
    `last_name` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- Table structure for table `classify`
  --
  DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
    `idmanga` int(11) NOT NULL,
    `idgenre` int(11) NOT NULL,
    PRIMARY KEY (`idmanga`, `idgenre`),
    KEY `fk_genre_idx` (`idgenre`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- Table structure for table `genre`
  --
  DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
    `id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `description` mediumtext DEFAULT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- Table structure for table `magazine`
  --
  DROP TABLE IF EXISTS `magazine`;
CREATE TABLE `magazine` (
    `id` int(11) NOT NULL,
    `name` varchar(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    UNIQUE KEY `name_UNIQUE` (`name`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- Table structure for table `manga`
  --
  DROP TABLE IF EXISTS `manga`;
CREATE TABLE `manga` (
    `id` int(11) NOT NULL,
    `rank` int(3) DEFAULT NULL,
    `title` varchar(255) NOT NULL,
    `status` varchar(20) DEFAULT NULL,
    `start_date` date DEFAULT NULL,
    `end_date` date DEFAULT NULL,
    `synopsis` mediumtext DEFAULT NULL,
    `image_url` varchar(255) DEFAULT NULL,
    `num_chapters` int(2) DEFAULT NULL,
    `num_volumes` int(2) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `manga_id_IDX` (`id`) USING BTREE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- Table structure for table `publish`
  --
  DROP TABLE IF EXISTS `publish`;
CREATE TABLE `publish` (
    `idmanga` int(11) NOT NULL,
    `idmagazine` int(11) NOT NULL,
    PRIMARY KEY (`idmanga`, `idmagazine`),
    KEY `fk_magazine_idx` (`idmagazine`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- Table structure for table `write`
  --
  DROP TABLE IF EXISTS `write`;
CREATE TABLE `write` (
    `idmanga` int(11) NOT NULL,
    `idauthor` int(11) NOT NULL,
    `role` varchar(45) NOT NULL,
    PRIMARY KEY (`idmanga`, `idauthor`),
    KEY `fk_author_idx` (`idauthor`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- # -------------------------------------------------------------------------manga
  REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    2,
    1,
    "Berserk",
    "currently_publishing",
    "1989-08-25",
    null,
    "Guts, a former mercenary now known as the \"Black Swordsman,\" is out for revenge. After a tumultuous childhood, he finally finds someone he respects and believes he can trust, only to have everything fall apart when this person takes away everything important to Guts for the purpose of fulfilling his own desires. Now marked for death, Guts becomes condemned to a fate in which he is relentlessly pursued by demonic beings.\n\nSetting out on a dreadful quest riddled with misfortune, Guts, armed with a massive sword and monstrous strength, will let nothing stop him, not even death itself, until he is finally able to take the head of the one who stripped him—and his loved one—of their humanity.\n\n[Written by MAL Rewrite]\n\nIncluded one-shot:\nVolume 14: Berserk: The Prototype",
    "https://api-cdn.myanimelist.net/images/manga/1/157931l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1706,
    2,
    "JoJo no Kimyou na Bouken Part 7: Steel Ball Run",
    "finished",
    "2004-01-19",
    "2011-04-19",
    "In the American Old West, the world\'s greatest race is about to begin. Thousands line up in San Diego to travel over six thousand kilometers for a chance to win the grand prize of fifty million dollars. With the era of the horse reaching its end, contestants are allowed to use any kind of vehicle they wish. Competitors will have to endure grueling conditions, traveling up to a hundred kilometers a day through uncharted wastelands. The Steel Ball Run is truly a one-of-a-kind event.\n\nThe youthful Johnny Joestar, a crippled former horse racer, has come to San Diego to watch the start of the race. There he encounters Gyro Zeppeli, a racer with two steel balls at his waist instead of a gun. Johnny witnesses Gyro using one of his steel balls to unleash a fantastical power, compelling a man to fire his gun at himself during a duel. In the midst of the action, Johnny happens to touch the steel ball and feels a power surging through his legs, allowing him to stand up for the first time in two years. Vowing to find the secret of the steel balls, Johnny decides to compete in the race, and so begins his bizarre adventure across America on the Steel Ball Run.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/179882l.jpg",
    24,
    96
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    25,
    3,
    "Fullmetal Alchemist",
    "finished",
    "2001-07-12",
    "2010-09-11",
    "Alchemists are knowledgeable and naturally talented individuals who can manipulate and modify matter due to their art. Yet despite the wide range of possibilities, alchemy is not as all-powerful as most would believe. Human transmutation is strictly forbidden, and whoever attempts it risks severe consequences. Even so, siblings Edward and Alphonse Elric decide to ignore this great taboo and bring their mother back to life. Unfortunately, not only do they fail in resurrecting her, they also pay an extremely high price for their arrogance: Edward loses his left leg and Alphonse his entire body. Furthermore, Edward also gives up his right arm in order to seal his brother\'s soul into a suit of armor.\n\nYears later, the young alchemists travel across the country looking for the Philosopher\'s Stone, in the hopes of recovering their old bodies with its power. However, their quest for the fated stone also leads them to unravel far darker secrets than they could ever imagine.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/27600l.jpg",
    27,
    116
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    13,
    4,
    "One Piece",
    "currently_publishing",
    "1997-07-22",
    null,
    "Gol D. Roger, a man referred to as the \"Pirate King,\" is set to be executed by the World Government. But just before his demise, he confirms the existence of a great treasure, One Piece, located somewhere within the vast ocean known as the Grand Line. Announcing that One Piece can be claimed by anyone worthy enough to reach it, the Pirate King is executed and the Great Age of Pirates begins.\n\nTwenty-two years later, a young man by the name of Monkey D. Luffy is ready to embark on his own adventure, searching for One Piece and striving to become the new Pirate King. Armed with just a straw hat, a small boat, and an elastic body, he sets out on a fantastic journey to gather his own crew and a worthy ship that will take them across the Grand Line to claim the greatest status on the high seas.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/55539l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1,
    5,
    "Monster",
    "finished",
    "1994-12-05",
    "2001-12-20",
    "Kenzou Tenma, a renowned Japanese neurosurgeon working in post-war Germany, faces a difficult choice: to operate on Johan Liebert, an orphan boy on the verge of death, or on the mayor of Düsseldorf. In the end, Tenma decides to gamble his reputation by saving Johan, effectively leaving the mayor for dead.\n\nAs a consequence of his actions, hospital director Heinemann strips Tenma of his position, and Heinemann\'s daughter Eva breaks off their engagement. Disgraced and shunned by his colleagues, Tenma loses all hope of a successful career—that is, until the mysterious killing of Heinemann gives him another chance.\n\nNine years later, Tenma is the head of the surgical department and close to becoming the director himself. Although all seems well for him at first, he soon becomes entangled in a chain of gruesome murders that have taken place throughout Germany. The culprit is a monster—the same one that Tenma saved on that fateful day nine years ago.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/54525l.jpg",
    18,
    162
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    656,
    6,
    "Vagabond",
    "on_hiatus",
    "1998-09-03",
    "2015-05-21",
    "In 16th century Japan, Shinmen Takezou is a wild, rough young man, in both his appearance and his actions. His aggressive nature has won him the collective reproach and fear of his village, leading him and his best friend, Matahachi Honiden, to run away in search of something grander than provincial life. The pair enlist in the Toyotomi army, yearning for glory—but when the Toyotomi suffer a crushing defeat at the hands of the Tokugawa Clan at the Battle of Sekigahara, the friends barely make it out alive.\n\nAfter the two are separated, Shinmen returns home on a self-appointed mission to notify the Hon\'iden family of Matahachi\'s survival. He instead finds himself a wanted criminal, framed for his friend\'s supposed murder based on his history of violence. Upon being captured, he is strung up on a tree and left to die. An itinerant monk, the distinguished Takuan Soho, takes pity on the \"devil child,\" secretly freeing Shinmen and christening him with a new name to avoid pursuit by the authorities: Musashi Miyamoto.\n\nVagabond is the fictitious retelling of the life of one of Japan\'s most renowned swordsmen, the \"Sword Saint\" Musashi Miyamoto—his rise from a swordsman with no desire other than to become \"Invincible Under the Heavens\" to an enlightened warrior who slowly learns of the importance of close friends, self-reflection, and life itself.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/181787l.jpg",
    37,
    327
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    4632,
    7,
    "Oyasumi Punpun",
    "finished",
    "2007-03-15",
    "2013-11-02",
    "Punpun Onodera is a normal 11-year-old boy living in Japan. Hopelessly idealistic and romantic, Punpun begins to see his life take a subtle—though nonetheless startling—turn to the adult when he meets the new girl in his class, Aiko Tanaka. It is then that the quiet boy learns just how fickle maintaining a relationship can be, and the surmounting difficulties of transitioning from a naïve boyhood to a convoluted adulthood. When his father assaults his mother one night, Punpun realizes another thing: those whom he looked up to were not as impressive as he once thought.\n\nAs his problems increase, Punpun\'s once shy demeanor turns into voluntary reclusiveness. Rather than curing him of his problems and conflicting emotions, this merely intensifies them, sending him down the dark path of maturity in this grim coming-of-age saga.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/164420l.jpg",
    13,
    147
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    70345,
    8,
    "Grand Blue",
    "currently_publishing",
    "2014-04-07",
    null,
    "Among the seaside town of Izu\'s ocean waves and rays of shining sun, Iori Kitahara is just beginning his freshman year at Izu University. As he moves into his uncle\'s scuba diving shop, Grand Blue, he eagerly anticipates his dream college life, filled with beautiful girls and good friends.\n\nBut things don\'t exactly go according to plan. Upon entering the shop, he encounters a group of rowdy, naked upperclassmen, who immediately coerce him into participating in their alcoholic activities. Though unwilling at first, Iori quickly gives in and becomes the heart and soul of the party. Unfortunately, this earns him the scorn of his cousin, Chisa Kotegawa, who walks in at precisely the wrong time. Undeterred, Iori still vows to realize his ideal college life, but will things go according to plan this time, or will his situation take yet another dive?\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/166124l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    51,
    9,
    "Slam Dunk",
    "finished",
    "1990-09-18",
    "1996-06-04",
    "Hanamichi Sakuragi, a tall, boisterous teenager with flame-red hair and physical strength beyond his years, is eager to put an end to his rejection streak of 50 and finally score a girlfriend as he begins his first year of Shohoku High. However, his reputation for delinquency and destructiveness precedes him, and most of his fellow students subsequently avoid him like the plague. As his first day of school ends, he is left with two strong thoughts: \"I hate basketball\" and \"I need a girlfriend.\"\n\nHaruko Akagi, ignorant of Hanamichi\'s history of misbehavior, notices his immense height and unwittingly approaches him, asking whether or not he likes basketball. Overcome by the fact that a girl is speaking to him, the red-haired giant blurts out a yes despite his true feelings. At the gym, Haruko asks if he can do a slam dunk. Though a complete novice, Hanamachi palms the ball and makes the leap...but overshoots, slamming his head into the backboard. Amazed by his near-inhuman physical abilities, Haruko quickly notifies the school\'s basketball captain of his feat. With this, Hanamichi is unexpectedly thrust into a world of competition for a girl he barely knows, but he soon discovers that there is perhaps more to basketball than he once thought.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/157904l.jpg",
    31,
    276
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    16765,
    10,
    "Kingdom",
    "currently_publishing",
    "2006-01-26",
    null,
    "During the Warring States period in China, Li Xin and Piao are two brother-like youngsters who dream of becoming Great Generals, despite their low status as orphaned slaves. One day, they encounter a man of nobility, who gives Piao an opportunity to undertake an important duty within the state of Qin\'s royal palace. Parting ways, Xin and Piao promise each other to one day become the greatest generals in the world. However, after a fierce coup d\'état occurs in the palace, Xin meets with a dying Piao, whose last words spur him into action and lead him to encounter the young and soon-to-be king of Qin, Ying Zheng.\n\nAlthough initially on bad terms, Xin and Zheng become comrades and start on a path filled with trials and bloodshed. Zheng\'s objective is to bring all the warring states under Qin, and Xin seeks to climb to the very top of the army ranks. Against a backdrop of constant tactical battle between states and great political unrest, both outside and within the palace, the two endeavor towards their monumental ambitions that will change history forever.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/171872l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    3,
    11,
    "20th Century Boys",
    "finished",
    "1999-09-27",
    "2006-04-24",
    "As the 20th century approaches its end, people all over the world are anxious that the world is changing. And probably not for the better.\n\nKenji Endo is a normal convenience store manager who\'s just trying to get by. But when he learns that one of his old friends going by the name \"Donkey\" has suddenly committed suicide, and that a new cult led by a figure known as \"Friend\" is becoming more notorious, Kenji starts to feel that something isn\'t right. With a few key clues left behind by his deceased friend, Kenji realizes that this cult is much more than he ever thought it would be—not only is this mysterious organization directly targeting him and his childhood friends, but the whole world also faces a grave danger that only the friends have the key to stop.\n\nKenji\'s simple life of barely making ends meet is flipped upside down when he reunites with his childhood friends, and together they must figure out the truth of how their past is connected to the cult, as the turn of the century could mean the possible end of the world.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/54437l.jpg",
    22,
    249
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    90125,
    12,
    "Kaguya-sama wa Kokurasetai: Tensai-tachi no Renai Zunousen",
    "currently_publishing",
    "2015-05-19",
    null,
    "Considered a genius due to having the highest grades in the country, Miyuki Shirogane leads the prestigious Shuchiin Academy\'s student council as its president, working alongside the beautiful and wealthy vice president Kaguya Shinomiya. The two are often regarded as the perfect couple by students despite them not being in any sort of romantic relationship.\n\nHowever, the truth is that after spending so much time together, the two have developed feelings for one another; unfortunately, neither is willing to confess, as doing so would be a sign of weakness. With their pride as elite students on the line, Miyuki and Kaguya embark on a quest to do whatever is necessary to get a confession out of the other. Through their daily antics, the battle of love begins!\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/188896l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    35243,
    13,
    "Haikyuu!!",
    "finished",
    "2012-02-20",
    "2020-07-20",
    "The whistle blows. The ball is up. A dig. A set. A spike.\n\nVolleyball. A sport where two teams face off, separated by a formidable, wall-like net.\n\nThe \"Little Giant,\" standing at only 170 cm, overcomes the towering net and the wall of blockers. The awe-inspired Shouyou Hinata looks on at the ace\'s crow-like figure. Determined to reach great heights like the Little Giant, small-statured Hinata finally manages to form a team in his last year of junior high school, and enters his first volleyball tournament. However, his team is utterly defeated in their first game against the powerhouse school Kitagawa Daiichi, led by the genius, but oppressive setter dubbed the \"King of the Court,\" Tobio Kageyama.\n\nHinata enrolls into Karasuno High School seeking  to take revenge against Kageyama in an official high school match and to follow in the Little Giant\'s footsteps—but his plans are ruined when he opens the gymnasium door to find Kageyama as one of his teammates.\n\nNow, Hinata must establish himself on the team and work alongside the problematic Kageyama to overcome his shortcomings and to fulfill his dream of making it to the top of the high school volleyball world.\n\n[Written by MAL Rewrite]\n\nIncluded one-shot:\nVolume 14: Nisekyuu!!",
    "https://api-cdn.myanimelist.net/images/manga/4/89519l.jpg",
    45,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    336,
    14,
    "GTO",
    "finished",
    "1996-12-11",
    "2002-01-30",
    "22-year-old Eikichi Onizuka: pervert, former gang member... and teacher?\n\nGreat Teacher Onizuka follows the incredible, though often ridiculous, antics of the titular teacher as he attempts to outwit and win over the cunning Class 3-4 that is determined to have him removed from the school. However, other obstacles present themselves throughout—including the frustrated, balding vice principal, Hiroshi Uchiyamada; old enemies from his biker days; and his own idiotic teaching methods. But Eikichi fights it all whilst trying to help his students, romance fellow teacher Azusa Fuyutsuki, and earn his self-proclaimed title.\n\n[Written by MAL Rewrite]\n\nAlso contains the gaiden \"GTO: Great Toroko Oppai♡\" (Tomoko\'s Big Adventures).",
    "https://api-cdn.myanimelist.net/images/manga/2/172982l.jpg",
    25,
    208
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    642,
    15,
    "Vinland Saga",
    "currently_publishing",
    "2005-04-13",
    null,
    "Thorfinn, son of one of the Vikings\' greatest warriors, is among the finest fighters in the merry band of mercenaries run by the cunning Askeladd, an impressive feat for a person his age. However, Thorfinn is not part of the group for the plunder it entails—instead, for having caused his family great tragedy, the boy has vowed to kill Askeladd in a fair duel. Not yet skilled enough to defeat him, but unable to abandon his vengeance, Thorfinn spends his boyhood with the mercenary crew, honing his skills on the battlefield among the war-loving Danes, where killing is just another pleasure of life.\n\nOne day, when Askeladd receives word that Danish prince Canute has been taken hostage, he hatches an ambitious plot—one that will decide the next King of England and drastically alter the lives of Thorfinn, Canute, and himself. Set in 11th century Europe, Vinland Saga tells a bloody epic in an era where violence, madness, and injustice are inescapable, providing a paradise for the battle-crazed and utter hell for the rest who live in it.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/188925l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    91941,
    16,
    "Made in Abyss",
    "currently_publishing",
    "2012-10-20",
    null,
    "The Abyss, a hole of unprecedented depth—one young girl and a robot brave its dangers to find the truth.\n\nThe town of Orth is a special one, as it is built around the edges of the massive Abyss, a wonder which has never been fully explored. Those who venture too far down never return, but those brave enough to traverse its territories are known as \"Cave Raiders\" and are heralded as legends. Within this town lives a young girl called Riko, the child of one of the most famous Cave Raiders of all time who disappeared on an expedition many years ago.\n\nOne day, Riko\'s life changes when she meets a strange robot called Regu, who seems to appear from within the Abyss. Believing this to be a sign from her mother stuck at the bottom of the Abyss, Riko descends into its depths with Regu, ready to confront all the dangers within it.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/161645l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    104,
    17,
    "Yotsuba to!",
    "currently_publishing",
    "2003-03-21",
    null,
    "Yotsuba\'s daily life is full of adventure. She is energetic, curious, and a bit odd—odd enough to be called strange by her father as well as ignorant of many things that even a five-year-old should know. Because of this, the most ordinary experience can become an adventure for her. As the days progress, she makes new friends and shows those around her that every day can be enjoyable.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/57369l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    651,
    18,
    "Kaze no Tani no Nausicaä",
    "finished",
    "1982-10-09",
    "1994-02-10",
    "Humanity, once a technologically advanced and thriving civilization, has been pushed to the brink of extinction following a cataclysmic war known as the \"Seven Days of Fire.\" The remnants of the human race now live in scattered kingdoms to avoid the unrelenting spread of the \"Sea of Corruption,\" a colossal forest infested with dangerous mutant insects and fungi that produce poisonous spores.\n\nNausicaä, sole heir to the throne of the agricultural kingdom Valley of the Wind, is thrust into a war after an ally kingdom, the imperialist Torumekia, invades the Dorok Empire. Forced to fight alongside the Torumekian military and their cunning princess Kushana, Nausicaä witnesses firsthand the horrors of war and its effect on both humanity and the environment. With her uncanny charisma and gentle nature, Nausicaä may be the only for hope for humanity as the ongoing war and the Sea of Corruption hasten the extinction of mankind.\n\nSet against the backdrop of a devastated world, Kaze no Tani no Nausicaä depicts the aftermath of human folly and the immortal power of nature.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/156624l.jpg",
    7,
    59
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1303,
    19,
    "Ashita no Joe",
    "finished",
    "1968-01-01",
    "1973-05-13",
    "Joe Yabuki is a troubled young man who runs away from an orphanage. Wandering through the Tokyo slums, he meets former boxing trainer Danpei. Joe is later arrested and goes to a temporary jail where he fights Nishi, his future best friend and leader of a group of hooligans. He and Nishi then go to a juvenile prison miles away from Tokyo. There Joe meets Rikiishi, a former boxing prodigy, and a rivalry develops between them. They face each other in a match in which Rikiishi dominates Joe until the latter hits him with a cross-counter, resulting in both being knocked out. This inspires the other prison inmates to take up boxing. Joe and Rikiishi vow to fight again.\n\n(Source: Wikipedia)",
    "https://api-cdn.myanimelist.net/images/manga/4/75029l.jpg",
    20,
    171
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    56805,
    20,
    "Koe no Katachi",
    "finished",
    "2013-08-07",
    "2014-11-19",
    "Shouya Ishida, a boy always looking for ways to beat boredom, ends up looking for it in the wrong place. Weirded out by his new classmate, a deaf transfer student named Shouko Nishimiya, he deems her as the target of his ostracizing and bullying. Day after day, Shouya picks on Shouko, unaware of the effects of his thoughtless actions. He finally understands the pain he has inflicted on her when one day, his bullying culminates in her leaving the school, and his classmates begin to shun and harass him every chance they get instead. Determined to right his wrongs, five years later, Shouya, now a third year high school loner, meets Shouko again. Thus begins the story of a young man\'s path to redemption.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/120529l.jpg",
    7,
    64
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1224,
    21,
    "3-gatsu no Lion",
    "currently_publishing",
    "2007-07-13",
    null,
    "Rei Kiriyama is an extraordinary shogi player. Among the few elites to have gone professional as a middle school student, he is considered a genius. But what lies behind his prodigious facade is a teenage boy who suffers immense pressure from both his family, and from the high expectations from the shogi community. Rei moves out to live a more independent life away from his family, but his unorganized lifestyle and unsociable personality show no signs of improvement.\n\nHowever, in a twist of fate that will prove to be a turning point in his life, Rei then encounters the Kawamoto sisters—the motherly Akari, the passionate Hinata, and the energetic Momo—who take great care of him. 3-gatsu no Lion tells the story of Rei as he reshapes his melancholic life and picks up the courage to begin facing the problems he evaded during his past.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/52281l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    21525,
    22,
    "Akatsuki no Yona",
    "currently_publishing",
    "2009-08-05",
    null,
    "Once upon a time, the kingdom of Kouka was ruled by a red dragon in human form. By his side, four warriors imbued with dragon blood helped him lead the kingdom to prosperity. Time passed, and this tale became a legend to tell children.\n\nAs the sole princess of Kouka, Yona lives a life of lavish ease. In love with her cousin, Su-won, and protected by her bodyguard, Son Hak, she wants for nothing and remains sheltered from the harrowing reality outside the castle walls. Contrary to this peaceful illusion, Kouka is about to undergo a political upheaval. After her beloved Su-won stages a bloody coup and murders her father, Yona is forced to flee with only Hak by her side.\n\nThough surrounded by enemies on all sides, the banished princess still yearns to save her kingdom. Her solution comes from an exiled priest, who tells her that her only hope is to find the four legendary dragon warriors. Guided by this seemingly fictitious myth, Yona sets out to find these warriors, determined to restore her kingdom.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/153249l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    14483,
    23,
    "Uchuu Kyoudai",
    "currently_publishing",
    "2007-12-06",
    null,
    "\"A big brother must always stay ahead of his younger brother. That is my responsibility as the older sibling\"—these are the words that have always motivated Mutta Nanba to try his best when it came to his younger brother Hibito. So naturally, in the summer of 2006 when the Nanba brothers witness something strange in the night sky, Hibito declared that he would become an astronaut and travel to the Moon, while Mutta countered with the affirmation that he would go to Mars. That was the promise they made to each other.\n\nNow in 2025, while Hibito is working with NASA and preparing to become the first Japanese to land on the moon, Mutta has been fired from his job in an automotive development company. Having difficulty finding another job, Mutta is given a lifetime opportunity when he receives a letter from JAXA—the Japan Aerospace Exploration Agency—telling him that he\'s been accepted to participate in the next astronaut selection. As if fate has given him a chance to fulfill the promise he made all those years ago, Mutta undertakes the difficult challenge of going to space.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/166256l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    44489,
    24,
    "Houseki no Kuni",
    "currently_publishing",
    "2012-10-25",
    null,
    "Long ago, Earth was struck by six meteorites, creating six moons and leaving a lone island in their wake. Those who could not make it to the island sank to the bottom of the ocean, where, over time, they slowly turned to crystal. As countless millennia passed, 28 of these crystallized lifeforms, known as the Lustrous, rose from the depths and resided on the island. Led by the wise Kongou-sensei, they must defend themselves against the seemingly infinite number of Lunarians, inhabitants of the moons who seek to harvest their valuable bodies for crafting weapons and jewelry. \n\nHouseki no Kuni centers around Phosphophyllite, a young gem about to turn three hundred years old. Clumsy, extremely fragile, and having no visible talent, they are one of the weakest gems around, unable to help in the fight against the Lunarians in any meaningful way. But as the battle with the otherworldly invaders rages on, they soon learn that power comes at a cost that no one should have to pay.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/115443l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    418,
    25,
    "Mushishi",
    "finished",
    "1999-11-00",
    "2008-08-25",
    "\"Mushi\": the most basic forms of life in the world. They exist without any goals or purposes aside from simply \"being.\" They are beyond the shackles of the words \"good\" and \"evil.\" Mushi can exist in countless forms and are capable of mimicking things from the natural world such as plants, diseases, and even phenomena like rainbows.\n\nThis is, however, just a vague definition of these entities that inhabit the vibrant world of Mushishi, as to even call them a form of life would be an oversimplification. Detailed information on mushi is scarce because the majority of humans are unaware of their existence.\n\nSo what are mushi and why do they exist? This is the question that a \"Mushishi,\" Ginko, ponders constantly. Mushishi are those who research mushi in hopes of understanding their place in the world\'s hierarchy of life.\n\nGinko relentlessly chases rumors of occurrences that could be tied to mushi, all for the sake of finding an answer.\n\nIt could, after all, lead to the meaning of life itself.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/159514l.jpg",
    10,
    50
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    657,
    26,
    "Real",
    "currently_publishing",
    "1999-00-00",
    null,
    "Tomomi Nomiya, former captain of his high school\'s basketball team turned delinquent, decides to drop out of school after he is crushed by the guilt of ruining a young girl\'s life in a traffic accident. As he dedicates his free time to helping her, he stumbles upon Kiyoharu Togawa, a former sprinter who has lost the use of his right leg and now plays wheelchair basketball as an alternate outlet.\n\nAfter challenging Kiyoharu to a one-on-one game, Tomomi is completely defeated. Inspired by this encounter, he realizes that he can\'t let his love for basketball die so easily and decides that he will do what he can to help others while striving to become a professional player. Meanwhile, Hisanobu Takahashi, Tomomi\'s replacement as the high school\'s team captain, gets into an accident and finds himself permanently paralyzed below the waist. Real tells the touching tale of these three young men as they struggle to overcome their disabilities and inner conflicts in order to achieve their dreams while igniting a passion that will bring them together.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/115969l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    100448,
    27,
    "Jumyou wo Kaitotte Moratta. Ichinen ni Tsuki, Ichimanen de.",
    "finished",
    "2016-08-10",
    "2017-10-25",
    "Helpless and struggling for cash, 20-year-old Kusunoki sells the last of his possessions to buy food. Noticing his poverty, an old shop owner directs him to a store that supposedly purchases lifespan, time, and health. While not completely believing the man\'s words, Kusunoki nevertheless finds himself at the address out of desperation and curiosity.\n\nKusunoki is crushed when he finds out the true monetary value of his lifespan—totaling a meager three hundred thousand yen. Deciding to sell the next 30 years of his life for ten thousand yen per year, Kusunoki is left with only three months to live. After heading home with the money, he is greeted by an unexpected visitor: the same store clerk he sold his lifespan to. She introduces herself as Miyagi, the one tasked with the job of observing him until the last three days of his life.\n\nJumyou wo Kaitotte Moratta. Ichinen ni Tsuki, Ichimanen de. follows the remaining three months of Kusunoki\'s life as he confronts lingering regrets from the past and discovers what truly gives life value.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/197880l.jpg",
    3,
    18
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    44347,
    28,
    "One Punch-Man",
    "currently_publishing",
    "2012-06-14",
    null,
    "After rigorously training for three years, the ordinary Saitama has gained immense strength which allows him to take out anyone and anything with just one punch. He decides to put his new skill to good use by becoming a hero. However, he quickly becomes bored with easily defeating monsters, and wants someone to give him a challenge to bring back the spark of being a hero.\n\nUpon bearing witness to Saitama\'s amazing power, Genos, a cyborg, is determined to become Saitama\'s apprentice. During this time, Saitama realizes he is neither getting the recognition that he deserves nor known by the people due to him not being a part of the Hero Association. Wanting to boost his reputation, Saitama decides to have Genos register with him, in exchange for taking him in as a pupil. Together, the two begin working their way up toward becoming true heroes, hoping to find strong enemies and earn respect in the process.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/80661l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    21,
    29,
    "Death Note",
    "finished",
    "2003-12-01",
    "2006-05-15",
    "Ryuk, a god of death, drops his Death Note into the human world for personal pleasure. In Japan, prodigious high school student Light Yagami stumbles upon it. Inside the notebook, he finds a chilling message: those whose names are written in it shall die. Its nonsensical nature amuses Light; but when he tests its power by writing the name of a criminal in it, they suddenly meet their demise. \n\nRealizing the Death Note\'s vast potential, Light commences a series of nefarious murders under the pseudonym \"Kira,\" vowing to cleanse the world of corrupt individuals and create a perfect society where crime ceases to exist. However, the police quickly catch on, and they enlist the help of L—a mastermind detective—to uncover the culprit.\n\nDeath Note tells the thrilling tale of Light and L as they clash in a great battle-of-minds, one that will determine the future of the world.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/54453l.jpg",
    12,
    108
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1859,
    30,
    "Natsume Yuujinchou",
    "currently_publishing",
    "2003-06-10",
    null,
    "Takashi Natsume is a 15-year-old boy who wants nothing more but to live a normal life like everyone else. But to his dismay, like his deceased grandmother, Reiko, he possesses the ability to see “youkai,” or spirits. Natsume eventually discovers that Reiko had bequeathed to him a book of contracts in which she had bound youkai—the “Book of Friends.” However, without Reiko ever calling upon the spirits’ names, they have been left in a confined state. Now, these spirits continuously pursue Natsume in the hopes of having their contracts dissolved for freedom.\n\nWhile there may be gentle, harmless spirits which come to Natsume for help, there are also malicious, hostile spirits that threaten him. This is where Madara steps in, a spirit disguised as a rotund cat. Commonly referred to as Nyanko-sensei by Natsume, Madara is a self-proclaimed bodyguard who has his own motives for accompanying Natsume.\n\nNatsume Yuujinchou is a supernatural slice-of-life series about a boy who struggles to live a normal life while balancing the spirit and human worlds and acquiring important life lessons along the way.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/4/154023l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    4,
    31,
    "Yokohama Kaidashi Kikou",
    "finished",
    "1994-04-25",
    "2006-02-25",
    "In a post-apocalyptic world where an environmental disaster led to the eruption of Mt. Fuji and the inundation of Yokohama, the age of humans is in its twilight. Alpha Hatsuseno is an android and the namesake of a small cafe outside Yokohama. As her owner is away on a trip indefinitely, she has been left responsible for running the cafe. Although she rarely gets any customers, Alpha remains outgoing and cheerful.\n\nWhile Alpha awaits her owner\'s homecoming, she explores the vicinity with her scooter and camera. Throughout her journeys, she meets new people and other androids, making memories along the way.\n\nYokohama Kaidashi Kikou is a beautiful, laid-back story centered around Alpha\'s daily activities, emphasizing the passing of time in everyday life.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/171813l.jpg",
    14,
    142
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    664,
    32,
    "Akira",
    "finished",
    "1982-12-06",
    "1990-06-11",
    "1988: It is World War III. Tokyo is decimated by a mysterious black explosion, unmatched in magnitude.\n\n2019: Fast forward 31 years. Neo-Tokyo, hastily built on the ruins of old Tokyo, is a sprawling cityscape of neon extravaganza. It is a fusion of towering skyscrapers and cutting-edge technology that is permeated through and through with an explosive, hyper-violent cocktail of biker gangs, poverty, and revolutionaries. In this derelict metropolis live Tetsuo Shima and Shoutarou Kaneda, two bikers who are the best of friends and the fiercest of rivals, despite being affiliated with the same gang. Desperate to prove himself as Kaneda\'s equal, Tetsuo unwittingly pulls a stunt that culminates in the awakening of a cryptic existence that threatens to change both the face of Neo-Tokyo and the lives of those who call the city their home—the awakening of a government secret simply known as Akira. \n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/157929l.jpg",
    6,
    120
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    28,
    33,
    "Nana",
    "on_hiatus",
    "2000-05-26",
    "2009-05-26",
    "Nana Komatsu is a naive, unmotivated girl who spends her high school days chasing one crush after the other. Despite continually facing failure in her quest for love, her spirits have never dampened. At the age of 20, she finds herself on a train to Tokyo with hopes of reuniting with her current boyfriend.\n\nNana Osaki, on the other hand, is feisty and prideful. After joining a local band during her high school days, she falls in love with music and one of the band members. However, when faced with the choice between her relationship and her musical career, she chooses the latter and separates from her boyfriend. On her 20th birthday, she boards the same train to Tokyo, like her namesake, where she aims to become a top vocalist.\n\nThe two girls with the same name but very different aspirations find themselves sitting together on their journey to the city, and, as fate would have it, eventually share the same apartment. A deep and unique bond is then forged, where they will support each other in this saga of love, music, friendship, and heartbreak.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/163191l.jpg",
    21,
    84
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    26,
    34,
    "Hunter x Hunter",
    "currently_publishing",
    "1998-03-03",
    null,
    "\"Secret treasure hoards, undiscovered wealth... mystical places, unexplored frontiers... \'The mysterious unknown.\' There\'s magic in such words for those captivated by its spell. They are called \'Hunters\'!\"\n\nGon Freecss wants to become a Hunter so he can find his father, a man who abandoned him to pursue a life of adventure. But it\'s not that simple: only one in one hundred thousand can pass the Hunter Exam, and that is just the first obstacle on his journey. During the Hunter Exam, Gon befriends many other potential Hunters, such as the mysterious Killua; the revenge-driven Kurapika; and Leorio, who aims to become a doctor. There\'s a world of adventure and peril awaiting, and those who embrace it with open arms can become the greatest Hunters of them all!\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/192445l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    34053,
    35,
    "Umineko no Naku Koro ni Chiru - Episode 8: Twilight of the Golden Witch",
    "finished",
    "2012-01-21",
    "2015-06-22",
    "The last episode of Umineko no Naku Koro ni, features a scenario where Ange is present with her family at the 1986 conference, in an attempt to uncover the heart of the mystery and conclude the long fought struggle between mystery and fantasy.\n\n(Source: Wikipedia)",
    "https://api-cdn.myanimelist.net/images/manga/3/206205l.jpg",
    9,
    42
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    7,
    36,
    "Hajime no Ippo",
    "currently_publishing",
    "1989-09-27",
    null,
    "Makunouchi Ippo is a 16-year-old high school student who helps his mother run the family business. His hefty workload impedes on his social life, making him an easy target for bullies. One day, while being beaten up by a group of high school students, Ippo is saved by a boxer named Mamoru Takamura, and is brought to the Kamogawa Boxing Gym. \n\nThis afterschool bullying session turns his life around for the better as Ippo discovers his latent talent for boxing and decides to practice the sport professionally. However, Mamoru doubts Ippo\'s determination and assigns him a task deemed impossible to complete, but the resolute Ippo trains tirelessly to fulfill his mission. Along the way, he finds out what it means to attain true strength while making new friends and fighting formidable foes.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/15282l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    145,
    37,
    "Beck",
    "finished",
    "2000-02-17",
    "2008-06-05",
    "Yukio \"Koyuki\" Tanaka wasted away his middle school days listening to Japanese pop music and apathetically trudging through life—until a casual run-in with the enigmatic guitarist Ryuusuke \"Ray\" Minami. Through this encounter, Koyuki realizes what he has been missing all this time as Ray introduces him to western rock music and jumpstarts his desire to play guitar.\n\nAlthough various struggles plague his path to rock fame, Koyuki refuses to abandon the passion that gave his life purpose, balancing it together with school, work, and friends. Beck tells the story of the love and trial that accompanies pursuing a professional career in music as Koyuki and Ray work toward realizing the guitarist\'s dream of the ultimate band.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/171795l.jpg",
    34,
    103
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    78523,
    38,
    "ReLIFE",
    "finished",
    "2013-10-12",
    "2018-03-16",
    "When the responsibilities of being an adult and the ugly side of corporate bullying betrays one\'s childhood dreams, many would wish to return to their innocent childhood to relive their life and make the right decisions. Dumbfounded by the offer presented to him, 27-year-old Arata Kaizaki hopes to turn his life around through a once-in-a-lifetime opportunity.\n\nReturning home from his part-time job, Arata is persuaded by Ryou Yoake, an employee of ReLife Research Institute, into participating in an experiment which will help him overcome his difficulties and re-enter corporate life. As part of the ReLife experiment, Arata\'s physique is reverted to that of a 17-year-old, and all he must do is relive his high school life for one year. Waiting for him at the end of the experiment is a job offer that he has been struggling to get ever since he left his first company.\n\nWith few other options, he decides to go along with this plan. However, with adult-like tendencies and many years since his last formal education, Arata steps into an unexpectedly challenging territory—a normal day of high school.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/171573l.jpg",
    0,
    237
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    88660,
    39,
    "Yagate Kimi ni Naru",
    "finished",
    "2015-04-27",
    "2019-09-27",
    "Yuu Koito has always enjoyed romance manga and love songs. She clings to them with the hope that she will one day experience a love story of her own—one that will sweep her off her feet and make her heart flutter. However, reality is often disappointing. When a classmate from junior high confesses his feelings to her, Yuu finds that she feels nothing. Unable to give him an answer, she becomes convinced that she is unable to fall in love.\n\nOne day, on her way to the student council room, Yuu encounters the council\'s president, Touko Nanami, turning down a confession from a boy. Inspired by Touko\'s confidence, Yuu turns to her for help. But when Touko becomes the next person to confess to Yuu, she is confused, yet her heart is set aflutter.\n\nYagate Kimi ni Naru is a manga about grappling with love and growing up. Will Yuu\'s long-awaited romance finally begin?\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/232311l.jpg",
    8,
    50
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    11734,
    40,
    "Watashitachi no Shiawase na Jikan",
    "finished",
    "2008-03-28",
    "2008-08-22",
    "They wanted to die for their own reasons.\n\nJuri Mutou is the daughter of a once-famous pianist whose career came to an end after giving birth to her. After a traumatic event she experienced as a teenager, Juri has attempted suicide three times and has come to hate her mother. With her life clouded due to a dark past, her aunt Monica, a member of the clergy, invites her to visit a convict sentenced to death.\n\nYuu is a death row inmate charged with murdering three people, leading to many attempts at ending his own life within his jail cell. He frequently receives letters from Monica, who hopes to help him, but sees this as as an act of pity. But when Yuu decides to meet Monica to say that he wants her to stop sending letters, he encounters Juri, a meeting that would change both of their lives.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/66993l.jpg",
    1,
    8
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    23390,
    41,
    "Shingeki no Kyojin",
    "currently_publishing",
    "2009-09-09",
    null,
    "Hundreds of years ago, horrifying creatures which resembled humans appeared. These mindless, towering giants, called \"titans,\" proved to be an existential threat, as they preyed on whatever humans they could find in order to satisfy a seemingly unending appetite. Unable to effectively combat the titans, mankind was forced to barricade themselves within large walls surrounding what may very well be humanity\'s last safe haven in the world.\n\nIn the present day, life within the walls has finally found peace, since the residents have not dealt with titans for many years. Eren Yeager, Mikasa Ackerman, and Armin Arlert are three young children who dream of experiencing all that the world has to offer, having grown up hearing stories of the wonders beyond the walls. But when the state of tranquility is suddenly shattered by the attack of a massive 60-meter titan, they quickly learn just how cruel the world can be. On that day, Eren makes a promise to himself that he will do whatever it takes to eradicate every single titan off the face of the Earth, with the hope that one day, humanity will once again be able to live outside the walls without fear.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/37846l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    72467,
    42,
    "Shoujo Shuumatsu Ryokou",
    "finished",
    "2014-02-21",
    "2018-01-12",
    "Amidst a post-apocalyptic world, Chito and Yuuri seem to be the final survivors of the war that brought civilization to its demise. No longer having a place to live, the girls roam around the city on their half-track motorcycle, ever in search of resources to sustain their vagabond lifestyle. Despite the bleak future ahead of them, the duo still finds ways to entertain themselves throughout this melancholic journey. \n\nShoujo Shuumatsu Ryokou takes place in a barren world during the harsh winter season. As the happy-go-lucky Yuuri and the serious Chito hopelessly search for a sign of civilization, their expedition may in fact become humanity\'s last tour.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/185918l.jpg",
    6,
    47
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    904,
    43,
    "Kozure Ookami",
    "finished",
    "1970-09-00",
    "1976-04",
    "Ittou Ogami has very little left to live for. Though once the Shogunate\'s chief executioner, his name is left in ruins after being framed for treason by the treacherous Yagyuu Clan, seeking to steal his position of power. His misfortune does not end here, however; they culminate in the brutal murder of his entire family, including his wife Azami, with only his child Daigorou still left alive.\n\nWith dishonor upon his head and his beloved wife in the grave, Ittou takes up a new mantle as an assassin for hire. Alongside his young son, Ittou wanders the country in search of revenge, with only the complete destruction of the Yagyuu Clan on his mind. As he travels the land, the number of his successful assassinations quickly grows, and soon the moniker of \"Lone Wolf and Cub\" becomes infamous across the land as the choice assassin to get the job done right.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/159264l.jpg",
    28,
    142
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    37707,
    44,
    "Shigatsu wa Kimi no Uso",
    "finished",
    "2011-04-06",
    "2015-02-06",
    "At a very young age, Kousei Arima was strictly taught how to play the piano and meticulously follow the score by his mother, to the point where he dominated every competition he entered with ease. He earned the title of \"Human Metronome\" for performing almost perfectly. Every musician of his age looked up to him. However, after his mother suddenly dies, he became tone-deaf due to the shock and then disappeared, never to be seen onstage since.\n\nTwo years later, Kousei lives a monotonous life with his childhood friends Tsubaki Sawabe and Ryouta Watari supporting him. He continues to cling to music, although performing is still an impossibility for him. This is until his unexpected encounter with Kaori Miyazono, a violinist who performs freely without the dictations of a score. A story of friendship, love, music, and a single lie, Kousei\'s life begins to change and gain color as Kaori helps him to take up music again.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/102691l.jpg",
    11,
    44
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    105084,
    45,
    "Jibaku Shounen Hanako-kun",
    "currently_publishing",
    "2014-12-18",
    null,
    "Rumors of the supernatural overrun Kamome Academy, namely the \"Seven Mysteries.\" One of these mysteries is the legend of Hanako-san, the ghost of a young girl residing in the girl\'s bathroom on the third floor of the old school building, who is said to grant any wish her summoner desires. First-year high school student Nene Yashiro daringly summons Hanako-san in desperate need of love, but the Hanako that appears before her is a boy!\n\nAfter Hanako-kun claims that he has no magical items of use, Nene tries various ways to get noticed by her crush. With her desperation reaching its peak, she gets into trouble after consuming a mermaid scale, which turns her into a fish. Hanako-kun rescues her, binding their fates together in the process; in return for this aid, Nene must become his assistant. Now entangled in the supernatural realm, Nene soon discovers that there\'s much more to the school\'s Seven Mysteries than basic rumors.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/192551l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    81,
    46,
    "Aria",
    "finished",
    "2002-02-28",
    "2008-02-29",
    "In the distant future, humanity has terraformed Mars into an oceanic planet to suit their needs. Now known as Aqua, the planet serves as a new home for people discontent with living on Manhome—the planet formerly known as Earth. Being a perfect imitation of Manhome\'s Venice, the town of Neo-Venezia has inherited all of the rustic charms of the original. Gondolas weave their way through the waterways of the dreamy town while nostalgic alleys await those who travel on foot.\n\nAkari Mizunashi, a young Manhome native, has recently made Neo-Venezia her new home. To pursue her dream of becoming a gondolier tour guide—or Undine—Akari joins the Aria Company, one of the most renowned water guide companies in town. As she basks in a simple lifestyle unavailable on Manhome, Akari cheerily ambles through her daily life in Neo-Venezia: the town where magic and miracles abound.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/202644l.jpg",
    12,
    67
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1133,
    47,
    "Dorohedoro",
    "finished",
    "2000-11-30",
    "2018-09-12",
    "Hole—a dark, decrepit, and disorderly district where the strong prey on the weak and death is an ordinary occurrence—is all but befitting of the name given to it. A realm separated from law and ethics, it is a testing ground to the magic users who dominate it. As a race occupying the highest rungs of their society, the magic users think of the denizens of Hole as no more than insects. Murdered, mutilated, and made experiments without a second thought, the powerless Hole dwellers litter the halls of Hole\'s hospital on a daily basis.\n\nPossessing free access to and from the cesspool, and with little challenge to their authority, the magic users appear indomitable to most—aside for a few. Kaiman, more reptile than man, is one such individual. He hunts them on a heedless quest for answers with only a trusted pair of bayonets and his immunity to magic. Cursed by his appearance and tormented by nightmares, magic users are his only clue to restoring his life to normal. With his biggest obstacle being his stomach, his female companion Nikaidou, who runs the restaurant Hungry Bug, is his greatest ally.\n\nSet in a gritty world of hellish design, Dorohedoro manages a healthy blend of comedy and lightheartedness with death and carnage. Taking plenty of twists and turns while following the lives of Hole\'s residents, it weaves a unique world of unearthly origin and dreary appearance not for the squeamish or easily disturbed.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/143111l.jpg",
    23,
    190
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    119161,
    48,
    "Spy x Family",
    "currently_publishing",
    "2019-03-25",
    null,
    "For the agent known as \"Twilight,\" no order is too tall if it is for the sake of peace. Operating as Westalis\' master spy, Twilight works tirelessly to prevent extremists from sparking a war with neighboring country Ostania. For his latest mission, he must investigate Ostanian politician Donovan Desmond by infiltrating his son\'s school: the prestigious Eden Academy. Thus, the agent faces the most difficult task of his career: get married, have a child, and play family.\n\nTwilight, or \"Loid Forger,\" quickly adopts the unassuming orphan Anya to play the role of a six-year-old daughter and prospective Eden Academy student. For a wife, he comes across Yor Briar, an absent-minded office worker who needs a pretend partner of her own to impress her friends. However, Loid is not the only one with a hidden nature. Yor moonlights as the lethal assassin \"Thorn Princess.\" For her, marrying Loid creates the perfect cover. Meanwhile, Anya is not the ordinary girl she appears to be; she is an esper, the product of secret experiments that allow her to read minds. Although she uncovers their true identities, Anya is thrilled that her new parents are cool secret agents! She would never tell them, of course. That would ruin the fun.\n\nUnder the guise of \"The Forgers,\" the spy, the assassin, and the esper must act as a family while carrying out their own agendas. Although these liars and misfits are only playing parts, they soon find that family is about far more than blood relations.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/219741l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    610,
    49,
    "Skip Beat!",
    "currently_publishing",
    "2002-02-15",
    null,
    "Sixteen-year-old Kyouko Mogami followed her childhood friend and love interest Shoutarou \"Shou\" Fuwa to Tokyo to support him while he works toward his dream of becoming a top idol in the entertainment industry. But after finding out that Shou considers her as little more than a mere housekeeper, she swears to enact revenge by entering the entertainment industry herself and beating him at his own game!\n\nHowever, Kyouko\'s revenge plan suffers a setback almost immediately when she is rejected by the talent agency of her choice. Fortunately, the president of the agency gives her a second chance, and places her in the newly made \"Love Me\" section. Kyouko then begins her long journey to stardom, cultivating her skills as an actress and forming relationships with new friends along the way.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/26110l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    745,
    50,
    "Pluto",
    "finished",
    "2003-09-09",
    "2009-04-01",
    "The world-famous Swiss robot Montblanc has been violently murdered. Humans and robots around the world mourn for the beloved celebrity, made famous for his service in the 39th Asian War. Montblanc\'s popularity only grew in the following years after the war, thanks to his dedication to nature conservation, as well as his loving personality. \n\nRobotic Europol detective and war veteran Gesicht is sent to investigate Montblanc\'s tragic demise. Gesicht uncovers evidence of a mysterious entity known only as \"Pluto.\" Along with this, he learns of a plot to dismantle the eight specialized robots from around the world who participated in the war. Racing against time to save those who still remain, Gesicht grapples with his memory, morality, and a world full of hate, desperately attempting to defend the fragile coexistence of man and machine.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/56177l.jpg",
    8,
    65
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    45143,
    51,
    "Kono Oto Tomare!",
    "currently_publishing",
    "2012-08-04",
    null,
    "Since the graduation of the senior members of the club, Takezou ends up being the sole member of the \"Koto\" (traditional Japanese string instrument) club. Now that the new school year has begun, Takezou will have to seek out new members into the club, or the club will become terminated. Out of nowhere, a new member barges into the near-abandoned club room, demanding to join the club. How will Takezou be able to keep his club alive and deal with this rascal of a new member?\n\n(Source: MangaHelpers)",
    "https://api-cdn.myanimelist.net/images/manga/3/116653l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    22,
    52,
    "Rurouni Kenshin: Meiji Kenkaku Romantan",
    "finished",
    "1994-04-12",
    "1999-09-21",
    "Ten years have passed since the end of Bakumatsu, an era of war that saw the uprising of citizens against the Tokugawa shogunate. The revolutionaries wanted to create a time of peace, and a thriving country free from oppression. The new age of Meiji has come, but peace has not yet been achieved. Swords are banned but people are still murdered in the streets. Orphans of war veterans are left with nowhere to go, while the government seems content to just line their pockets with money.\n\nOne wandering samurai, Kenshin Himura, still works to make sure the values he fought for are worth the lives spent to bring about the new era. Once known as Hitokiri Battousai, he was feared as the most ruthless killer of all the revolutionaries. Now haunted by guilt, Kenshin has sworn never to kill again in atonement for the lives he took, and he may never know peace until killing is a thing of the past.\n\nNow in the 11th year of Meiji, Kenshin stumbles upon Kaoru Kamiya, owner and head instructor of a small dojo being threatened to close its doors. The police force is powerless to stop the string of murders done in the name of her dojo by a man claiming to be the famous Battousai. Kenshin\'s wanderings pause for now as he joins Kaoru to clear both their names. But how long can he stay before his past catches up to him?\n\n[Written by MAL Rewrite]\n\nIncluded one-shot:\nVolume 28: Meteor Strike",
    "https://api-cdn.myanimelist.net/images/manga/2/127583l.jpg",
    28,
    259
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    3031,
    53,
    "Pandora Hearts",
    "finished",
    "2006-05-18",
    "2015-03-18",
    "Reminiscent of a broken toy box, the mystical Abyss is a terrifying realm home to monstrous creatures called \"Chains.\" Most believe it to be only a fairy tale, used to scare children who misbehave. Oz Vessalius, the cheerful and mischievous heir of the noble Vessalius family, is one such individual—until, at his coming-of-age ceremony, the mysterious Baskerville Clan inexplicably arrives and condemns him to the Abyss for a sin he didn\'t commit, nor knows nothing about. Oz then forms a contract with Alice, a unique Chain who can take on human form, in an attempt to escape from the Abyss.\n\nPandora Hearts follows the young boy\'s struggle to unravel the mysteries behind his sin, the Abyss, and a tragedy from one hundred years ago. Soon, Oz and his companions will find themselves confronted by the Baskervilles and ghosts from the past, as he makes his way back home in a journey plagued by relentless despair.\n\n[Written by MAL Rewrite]\n\nIncluded one-shot:\nVolume 8: Pandora Hearts (pilot)",
    "https://api-cdn.myanimelist.net/images/manga/5/185498l.jpg",
    24,
    107
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    60783,
    54,
    "Mob Psycho 100",
    "finished",
    "2012-04-18",
    "2017-12-22",
    "Shigeo \"Mob\" Kageyama is an eighth-grade student blessed with extraordinary psychic powers. However, Mob decides to suppress his abilities in public due to its destructive and conspicuous nature. To keep his psychic powers honed, he works under Arataka Reigen—a self-proclaimed esper looking to make use of Mob\'s skills.\n\nAlongside Reigen, Mob spends his days exorcising evil spirits at Reigen\'s behest. With the simple wish to impress his childhood friend Tsubomi Takane, Mob works toward making himself more desirable. But troubles keep on bombarding his daily life, slowly breaking his shackled feelings. With his repressed emotions welling up, there\'s no telling what will happen once he reaches his limit.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/204842l.jpg",
    16,
    109
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    756,
    55,
    "Banana Fish",
    "finished",
    "1985-04-13",
    "1994-03-12",
    "Ash Lynx is a beauty, a genius—and a murderer. Since childhood, he had been in the care of Dino \"Papa\" Golzine, the mafia boss who turned him into the ruthless killer he is now. At first, Ash was just a pretty face for Golzine’s pleasure, but now estranged from him, a 17-year-old Ash runs his own gang with an iron fist.\n\nEiji Okumura is a young Japanese photographer. Traveling to New York as an assistant, Eiji is set to work on a report about kids living in the streets. There, he meets teenage gang leader Ash and is mesmerized by the boy—who in turn is curious about Eiji\'s different lifestyle.\n\nBut this is the dark underground of New York, and recently a series of murders has surfaced in the city, connected only by the words \"Banana Fish.\" With personal stakes in this mysterious battle, it is up to Ash, Eiji and their allies to discover what exactly \"Banana Fish\" is, where it came from and how to get rid of it—before the world as they know it descends into chaos.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/5/215997l.jpg",
    19,
    110
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    3006,
    56,
    "JoJo no Kimyou na Bouken Part 4: Diamond wa Kudakenai",
    "finished",
    "1992-04-21",
    "1995-11-21",
    "In 1999, Joutarou Kuujou arrives at the Japanese town of Morioh for two reasons: to meet his illegitimate uncle Jousuke Higashikata and investigate a potentially dangerous Stand user. Only minutes after he arrives does he accomplish his first goal; however, Joutarou finds that Jousuke is not only a much younger high school student, but he possesses a Stand of his own called Crazy Diamond. Not long after their meeting, the two make a startling discovery: someone is using a supernatural bow and arrow to create Stand users around Morioh.\n\nWhen Jousuke witnesses the threat that this poses, he resolves to protect his town and stop the spread of lethal Stand users. Finding both allies and enemies among these users, Jousuke learns just how much one\'s personal interests and ambitions can be reflected in their Stands, and the resulting harm or virtue it brings. As they continue to investigate, they begin to unearth the shocking history of Morioh, bringing forth hidden dangers and a mystery from years past.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/4/156988l.jpg",
    18,
    174
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    44307,
    57,
    "Kakukaku Shikajika",
    "finished",
    "2011-11-28",
    "2015-01-28",
    "Akiko Hayashi has soaring but strangely specific dreams: to make a successful manga debut while still in school, have her favorite actor star in its adaptation, and end up marrying him. However, she is far from having the motivation or skills to realize these hopes. When a friend introduces her to an unorthodox, backstreet art class taught by the strong-armed Kenzou Hidaka, called simply as \"sensei,\" Akiko decides to enroll, expecting an easy ride and an automatic improvement in her art skills. To her chagrin, what she gets is something else entirely—a tough, demanding, and uncompromising teacher with absolutely no interest in manga.\n\nBut when Akiko takes up Sensei\'s challenge of an intense schedule, she comes to recognize how much he cares about his students and forms a close bond with him. With Sensei\'s guidance, Akiko learns what is necessary to become a successful mangaka as well as what it means to be an adult.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/154270l.jpg",
    5,
    34
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    11327,
    58,
    "One Outs",
    "finished",
    "1998-11-14",
    "2006-08-15",
    "Toua Tokuchi, a master of gambling and mind games, holds the remarkable record of 499 wins and zero losses in \"One Outs,\" a simplified form of baseball that consists of only a batter and a pitcher. Visiting Okinawa, Tokuchi\'s hometown, is Hiromichi Kojima, the star batter of the Saikyou Saitama Lycaons, the weakest team in the Japanese baseball league. Dreaming of leading the Lycaons to winning the championship, and in dire need of a replacement for their injured pitcher during a training camp, Kojima involves himself in a game of One Outs, only to lose to a normal fastball from the seemingly invincible Tokuchi.\n\nMesmerized by his prowess, Kojima recruits Tokuchi to the team after narrowly avoiding defeat in a rematch, believing he might just be their key to victory. However, the greedy owner of the Lycaons refuses to give him a decent salary, leading Tokuchi to suggest an unusual contract: every out he pitches will gain him five million yen, but every run he gives up will lose him fifty million yen. With his fate now tied to that of the team, Tokuchi\'s fight to bring the Lycaons to victory becomes yet another gamble—the very thing that he does best.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/169329l.jpg",
    20,
    175
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    28393,
    59,
    "Sakamichi no Apollon",
    "finished",
    "2007-09-28",
    "2012-01-28",
    "Constantly transferring schools since childhood, Kaoru Nishimi has always been seen as a social outcast when he transfers due to his intellectual nature and wealthy background. But after moving to Kyushu for his first year of high school, things begin to change when Kaoru befriends the class president Ritsuko Mukae and, unexpectedly, the notorious school delinquent Sentarou Kawabuchi. While Kaoru is an honors student, Sentarou is constantly getting into fights and skipping class. However, these two opposites find a common ground in one thing—music.\n\nOne day, Kaoru is invited by Ritsuko to visit her family\'s record store, where he finds Sentarou in the basement showcasing his skill in jazz drumming. Kaoru, being a classical pianist, knows nothing about jazz. But inspired by the performance, he begins to open his mind to the genre alongside Sentarou. The duo begin to practice in after-school jazz sessions in the record store\'s basement. As he spends more time improving his skills in jazz, Kaoru finds a person whom he can truly call his friend, and comes to learn the joys of playing music. Sakamichi no Apollon follows their story of friendship and love brought together by jazz.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/62627l.jpg",
    9,
    45
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    46282,
    60,
    "Chikan Otoko",
    "finished",
    "2004-00-00",
    "2004",
    "Molester Man is a perverted, socially inept otaku who spends most of his time on the textboard 2ch. One day, on the way home from his part-time job, he is mistaken for a stalker and arrested. After clearing the misunderstanding, Molester Man learns that the girl, whom he subsequently refers to as Miss Understanding, was left traumatized by her stalker, so he offers his hand in the hope of dating her. However, exceeding his own expectations, he gradually becomes closer to Miss Understanding and her friends, the cheerful Kansai and the guileless Loli Jugs.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/4/155148l.jpg",
    0,
    21
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    88639,
    61,
    "Ohayou, Ibarahime",
    "finished",
    "2014-11-22",
    "2017-05-24",
    "Timid but hard-working high schooler Tetsu Misato takes up a job at his father\'s housekeeping agency, where he finds himself working at the mansion on the hill he always saw as a child. Deep in the back of the mansion lies a garden and a lone building, where the mysterious daughter of the house, Shizu Karasawa, lives in isolation. \n\nWhile cleaning near the building, Tetsu chances upon the enigmatic girl, and when he returns the next day, they quickly get to know each other. Shizu reveals to him that she is confined to the building due to an unknown illness afflicting her, and that she has had no human interaction for years.\n\nAs they continue to meet, Tetsu\'s feelings toward Shizu develop—but when he realizes how he truly feels, he is faced with the true nature of her illness. Ohayou, Ibarahime follows Tetsu as he searches for the real Shizu underneath her supernatural condition—both for her sake and for the sake of his own feelings.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/164641l.jpg",
    6,
    26
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    11514,
    62,
    "Otoyomegatari",
    "currently_publishing",
    "2008-10-14",
    null,
    "It\'s the 19th century in a tribal town near the Caspian Sea, Central Asia. People lead simple lives along the Silk Road, believing in various customs and traditions as they have for many years. Amir Halgal is a beautiful 20-year-old woman skilled in archery, hunting, and horseback riding. She has come from a faraway village for an arranged marriage to a charming 12-year-old boy by the name of Karluk Eihon.\n\nDue to the large age difference, the relationship between Amir and Karluk is a little awkward initially. However, everyday interactions between the two allow them to develop feelings of love and respect for each other that eventually strengthen their bond. Otoyomegatari follows the daily lives and challenges of Amir and Karluk alongside various other couples across Central Asia, in a beautiful portrayal of the culture and traditions of the brides of the era.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/188950l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    44,
    63,
    "Gintama",
    "finished",
    "2003-12-08",
    "2019-06-20",
    "During the Edo period, Japan is suddenly invaded by alien creatures known as the \"Amanto.\" Despite the samurai\'s attempts to combat the extraterrestrial menace, the Shogun soon realizes that their efforts are futile and decides to surrender. This marks the beginning of an uneasy agreement between the Shogunate and Amanto, one that results in a countrywide sword ban and the disappearance of the samurai spirit.\n\nHowever, there exists one eccentric individual who wields a wooden sword and refuses to let his samurai status die. Now that his kind are no longer needed, Gintoki Sakata performs various odd jobs around town in order to make ends meet. Joined by his self-proclaimed disciple Shinpachi Shimura, the fearsome alien Kagura, and a giant dog named Sadaharu, they run the business known as Yorozuya, often getting caught up in all sorts of crazy and hilarious shenanigans.\n\n[Written by MAL Rewrite]\n\nIncluded one-shots:\nVolume 1: Dandelion\nVolume 2: Shirokuro (Black and White)\nVolume 24: 13\nVolume 38: Bankara-san ga Tooru",
    "https://api-cdn.myanimelist.net/images/manga/1/143121l.jpg",
    77,
    709
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    97244,
    64,
    "Shimanami Tasogare",
    "finished",
    "2015-03-06",
    "2018-05-23",
    "At the peak of a steep hill, in the picturesque Onomichi town, stands a building with a lounge open to all. An unusual group of friendly people gathers there, each with their own stories to tell. \n\nTasuku Kaname is a troubled high school student who is prepared to commit suicide because his classmates found out that he might be gay. As he questions his existence, the sight of a mysterious woman jumping off a nearby building leaves him utterly startled. He rushes to the scene only to discover her unharmed, soon learning that she is the owner of the aforementioned building, known to everyone as \"Anonymous.\"\n\nAnonymous notices Tasuku\'s nervous temperament and offers him an ear if he is willing to share his problems. While speaking to her, he realizes that the most painful thing is his inability to accept his sexuality. Emotional and heartfelt, Shimanami Tasogare is a realistic take on the struggles of Tasuku among other lesbian, gay, bisexual, and transgender people in coming to terms with their selves. \n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/174018l.jpg",
    4,
    23
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    38071,
    65,
    "Spirit Circle",
    "finished",
    "2012-05-30",
    "2016-03-30",
    "Fuuta Okeya, a 14-year-old student, can see ghosts and wears a bandage on his left cheek to hide his striking birthmark. One day, a girl with a scar on her forehead named Kouko Ishigami, accompanied by a ghost of a tall and friendly man, transfers into his class.\n\nFuuta quickly takes a liking to Kouko, wondering if it might be love at first sight. After waking up crying from a strange dream involving her, he feels a nostalgic connection to Kouko and becomes determined to befriend her. However, a chain of events forces Fuuta to reveal his birthmark to Kouko, to which she declares him to be the enemy of her life. A furious Kouko explains that the two are bound by reincarnation, and that Fuuta\'s birthmark is a curse she engraved on him in one of their past lives to recognize and eventually defeat him.\n \nKouko brings out a circular object made of flames known as the \"spirit circle\" and attacks Fuuta, pushing him off a flight of stairs. As he falls, Fuuta is thrown back into the insight of one of his previous lives. Spirit Circle chronicles Fuuta\'s journey back and forth his several past lives as he gradually unravels the mysteries behind his apparent bad blood with Kouko.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/161198l.jpg",
    6,
    45
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    33327,
    66,
    "Tokyo Ghoul",
    "finished",
    "2011-09-08",
    "2014-09-18",
    "Lurking within the shadows of Tokyo are frightening beings known as \"ghouls,\" who satisfy their hunger by feeding on humans once night falls. An organization known as the Commission of Counter Ghoul (CCG) has been established in response to the constant attacks on citizens and as a means of purging these creatures. However, the problem lies in identifying ghouls as they disguise themselves as humans, living amongst the masses so that hunting prey will be easier. Ken Kaneki, an unsuspecting university freshman, finds himself caught in a world between humans and ghouls when his date turns out to be a ghoul after his flesh.\n\nBarely surviving this encounter after being taken to a hospital, he discovers that he has turned into a half-ghoul as a result of the surgery he received. Unable to satisfy his intense craving for human meat through conventional means, Kaneki is taken in by friendly ghouls who run a coffee shop in order to help him with his transition. As he begins what he thinks will be a peaceful new life, little does he know that he is about to find himself at the center of a war between his new comrades and the forces of the CCG, and that his new existence has caught the attention of ghouls all over Tokyo.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/114037l.jpg",
    14,
    144
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    92559,
    67,
    "Diamond no Ace Act II",
    "currently_publishing",
    "2015-08-19",
    null,
    "Picking up the next year after the end of the fall tournament, Seidou High School baseball team battle it out with new and old faces as they begin their tournament run at Koshien.",
    "https://api-cdn.myanimelist.net/images/manga/3/167576l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    107931,
    68,
    "Blue Period",
    "currently_publishing",
    "2017-06-24",
    null,
    "Second-year high school student Yataro Yaguchi is bored with his normal life. He studies well and plays around with his friends, but in truth, he does not enjoy either of those activities. Bound by norms, he secretly envies those who do things differently.\n\nThat is until he discovers the joy of drawing. When he sees a painting made by a member of the Art Club, Yataro becomes fascinated with the colors used in it. Later, in an art exercise, he tries to convey his language without words but instead through painting. After that experience, Yataro finds himself so invested in art that he decides that it is what he wants to do for a living. But there stand multiple obstacles in his way: his parents who are hesitant over his unique choices, his more experienced peers, and the study of a subject much deeper than he initially expected.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/204827l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    30,
    69,
    "Ouran Koukou Host Club",
    "finished",
    "2002-07-24",
    "2010-09-24",
    "At Ouran High School, an academy where only the children of the rich and powerful attend, there exists a club consisting of the most elite of the student body: the legendary Host Club. Within the club\'s room, six beautiful, bored boys spend their time entertaining equally beautiful and bored girls.\n\nHaruhi Fujioka, a poor scholarship student, has no interest in the Host Club—until she breaks a valuable vase in their clubroom. After being mistaken for a boy, Haruhi is forced by Kyouya Ootori to work for the Host Club to repay her debt. Tamaki Suou, the princely leader of the club, eagerly takes her under his wing to teach her the ways of the host.\n\nThings, however, are never quite so simple with the Host Club around. Even the most mundane events can turn into huge spectacles with the likes of prankster twins Hikaru and Kaoru Hitachiin, stoic Takashi Morinozuka, and sweet Mitsukuni \"Hunny\" Haninozuka. The crazy adventures of the Host Club are just beginning, and Haruhi must learn how to survive in the glitzy world of the hosts.\n\n[Written by MAL Rewrite]\n\nNote: The final volume contains a special bonus chapter where the group travels to Spain.",
    "https://api-cdn.myanimelist.net/images/manga/5/19240l.jpg",
    18,
    87
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    214,
    70,
    "Kidou Senshi Gundam: The Origin",
    "finished",
    "2001-06-25",
    "2014-06-26",
    "Zeon ace pilot, Commander Char Aznable, thought he could foil the Federation\'s plan to build a mobile suit by attacking their research base on colony Side 7. He was wrong. With a prototype already active, the besieged Federation forces strike back using their new weapon, the mobile suit Gundam, with devastating consequences. Amidst the fighting, young electronics wizard Amuro Ray is determined not to let his friends and family die in the crossfire. But what can one boy do to repel a squad of mobile suit-clad invaders?\n\n(Source: VIZ Media)",
    "https://api-cdn.myanimelist.net/images/manga/1/151300l.jpg",
    24,
    112
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    698,
    71,
    "Neon Genesis Evangelion",
    "finished",
    "1994-12-26",
    "2013-06-04",
    "In 1999, a meteorite crashed into Antarctica. The impact melted the continental ice mass and drastically raised sea levels, damaging the world\'s climate and causing the deaths of over half its population. Now in 2015, devastating creatures of unknown origin—referred to as \"Angels\"—ravage what remains of the planet. \n\nIn the heavily fortified city of Tokyo-3, 14-year-old Shinji Ikari is destined to halt the Angels\' onslaught. Recruited by his father\'s secret organization NERV, Shinji is enlisted as a pilot of an Evangelion, a massive bioorganic android created solely to defeat the Angels.\n\nSuddenly with the weight of the world upon his shoulders, Shinji must find the courage and drive to stand up for the future—and himself. But as skirmishes between the Evangelions and Angels become recurrent, the horrifying truth of the world is slowly revealed.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/145061l.jpg",
    14,
    97
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1325,
    72,
    "Hi no Tori (1967)",
    "finished",
    "1967-01-00",
    "1988-02",
    "\"All things are born and all things die. That is the law of heaven.\" According to legend, the Bird of Fire called the Phoenix is the eternal spirit of life, death and rebirth. She oversees the cycle of reincarnation and the rising and falling of civilizations and species. Those who can obtain her blood will be granted eternal life, while to others she can grant infinite wisdom, or eternal suffering. Throughout history, from the dawn of civilization to the extinction of the human race, those human souls touched by the Phoenix have hunted her over and over in multiple reincarnations, and their actions in one life determine or reflect the sins and sufferings of other lifetimes.\n\n(Source: ANN)\n\nNote: This is an incomplete series due to Tezuka\'s death.",
    "https://api-cdn.myanimelist.net/images/manga/3/159419l.jpg",
    16,
    19
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    13245,
    73,
    "Chihayafuru",
    "currently_publishing",
    "2007-12-28",
    null,
    "Always deemed inferior to her elder sister, the strong-willed yet aimless Chihaya Ayase has no dream of her own. In contrast to her, Taichi Mashima, the son of a surgeon, is gifted yet insecure as he is burdened by the heavy expectations of his strict mother, who wants him to be perfect in everything. However, the lives of Chihaya and Taichi soon change as they encounter Arata Wataya, the new transfer student in their class.\n\nInspired by Arata\'s dream to become the best at competitive karuta—a card game based on the classic anthology of one hundred Japanese poets—Chihaya quickly falls in love with the game. Refusing to lose to the talented Arata, the prideful Taichi joins along and immerses himself in the game, aiming to one day surpass his fated rival. The three friends spend their childhood practicing karuta everyday, until certain circumstances force them to part with each other.\n\nA few years later, now in high school, the trio finds themselves reunited through the world of competitive karuta. Alongside their newfound comrades and rivals, they embark on a journey of self-discovery, friendship, and romance.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/135341l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    8157,
    74,
    "Kamisama Hajimemashita",
    "finished",
    "2008-02-20",
    "2016-05-20",
    "Nanami Momozono is a high schooler who has a lot on her plate. Her father had evaded his enormous gambling debts by escaping town, which resulted in his daughter being evicted by the debt collectors. As Nanami muses about her future, she runs into a man hanging onto a tree to escape a dog. She rescues him and tells him about her current situation, prompting the man to offer her his home. He believes that Nanami is more suited than him to be the \"Master\" of the house, and thus she takes him up on his offer.\n\nUpon arrival, however, Nanami discovers that said house is actually a dilapidated shrine. She is about to double back when a fox familiar and two shrine spirits stop her, mistaking her for their former master Mikage, the land god of the shrine. Upon realization, Tomoe—the fox familiar—leaves the shrine, refusing to serve Nanami. After a series of events leaves Nanami in grave danger, she summons Tomoe and seals a contract with him to earn his subservience. Now a human land god, Nanami must face new daunting tasks, menacing adversaries, and her handsome and hot-headed familiar.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/167521l.jpg",
    25,
    154
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    29211,
    75,
    "Gekkan Shoujo Nozaki-kun",
    "currently_publishing",
    "2011-08-25",
    null,
    "Confessing to your crush is no easy task for any teenager, and it is no different for Chiyo Sakura, who was saved from being late on the first day of school at Roman Academy by Umetarou Nozaki. Touched by his action, Sakura begins to develop feelings toward him.\n\nOne fateful day in their second year of high school, Sakura finally musters up the courage to confess. Swallowing her fears, she reveals it to him in a classroom after school. However, unbeknownst to her, Nozaki is actually a praised shoujo manga artist working under the pen name of \"Sakiko Yumeno.\" His work is acclaimed for being sensitive toward girls\' feelings, but Nozaki himself has no experience with love or being in a relationship.\n\nAll this results in him misunderstanding Sakura\'s confession as nothing but praise from a fan, and he simply hands her his autograph. One misunderstanding leads to another, and she somehow ends up working as an assistant for his manga. Gekkan Shoujo Nozaki-kun follows Sakura as she continually tries to convey her feelings to the oblivious Nozaki while helping him with his manga, as well as meeting his quirky assistants who coincidentally also attend Roman Academy.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/208752l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    113010,
    76,
    "Bakemonogatari",
    "currently_publishing",
    "2018-03-14",
    null,
    "Koyomi Araragi, a third year high school student who is almost human again after briefly becoming a vampire. One day, a classmate named Hitagi Senjougahara, who infamously never talks to anyone, falls down the stairs into Koyomi\'s arms. He discovers that Hitagi weighs next to nothing, in defiance of physics. Despite being threatened by her, Koyomi offers his help, and introduces her to Meme Oshino, a middle-aged homeless man who helped him stop being a vampire.",
    "https://api-cdn.myanimelist.net/images/manga/2/210355l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    126287,
    77,
    "Sousou no Frieren",
    "currently_publishing",
    "2020-04-28",
    null,
    "The demon king has been defeated, and the victorious hero party returns home before disbanding. The four—mage Frieren, hero Himmel, priest Heiter, and warrior Eisen—reminisce about their decade-long journey as the moment to bid each other farewell arrives. But the passing of time is different for elves, thus Frieren witnesses her companions slowly pass away one by one.\n\nBefore his death, Heiter manages to foist a young human apprentice called Fern onto Frieren. Driven by the elf\'s passion for collecting a myriad of magic spells, the pair embarks on a seemingly aimless journey, revisiting the places that the heroes of yore had visited. Along their travels, Frieren slowly confronts her regrets of missed opportunities to form deeper bonds with her now-deceased comrades.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/232121l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    43,
    78,
    "Eyeshield 21",
    "finished",
    "2002-07-23",
    "2009-06-15",
    "Timid, diminutive, and frequently the target of bullies, Sena Kobayakawa has just enrolled at Deimon Private High School. When he angers a group of delinquents by refusing to act as their errand boy, he makes an incredibly speedy getaway, an ability he has developed through years of running from his tormentors.\n\nYouichi Hiruma—the demonic captain of the Deimon Devil Bats football team—happens to be nearby, and seeing Sena\'s \"golden legs\" at work, forcibly recruits him as a running back despite Sena\'s desire to be team manager instead. Made to don the number 21 jersey and a special helmet to hide his identity as a player, Sena becomes \"Eyeshield 21,\" the team\'s closely guarded secret weapon. Soon he realizes his love for the sport, and aims to help the Devil Bats reach the Christmas Bowl, the high school football championship.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/165586l.jpg",
    37,
    333
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    7375,
    79,
    "Kokou no Hito",
    "finished",
    "2007-00-00",
    "2012",
    "Through pain and arduous effort, one can reach the top of the world. Standing where no man has ever set foot before, there is an exhilarating feeling of success. This is what Mori Buntarou trains, works, and lives for.\n\nHis climb to the top starts when he transfers to a new high school. Despite his lonesome and solitary nature, Mori\'s classmates persuade him to climb the school building. Without a harness or hesitation, he begins his scale to reach the top. Edging past the point of no return, he halts when he is faced with a final intimidating obstacle—a horizontal overhang. Adrenaline courses through him, and Mori jumps for the final hold at the summit.\n\nFrom there, he casts his eyes upon something that he normally would not have seen—another peak, another goal. With an awakened passion and newfound purpose in life, Mori explores the breathtaking sport of rock climbing.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/5/96223l.jpg",
    17,
    170
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    7519,
    80,
    "Kami nomi zo Shiru Sekai",
    "finished",
    "2008-04-09",
    "2014-04-23",
    "Keima Katsuragi is a high school student better known online as the \"God of Conquest,\" the man who can obtain the heart of any dating sim girl. In his opinion, real life is an awful game; three-dimensional girls are annoying and false representations of how a real girl should be.\n\nOne afternoon, while taking a break from cleaning duty, he stumbles across a strange message that goads him to conquer a girl. On a whim, he accepts, and his consent summons a girl named Elucia \"Elsie\" de Lute Ima, a denizen of hell tasked with capturing runaway spirits that have festered in girls\' hearts. Keima is shocked and tries to escape, but Elsie tells him that failure in fulfilling the newly-formed contract will result in the termination of his life! \n\nTasked with capturing the runaway spirits, Keima uses his expertise and knowledge of dating sims to obtain the hearts of girls in real life.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/188974l.jpg",
    26,
    271
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    36413,
    81,
    "Hinamatsuri",
    "finished",
    "2010-06-15",
    "2020-07-15",
    "Yoshifumi Nitta, a mid-level yakuza, finds his life forever changed when a strange capsule appears and rams into his head. Though he believes the curious event to be a dream, he finds the capsule still there the next morning; from within it emerges a young girl. She remembers nothing but her name, Hina, and uses psychokinesis to coerce Yoshifumi into buying her clothes and toys. Unable to get rid of Hina, Yoshifumi reluctantly becomes her guardian.\n\nThe pair\'s peculiar life is just beginning. As Hina lazes around the house, Yoshifumi quickly rises through the ranks of the yakuza with the help of her supernatural abilities. Hinamatsuri follows the comedic duo as Hina drags both new friends and old acquaintances into her antics, while Yoshifumi juggles between taking care of Hina, hiding her powers, and managing the yakuza business.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/65759l.jpg",
    19,
    117
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    1183,
    82,
    "Cross Game",
    "finished",
    "2005-09-02",
    "2010-02-17",
    "Kou Kitamura is a fifth grader whose family runs a sporting goods store. One of the regular customers of his family\'s store is the Tsukishima Batting Center, and so he gets to know the four daughters of the Tsukishima family (Ichiyo, Wakaba, Aoba, and Momiji) very well. Since Kou has spent so much time practicing in their batting cages, he has become a genius hitter, but has no knowledge of any other aspect of baseball. This is in contrast to Aoba, who, despite being a year younger, is an adept pitcher and hitter. Wakaba is a classmate of Kou\'s, and she seems fully intent on marrying him when she grows up. All seems idyllic in their world, until tragedy strikes. The story then skips ahead to four years later, as Kou has continued the training he began four years ago, but has not played in a baseball game since. As he finally begins playing again, it remains to be seen whether or not he will live up to the expectations of those who know the true talent he has been hiding all this time.\n\n(Source: ANN)",
    "https://api-cdn.myanimelist.net/images/manga/3/54197l.jpg",
    17,
    170
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    102,
    83,
    "Fruits Basket",
    "finished",
    "1998-07-18",
    "2006-11-20",
    "Tooru Honda is an orphan with nowhere to go but a tent in the woods, until the Souma family takes her in. However, the Souma family is no ordinary family, and they hide a grave secret: when they are hugged by someone of the opposite gender, they turn into animals from the Chinese Zodiac!\n\nNow, Tooru must help Kyou and Yuki Souma hide their curse from their classmates, as well as her friends Arisa Uotani and Megumi Hanajima. As she is drawn further into the mysterious world of the Soumas, she meets more of the family, forging friendships along the way.\n\nBut this curse has caused much suffering; it has broken many Soumas. Despite this, Tooru may just be able to heal their hearts and soothe their souls.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/155964l.jpg",
    23,
    136
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    85968,
    84,
    "Golden Kamuy",
    "currently_publishing",
    "2014-08-21",
    null,
    "Saichi Sugimoto is feared as the \"Immortal Sugimoto\" for his savagery on the battlefield during the Russo-Japanese war, but he is by no means a war hero. Sugimoto has been left to fend for himself after his release from the army for nearly killing a superior officer. Braving the rough terrain of Hokkaido, Sugimoto is now searching for gold in order to keep a promise to his lost brother-in-arms. His efforts have been fruitless for a long time until a mysterious traveler tells him of an urban legend that would rid him of all his troubles.\n\nAccording to the legend, a criminal stole the gold of the Ainu, the indigenous people of Hokkaido, and hid it away in a location that can only be found when a map—made not from pieces of parchment, but the tattooed skins of escaped convicts—is brought together.\n\nUpon meeting with a young Ainu girl, Asirpa, Sugimoto sets off in search of the tattooed prisoners, but many dangers await as soldiers and mercenaries seek the gold as well. Aided by Asirpa’s knowledge of the lands, the two of them depart to find the stolen Ainu gold in a journey of revenge, murder, and greed.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/149257l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    24692,
    85,
    "Noragami",
    "currently_publishing",
    "2010-12-23",
    null,
    "As a relatively unknown minor deity without any worshippers, Delivery God Yato takes on odd jobs for only five yen, with the goal of amassing a fortune large enough to buy himself a shrine. But in addition to obscurity, he has another problem: his \"Shinki,\" or weapon partner, has decided to resign, tired of being with a homeless god. Left with no weapon, Yato takes on more jobs, hoping to find a new partner soon.\n\nWhile out putting up fliers for a missing cat, Yato sees said cat and chases after him, right into the path of an oncoming vehicle. Hiyori Iki, a nearby girl, rushes to push Yato out of the way and ends up hurt herself. After waking up in the hospital, she discovers the incident has knocked her soul loose from her body. Realizing his actions caused this, Yato promises to help return Hiyori to normal—for five yen of course. But in order to return her to normal, he requires a new Shinki, which he finds in the rebellious spirit Yukine.\n\nNoragami tells the story of a girl walking the line between two worlds, and a stray deity\'s quest for a place to call his own.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/90899l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    104538,
    86,
    "Kimi no Suizou wo Tabetai",
    "finished",
    "2016-08-25",
    "2017-05-25",
    "The novel\'s story is told from the point of view of an unnamed protagonist who happens to find a diary in a hospital one day. The diary belongs to his classmate, a girl named Sakura Yamauchi, who is revealed to be suffering from a terminal illness in her pancreas, and who only has a few months left to live. Sakura explains that the protagonist is the only person apart from her family that knows about her condition. The protagonist promises to keep Sakura\'s secret. Despite their completely opposite personalities, the protagonist decides to be together with Sakura during her last few months.\n\n(Source: ANN)",
    "https://api-cdn.myanimelist.net/images/manga/2/191611l.jpg",
    2,
    10
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    3285,
    87,
    "Holyland",
    "finished",
    "2000-10-13",
    "2008-05-23",
    "A tormented soul, Yuu Kamishiro has no place in society. His peers constantly abuse him at school and finds that he does not fit anywhere. Out of desperation, Yuu stops going to school and ventures into the night in search of a safe haven where he will be accepted.\n\nAs Yuu roams the streets, he starts to believe he has found his place in society and a way to gain acceptance: in a world of violence and lenient law. Yuu takes up his fists in order to gain strength to protect himself, training and refining a single boxing punch. After honing his fists, Yuu wanders the streets once again, defending himself from street thugs. Building a reputation as the \"Thug Hunter,\" Yuu finds that his name has been attracting all sorts people seeking him out for a brawl. \n\nFight after fight, Yuu exchanges fists to find his place in the twisted and dark society of the streets, all while battling the darkness welling up within him. The stronger he becomes, the closer he is to reach his \"holyland.\"\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/4/71665l.jpg",
    18,
    182
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    6812,
    88,
    "Kyou kara Ore wa!!",
    "finished",
    "1988-00-00",
    "1997-10",
    "After Takashi\'s family moves into a new neighborhood, he decides to use the opportunity to become a delinquent. Upon meeting Itou, he finds out that he wasn\'t the only one who had this idea. Making friends and foes along the way, will these two take over their school or just end up as wannabes?\n\n(Source: Chikan-Manga)",
    "https://api-cdn.myanimelist.net/images/manga/5/156533l.jpg",
    38,
    366
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    8967,
    89,
    "Onanie Master Kurosawa",
    "finished",
    "2007-09-00",
    "2008-03",
    "Fourteen-year-old Kakeru Kurosawa is an antisocial junior high school student who looks down on his classmates—but beneath his superiority complex is a hopeless young teenager who uses masturbation as a pastime. Using erotic thoughts of his female classmates as stimulus, he locks himself daily in a seldom-used girl\'s bathroom at school to do his dirty deed.\n\nOne day during class, Kurosawa witnesses the popular girls bullying the timid Aya Kitahara. Although not one to be riled over such matters, he decides to deliver retribution with his own hands. In a daring move, he steals the uniforms of the bullies and dispenses his \"white justice\" over them.\n\nAlthough satisfied with his exploits, Kurosawa\'s troubles are only just beginning. While going about his daily routine, he is suddenly confronted by Kitahara, who identifies him as the culprit behind the uniform incident, and blackmails him into terrorizing the other girls in the class the same way he dealt with her bullies. Left with little choice, Kurosawa agrees, and thus begins a coming-of-age story that deals with consequences, bullying, and people\'s ability to change.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/212092l.jpg",
    4,
    31
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    21498,
    90,
    "Umineko no Naku Koro ni Chiru - Episode 5: End of the Golden Witch",
    "finished",
    "2010-10-22",
    "2012-11-22",
    "Manga adaption of 07th Expansion\'s popular visual novel.\n\nNow that Beatrice has become a shadow of her former self, Battler has to fight against Lamdbadelta, Bernkastel and Bernkastel\'s piece called Erika to save her.",
    "https://api-cdn.myanimelist.net/images/manga/1/76083l.jpg",
    6,
    27
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    42451,
    91,
    "Horimiya",
    "currently_publishing",
    "2011-10-18",
    null,
    "Although admired at school for her amiability and academic prowess, high school student Kyouko Hori has been hiding another side of her. With her parents often away from home due to work, Hori has to look after her younger brother and do the housework, leaving no chance to socialize away from school.\n\nMeanwhile, Izumi Miyamura is seen as a brooding, glasses-wearing otaku. However, in reality, he is a gentle person inept at studying. Furthermore, he has nine piercings hidden behind his long hair and a tattoo along his back and left shoulder.\n\nBy sheer chance, Hori and Miyamura cross paths outside of school—neither looking as the other expects. These seemingly polar opposites become friends, sharing with each other a side they have never shown to anyone else.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/162128l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    3299,
    92,
    "Ookami to Koushinryou",
    "finished",
    "2007-09-27",
    "2017-12-27",
    "Dreaming of someday owning his own shop, traveling merchant Kraft Lawrence spends his days looking for trade opportunities. One day, however, Lawrence\'s adventure takes an unexpected turn when he discovers a naked wolf girl asleep in his wagon.\n\nThe charming girl claims to be Holo, the wolf deity of the nearby town Pasloe. Having grown weary of the ungrateful locals, she requests Lawrence to take her back to her hometown of Yoitsu, located farther north. In return, she will help him with his mercantile affairs, lending him her shrewd mind and keen judgement.\n\nThe pair now travels from town to town, dealing with various people and the troubles they come with. But as their hearts and destination grow closer, their days of companionship are numbered.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/3/153861l.jpg",
    16,
    108
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    3866,
    93,
    "Kuroshitsuji",
    "currently_publishing",
    "2006-09-16",
    null,
    "Tucked away in the English countryside lies the ominous manor of the Phantomhives, a family which has established itself as the cold and ruthless \"Queen\'s Watchdog\" as well as the head of London\'s criminal underground. After a tragedy leaves the Earl and his wife dead, many are shocked when their son, a young boy named Ciel, claims his place as the new Earl of the Phantomhive house. At first, many perceive him only as a child surrounded by a few eccentric servants. But they soon begin to realize that it is foolish to meddle with Ciel and his demonic butler Sebastian.\n\nTaking place at the end of the 19th century, Kuroshitsuji follows these two as they face countless mysteries and dangers that plague England and threaten the Queen, uncovering the truth about what really happened to Ciel\'s parents in the process.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/28128l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    99314,
    94,
    "Kimi no Na wa.",
    "finished",
    "2016-05-27",
    "2017-01-27",
    "Mitsuha Miyamizu is a high school girl living in the countryside town of Itomori. She yearns for a life in Tokyo as she is sick of living in the countryside. At the same time, Taki Tachibana, a high school student, lives in Tokyo and has a great interest in architecture, aiming to become an urban planner in the near future.\n\nOne day, Mitsuha dreams of herself as a boy living a life in the dense capital, while Taki dreams of living as a girl in the rural town of Itomori. As time passes by, the two discover that these are not just dreams, but that they actually swap bodies upon falling asleep! Kimi no Na wa. revolves around Mitsuha and Taki as they experience the supernatural. With both of them working together to deal with the strange phenomenon, how will this impact their everyday life?\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/182270l.jpg",
    3,
    9
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    419,
    95,
    "Nodame Cantabile",
    "finished",
    "2001-07-10",
    "2010-08-25",
    "Shinichi Chiaki, the perfectionist son of a famous pianist, is in his fourth year at Momogaoka College of Music, hoping to achieve his secret dream of being a conductor. His admiration for his father led him to pursue a career in music. As much as he wants to return to Europe, his phobia of flying traps him in Japan where he now lives.\n\nOne night, he passes out, and ends up being taken in by Megumi \"Nodame\" Noda. Upon first glance, Nodame is a talented pianist, but she is also slobbish and eccentric. What\'s even worse is that she is his neighbor and he ends up forced to work with her. Though it sounds like a recipe for disaster, Chiaki is drawn to this girl who makes him remember the love for music he once held. Just what does the future hold for this musical duo?\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/2/153962l.jpg",
    25,
    150
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    9711,
    96,
    "Bakuman.",
    "finished",
    "2008-08-11",
    "2012-04-23",
    "Despite being a talented artist, middle school student Moritaka Mashiro is unsure about his future, accepting that he will simply lead a normal life. After seeing one of Mashiro\'s drawings in class, Akito Takagi—an aspiring writer—insists that they write a manga together. But Mashiro is hesitant—his uncle, a mangaka, had died from overworking just a few years prior. However, when Mashiro hears that his crush, Miho Azuki, aims to be a voice actress, he becomes determined to create a manga that can be adapted into an anime for her to star in. Reciprocating Mashiro\'s feelings, she agrees to get married once they have both achieved their dreams.\n\nBakuman. chronicles Mashiro and Takagi\'s successes and struggles in their attempts to be serialized in Weekly Shounen Jump and become famous mangakas. Will their gamble pay off, or will they join the countless number of failures?\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/208974l.jpg",
    20,
    176
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    17051,
    97,
    "Barakamon",
    "finished",
    "2008-02-22",
    "2019-01-10",
    "Seishuu Handa is considered a prodigy in the calligraphy world. However, he is extremely narcissistic about his work, and when a senior curator dismisses his award-winning piece as conventional and bland, he loses his cool, leading to potentially career-ending repercussions. \n\nAfter seeing his son\'s immaturity, his father⁠—also a master calligrapher—sends Handa to a village in the Goto Islands as punishment. Deprived of city comforts, Handa moves into a house in the local village with the sole intention of spending his stay engrossed in calligraphy. However, the house he has moved into was previously the hideout for some rambunctious children, headed by Naru Kotoishi, who are unwilling to move out. Furthermore, the neighbors seem very interested in the calligrapher, who they see as an amusing oddity!\n\nDespite Handa having been uprooted from his comfortable lifestyle, his experiences with the village and its people will teach him things about himself, life, and calligraphy.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/216099l.jpg",
    18,
    135
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    25515,
    98,
    "JoJo no Kimyou na Bouken Part 8: JoJolion",
    "currently_publishing",
    "2011-05-19",
    null,
    "In 2011, childhood friends Yasuho Hirose and Joushuu Higashikata discover a naked man buried in the ground just outside the town of Morioh. The man has no memory of his name or previous life; the only thing he remembers about himself is how to use his Stand, a supernatural ability that takes the form of a humanoid creature. The stranger is quickly given a name, Jousuke, and Joushuu\'s father Norisuke decides to adopt him into the Higashikata household until he can find his own home.\nAs Jousuke begins to investigate his past, it becomes apparent that he is no ordinary amnesiac. There is much more to his identity than he first suspected, and, as he is thrust into a series of high-stakes Stand battles, he soon begins unravelling a deadly conspiracy that encompasses the entire town.\n\n[Written by MAL Rewrite]",
    "https://api-cdn.myanimelist.net/images/manga/1/179885l.jpg",
    0,
    0
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    658,
    99,
    "Blade of the Immortal",
    "finished",
    "1993-06-25",
    "2012-12-25",
    "Manji is an infamous swordsman in feudal Japan who is known as the \"Hundred Man Killer,\" as he has killed one hundred innocent men. However, there is something far more frightening than his ominous reputation: the fact that he is immortal. This is the handiwork of eight-hundred-year-old nun Yaobikuni, who placed bloodworms capable of healing almost any wound in Manji\'s body. \n\nTo atone for his crimes, Manji resolves to kill one thousand evil men. Yaobikuni agrees to this proposal, saying that if he succeeds, she will undo his curse of immortality. Soon after this promise, Manji meets Rin Asano, a 16-year-old girl who requests Manji\'s assistance in killing those who slaughtered her parents.\n\nInitially reluctant, Manji refuses Rin\'s desperate plea. However, owing to her evident lack of strength, Manji changes his mind and agrees to protect Rin for four years. With this partnership set in stone, the two embark on a perilous journey of bloodshed, vengeance, and redemption, each to fulfill their own life\'s cause.\n\n[Written by MAL Rewrite]\n\n\nNote: Originally published with 219 chapters, which were then recollected into 207 chapters in the tankoubons. Please do not change the chapter count. ",
    "https://api-cdn.myanimelist.net/images/manga/1/157919l.jpg",
    30,
    207
  );
REPLACE INTO `manga` (
    `id`,
    `rank`,
    `title`,
    `status`,
    `start_date`,
    `end_date`,
    `synopsis`,
    `image_url`,
    `num_volumes`,
    `num_chapters`
  )
VALUES
  (
    743,
    100,
    "21st Century Boys",
    "finished",
    "2006-12-25",
    "2007-07-14",
    "Growing older is pretty rough and Kenji is finding out just how hard it can be as life starts wearing down on him. On top of trying to make ends meet running a convenience store he has to care for the niece that his missing sister left in his care. Memories of youth make it easier, until those memories come back to haunt him\n\nPicking up directly after the events of 20th Century Boys, it seems like the world is finally out of danger, but the mystery of \"Friend\" still exists. As the world is threatened again, Kenji must search his memories for any clue about \"Friend\".\n\n(Source: ANN)",
    "https://api-cdn.myanimelist.net/images/manga/2/54415l.jpg",
    2,
    16
  );
-- # -------------------------------------------------------------------------genre
  REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    38,
    "Military",
    "An anime series/movie that has a heavy militaristic feel behind it."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    6,
    "Demons",
    "Anime that are set in a world where demons and other dark creatures play a significant role: the main character may even be one."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    14,
    "Horror",
    "Anime whose focus is to scare the audience."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    14,
    "Horror",
    "Anime whose focus is to scare the audience."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    38,
    "Military",
    "An anime series/movie that has a heavy militaristic feel behind it."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    31,
    "Super Power",
    "Anime whose main character(s) have powers beyond normal humans. Often it looks like magic, but can\'t really be considered magic; usually ki-attacks, flying or superhuman strength."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    21,
    "Samurai",
    "Anime whose main character(s) are samurai, the old, but not forgotten, warrior cast of medieval Japan."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    38,
    "Military",
    "An anime series/movie that has a heavy militaristic feel behind it."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    9,
    "Ecchi",
    "Anime that contain a lot of sexual innuendo. The translation of this letter (Ecchi is the letter \'H\' in Japanese) is pervert. Ecchi is about panties (pantsu) and bra/breast showing, situations with \"sudden nudity\" and of course, subtle hints or sexual thoughts. Ecchi does not describe actual sex acts or show any intimate body parts except for bare breasts and buttocks. Ecchi is almost always used for humor."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    11,
    "Game",
    "Anime whose central theme is based on a non-violent, non-sports game, like go, chess, trading card games or computer/video games."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    29,
    "Space",
    "Anime whose setting is in outer space, not on another planet, nor in another dimension, but space. This is a sub-genre of scifi."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    31,
    "Super Power",
    "Anime whose main character(s) have powers beyond normal humans. Often it looks like magic, but can\'t really be considered magic; usually ki-attacks, flying or superhuman strength."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    20,
    "Parody",
    "Anime that imitate other stories (can be from TV, film, books, historical events, ...) for comic effect by exaggerating the style and changing the content of the original. Also known as spoofs. This is a sub-genre of comedy."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    19,
    "Music",
    "Anime whose central theme revolves around singers/idols or people playing instruments. This category is not intended for finding AMVs (Animated Music Videos)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    31,
    "Super Power",
    "Anime whose main character(s) have powers beyond normal humans. Often it looks like magic, but can\'t really be considered magic; usually ki-attacks, flying or superhuman strength."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    16,
    "Magic",
    "Anime whose central theme revolves around magic. Things that are \"out of this world\" happen: incidents that cannot be explained by the laws of nature or science. Usually wizards/witches indicate that it is of the \"Magic\" type. This is a sub-genre of fantasy."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    19,
    "Music",
    "Anime whose central theme revolves around singers/idols or people playing instruments. This category is not intended for finding AMVs (Animated Music Videos)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    26,
    "Shoujo Ai",
    "Anime whose central theme is about a relationship (or strong affection, not usually sexual) between two girls or women. Shoujo Ai literally means \"girl love\"."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    19,
    "Music",
    "Anime whose central theme revolves around singers/idols or people playing instruments. This category is not intended for finding AMVs (Animated Music Videos)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    31,
    "Super Power",
    "Anime whose main character(s) have powers beyond normal humans. Often it looks like magic, but can\'t really be considered magic; usually ki-attacks, flying or superhuman strength."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    14,
    "Horror",
    "Anime whose focus is to scare the audience."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    21,
    "Samurai",
    "Anime whose main character(s) are samurai, the old, but not forgotten, warrior cast of medieval Japan."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    19,
    "Music",
    "Anime whose central theme revolves around singers/idols or people playing instruments. This category is not intended for finding AMVs (Animated Music Videos)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    14,
    "Horror",
    "Anime whose focus is to scare the audience."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    18,
    "Mecha",
    "Anime whose central theme involves mechanical things. This genre is mainly used to point out when there are giant robots. Human size androids are in general not considered \"Mecha\" but \"SciFi\"."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    21,
    "Samurai",
    "Anime whose main character(s) are samurai, the old, but not forgotten, warrior cast of medieval Japan."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    31,
    "Super Power",
    "Anime whose main character(s) have powers beyond normal humans. Often it looks like magic, but can\'t really be considered magic; usually ki-attacks, flying or superhuman strength."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (42, "Josei", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    19,
    "Music",
    "Anime whose central theme revolves around singers/idols or people playing instruments. This category is not intended for finding AMVs (Animated Music Videos)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (42, "Josei", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    21,
    "Samurai",
    "Anime whose main character(s) are samurai, the old, but not forgotten, warrior cast of medieval Japan."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    20,
    "Parody",
    "Anime that imitate other stories (can be from TV, film, books, historical events, ...) for comic effect by exaggerating the style and changing the content of the original. Also known as spoofs. This is a sub-genre of comedy."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    14,
    "Horror",
    "Anime whose focus is to scare the audience."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (44, "Gender Bender", "undefined");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    35,
    "Harem",
    "Anime that involves one lead male character and many cute/pretty female support characters. Typically, the male lead ends up living with many female support characters within the same household. The lead male typically represents the average guy who is shy, awkward, and girlfriendless. While each female character surround the lead male possesses distinct physical and personality traits, those traits nevertheless represent different stereotypical roles that play on popular Japanese fetishes; i.e. the librarian/genius, tomboy, little sister, and older woman. Some anime that are under the harem genre are: Love Hina, Girls Bravo, Maburaho, and Sister Princess."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    18,
    "Mecha",
    "Anime whose central theme involves mechanical things. This genre is mainly used to point out when there are giant robots. Human size androids are in general not considered \"Mecha\" but \"SciFi\"."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    38,
    "Military",
    "An anime series/movie that has a heavy militaristic feel behind it."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    29,
    "Space",
    "Anime whose setting is in outer space, not on another planet, nor in another dimension, but space. This is a sub-genre of scifi."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    18,
    "Mecha",
    "Anime whose central theme involves mechanical things. This genre is mainly used to point out when there are giant robots. Human size androids are in general not considered \"Mecha\" but \"SciFi\"."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    29,
    "Space",
    "Anime whose setting is in outer space, not on another planet, nor in another dimension, but space. This is a sub-genre of scifi."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    11,
    "Game",
    "Anime whose central theme is based on a non-violent, non-sports game, like go, chess, trading card games or computer/video games."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (42, "Josei", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    6,
    "Demons",
    "Anime that are set in a world where demons and other dark creatures play a significant role: the main character may even be one."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    32,
    "Vampire",
    "Anime whose main character(s) are vampires or at least vampires play a significant role in the story."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    16,
    "Magic",
    "Anime whose central theme revolves around magic. Things that are \"out of this world\" happen: incidents that cannot be explained by the laws of nature or science. Usually wizards/witches indicate that it is of the \"Magic\" type. This is a sub-genre of fantasy."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    35,
    "Harem",
    "Anime that involves one lead male character and many cute/pretty female support characters. Typically, the male lead ends up living with many female support characters within the same household. The lead male typically represents the average guy who is shy, awkward, and girlfriendless. While each female character surround the lead male possesses distinct physical and personality traits, those traits nevertheless represent different stereotypical roles that play on popular Japanese fetishes; i.e. the librarian/genius, tomboy, little sister, and older woman. Some anime that are under the harem genre are: Love Hina, Girls Bravo, Maburaho, and Sister Princess."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    30,
    "Sports",
    "Anime whose central theme revolves around sports, examples are tennis, boxing and basketball."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    25,
    "Shoujo",
    "Anime that are targeted towards the \"young girl\" market. Usually the story is from the point of view of a girl and deals with romance, drama or magic."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    17,
    "Martial Arts",
    "Anime whose central theme revolves around martial arts. This includes all hand-to-hand fighting styles, including Karate, Tae-Kwon-Do and even Boxing. Weapons use, like Nunchaku and Shuriken are also indications of this genre. This is a sub-genre of action."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    16,
    "Magic",
    "Anime whose central theme revolves around magic. Things that are \"out of this world\" happen: incidents that cannot be explained by the laws of nature or science. Usually wizards/witches indicate that it is of the \"Magic\" type. This is a sub-genre of fantasy."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (45, "Thriller", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    14,
    "Horror",
    "Anime whose focus is to scare the audience."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    10,
    "Fantasy",
    "Anime that are set in a mythical world quite different from modern-day Earth. Frequently this world has magic and/or mythical creatures such as dragons and unicorns. These stories are sometimes based on real world legends and myths. Frequently fantasies describe tales featuring magic, brave knights, damsels in distress, and/or quests."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    6,
    "Demons",
    "Anime that are set in a world where demons and other dark creatures play a significant role: the main character may even be one."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    23,
    "School",
    "Anime which are mainly set in a school environment."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (42, "Josei", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    22,
    "Romance",
    "Anime whose story is about two people who each want [sometimes unconciously] to win or keep the love of the other. This kind of anime might also fall in the \"Ecchi\" category, while \"Romance\" and \"Hentai\" generally contradict each other."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    4,
    "Comedy",
    "Multiple characters and/or events causing hilarious results. These stories are built upon funny characters, situations and events."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    36,
    "Slice of Life",
    "Anime with no clear central plot. This type of anime tends to be naturalistic and mainly focuses around the main characters and their everyday lives. Often there will be some philosophical perspectives regarding love, relationships, life etc. tied into the anime. The overall typical moods for this type of anime are cheery and carefree, in other words, it is your \"feel-good\" kind of anime. Some anime that are under the slice of life genre are: Ichigo Mashimaro, Fruits Basket, Aria the Natural, Honey and Clover, and Piano."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    27,
    "Shounen",
    "Anime that are targeted towards the \"young boy\" market. The usual topics for this involve fighting, friendship and sometimes super powers."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    1,
    "Action",
    "Plays out mainly through a clash of physical forces. Frequently these stories have fast cuts, tough characters making quick decisions and usually a beautiful girl nearby. Anything quick and most likely a thin storyline."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    2,
    "Adventure",
    "Exploring new places, environments or situations. This is often associated with people on long journeys to places far away encountering amazing things, usually not in an epic but in a rather gripping and interesting way."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    13,
    "Historical",
    "Anime whose setting is in the past. Frequently these follow historical tales, sagas or facts."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    17,
    "Martial Arts",
    "Anime whose central theme revolves around martial arts. This includes all hand-to-hand fighting styles, including Karate, Tae-Kwon-Do and even Boxing. Weapons use, like Nunchaku and Shuriken are also indications of this genre. This is a sub-genre of action."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    21,
    "Samurai",
    "Anime whose main character(s) are samurai, the old, but not forgotten, warrior cast of medieval Japan."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    37,
    "Supernatural",
    "Anime of the paranormal stature. Demons, vampires, ghosts, undead, etc."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    40,
    "Psychological",
    "Often when two or more characters prey each others\' minds, either by playing deceptive games with the other or by merely trying to demolish the other\'s mental state."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    24,
    "Sci-Fi",
    "Anime where the setting is based on the technology and tools of a scientifically imaginable world. The majority of technologies presented are not available in the present day and therefore the Science is Fiction. This incorporates any possible place (planets, space, underwater, you name it)."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    7,
    "Mystery",
    "Anime where characters reveal secrets that may lead a solution for a great mystery. This is not necessarily solving a crime, but can be a realization after a quest."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (
    8,
    "Drama",
    "Anime that often show life or characters through conflict and emotions. In general, the different parts of the story tend to form a whole that is greater than the sum of the parts. In other words, the story has a message that is bigger than just the story line itself."
  );
REPLACE INTO `genre` (`id`, `name`, `description`)
VALUES
  (41, "Seinen", "");
-- # ------------------------------------------------------------------------author
  REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1868, "Kentarou", "Miura");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2619, "Hirohiko", "Araki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1874, "Hiromu", "Arakawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1881, "Eiichiro", "Oda");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1867, "Naoki", "Urasawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1911, "Takehiko", "Inoue");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (5760, "Eiji", "Yoshikawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2836, "Inio", "Asano");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (7108, "Kenji", "Inoue");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (16441, "Kimitake", "Yoshioka");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1911, "Takehiko", "Inoue");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (14715, "Yasuhisa", "Hara");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1867, "Naoki", "Urasawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2139, "Aka", "Akasaka");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (8260, "Haruichi", "Furudate");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2318, "Tohru", "Fujisawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2034, "Makoto", "Yukimura");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (38670, "Akihito", "Tsukushi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1939, "Kiyohiko", "Azuma");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1870, "Hayao", "Miyazaki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (4017, "Ikki", "Kajiwara");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (6217, "Tetsuya", "Chiba");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (10951, "Yoshitoki", "Ooima");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2891, "Chika", "Umino");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2426, "Mizuho", "Kusanagi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (7969, "Chuuya", "Koyama");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (16515, "Haruko", "Ichikawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2394, "Yuki", "Urushibara");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1911, "Takehiko", "Inoue");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (17059, "Shouichi", "Taguchi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (41857, "Sugaru", "Miaki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1903, "Yusuke", "Murata");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (16993, "", "ONE");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1888, "Takeshi", "Obata");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2111, "Tsugumi", "Ohba");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3206, "Yuki", "Midorikawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1869, "Hitoshi", "Ashinano");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1872, "Katsuhiro", "Otomo");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1894, "Ai", "Yazawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1893, "Yoshihiro", "Togashi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3751, "Kei", "Natsumi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (5092, "", "Ryukishi07");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1876, "George", "Morikawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1976, "Harold", "Sakuishi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (33911, "Sou", "Yayoi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (37750, "Nio", "Nakatani");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2867, "Sumomo", "Yumeka");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (11705, "Hajime", "Isayama");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (8886, "", "Tsukumizu");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3020, "Kazuo", "Koike");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3021, "Goseki", "Kojima");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (12781, "Naoshi", "Arakawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (21071, "Iro", "Aida");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1937, "Kozue", "Amano");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3024, "Q", "Hayashida");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3543, "Tatsuya", "Endou");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2536, "Yoshiki", "Nakamura");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1867, "Naoki", "Urasawa");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1938, "Osamu", "Tezuka");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (4429, "Amyuu", "Sakura");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1890, "Nobuhiro", "Watsuki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3483, "Jun", "Mochizuki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (16993, "", "ONE");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2082, "Akimi", "Yoshida");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2619, "Hirohiko", "Araki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (4186, "Akiko", "Higashimura");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2656, "Shinobu", "Kaitani");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (8494, "Yuki", "Kodama");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3906, "Takuma", "Yokota");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (37744, "Megumi", "Morino");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2575, "Kaoru", "Mori");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1904, "Hideaki", "Sorachi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3154, "Yuhki", "Kamatani");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (6386, "Satoshi", "Mizukami");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (15753, "Sui", "Ishida");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (4610, "Yuuji", "Terajima");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (40163, "Tsubasa", "Yamaguchi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1895, "Bisco", "Hatori");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2220, "Yoshikazu", "Yasuhiko");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2337, "Yoshiyuki", "Tomino");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3158, "Yoshiyuki", "Sadamoto");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1938, "Osamu", "Tezuka");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2293, "Yuki", "Suetsugu");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3695, "Julietta", "Suzuki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3624, "Izumi", "Tsubaki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1932, "", "Oh! Great");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (5254, "ISIN", "NISIO");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (23829, "Kanehito", "Yamada");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (51216, "Tsukasa", "Abe");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1902, "Riichiro", "Inagaki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1903, "Yusuke", "Murata");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (5215, "Shinichi", "Sakamoto");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (6203, "Tamiki", "Wakaki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (16607, "Masao", "Ohtake");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2104, "Mitsuru", "Adachi");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1873, "Natsuki", "Takaya");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (34371, "Satoru", "Noda");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (6644, "", "Adachitoka");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2898, "Idumi", "Kirihara");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (44281, "Yoru", "Sumino");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (6748, "Kouji", "Mori");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2770, "Hiroyuki", "Nishimori");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3906, "Takuma", "Yokota");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (5854, "Katsura", "Ise");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (5092, "", "Ryukishi07");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (19801, "", "Akitaka");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (12332, "Daisuke", "Hagiwara");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (16703, "", "HERO");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2665, "Keito", "Koume");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3595, "Isuna", "Hasekura");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (3768, "Yana", "Toboso");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1117, "Makoto", "Shinkai");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (12086, "Ranmaru", "Kotone");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2395, "Tomoko", "Ninomiya");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1888, "Takeshi", "Obata");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2111, "Tsugumi", "Ohba");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (9848, "Satsuki", "Yoshino");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2619, "Hirohiko", "Araki");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (2843, "Hiroaki", "Samura");
REPLACE INTO `author` (`id`, `first_name`, `last_name`)
VALUES
  (1867, "Naoki", "Urasawa");
-- # ----------------------------------------------------------------------magazine
  REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (2, "Young Animal");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (25, "Ultra Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (13, "Shounen Gangan");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1, "Big Comic Original");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (72, "Morning");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (3, "Big Comic Spirits");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (316, "good! Afternoon");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (87, "Young Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (3, "Big Comic Spirits");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (87, "Young Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (8, "Shounen Magazine (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (4, "Afternoon");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1103, "Web Comic Gamma");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (23, "Dengeki Daioh");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1205, "Animage");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (8, "Shounen Magazine (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (8, "Shounen Magazine (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (2, "Young Animal");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (21, "Hana to Yume");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (72, "Morning");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (4, "Afternoon");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (4, "Afternoon");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (87, "Young Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1209, "Shounen Jump+");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (290, "Tonari no Young Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (135, "LaLa DX");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (4, "Afternoon");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (10, "Young Magazine (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (15, "Cookie");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (412, "Gangan Joker");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (8, "Shounen Magazine (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (48, "Shounen Magazine (Monthly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1278, "comico");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (23, "Dengeki Daioh");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (92, "Comic Bunch");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (450, "Bessatsu Shounen Magazine");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1063, "Kurage Bunch");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (847, "Manga Action");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (48, "Shounen Magazine (Monthly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (35, "GFantasy");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (28, "Comic Blade");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (591, "Gessan");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1209, "Shounen Jump+");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (21, "Hana to Yume");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1, "Big Comic Original");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (161, "Jump SQ.");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (35, "GFantasy");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1361, "MangaONE");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (54, "Betsucomi");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (817, "Cocohana");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (57, "Business Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (121, "Flowers (Monthly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (95, "Dessert");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (953, "Harta");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (1295, "HiBaNa");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (88, "Young King OURs");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (87, "Young Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (8, "Shounen Magazine (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (4, "Afternoon");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (11, "LaLa");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (68, "Gundam Ace");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (27, "Shounen Ace");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (301, "Manga Shounen");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (306, "Be-Love");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (21, "Hana to Yume");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (419, "Gangan Online");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (8, "Shounen Magazine (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (229, "Shounen Sunday");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (87, "Young Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (229, "Shounen Sunday");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (953, "Harta");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (229, "Shounen Sunday");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (21, "Hana to Yume");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (87, "Young Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (48, "Shounen Magazine (Monthly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (117, "Monthly Action");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (2, "Young Animal");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (229, "Shounen Sunday");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (412, "Gangan Joker");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (35, "GFantasy");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (163, "Dengeki Maoh");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (35, "GFantasy");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (137, "Comic Alive");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (113, "Kiss");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (83, "Shounen Jump (Weekly)");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (419, "Gangan Online");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (25, "Ultra Jump");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (4, "Afternoon");
REPLACE INTO `magazine` (`id`, `name`)
VALUES
  (3, "Big Comic Spirits");
-- # ----------------------------------------------------------------------classify
  REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 38);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 6);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 14);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (2, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1706, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1706, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1706, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1706, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1706, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1706, 14);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1706, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25, 38);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13, 31);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (656, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (656, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (656, 21);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (656, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (656, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (656, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4632, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4632, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4632, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4632, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (70345, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (70345, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (70345, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (51, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (51, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (51, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (51, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (51, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (16765, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (16765, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (16765, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (16765, 38);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (16765, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (90125, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (90125, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (90125, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (90125, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (35243, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (35243, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (35243, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (35243, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (35243, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (336, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (336, 9);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (336, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (336, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (336, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (336, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (642, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (642, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (642, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (642, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (642, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (91941, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (91941, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (91941, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (91941, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (104, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (104, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (651, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (651, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (651, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (651, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1303, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1303, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1303, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1303, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (56805, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (56805, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (56805, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1224, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1224, 11);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1224, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1224, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21525, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21525, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21525, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21525, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21525, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (14483, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (14483, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (14483, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (14483, 29);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44489, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44489, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44489, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (418, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (418, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (418, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (418, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (418, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (657, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (657, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (657, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (657, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (100448, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (100448, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44347, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44347, 31);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44347, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44347, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44347, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44347, 20);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1859, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1859, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1859, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (4, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (664, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (664, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (664, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28, 19);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (26, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (26, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (26, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (26, 31);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (26, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (34053, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (34053, 16);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (34053, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (34053, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (34053, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (34053, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (145, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (145, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (145, 19);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (145, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (145, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (145, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (78523, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (78523, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (78523, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (78523, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (78523, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (88660, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (88660, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (88660, 26);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11734, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11734, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11734, 19);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11734, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11734, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11734, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 31);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 14);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (23390, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (72467, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (72467, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (904, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (904, 21);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (904, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (904, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (37707, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (37707, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (37707, 19);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (37707, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (37707, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (105084, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (105084, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (81, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (81, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (81, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (81, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (81, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (81, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1133, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1133, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1133, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1133, 14);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1133, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (119161, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (119161, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (119161, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (610, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (610, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (610, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (610, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (745, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (745, 18);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (745, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (745, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (745, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (745, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (45143, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (45143, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (45143, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (22, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (22, 21);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (22, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (22, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (22, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3031, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3031, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3031, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3031, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3031, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (60783, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (60783, 31);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (60783, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (60783, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (756, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (756, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (756, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (756, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3006, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3006, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3006, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44307, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44307, 42);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11327, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11327, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11327, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28393, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28393, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28393, 19);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28393, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28393, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (28393, 42);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (46282, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (46282, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (46282, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (46282, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (88639, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (88639, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11514, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11514, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11514, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (11514, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44, 21);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44, 20);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (44, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (97244, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (97244, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (97244, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (97244, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (38071, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (38071, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (38071, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (38071, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (38071, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (38071, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (38071, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (33327, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (33327, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (33327, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (33327, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (33327, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (33327, 14);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (33327, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (92559, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (92559, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (92559, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (107931, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (107931, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (107931, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (30, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (30, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (30, 44);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (30, 35);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (30, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (30, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (30, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (214, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (214, 18);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (214, 38);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (214, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (214, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (214, 29);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (214, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (698, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (698, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (698, 18);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (698, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (698, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (698, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (698, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 29);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1325, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13245, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13245, 11);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13245, 42);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (13245, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8157, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8157, 6);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8157, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8157, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8157, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8157, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (29211, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (29211, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (29211, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 32);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (113010, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (126287, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (126287, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (126287, 16);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (126287, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (43, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (43, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (43, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (43, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7375, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7375, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7375, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7375, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7519, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7519, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7519, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7519, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7519, 35);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7519, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (7519, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (36413, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (36413, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (36413, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (36413, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1183, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1183, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1183, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1183, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1183, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (1183, 30);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (102, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (102, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (102, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (102, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (102, 25);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (102, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (85968, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (85968, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (85968, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (85968, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (24692, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (24692, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (24692, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (24692, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (24692, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (104538, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3285, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3285, 17);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3285, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3285, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (6812, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (6812, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (6812, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8967, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8967, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (8967, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 16);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 45);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 14);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (21498, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (42451, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (42451, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (42451, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (42451, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (42451, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3299, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3299, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3299, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3299, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3299, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3299, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3299, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3866, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3866, 10);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3866, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3866, 6);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3866, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3866, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (3866, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (99314, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (99314, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (99314, 23);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (99314, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (99314, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (419, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (419, 42);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (419, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (419, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (9711, 22);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (9711, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (9711, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (9711, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (17051, 4);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (17051, 36);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (17051, 27);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25515, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25515, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25515, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25515, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (25515, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 1);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 2);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 13);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 17);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 21);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 41);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (658, 37);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (743, 40);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (743, 24);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (743, 7);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (743, 8);
REPLACE INTO `classify` (`idmanga`, `idgenre`)
VALUES
  (743, 41);
-- # -------------------------------------------------------------------------write
  REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (2, 1868, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1706, 2619, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (25, 1874, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (13, 1881, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1, 1867, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (656, 1911, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (656, 5760, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (4632, 2836, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (70345, 7108, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (70345, 16441, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (51, 1911, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (16765, 14715, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (3, 1867, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (90125, 2139, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (35243, 8260, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (336, 2318, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (642, 2034, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (91941, 38670, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (104, 1939, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (651, 1870, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1303, 4017, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1303, 6217, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (56805, 10951, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1224, 2891, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (21525, 2426, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (14483, 7969, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (44489, 16515, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (418, 2394, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (657, 1911, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (100448, 17059, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (100448, 41857, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (44347, 1903, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (44347, 16993, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (21, 1888, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (21, 2111, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1859, 3206, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (4, 1869, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (664, 1872, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (28, 1894, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (26, 1893, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (34053, 3751, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (34053, 5092, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (7, 1876, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (145, 1976, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (78523, 33911, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (88660, 37750, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (11734, 2867, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (23390, 11705, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (72467, 8886, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (904, 3020, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (904, 3021, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (37707, 12781, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (105084, 21071, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (81, 1937, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1133, 3024, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (119161, 3543, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (610, 2536, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (745, 1867, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (745, 1938, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (45143, 4429, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (22, 1890, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (3031, 3483, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (60783, 16993, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (756, 2082, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (3006, 2619, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (44307, 4186, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (11327, 2656, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (28393, 8494, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (46282, 3906, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (88639, 37744, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (11514, 2575, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (44, 1904, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (97244, 3154, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (38071, 6386, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (33327, 15753, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (92559, 4610, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (107931, 40163, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (30, 1895, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (214, 2220, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (214, 2337, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (698, 3158, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1325, 1938, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (13245, 2293, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (8157, 3695, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (29211, 3624, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (113010, 1932, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (113010, 5254, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (126287, 23829, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (126287, 51216, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (43, 1902, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (43, 1903, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (7375, 5215, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (7519, 6203, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (36413, 16607, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (1183, 2104, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (102, 1873, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (85968, 34371, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (24692, 6644, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (104538, 2898, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (104538, 44281, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (3285, 6748, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (6812, 2770, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (8967, 3906, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (8967, 5854, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (21498, 5092, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (21498, 19801, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (42451, 12332, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (42451, 16703, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (3299, 2665, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (3299, 3595, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (3866, 3768, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (99314, 1117, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (99314, 12086, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (419, 2395, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (9711, 1888, "Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (9711, 2111, "Story");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (17051, 9848, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (25515, 2619, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (658, 2843, "Story & Art");
REPLACE INTO `write` (`idmanga`, `idauthor`, `role`)
VALUES
  (743, 1867, "Story & Art");
-- # -----------------------------------------------------------------------publish
  REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (2, 2);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1706, 25);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (25, 13);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (13, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1, 1);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (656, 72);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (4632, 3);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (70345, 316);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (51, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (16765, 87);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (3, 3);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (90125, 87);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (35243, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (336, 8);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (642, 4);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (91941, 1103);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (104, 23);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (651, 1205);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1303, 8);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (56805, 8);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1224, 2);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (21525, 21);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (14483, 72);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (44489, 4);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (418, 4);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (657, 87);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (100448, 1209);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (44347, 290);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (21, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1859, 135);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (4, 4);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (664, 10);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (28, 15);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (26, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (34053, 412);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (7, 8);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (145, 48);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (78523, 1278);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (88660, 23);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (11734, 92);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (23390, 450);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (72467, 1063);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (904, 847);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (37707, 48);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (105084, 35);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (81, 28);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1133, 591);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (119161, 1209);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (610, 21);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (745, 1);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (45143, 161);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (22, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (3031, 35);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (60783, 1361);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (756, 54);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (3006, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (44307, 817);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (11327, 57);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (28393, 121);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (88639, 95);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (11514, 953);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (44, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (97244, 1295);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (38071, 88);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (33327, 87);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (92559, 8);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (107931, 4);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (30, 11);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (214, 68);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (698, 27);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1325, 301);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (13245, 306);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (8157, 21);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (29211, 419);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (113010, 8);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (126287, 229);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (43, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (7375, 87);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (7519, 229);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (36413, 953);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (1183, 229);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (102, 21);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (85968, 87);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (24692, 48);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (104538, 117);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (3285, 2);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (6812, 229);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (21498, 412);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (42451, 35);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (3299, 163);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (3866, 35);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (99314, 137);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (419, 113);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (9711, 83);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (17051, 419);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (25515, 25);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (658, 4);
REPLACE INTO `publish` (`idmanga`, `idmagazine`)
VALUES
  (743, 3);
--
  -- Add the relevants constraints
  --
ALTER TABLE
  `classify`
ADD
  CONSTRAINT `fk_classify_genre` FOREIGN KEY (`idgenre`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD
  CONSTRAINT `fk_classify_manga` FOREIGN KEY (`idmanga`) REFERENCES `manga` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE
  `publish`
ADD
  CONSTRAINT `fk_publish_magazine` FOREIGN KEY (`idmagazine`) REFERENCES `magazine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD
  CONSTRAINT `fk_publish_manga` FOREIGN KEY (`idmanga`) REFERENCES `manga` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE
  `write`
ADD
  CONSTRAINT `fk_write_author` FOREIGN KEY (`idauthor`) REFERENCES `author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD
  CONSTRAINT `fk_write_manga` FOREIGN KEY (`idmanga`) REFERENCES `manga` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET
  session SQL_MODE = default;
-- Restore the SQL_MODE to default