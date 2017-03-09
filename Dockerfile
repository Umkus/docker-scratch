FROM        scratch
ADD         ./true /bin/true
ENTRYPOINT  ["/bin/true"]
