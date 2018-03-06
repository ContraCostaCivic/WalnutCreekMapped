//
//  C.swift
//  walnutcreek
//
//  Created by Lewis Black on 03/03/2018.
//  Copyright © 2018 Lewis Black. All rights reserved.
//

import Foundation

//
//  FirebaseConstants.swift
//  Celebreak
//
//  Created by Lewis Black on 01/03/2017.
//  Copyright © 2017 Lewis Black. All rights reserved.
//

import Firebase
import Foundation

/** Firebase Constants */
struct C {
    static let database = Database.database()
    static let firebaseRef = database.reference()
    
    static let CITIES = "cities"
    static let FORBIDDEN_VERSIONS = "forbiddenVersions"
    
    static let USERS = "users"
    static let USERS_JUST_UID = "usersJustUid"
    static let USERS_DETAILED = "usersDetailed"
    
    static let FIESTAS = "fiestas"
    static let TOURNAMENTS = "tournaments"
    static let TERMS_AND_CONDITIONS = "terms"
    
    struct USER {
        static let UID = "uid"
        static let GAME_IDS = "gam"
        static let NAME = "nam"
        static let PHOTO_URL = "pho"
        static let APP_VERSION_DOWNLOADED = "app"
        
        static let TOTAL_RED_CARDS = "red"
        static let TOTAL_YELLOW_CARDS = "yel"
        static let GAMES_PLAYED = "gam"
        static let TELEPHONE_NUMBER = "tel"
        static let FIRST_NAME = "fir"
        static let LAST_NAME = "las"
        static let GENDER = "gen"
        static let LOCALE = "loc"
        static let AGE_RANGE = "age"
        static let TIMEZONE = "tim"
        static let LINK = "lin"
        static let ANDROID_APP_VERSION_DOWNLOADED = "androidapp"
        static let EMAIL = "ema"
        static let ACCOUNT_CREATED = "cre"
        static let ACCOUNT_LAST_ACTIVE = "lac"
        
        static let DEVICE_ID = "deviceID"
        
    }
    
    static let PICKUP = "pickUp"
    static let GAME_IDS_ON_DATES = "gamesIDsOnDates"
    static let GAMES_DETAILED = "gamesDetailed"
    static let LOCATIONS = "locations"
    
    
    
    struct GAME {
        static let MESSAGES = "mess"
        static let GAME_DATA = "gameData"
        
        
        static let GAMEID = "gid"
        static let YEAR = "yea"
        static let MONTH = "mon"
        static let DAY = "day"
        static let HOUR = "hou"
        static let MINUTE = "min"
        static let DATE_STRING = "dat"
        static let LOCATIONID = "lid"
        static let TEAM1_PLAYER_IDS = "pla1"
        static let TEAM2_PLAYER_IDS = "pla2"
        
        static let NUMBER_OF_MAX_PLAYERS = "max"
        static let NUMBER_OF_CURRENT_PLAYERS = "cur"
        static let GAME_TYPE = "typ"
        
        static let WALL = "wal"
        
        static let GAME_MESSAGE = "mes"
        static let GAME_CANCELLED = "can"
        static let GAME_EDITED = "edi"
        static let CANCELLED_MESSAGE = "canMes"
        static let EDITED_MESSAGE = "ediMes"
        
        static let DURATION = "dur"
        static let COST = "cos"
        //        static let GENDER = "gen"
        //        static let TELEPHONE_NUMBER = "tel"
        
        static let PLAYER_NAME = "pnam"
        static let PLAYER_URLSTRING = "url"
        
        struct MESSAGE {
            static let USERNAME = "unm"
            static let USERID = "usi"
            static let MESSAGE = "mes"
        }
    }
    
    struct LOCATION {
        static let LOCATIONID = "lid"
        static let NAME = "nam"
        static let LATITUDE = "lat"
        static let LONGITUDE = "lon"
        static let GAME_IDS = "gam"
        static let NEIGHBOURHOOD = "nei"
        static let ADDRESS = "add"
        static let MESSAGE = "mes"
        static let PICTURE_STRING = "pic"
    }
    
    
    
    struct LEAGUES {
        static let LEAGUES = "leagues"
        static let LEAGUES_IDS_ON_DATES = "leaguesIDsOnDates"
        static let LEAGUES_DETAILED = "leaguesDetailed"
        
        static let LEAGUE_VIDEO = "leagueVideo"
        
        //        static let DATE_STRING = "dat"
        static let MESSAGE = "mes"
        static let TABLE = "tab"
        static let FIXTURES = "fix"
        static let RESULTS = "res"
        static let TOPSCORERS = "topScorers"
        static let ALBUMS_TO_ADD = "photoAlbumsWithoutURLs"
        static let ALBUMS = "photoAlbums"
        
        
        static let DURATION_DATE_STRING = "durds"
        static let START_DATE_STRING = "stads"
        
        static let TYPE = "typ"
        
        static let TEAMID = "tid"
        static let NAME = "nam"
        static let PLAYED = "pla"
        static let WON = "won"
        static let DRAWN = "dra"
        static let LOST = "los"
        static let GOAL_DIFFERENCE = "godi"
        static let POINTS = "poi"
        
        static let ID = "eid"
        static let HOMETEAMID = "te1"
        static let AWAYTEAMID = "te2"
        static let YEAR = "yea"
        static let MONTH = "mon"
        static let DAY = "day"
        static let HOUR = "hou"
        static let MINUTE = "min"
        static let HOMETEAMGOALS = "t1g"
        static let AWAYTEAMGOALS = "t2g"
        static let VIDEOID = "vidId"
        static let VIDEO_NAME = "vidName"
        
        static let ALBUM_ID = "albID"
        static let ALBUM_NAME = "albNam"
        static let ALBUM_POSITION = "pos"
        static let ALBUM_URLS = "urls"
        
        static let TOP_SCORER_NAME = "plaN"
        static let TOP_SCORER_GOALS = "gol"
        static let TOP_SCORER_TEAMNAME = "teaN"
        static let TOP_SCORER_POSITION = "pos"
        
    }
    
    struct FIESTA {
        static let array = "arr"
        
        static let messageOnFirstPage = "firMes"
        
        static let dayText = "day"
        static let messageText = "mes"
        static let timeText = "tim"
        static let nameOfImage = "nam"
        static let textOfImage = "txt"
        static let orderInArray = "orderInArray"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let joinMessage = "joi"
        static let clubDescription = "clu"
    }
    
    struct TOURNAMENT {
        static let array = "arr"
        
        static let messageOnFirstPage = "firMes"
        
        static let mainMessage = "mainmes"
        
        static let name = "name"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let time = "tim"
        static let date = "dat"
        static let imageName = "imageName"
        static let imageName2 = "imageName2"
        static let joinMessage = "joi"
        static let location = "loc"
        static let locationText = "locT"
        static let orderInArray = "orderInArray"
        
    }
}
