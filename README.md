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
TASK [update the mongo config file] ********************************************
ok: [localhost]

TASK [ensure mongod service is running (and enable it at boot)] ****************
fatal: [localhost]: FAILED! => {"changed": false, "msg": "Could not find the requested service mongod: host"}

msg: Could not find the requested service mongod: host

RUNNING HANDLER [apache_config : Restart apache] *******************************

RUNNING HANDLER [restart postfix] **********************************************
        to retry, use: --limit @/root/src/xForge/web-languageforge/deploy/playbook_xenial.retry

PLAY RECAP *********************************************************************
localhost                  : ok=62   changed=50   unreachable=0    failed=1 

ERROR: Service 'forge' failed to build: The command '/bin/sh -c ansible-playbook playbook_xenial.yml --limit localhost' returned a non-zero code: 2
```

# TODO

Building the entire application into single image doesn't make a lot of sense from a development view. Configure host volume with cloned repository.

Decouple Mongo configuration from existing deployment. This will allow me to leverage `docker-compose` in keeping the DB container separate.

# Peace
