from typing import Union

from fastapi import FastAPI
from chatgpt import ask_pychatgpt1


app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/question/")
def read_item(question: str):
    res = ask_pychatgpt1(question)
    return str(res)
