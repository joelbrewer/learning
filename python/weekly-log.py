import plaid
from plaid.api import plaid_api
from plaid.model.item_public_token_exchange_request import ItemPublicTokenExchangeRequest
import os
from dotenv import load_dotenv
import json

load_dotenv()

print('client id: ', os.getenv('PLAID_CLIENT_ID'))
print('secret: ', os.getenv('PLAID_SECRET'))

configuration = plaid.Configuration(
    host=plaid.Environment.Sandbox,
    api_key={
        'clientId': os.getenv('PLAID_CLIENT_ID'),
        'secret': os.getenv('PLAID_SECRET'),
    }
)

api_client = plaid.ApiClient(configuration)
client = plaid_api.PlaidApi(api_client)

def create_link_token():
    try:
        request = {
            'user': {
                'client_user_id': 'unique-id'
            },
            'client_name': 'Plaid Test App',
            'products': ['auth'],
            'country_codes': ['US'],
            'language': 'en',
        }
        response = client.link_token_create(request)
        return response.to_dict()
    except plaid.ApiException as e:
        print(f"Error creating link token: {e}")
        return None

def get_access_token():
    public_token = 'public-sandbox-d0b25d70-efa6-415f-be08-bdc4bb0d9161'

    exchange_request = ItemPublicTokenExchangeRequest(
            public_token=public_token
            )

    exchange_response = client.item_public_token_exchange(exchange_request)
    access_token = exchange_response['access_token']
    item_id = exchange_response['item_id']

    print (f"Access token: {access_token}")
    print (f"Item ID: {item_id}")

def get_balance():
    try:
        request = {
            'access_token': os.getenv('PLAID_ACCESS_TOKEN')
        }
        response = client.accounts_balance_get(request)
        print('response: ', response)
        return response.to_dict()
    except plaid.ApiException as e:
        print(f"Error retrieving balance: {e}")
        return None

# get_cash_in_bank_as_of date

# get_trailing_utilization_rate_as_of date num_days

# get_forecasted_utilization_rate_as_of date num_days

# get_income_cash_as_of date

# get_income_accrual_as_of date

# link_token = create_link_token()

# print("link token: ",link_token)

# get_access_token()

get_balance()
