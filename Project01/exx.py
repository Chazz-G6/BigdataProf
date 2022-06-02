import pandas as pd
import plotly.express as px  # (version 4.7.0 or higher)
import plotly.graph_objects as go
from dash import Dash, dcc, html, Input, Output  # pip install dash (version 2.0.0 or higher)


external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']
app = Dash(__name__)

#Import and clean

df = pd.read_csv("faang_stocks_pandemic_data.csv")
df2 = pd.read_csv("online_store_customer_data.csv")
#불러오기

df2.get('Gender', default='no_gender')

df2.loc[df2['Gender'] == '', 'Gender'] = 'Male'
df2['Gender'] = df2['Gender'].fillna('Male')

df2.loc[df2['Segment'] == '', 'Segment'] = 'Missing'
df2['Segment'] = df2['Segment'].fillna('Missing')


df = df.groupby(['Name', 'Date', 'Volume', 'Open', 'High', 'Low','Adj Close'])[['Close']].sum()
df2 = df2.groupby(['Segment', 'Gender'])["Amount_spent"].mean()
# 그룹바이
df.reset_index(inplace=True)

print(df[:5])
print(df2[:30])




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
    # dcc.Checklist(
    #     id='toggle-rangeslider',
    #     options=[{'label': 'Include Rangeslider', 
    #             'value': 'slider'}],
    #     value=['slider']
    #),
    html.Br(),
    html.Div(id='output_container', children=[]),# Div, id=아웃풋상자, 비어있음
    dcc.Graph(id='faang_stocks_pandemic_data', figure={}), # 그래프 예정. id=내_벌_지도

    html.Div([
        html.H2("The customer chart", style={'text-align': 'center'}),
        #제목 헤드 1
        dcc.Dropdown(id="slct_gender", #드롭다운 id = 성별_선택
                    options=[ #선택지
                        {"label": "Basic", "value": "Basic"},
                        {"label": "Silver", "value": "Silver"},
                        {"label": "Gold", "value": "Gold"},
                        {"label": "Platinum", "value": "Platinum"},
                        {"label": "Missing", "value": "Missing"}],
                    multi=False, # 다중 = False
                    value="Basic", # 현재값 =Male
                    style={'width': "40%",'text-align': 'center'} #스타일='넓이':40%
                    ),
        html.Div(id='output_container2', children=[]),
        dcc.Graph(id='online_store_customer_data', figure={})
])
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
    # [Input(component_id='toggle-rangeslider',component_property='value2')]
)
def update_graph(option_slctd): #2016년 선택(드롭다운)
    #그래프 업데이트 함수 정의:(옵션이 선택되었을 시)
    print(option_slctd) # 2016 출력
    print(type(option_slctd)) # 

    container = "Now Displaying : {}".format(option_slctd)
    #return 예정. 니가 고른 연도는 : {}.포맷(니가고른_옵션)

    ff = df.copy() #원본보존을 위해 복사
    ff = ff[ff["Name"] == option_slctd] #고른 행을 적용


    fig = go.Figure(data=[go.Candlestick(x=ff['Date'],
                                        open=ff['Open'],
                                        high=ff['High'],
                                        low=ff['Low'],
                                        close=ff['Close'])])

    fig.layout = dict(title='Time-Series Candlestick Chart by plotly.', 
                        xaxis = dict(type="category", 
                                        categoryorder='category ascending'))
    fig.update_xaxes(nticks=5)
    
    # fig.update_layout(
    #     xaxis_rangeslider_visible='slider' in 'value2'
    # )

    
    
    return container, fig

@app.callback( #콜백
    [Output(component_id='output_container2', component_property='children'),
    #위의 아웃풋상자 id에서 비어있는 칠드런 프로퍼티를 가져옴
    Output(component_id='online_store_customer_data', component_property='figure')],
    #위의 그래프 에서 내 벌 지도id의 figure를 가져옴
    [Input(component_id='slct_gender', component_property='value')]
    #아웃풋과 인풋으로 나누어지고 id와 property로 구성되어 있음
    #콜백 아래에는 함수가 꼭 필요하다
    # [Input(component_id='toggle-rangeslider',component_property='value2')]
)

def make_graph(option_slctd):
    
    print(option_slctd) # 2016 출력
    print(type(option_slctd)) # 

    container = "Now Displaying : {}".format(option_slctd)
    #return 예정. 니가 고른 연도는 : {}.포맷(니가고른_옵션)

    ff2 = df2.copy()
    ff2 = ff2[ff2["Segment"] == option_slctd] #고른 행을 적용
    
    fig = go.Figure(data=[go.Bar(x=ff2['Gender'],
                                        y=ff2['Amount_spent'])])

    # fig.layout = dict(title='Time-Series Candlestick Chart by plotly.', 
    #                     xaxis = dict(type="category", 
    #                                     categoryorder='category ascending'))

    
    return container, fig

# ------------------------------------------------------------------------------
if __name__ == '__main__':
    app.run_server(debug=True)