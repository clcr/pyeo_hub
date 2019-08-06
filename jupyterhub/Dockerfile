# Jupyterhub server
FROM jupyterhub/jupyterhub
RUN pip install --no-cache-dir dockerspawner

RUN jupyterhub --generate-config -y True

RUN useradd jfr10 && echo "jfr10:trees" | chpasswd && mkdir /user && mkdir /user/jfr10 && chmod 777 /user/jfr10

RUN echo c.Authenticator.admin_users = {\"jfr10\"} >> jupyterhub_config.py \
&& echo import dockerspawner >> jupyterhub_config.py \
&& echo c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner' >> jupyterhub_config.py \
&& echo c.LocalAuthenticator.create_system_users = True >> jupyterhub_config.py \
&& echo c.PAMAuthenticator.open_sessions = False >> jupyterhub_config.py \
&& echo c.DockerSpawner.image = \'pyeo:latest\' >> jupyterhub_config.py \
&& echo c.DockerSpawner.hub_ip_connect = \'143.210.25.211\' >> jupyterhub_config.py \
&& echo c.Spawner.cmd = \'jupyterhub-singleuser\' >> jupyterhub_config.py \

