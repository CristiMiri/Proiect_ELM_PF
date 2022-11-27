module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id)
import Html.Attributes exposing (href)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }

{-| Functia transforma un element de tip DetailWithName
    intr-un list item al unei liste neordonate pentru
    contacte
-}
convertContacts: DetailWithName->Html msg
convertContacts item=
    li[][text (item.name++" "++item.detail)]

{-| Functia transforma un element de tip DetailWithName
    intr-un list item cu un link al unei liste neordonate
    pentru social links
-}
convertLinks: DetailWithName->Html msg
convertLinks item=
    li[][a[href item.detail][text item.name]]

view : PersonalDetails -> Html msg
view details =
    div [] 
        [ h1[id "name"][text details.name]
        , em[id "intro"][text details.intro]
        , ul[class "contact-detail"](List.map convertContacts details.contacts)
        , ul[class "social-link"](List.map convertLinks details.socials)
        ]