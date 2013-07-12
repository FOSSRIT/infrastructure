#!/usr/bin/env python
""" Given a username, subscribe julython to all of their repos. """

import argparse
import getpass

import requests

from pygithub3 import Github
gh = None

# http://developer.github.com/v3/repos/hooks/
github_api_url = "https://api.github.com/hub"


def most_repos(username):
    print "  * Looking at repos for %s" % username
    return gh.repos.list(username).all()


def all_repos(username):
    orgs = gh.orgs.list(username).all()
    repos = most_repos(username) + sum([
        most_repos(org.login) for org in orgs
    ], [])
    return repos


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-u', '--username', default=None,
                        help="GitHub username to act on")
    parser.add_argument('-t', '--oauthtoken', default=None,
                        help="OAuth token for this user")
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    username, oauth_token = args.username, args.oauthtoken
    if not username or not oauth_token:
        raise ValueError("You must provide --username and --oauthtoken")

    # pygithub3 needs to support oauth..  :/
    gh = Github(login=username, password=getpass.getpass())

    callback = "http://www.julython.org/api/v1/github"
    topic_tmpl = "https://github.com/%s/%s/events/%s"

    print "* Gathering list of repos for %s" % username
    repos = all_repos(username)
    print "  * Found %i repos" % len(repos)

    print "* Adding hook to all of those repos."
    for repo in repos:
        print "  * posting hook up in %s/%s" % (repo.owner.login, repo.name)
        data = {
            "access_token": oauth_token,
            "hub.mode": "subscribe",
            "hub.callback": callback,
            "hub.topic": topic_tmpl % (repo.owner.login, repo.name, "push")
        }

        # Subscribe with pubsubhubbub
        result = requests.post(github_api_url, data=data)
        if result.status_code != 204:
            d = result.json()
            d['status_code'] = result.status_code
            raise IOError(d)
