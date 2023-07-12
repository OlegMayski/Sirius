import os
import sys
import pytest
import json

import app

@pytest.fixture
def client():
  return app.app.test_client()

def test_root(client):
  response = client.get("/")
  assert b'doctype html' in response.data

def test_form(client):
  name = "my_super_test"
  response = client.get("/", query_string={"name": name})
  assert name.encode() in response.data
