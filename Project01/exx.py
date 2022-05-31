import pandas as pd
import plotly.express as px  # (version 4.7.0 or higher)
import plotly.graph_objects as go
from dash import Dash, dcc, html, Input, Output  # pip install dash (version 2.0.0 or higher)






app = Dash(__name__)

#Import and clean

df = pd.read_csv("faang_stocks_pandemic_data.csv")
df2 = pd.read_csv("online_store_customer_data.csv")
#불러오기

df = df.groupby(['Name', 'Date', 'Volume', 'Open', 'High', 'Low','Adj Close'])[['Close']].sum()
df2 = df2.groupby(["State_names"])["Amount_spent"].mean().sort_values(ascending = False)
# 그룹바이
df.reset_index(inplace=True)
print(df[:5])


# ------------------------------------------------------------------------------
# App layout
app.layout = html.Div([

    html.H1("The 'FAANG' Stock chart after COVID-19", style={'text-align': 'center'}),
    #제목 헤드 1
    html.Br(),
    dcc.Dropdown(id="slct_year", #드롭다운 id = 연도_선택
                options=[ #선택지
                    {"label": "Facebook", "value": "Facebook"},
                    {"label": "Google", "value": "Google"},
                    {"label": "Amazon", "value": "Amazon"},
                    {"label": "Netflix", "value": "Netflix"},
                    {"label": "Apple", "value": "Apple"}],
                multi=False, # 다중 = False
                value="Apple", # 현재값 =2015
                style={'width': "40%",'text-align': 'center'} #스타일='넓이':40%
                ),
    html.Br(),
    html.Div(id='output_container', children=[]),# Div, id=아웃풋상자, 비어있음
    dcc.Graph(id='faang_stocks_pandemic_data', figure={}) # 그래프 예정. id=내_벌_지도
])


# ------------------------------------------------------------------------------
# Connect the Plotly graphs with Dash Components
@app.callback( #콜백
    [Output(component_id='output_container', component_property='children'),
    #위의 아웃풋상자 id에서 비어있는 칠드런 프로퍼티를 가져옴
    Output(component_id='faang_stocks_pandemic_data', component_property='figure')],
    #위의 그래프 에서 내 벌 지도id의 figure를 가져옴
    [Input(component_id='slct_year', component_property='value')]
    #아웃풋과 인풋으로 나누어지고 id와 property로 구성되어 있음
    #콜백 아래에는 함수가 꼭 필요하다
)
def update_graph(option_slctd): #2016년 선택(드롭다운)
    #그래프 업데이트 함수 정의:(옵션이 선택되었을 시)
    print(option_slctd) # 2016 출력
    print(type(option_slctd)) # 

    container = "The company chosen by user was: {}".format(option_slctd)
    #return 예정. 니가 고른 연도는 : {}.포맷(니가고른_옵션)

    ff = df.copy() #원본보존을 위해 복사
    ff = ff[ff["Name"] == option_slctd] #고른 행을 적용


    fig = go.Figure(data=[go.Candlestick(x=ff['Date'],
                                        open=ff['Open'],
                                        high=ff['High'],
                                        low=ff['Low'],
                                        close=ff['Close'])])

    fig.layout = dict(title='stock_name', 
                        xaxis = dict(type="category", 
                                        categoryorder='category ascending'))
    fig.update_xaxes(nticks=5)

    
    
    return container, fig


# ------------------------------------------------------------------------------
if __name__ == '__main__':
    app.run_server(debug=True)