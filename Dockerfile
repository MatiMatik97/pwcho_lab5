FROM scratch as builder                                                      
                                                                             
WORKDIR /python-http-hello-world/                                            
                                                                             
ADD https://raw.githubusercontent.com/MatiMatik97/pwcho_lab5/main/serwer.py ./serwer.py                 
                                                                             
FROM python:3.8-buster                                                       
                                                                             
RUN pip install --upgrade pip && \                                           
    pip install --no-cache-dir flask flask-restful                           
                                                                             
COPY --from=builder /python-http-hello-world/serwer.py .                       
                                                                             
ENTRYPOINT ["python"]                                                        
CMD ["serwer.py"]
