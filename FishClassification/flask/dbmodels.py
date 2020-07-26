from sqlalchemy import Column, Integer, String, Boolean
from flask.database import Base

#テーブル情報魚マスタ
class FishMaster(Base):
    #テーブル名の設定
    __tablename__ = "fish_master"
    #Column情報の設定
    fish_name = Column(String, primary_key=True)
    classifi = Column(Integer)
    country = Column(String)
    wiki_url = Column(String)
    picture_path = Column(String)
    copyright_owner = Column(String)
    copyright_url = Column(String)

    def __init__(self, fish_name=None, classifi=None, country=None, wiki_url=None, picture_path=None, copyright_owner=None, copyright_url=None):
        self.fish_name = fish_name
        self.classifi = classifi
        self.country = country
        self.wiki_url = wiki_url
        self.picture_path = picture_path
        self.copyright_owner = copyright_owner
        self.copyright_url = copyright_url
