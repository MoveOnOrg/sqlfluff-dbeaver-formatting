# sqlfluff-dbeaver-formatting

Helper script that allows setting DBeaver with any Sqlfluff formatting set up.

## Get started

### Setup the script

- Checkout this repo or save the bash script `sqlfluff-for-dbeaver.sh` in your local environment.
- Make sure the script is executable, `chmod +x sqlfluff-for-dbeaver.sh`.

### Get the `sqlfluff` executable

If you are using a python venv, you can typically activate it an run `pip show sqlfluff` to get the `site-packages` location, which will look like this:
- `/Users/foo/.pyenv/versions/3.12.11/envs/my-project-venv/lib/python3.12/site-packages`. 
- You can then, simply adapt the path to get the executable: `/Users/foo/.pyenv/versions/3.12.11/envs/my-project-venv/bin/sqlfluff` 

### Setup DBeaver

- In DBeaver, open `Preferences` -> `Editors` -> `SQL Editor` -> `Formatting`.
  - Select `External Formatter` under "Formatter", the "Format active query only" checkbox should be checked.
  - The "Use temp file" checkbox should be checked.
  - On the "Command line" input field, enter the following command:
  ```bash
  Users/bar/sqlfluff-for-dbeaver.sh ${file} /Users/foo/my-project/.sqlfluff /Users/foo/.pyenv/versions/3.12.11/envs/my-project-venv/bin/sqlfluf
  ```
