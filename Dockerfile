FROM scratch as builder                                                      
                                                                             
WORKDIR /python-http-hello-world/                                            
                                                                             
ADD https://raw.githubusercontent.com/kuzxnia/lab6/main/test.py ./test.py                 
                                                                             
FROM python:3.8-buster                                                       
                                                                             
RUN pip install --upgrade pip && \                                           
    pip install --no-cache-dir flask flask-restful                           
                                                                             
COPY --from=builder /python-http-hello-world/test.py .                       
                                                                             
ENTRYPOINT ["python"]                                                        
CMD ["test.py"]
