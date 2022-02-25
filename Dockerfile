FROM java
WORKDIR /app
EXPOSE 8989
COPY ./script.sh ./
CMD ["./script.sh", "europe/sweden"]
