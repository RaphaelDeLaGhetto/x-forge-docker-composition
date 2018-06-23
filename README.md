Experimental web-languageforge Docker Composition
=================================================

I like to use Docker for development and deployment. [sillsdev/web-languageforge](https://github.com/sillsdev/web-languageforge).

One of the best things about `docker` is that it helps keep my host machine reasonably uncluttered.

Here I document my attempt to deploy a [Local Linux Development Setup](https://github.com/sillsdev/web-languageforge#LocalSetup) with `docker-compose`.

# Set up

Clone this repository.

Then build and execute the current best configuration:

```
docker-compose up --build -d
```

## Stop and remove

```
docker-compose down
```

## Peek inside the container 

```
docker-compose exec forge bash
```

# Error!

This is as far as I get:

```
Step 20/21 : RUN ansible-playbook playbook_xenial.yml --limit localhost -K
 ---> Running in a7a08e46d28d
/usr/lib/python2.7/getpass.py:83: GetPassWarning: Can not control echo on the terminal.
  passwd = fallback_getpass(prompt, stream)
Warning: Password input may be echoed.
SUDO password: [DEPRECATION WARNING]: 'include' for playbook includes. You should use 
'import_playbook' instead. This feature will be removed in version 2.8. 
Deprecation warnings can be disabled by setting deprecation_warnings=False in 
ansible.cfg.

PLAY [Linux Xenial local webserver] ********************************************

TASK [Gathering Facts] *********************************************************
fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: 1: sudo: not found\n", "module_stdout": "", "msg": "MODULE FAILURE", "rc": 127}

msg: MODULE FAILURE
        to retry, use: --limit @/home/app/src/xForge/web-languageforge/deploy/playbook_xenial.retry

PLAY RECAP *********************************************************************
localhost                  : ok=0    changed=0    unreachable=0    failed=1   

ERROR: Service 'forge' failed to build: The command '/bin/sh -c ansible-playbook playbook_xenial.yml --limit localhost -K' returned a non-zero code: 2
```

# TODO

Building the entire application into single image doesn't make a lot of sense from a development view. Configure host volume with cloned repository.

Decouple Mongo configuration from existing deployment. This will allow me to leverage `docker-compose` in keeping the DB container separate.

# Peace
