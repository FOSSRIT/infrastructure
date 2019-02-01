Ansible Role: teleirc
=====================

Deploy RITlug/teleirc chat bots to bridge IRC channels and Telegram groups


## Requirements

No special requirements.
Note this role requires root access; either run it in a playbook with a global `become: yes` or invoke the role in your playbook:

```yaml
- hosts: servers
  roles:
    - role: jwflory.teleirc
      become: yes
```


## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

### `defaults/main.yml`

```yaml
default_irc_server: chat.freenode.net
default_irc_nickserv_service: NickServ
default_version: v1.2.2
```

* **`default_irc_server`**: Default IRC server to connect to (defaults to Freenode)
* **`default_irc_nickserv_service`**: Default authentication service for IRC server (defaults to NickServ)
* **`default_version`**: Default version of Teleirc to deploy (corresponds to git tag releases in upstream project)

### `vars/main.yml`

```yaml
bots:
  my_example_bot:
    cn: "my-example-bot"
    irc_blacklist: "noisy-irc-bot,ci-build-alerts"
    irc_bot_name: tg-my-example-bot
    irc_channel: "#ritlug-teleirc-sandbox"
    irc_server: "{{ default_irc_server }}"
    irc_nickserv_service: "{{ default_irc_nickserv_service }}"
    irc_nickserv_password: "{{ vault_bots.my_example_bot.vault_irc_nickserv_password }}"
    teleirc_token: "{{ vault_bots.my_example_bot.vault_teleirc_token }}"
    teleirc_chat_id: "{{ vault_bots.my_example_bot.vault_teleirc_chat_id }}"
    imgur_client_id: "{{ vault_default_imgur_client_id }}"
    version: "{{ default_version }}"
```

* **`bots`**: List of all bots
* **`bots.my_example_bot`**: Example of a single Teleirc bot
* **`bots.my_example_bot.cn`**: Common name. Used for directory names, systemd service name, and more.
* **`bots.my_example_bot.irc_blacklist`**: Comma-separated string of IRC nicks to ignore
* **`bots.my_example_bot.irc_bot_name`**: IRC nick of Teleirc bridge bot
* **`bots.my_example_bot.irc_channel`**: IRC channel for bot to join
* **`bots.my_example_bot.irc_server`**: IRC server for bot to connect to (uses `defaults/main.yml`)
* **`bots.my_example_bot.irc_nickserv_service`**: IRC account authentication method (uses `defaults/main.yml`)
* **`bots.my_example_bot.irc_nickserv_password`**: _See below_
* **`bots.my_example_bot.teleirc_token`**: _See below_
* **`bots.my_example_bot.teleirc_chat_id`**: _See below_
* **`bots.my_example_bot.imgur_client_id`**: _See below_
* **`bots.my_example_bot.version`**: What version of Teleirc to deploy (uses `defaults/main.yml`)

### `vars/vault.yml`

```yaml
# encrypt this with Ansible Vault before committing!

vault_default_imgur_client_id: "000000000000000"

vault_bots:
  my_example_bot:
    vault_irc_nickserv_password: ""
    vault_teleirc_token: "000000000:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    vault_teleirc_chat_id: "-0000000000000"
```

* **`default_imgur_client_id`**: Imgur API client ID to upload images from Telegram to Imgur
* **`vault_bots`**: List of all bots
* **`vault_bots.my_example_bot`**: Example of secrets for a single Teleirc bot
* **`vault_bots.my_example_bot.vault_irc_nickserv_password`**: Password to NickServ account on IRC server
* **`vault_bots.my_example_bot.vault_teleirc_token`**: Telegram API bot token provided by the BotFather
* **`vault_bots.my_example_bot.vault_teleirc_chat_id`**: Telegram chat ID of group for bridging to IRC


## Dependencies

None.


## Example Playbook

```yaml
- hosts: servers
  roles:
     - role: jwflory.teleirc
```

## License

[Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/ "Mozilla Public License – Mozilla")


## Author Information

This role was created in 2018 by [Justin W. Flory](https://justinwflory.com/).
Find him on [GitHub](https://github.com/jwflory "Check out other things I'm working on!") and [LinkedIn](https://www.linkedin.com/in/justinwflory/ "See what I'm doing out in the world…").
