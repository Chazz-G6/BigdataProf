import pandas as pd
import json
import requests
from bs4 import BeautifulSoup


url = "http://apis.data.go.kr/1360000/AsosDalyInfoService/getWthrDataList"

queryParams =   '?' + \
                'ServiceKey=' + '42oidZ%2BJM1zFI5bS2cFUcsYnDJSIVUNN%2Fgwwtm4PWKIsM8f8GoVIkhRkzUv7tzgz3QbrggEDH1cVb4enmySXDg%3D%3D' + \
                '&pageNo='+ '1' + \
                '&numOfRows=' + '999' + \
                '&dataType=' + 'JSON' + \
                '&dataCd=' + 'ASOS' + \
                '&dateCd=' + 'DAY' + \
                '&startDt=' + '20200101' + \
                '&endDt=' + '20200421' + \
                '&stnIds=' + '108'

result = requests.get(url + queryParams)
js = json.loads(result.content)
data = pd.DataFrame(js['response']['body']['items']['item'])

li = ['stnId','tm','avgTa','minTa','maxTa','sumRn','maxWs','avgWs','ddMes']

data.loc[:,li]

data[li].to_csv("C:/Bigdata/work/Python_Bigdata/Ch02/weather.csv", index=False)