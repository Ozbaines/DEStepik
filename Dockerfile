
FROM postgres:13

ENV POSTGRES_USER=userozbaines
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=mydb

VOLUME /var/lib/postgresql/data
VOLUME /de_course_data

EXPOSE 5432

