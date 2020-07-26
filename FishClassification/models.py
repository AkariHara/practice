import flask.database
import flask.dbmodels
import http.client, urllib.request, urllib.parse, urllib.error, base64
from azure.cognitiveservices.vision.customvision.prediction import CustomVisionPredictionClient

base_url = 'azure URL'
projectID = 'ID'
publish_iteration_name = 'FishClassification'
prediction_key = 'key'

threshold = 10

#APIの呼び出し
def callAPI(uploadFile):
    #予測用インスタンスの作成
    predictor = CustomVisionPredictionClient(prediction_key, endpoint=base_url)

    with open(uploadFile, mode='rb') as f:
        #予測実行
        results = predictor.classify_image(projectID, publish_iteration_name, f.read())

    result = []

    for prediction in results.predictions:
        if len(get_fish_data(prediction.tag_name)) != 0:
            #確率がしきい値より大きいものを採用する
            if prediction.probability * 100 > threshold:
                result.append(get_fish_data(prediction.tag_name))

    return result

#魚情報をDBから取得して辞書型で返す
def get_fish_data(fishname):
    ses = flask.database.db_session()
    fish_master = flask.dbmodels.FishMaster
    fish_data = ses.query(fish_master).filter(fish_master.fish_name == fishname).first()

    fish_data_dict = {}

    if not fish_data is None:
        fish_data_dict['fish_name'] = fish_data.fish_name
        if fish_data.classifi == 1:
            fish_data_dict['classifi'] = '外来種'
        else:
            fish_data_dict['classifi'] = ''
        fish_data_dict['country'] = fish_data.country
        fish_data_dict['wiki_url'] = fish_data.wiki_url
        fish_data_dict['picture_path'] = fish_data.picture_path
        fish_data_dict['copyright_owner'] = fish_data.copyright_owner
        fish_data_dict['copyright_url'] = fish_data.copyright_url

    return fish_data_dict
