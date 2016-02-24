--|  Localization for SpartanUI.  |--
--|  The table is abbreviated for simplicity from SpartanUI_Language.type to SUIL.type  |--

local _G = getfenv(0)

function Sui_InitializeLanguages()

SUIL = {}

SUIL.AVAILABLE_LANGUAGES = {
	[1] = "English, Spanish (Español), Korean (한국어/조선말), Norwegian (Norsk), German (Deutsch), Simplified Chinese (简体中文), Traditional Chinese (繁體中文), Greek (Νέα Ελληνικά), Italian (Italiano), Swedish (Svenska), Russian (Pусский язык), Danish (Dansk), French (Français)",
}

SUIL.ENGLISH = {
	UI = {
		LANGUAGE = "English",
		CONTROL_PANEL = "Control Panel",
		CHOOSE_LANGUAGE = "Choose Language",
		CHOOSE_SKIN = "Choose Skin",
		CHOOSE_LAYOUT = "Choose Layout",
		TOGGLE_CHAT = "Toggle chat window",
		TOGGLE_SPINCAM = "Toggle SpinCam (a.k.a. Spinning Camera)",
		TEST = "test",
		GODMODE = "godmode",
		MAXRES = "maxres",
		VERSION = "version",
		UNKNOWN = "unknown",
		VERSION_CHECK = "version check broadcast to ",
		STAT_CHECK = "stat check broadcast to ",
		STAT = "stat",
		ONLY_AVAILABLE_IN_CHANNELS = "info only available for specific units, raid, or in-guild.",
		LOADED = "loaded",
		LANGUAGE_NOT_AVAILABLE = "language is not available.",
		TARGET_OR_TYPE = "You must either target or type the name of the person whom you wish to query.",
		CHATTER = "chatter",
		LATENCY = "Latency",
		FPS = "FPS",
		CURRENT_XP = "Current XP: ",
		RESTED_XP = "Rested XP: ",
		TIME_TO_LEVEL = "Time to level: ",
		MOBS_TO_LEVEL = "Mobs to level: ",
		LEVEL = "Level: ",
	},
	DRUID = {
		[1] = "Druid",
		[2] = "Balance",
		[3] = "Feral Combat",
		[4] = "Restoration",
	},
	MAGE = {
		[1] = "Mage",
		[2] = "Arcane",
		[3] = "Fire",
		[4] = "Frost",
	},
	PRIEST = {
		[1] = "Priest",
		[2] = "Discipline",
		[3] = "Holy",
		[4] = "Shadow",
	},
	ROGUE = {
		[1] = "Rogue",
		[2] = "Assassination",
		[3] = "Combat",
		[4] = "Subtlety",
	},
	WARRIOR = {
		[1] = "Warrior",
		[2] = "Arms",
		[3] = "Fury",
		[4] = "Protection",
	},
	HUNTER = {
		[1] = "Hunter",
		[2] = "Beast Mastery",
		[3] = "Marksmanship",
		[4] = "Survival",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Holy",
		[3] = "Protection",
		[4] = "Retribution",
	},
	SHAMAN = {
		[1] = "Shaman",
		[2] = "Elemental",
		[3] = "Enhancement",
		[4] = "Restoration",
	},
	WARLOCK = {
		[1] = "Warlock",
		[2] = "Affliction",
		[3] = "Demonology",
		[4] = "Destruction",
	},
}



SUIL.SPANISH = {
	UI = {
		LANGUAGE = "Español",
		CONTROL_PANEL = "Panel De Control",
		CHOOSE_LANGUAGE = "Seleccione Idioma",
		CHOOSE_SKIN = "Seleccione Caratula",
		CHOOSE_LAYOUT = "Seleccione modo de pantalla",
		TOGGLE_CHAT = "Accionar la ventana de conversacion, cerrar la ventana de conversacion",
		TOGGLE_SPINCAM = "Accionar Camara giratoria",
		TEST = "prueba",
		GODMODE = "Modo dios",
		MAXRES = "Maxima Resolucion",
		VERSION = "Version",
		UNKNOWN = "desconocido",
		VERSION_CHECK = " ",
		VERSION_CHECK = " ",
		STAT_CHECK = " ",
		STAT = " ",
		ONLY_AVAILABLE_IN_CHANNELS = " ",
		LOADED = " ",
		LANGUAGE_NOT_AVAILABLE = " ",
		TARGET_OR_TYPE = " ",
		CHATTER = " ",
		LATENCY = " ",
		FPS = " ",
		CURRENT_XP = " ",
		RESTED_XP = " ",
		TIME_TO_LEVEL = " ",
		MOBS_TO_LEVEL = " ",
		LEVEL = " ",
	},
	DRUID = {
		[1] = "Druida",
		[2] = "Equilibrio",
		[3] = "Combate Feral",
		[4] = "Restablecimiento",
	},
	MAGE = {
		[1] = "Mago",
		[2] = "Arcano",
		[3] = "Fuego",
		[4] = "Escarcha",
	},
	PRIEST = {
		[1] = "clerigo/sacerdote",
		[2] = "Disciplina",
		[3] = "Sagrado",
		[4] = "Sombra",
	},
	ROGUE = {
		[1] = "picaro",
		[2] = "Asesinato",
		[3] = "Combate",
		[4] = "Sutileza",
	},
	WARRIOR = {
		[1] = "Guerrero",
		[2] = "Armas",
		[3] = "Furia",
		[4] = "Proteccion",
	},
	HUNTER = {
		[1] = "Cazador",
		[2] = "Dominio de Bestias",
		[3] = "Punteria",
		[4] = "supervivencia",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Sagrado",
		[3] = "Proteccion",
		[4] = "Represion",
	},
	SHAMAN = {
		[1] = "Chaman",
		[2] = "Elemental",
		[3] = "Mejora",
		[4] = "Restauracion",
	},
	WARLOCK = {
		[1] = "Brujo",
		[2] = "Afliccion",
		[3] = "Demonologia",
		[4] = "Destruccion",
	},
}


SUIL.KOREAN = {
	UI = {
		LANGUAGE = "한국어/조선말",
		CONTROL_PANEL = "제어판",
		CHOOSE_LANGUAGE = "언어 선택",
		CHOOSE_SKIN = "스킨 선택",
		CHOOSE_LAYOUT = "레이아웃 선택",
		TOGGLE_CHAT = "대화창 전환",
		TOGGLE_SPINCAM = "스핀캠) 전환",
		TEST = "테스트하기",
		GODMODE = "갓(무적)모드 ",
		MAXRES = "최대해상도",
		VERSION = "버젼",
		UNKNOWN = "unknown",
		VERSION_CHECK = "로 버젼 출력",
		STAT_CHECK = "로 통계치 출력",
		STAT = "통계",
		ONLY_AVAILABLE_IN_CHANNELS = "의 정보는 특정 유닛/공격대/길드내에서만 확인이 가능합니다.",
		LOADED = "로딩 완료",
		LANGUAGE_NOT_AVAILABLE = "의 언어가 존재하지 않습니다.",
		TARGET_OR_TYPE = "질문하실 대상을 선택하시거나,대상의 이름을 입력하셔야만 합니다.",
		CHATTER = "대화창",
		LATENCY = "네트워크 안정성",
		FPS = "FPS",
		CURRENT_XP = "현재 경험치: ",
		RESTED_XP = "휴식 경험치: ",
		TIME_TO_LEVEL = "다음 레벨까지의 예상시간: ",
		MOBS_TO_LEVEL = "다음 레벨까지 잡아야할 몹의 예상숫자: ",
		LEVEL = "레벨: ",
	},
	DRUID = {
		[1] = "드루이드",
		[2] = "조화",
		[3] = "아생",
		[4] = "회복",
	},
	MAGE = {
		[1] = "마법사",
		[2] = "비젼",
		[3] = "화염",
		[4] = "냉기",
	},
	PRIEST = {
		[1] = "사제",
		[2] = "수양",
		[3] = "신성",
		[4] = "암흑",
	},
	ROGUE = {
		[1] = "도적",
		[2] = "암살",
		[3] = "전투",
		[4] = "잠행",
	},
	WARRIOR = {
		[1] = "전사",
		[2] = "무기",
		[3] = "분노",
		[4] = "방어",
	},
	HUNTER = {
		[1] = "사냥꾼",
		[2] = "야수",
		[3] = "사격",
		[4] = "생존",
	},
	PALADIN = {
		[1] = "성기사",
		[2] = "신성",
		[3] = "보호",
		[4] = "징벌",
	},
	SHAMAN = {
		[1] = "주술사",
		[2] = "정기",
		[3] = "고양",
		[4] = "복원",
	},
	WARLOCK = {
		[1] = "흑마법사",
		[2] = "고통",
		[3] = "악마",
		[4] = "파괴",
	},
}



SUIL.NORWEGIAN = {
	UI = {
		LANGUAGE = "Norsk",
		CONTROL_PANEL = "Kontrollpanel",
		CHOOSE_LANGUAGE = "Velg språk",
		CHOOSE_SKIN = "Velg skinn",
		CHOOSE_LAYOUT = "Velg layout",
		TOGGLE_CHAT = "Velg samtalevindu",
		TOGGLE_SPINCAM = "Velg Spinnkam (Spinnkamera)",
		TEST = "test",
		GODMODE = "udødelighet",
		MAXRES = "maksoppl (Maksimum Oppløsning)",
		VERSION = "versjon",
		UNKNOWN = "ukjent",
		VERSION_CHECK = "versjonsjekk send til ",
		STAT_CHECK = "statssjekk send til ",
		STAT = "som i statistikker",
		ONLY_AVAILABLE_IN_CHANNELS = "Opplysning om X kun tilgjengelig for spesifikke enheter, raid, eller guildmedlemmer",
		LOADED = "lastet",
		LANGUAGE_NOT_AVAILABLE = "Språket er ikke tilgjengelig",
		TARGET_OR_TYPE = "Du må enten utpeke eller skrive navnet på personen du ønsker å forhøre deg om",
		CHATTER = "småprat",
		LATENCY = "Latens",
		FPS = "FPS",
		CURRENT_XP = "Nåværende XP: ",
		RESTED_XP = "Hvilt XP: ",
		TIME_TO_LEVEL = "Tid til levling: ",
		MOBS_TO_LEVEL = "Monster igjen til levling: ",
		LEVEL = "Level: ",
	},
	DRUID = {
		[1] = "Druid",
		[2] = "Balance",
		[3] = "Feral Combat",
		[4] = "Restoration",
	},
	MAGE = {
		[1] = "Mage",
		[2] = "Arcane",
		[3] = "Fire",
		[4] = "Frost",
	},
	PRIEST = {
		[1] = "Priest",
		[2] = "Discipline",
		[3] = "Holy",
		[4] = "Shadow",
	},
	ROGUE = {
		[1] = "Rogue",
		[2] = "Assassination",
		[3] = "Combat",
		[4] = "Subtlety",
	},
	WARRIOR = {
		[1] = "Warrior",
		[2] = "Arms",
		[3] = "Fury",
		[4] = "Protection",
	},
	HUNTER = {
		[1] = "Hunter",
		[2] = "Beast Mastery",
		[3] = "Marksmanship",
		[4] = "Survival",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Holy",
		[3] = "Protection",
		[4] = "Retribution",
	},
	SHAMAN = {
		[1] = "Shaman",
		[2] = "Elemental",
		[3] = "Enhancement",
		[4] = "Restoration",
	},
	WARLOCK = {
		[1] = "Warlock",
		[2] = "Affliction",
		[3] = "Demonology",
		[4] = "Destruction",
	},
}




SUIL.GERMAN = {
	UI = {
		LANGUAGE = "Deutsch",
		CONTROL_PANEL = "Einstellungen",
		CHOOSE_LANGUAGE = "Sprache wählen",
		CHOOSE_SKIN = "Skin wählen",
		CHOOSE_LAYOUT = "Layout wählen",
		TOGGLE_CHAT = "ein/ausschalten des Chat Fensters",
		TOGGLE_SPINCAM = "ein/ausschalten der SpinCam (drehende Kamera)",
		TEST = "test",
		GODMODE = "godmode",
		MAXRES = "Maximale Auflösung",
		VERSION = "version",
		UNKNOWN = "unknown",
		VERSION_CHECK = "Versionsüberprüfung an ",
		STAT_CHECK = "stat check broadcast to ",
		STAT = "stat",
		ONLY_AVAILABLE_IN_CHANNELS = "Informationen nur für bestimmte Spieler, Raid, oder Gildenmitglieder",
		LOADED = "geladen",
		LANGUAGE_NOT_AVAILABLE = "Sprache nicht verfügbar.",
		TARGET_OR_TYPE = "Sie müssen die Person mit der sie sprechen wollen ins Ziel nehmen oder deren Namen eintippen",
		CHATTER = "chatter",
		LATENCY = "Latenz",
		FPS = "FPS",
		CURRENT_XP = "momentane EP: ",
		RESTED_XP = "erholt EP: ",
		TIME_TO_LEVEL = "Zeit bis Level: ",
		MOBS_TO_LEVEL = "Mobs bis Level: ",
		LEVEL = "Level: ",
	},
	DRUID = {
		[1] = "DRUIDE",
		[2] = "Gleichgewicht",
		[3] = "Wilder Kampf",
		[4] = "Wiederherstellung",
	},
	MAGE = {
		[1] = "MAGIER",
		[2] = "Arkan",
		[3] = "Feuer",
		[4] = "Frost",
	},
	PRIEST = {
		[1] = "PRIESTER",
		[2] = "Disziplin",
		[3] = "Heilig",
		[4] = "Schatten",
	},
	ROGUE = {
		[1] = "SCHURKE",
		[2] = "Meucheln",
		[3] = "Kampf",
		[4] = "Täuschung",
	},
	WARRIOR = {
		[1] = "KRIEGER",
		[2] = "Waffen",
		[3] = "Furor",
		[4] = "Schutz",
	},
	HUNTER = {
		[1] = "JÄGER",
		[2] = "Tierherrschaft",
		[3] = "Treffsicherheit",
		[4] = "Überleben",
	},
	PALADIN = {
		[1] = "PALADIN",
		[2] = "Heilig",
		[3] = "Schutz",
		[4] = "Vergeltung",
	},
	SHAMAN = {
		[1] = "SCHAMANE",
		[2] = "Elementar",
		[3] = "Verstärkung",
		[4] = "Wiederherstellung",
	},
	WARLOCK = {
		[1] = "HEXENMEISTER",
		[2] = "Gebrechen",
		[3] = "Dämonologie",
		[4] = "Zerstörung",
	},
}



SUIL.SIMPLIFIED_CHINESE = {
	UI = {
		LANGUAGE = "简体中文",
		CONTROL_PANEL = "控制面板",
		CHOOSE_LANGUAGE = "选择语言",
		CHOOSE_SKIN = "选择皮肤",
		CHOOSE_LAYOUT = "选择布局",
		TOGGLE_CHAT = "打开聊天窗口",
		TOGGLE_SPINCAM = "打开扩展镜头",
		TEST = "测试",
		GODMODE = "上帝模式",
		MAXRES = "最大分辨率",
		VERSION = "版本",
		UNKNOWN = "未知",
		VERSION_CHECK = "版本检测广播到 ",
		STAT_CHECK = "统计检测广播到 ",
		STAT = "stat",
		ONLY_AVAILABLE_IN_CHANNELS = "信息仅对特定单位,团队或公会可用。",
		LOADED = "加载成功。",
		LANGUAGE_NOT_AVAILABLE = "语言不可用。",
		TARGET_OR_TYPE = "查询对象必须是你的目标或者请输入查询对象名字。",
		CHATTER = "chatter",
		LATENCY = "延迟",
		FPS = "每秒帧数",
		CURRENT_XP = "目前经验值 ",
		RESTED_XP = "精力充沛奖励经验 ",
		TIME_TO_LEVEL = "升级所需时间 ",
		MOBS_TO_LEVEL = "升级所需杀怪 ",
		LEVEL = "等级 ",
	},
	DRUID = {
		[1] = "德鲁伊",
		[2] = "平衡",
		[3] = "野性战斗",
		[4] = "恢复",
	},
	MAGE = {
		[1] = "法师",
		[2] = "奥术",
		[3] = "火焰",
		[4] = "冰霜",
	},
	PRIEST = {
		[1] = "牧师",
		[2] = "戒律",
		[3] = "神圣",
		[4] = "暗影",
	},
	ROGUE = {
		[1] = "潜行者",
		[2] = "刺杀",
		[3] = "战斗",
		[4] = "敏锐",
	},
	WARRIOR = {
		[1] = "战士",
		[2] = "武器",
		[3] = "狂怒",
		[4] = "防护",
	},
	HUNTER = {
		[1] = "猎人",
		[2] = "野兽掌握",
		[3] = "射击",
		[4] = "生存",
	},
	PALADIN = {
		[1] = "圣骑士",
		[2] = "神圣",
		[3] = "防护",
		[4] = "惩戒",
	},
	SHAMAN = {
		[1] = "萨满祭司",
		[2] = "元素战斗",
		[3] = "增强",
		[4] = "恢复",
	},
	WARLOCK = {
		[1] = "术士",
		[2] = "痛苦",
		[3] = "恶魔学识",
		[4] = "毁灭",
	},
}



SUIL.TRADITIONAL_CHINESE = {
	UI = {
		LANGUAGE = "繁體中文",
		CONTROL_PANEL = "控制面板",
		CHOOSE_LANGUAGE = "選擇語系",
		CHOOSE_SKIN = "選擇皮膚",
		CHOOSE_LAYOUT = "選擇布局",
		TOGGLE_CHAT = "打開聊天窗",
		TOGGLE_SPINCAM = "打開擴展鏡頭",
		TEST = "測試",
		GODMODE = "上帝模式",
		MAXRES = "最大解析度",
		VERSION = "版本",
		UNKNOWN = "未知",
		VERSION_CHECK = "版本檢查廣播到 ",
		STAT_CHECK = "統計檢查廣播到 ",
		STAT = "stat",
		ONLY_AVAILABLE_IN_CHANNELS = "資訊僅對特定單位,團隊或公會可用。",
		LOADED = "加載成功。",
		LANGUAGE_NOT_AVAILABLE = "語系不可用。",
		TARGET_OR_TYPE = "查詢對象必須是你的目標或請鍵入查詢對象名字。",
		CHATTER = "chatter",
		LATENCY = "延迟",
		FPS = "每秒幀數",
		CURRENT_XP = "目前經驗值 ",
		RESTED_XP = "精力充沛獎勵經驗 ",
		TIME_TO_LEVEL = "升級所需時間 ",
		MOBS_TO_LEVEL = "升級所需殺怪 ",
		LEVEL = "等級 ",
	},
	DRUID = {
		[1] = "德魯伊",
		[2] = "平衡",
		[3] = "野性戰斗",
		[4] = "恢復",
	},
	MAGE = {
		[1] = "法師",
		[2] = "秘法",
		[3] = "火焰",
		[4] = "冰霜",
	},
	PRIEST = {
		[1] = "牧師",
		[2] = "戒律",
		[3] = "神聖",
		[4] = "暗影",
	},
	ROGUE = {
		[1] = "盜賊",
		[2] = "刺殺",
		[3] = "戰斗",
		[4] = "敏銳",
	},
	WARRIOR = {
		[1] = "戰士",
		[2] = "武器",
		[3] = " 狂怒",
		[4] = "防護",
	},
	HUNTER = {
		[1] = "獵人",
		[2] = "野獸控制",
		[3] = "射擊",
		[4] = "生存",
	},
	PALADIN = {
		[1] = "聖騎士",
		[2] = "神聖",
		[3] = "防護",
		[4] = "懲戒",
	},
	SHAMAN = {
		[1] = "薩滿",
		[2] = "元素",
		[3] = "增強",
		[4] = "恢復",
	},
	WARLOCK = {
		[1] = "術士",
		[2] = "痛苦",
		[3] = "惡魔學識",
		[4] = "毀滅",
	},
}



SUIL.GREEK = {
	UI = {
		LANGUAGE = "Νέα Ελληνικά",
		CONTROL_PANEL = "Πίνακας Ελέγχου",
		CHOOSE_LANGUAGE = "Επιλέξτε γλώσσα",
		CHOOSE_SKIN = "Επιλέξτε εμφάνιση",
		CHOOSE_LAYOUT = "Επιλέξτε στήσιμο",
		TOGGLE_CHAT = "Ενεργοποιήστε το παράθυρο συζήτησης",
		TOGGLE_SPINCAM = "Ενεργοποιήστε την περιστροφική κάμερα",
		TEST = "τεστ",
		GODMODE = "godmode",
		MAXRES = "Μέγιστη Ανάλυση",
		VERSION = "έκδοση",
		UNKNOWN = "άγνωστη",
	},
	DRUID = {
		[1] = "Druid",
		[2] = "Balance",
		[3] = "Feral Combat",
		[4] = "Restoration",
	},
	MAGE = {
		[1] = "Mage",
		[2] = "Arcane",
		[3] = "Fire",
		[4] = "Frost",
	},
	PRIEST = {
		[1] = "Priest",
		[2] = "Discipline",
		[3] = "Holy",
		[4] = "Shadow",
	},
	ROGUE = {
		[1] = "Rogue",
		[2] = "Assassination",
		[3] = "Combat",
		[4] = "Subtlety",
	},
	WARRIOR = {
		[1] = "Warrior",
		[2] = "Arms",
		[3] = "Fury",
		[4] = "Protection",
	},
	HUNTER = {
		[1] = "Hunter",
		[2] = "Beast Mastery",
		[3] = "Marksmanship",
		[4] = "Survival",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Holy",
		[3] = "Protection",
		[4] = "Retribution",
	},
	SHAMAN = {
		[1] = "Shaman",
		[2] = "Elemental",
		[3] = "Enhancement",
		[4] = "Restoration",
	},
	WARLOCK = {
		[1] = "Warlock",
		[2] = "Affliction",
		[3] = "Demonology",
		[4] = "Destruction",
	},
}



SUIL.ITALIAN = {
	UI = {
		LANGUAGE = "Italiano",
		CONTROL_PANEL = "Pannello di Controllo",
		CHOOSE_LANGUAGE = "Scegli la Llingua",
		CHOOSE_SKIN = "Scegli la Personalizzazione",
		CHOOSE_LAYOUT = "Scegli la Disposizione",
		TOGGLE_CHAT = "Alterna Finestra di Comunicazion",
		TOGGLE_SPINCAM = "Alterna Rotazione Fotocamera",
		TEST = "test",
		GODMODE = "modalità massima",
		MAXRES = "Risoluzione Massima",
		VERSION = "versione",
		UNKNOWN = "ignoto",
		VERSION_CHECK = "controllo versione comunicato a ",
		STAT_CHECK = "controllo statistiche comunicato a ",
		STAT = "stat",
		ONLY_AVAILABLE_IN_CHANNELS = "informazioni in X disponibili solo per specifiche unità, raid o di gilda.",
		LOADED = "caricato",
		LANGUAGE_NOT_AVAILABLE = "Lingua non disponibile",
		TARGET_OR_TYPE = "Devi selezionare o scrivere il nome della persona che desideri interrogare.",
		CHATTER = "chatter",
		LATENCY = "Latenza",
		FPS = "FPS",
		CURRENT_XP = "XP Correnti ",
		RESTED_XP = " XP Riposo ",
		TIME_TO_LEVEL = "Tempo per livellare ",
		MOBS_TO_LEVEL = "Nemici per livellare ",
		LEVEL = "Livello: ",

	},
	DRUID = {
		[1] = "Druid",
		[2] = "Balance",
		[3] = "Feral Combat",
		[4] = "Restoration",
	},
	MAGE = {
		[1] = "Mage",
		[2] = "Arcane",
		[3] = "Fire",
		[4] = "Frost",
	},
	PRIEST = {
		[1] = "Priest",
		[2] = "Discipline",
		[3] = "Holy",
		[4] = "Shadow",
	},
	ROGUE = {
		[1] = "Rogue",
		[2] = "Assassination",
		[3] = "Combat",
		[4] = "Subtlety",
	},
	WARRIOR = {
		[1] = "Warrior",
		[2] = "Arms",
		[3] = "Fury",
		[4] = "Protection",
	},
	HUNTER = {
		[1] = "Hunter",
		[2] = "Beast Mastery",
		[3] = "Marksmanship",
		[4] = "Survival",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Holy",
		[3] = "Protection",
		[4] = "Retribution",
	},
	SHAMAN = {
		[1] = "Shaman",
		[2] = "Elemental",
		[3] = "Enhancement",
		[4] = "Restoration",
	},
	WARLOCK = {
		[1] = "Warlock",
		[2] = "Affliction",
		[3] = "Demonology",
		[4] = "Destruction",
	},
}



SUIL.SWEDISH = {
	UI = {
		LANGUAGE = "Svenska",
		CONTROL_PANEL = "Kontrollpanel",
		CHOOSE_LANGUAGE = "Välj språk",
		CHOOSE_SKIN = "Välj skinn",
		CHOOSE_LAYOUT = "Välj utseende",
		TOGGLE_CHAT = "Slå på/av chattfönster",
		TOGGLE_SPINCAM = "Slå på/av snurrkamera",
		TEST = "Prova",
		GODMODE = "modalità massima",
		MAXRES = "Max upplösning",
		VERSION = "versione",
		UNKNOWN = "Okänd",
		VERSION_CHECK = "Versionkontroll vidarebefordras till ",
		STAT_CHECK = "statistisk kontroll vidarebefordras till ",
		STAT = "stat",
		ONLY_AVAILABLE_IN_CHANNELS = "information X är endast tillgänglig för specifika grupper, räd, eller inom gillet.",
		LOADED = "laddad",
		LANGUAGE_NOT_AVAILABLE = "språk är inte tillgängligt.",
		TARGET_OR_TYPE = "Du måste antingen markera eller skriva in namnet på den person som du vill få information om",
		CHATTER = "babbel",
		LATENCY = "Fördröjning",
		FPS = "FPS",
		CURRENT_XP = "Nuvarande XP ",
		RESTED_XP = "Vilande XP ",
		TIME_TO_LEVEL = "Kvarvarande tid till nivåökning ",
		MOBS_TO_LEVEL = "Kvarvarande fiender till nivåökning ",
		LEVEL = "Nivå: ",
	},
	DRUID = {
		[1] = "Druid",
		[2] = "Balans",
		[3] = "Vild kamp",
		[4] = "Rehabilitering",
	},
	MAGE = {
		[1] = "Magiker",
		[2] = "Mystik",
		[3] = "Eld",
		[4] = "Köld",
	},
	PRIEST = {
		[1] = "Präst",
		[2] = "Disciplin",
		[3] = "Helig",
		[4] = "Skugga",
	},
	ROGUE = {
		[1] = "Skurk",
		[2] = "Lönnmord",
		[3] = "Strid",
		[4] = "Finess",
	},
	WARRIOR = {
		[1] = "Krigare",
		[2] = "Vapen",
		[3] = "Ursinne",
		[4] = "Skydd",
	},
	HUNTER = {
		[1] = "Jägare",
		[2] = "Odjurmästare",
		[3] = "Skytte",
		[4] = "Överlevnad",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Helig",
		[3] = "Skydd",
		[4] = "Vedergällning",
	},
	SHAMAN = {
		[1] = "Schaman",
		[2] = "Elementär",
		[3] = "Förstärkande",
		[4] = "Rehabilitering",
	},
	WARLOCK = {
		[1] = "Häxmästare",
		[2] = "Smärta",
		[3] = "Demonkunskap",
		[4] = "Förstörelse",
	},
}



SUIL.RUSSIAN = {
	UI = {
		LANGUAGE = "Pусский язык",
		CONTROL_PANEL = "Панель управления",
		CHOOSE_LANGUAGE = "Выбрать язык",
		CHOOSE_SKIN = "Выбрать тему",
		CHOOSE_LAYOUT = "Выбрать расположение",
		TOGGLE_CHAT = "Развернуть окно чата",
		TOGGLE_SPINCAM = "Включить разворот камеры (ака Разворачивающаяся камера)",
		TEST = "Тест",
		GODMODE = "Режим бога",
		MAXRES = "максразр",
		VERSION = "версия",
		UNKNOWN = "неизвестно",
	},
	DRUID = {
		[1] = "Друид",
		[2] = "Балансер",
		[3] = "Ферал",
		[4] = "Рестор",
	},
	MAGE = {
		[1] = "Маг",
		[2] = "Аркан",
		[3] = "Фаер",
		[4] = "Фрост",
	},
	PRIEST = {
		[1] = "Прист",
		[2] = "Дисциплин",
		[3] = "Холи",
		[4] = "Шедоу",
	},
	ROGUE = {
		[1] = "Рога",
		[2] = "Ассассин",
		[3] = "Комбат",
		[4] = "Сабтлеты",
	},
	WARRIOR = {
		[1] = "Воин",
		[2] = "Армс",
		[3] = "Фури",
		[4] = "Протекшн",
	},
	HUNTER = {
		[1] = "Хантер",
		[2] = "Бистмастер",
		[3] = "Марксманшип",
		[4] = "Сурвайвал",
	},
	PALADIN = {
		[1] = "Паладин",
		[2] = "Холи",
		[3] = "Протекшн",
		[4] = "Ретрибьюшн",
	},
	SHAMAN = {
		[1] = "Шаман",
		[2] = "Элементаль",
		[3] = "Энханс",
		[4] = "Рестор",
	},
	WARLOCK = {
		[1] = "Варлок",
		[2] = "Аффликт",
		[3] = "Демонолог",
		[4] = "Дестракшн",
	},
}



SUIL.DANISH = {
	UI = {
		LANGUAGE = "Dansk",
		CONTROL_PANEL = "Kontrol panel",
		CHOOSE_LANGUAGE = "Vælg sprog",
		CHOOSE_SKIN = "Vælg overflade",
		CHOOSE_LAYOUT = "Vælg tema",
		TOGGLE_CHAT = "Slå chat vindue til/fra",
		TOGGLE_SPINCAM = "Slå roterende kamera til/fra",
		TEST = "test",
		GODMODE = "godmode",
		MAXRES = "Maks opløsning",
		VERSION = "version",
		UNKNOWN = "ukendt",
	},
	DRUID = {
		[1] = "Druid",
		[2] = "Balance",
		[3] = "Feral Combat",
		[4] = "Restoration",
	},
	MAGE = {
		[1] = "Mage",
		[2] = "Arcane",
		[3] = "Fire",
		[4] = "Frost",
	},
	PRIEST = {
		[1] = "Priest",
		[2] = "Discipline",
		[3] = "Holy",
		[4] = "Shadow",
	},
	ROGUE = {
		[1] = "Rogue",
		[2] = "Assassination",
		[3] = "Combat",
		[4] = "Subtlety",
	},
	WARRIOR = {
		[1] = "Warrior",
		[2] = "Arms",
		[3] = "Fury",
		[4] = "Protection",
	},
	HUNTER = {
		[1] = "Hunter",
		[2] = "Beast Mastery",
		[3] = "Marksmanship",
		[4] = "Survival",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Holy",
		[3] = "Protection",
		[4] = "Retribution",
	},
	SHAMAN = {
		[1] = "Shaman",
		[2] = "Elemental",
		[3] = "Enhancement",
		[4] = "Restoration",
	},
	WARLOCK = {
		[1] = "Warlock",
		[2] = "Affliction",
		[3] = "Demonology",
		[4] = "Destruction",
	},
}




SUIL.FRENCH = {
	UI = {
		LANGUAGE = "Français",
		CONTROL_PANEL = "Panneau de configuration",
		CHOOSE_LANGUAGE = "Choisir Langue",
		CHOOSE_SKIN = "Choisir Style",
		CHOOSE_LAYOUT = "Choisir Format",
		TOGGLE_CHAT = "Sélectionner Fenêtre de text",
		TOGGLE_SPINCAM = "Sélectionner ''SpinCam'' (i.e. Caméra Tournante)",
		TEST = "test",
		GODMODE = "modedieu",
		MAXRES = "Maks opløsning",
		VERSION = "version",
		UNKNOWN = "Inconnu",
	},
	DRUID = {
		[1] = "Druide",
		[2] = "Équilibre",
		[3] = "Combat Feral",
		[4] = "Restauration",
	},
	MAGE = {
		[1] = "Mage",
		[2] = "Arcane",
		[3] = "Feu",
		[4] = "Givre",
	},
	PRIEST = {
		[1] = "Prêtre",
		[2] = "Discipline",
		[3] = "Sacré",
		[4] = "Ombre",
	},
	ROGUE = {
		[1] = "Voleur",
		[2] = "Assassinat",
		[3] = "Combat",
		[4] = "Finesse",
	},
	WARRIOR = {
		[1] = "Guerrier",
		[2] = "Arme",
		[3] = "Fureur",
		[4] = "Protection",
	},
	HUNTER = {
		[1] = "Chasseur",
		[2] = "Maîtrise des bêtes",
		[3] = "Précision",
		[4] = "Survie",
	},
	PALADIN = {
		[1] = "Paladin",
		[2] = "Sacré",
		[3] = "Protection",
		[4] = "Vindicte",
	},
	SHAMAN = {
		[1] = "Chaman",
		[2] = "Elementaire",
		[3] = "Amélioration",
		[4] = "Restauration",
	},
	WARLOCK = {
		[1] = "Démoniste",
		[2] = "Affliction",
		[3] = "Démonologie",
		[4] = "Destruction",
	},
}


	SUI_Lang = (SUI_Lang or SUIL.ENGLISH)
	DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." " .. SUI_Lang.UI.LANGUAGE .. " loaded.", 1, 0.75, 0)

	if SUI_Lang.LANGUAGE==SUIL.RUSSIAN.LANGUAGE or SUI_Lang.LANGUAGE==SUIL.CHINESE.LANGUAGE then
		local font = SUI_FontTitle_Lang
		SUI_Self_Name:SetFontObject(font)
		SUI_Target_Name:SetFontObject(font)
		SUI_Party1_Name:SetFontObject(font)
		SUI_Party2_Name:SetFontObject(font)
		SUI_Party3_Name:SetFontObject(font)
		SUI_Party4_Name:SetFontObject(font)
		SUI_Pet_Name:SetFontObject(font)
		SUI_TOT_Name:SetFontObject(font)
		SUI_MouseTooltip_Text:SetFontObject(font)
	end

	BINDING_HEADER_SPARTANUI = "SpartanUI"
	BINDING_NAME_SUI_CHATTOGGLE = SUI_Lang.UI.TOGGLE_CHAT
	BINDING_NAME_DOOTHERSTUFF = "another name"
	BINDING_NAME_DOMORESTUFF = "yet another name"


end