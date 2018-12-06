FROM dataphoriawebapi:latest

RUN apt-get update && \
apt-get install xmlstarlet -y

COPY --chown=1000:1000 /Libraries /usr/share/Alphora/Application/Libraries

RUN dotnet /usr/share/Alphora/D4Runner/D4Runner.dll /A:Processor "EnsureLibraryRegistered('Frontend'); RegisterLibrary('TILTidMain', false);"

ENV SERVER=postgres PORT=5432 DATABASE=postgres USERID=postgres PASSWORD="" RECONCILEMASTER=Server RECONCILEMODE=Command
COPY --chown=1000:1000 /Scripts .
ENTRYPOINT ["/bin/bash"]
CMD ["startup.sh"]