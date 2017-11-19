DOCKERFILENAME=${3:-all}

if [ $DOCKERFILENAME == "all" ] || [ $DOCKERFILENAME == "zuul" ]
then
    echo "zuul start"
    docker service create --name zuul \
     --replicas 1 \
     --detach \
     --network $1 \
     --with-registry-auth \
     --env SPRING_PROFILES_ACTIVE=$1 \
     -p 8080:8080 \
     111909622691.dkr.ecr.ap-southeast-1.amazonaws.com/zuul:$2
fi

if [ $DOCKERFILENAME == "all" ] || [ $DOCKERFILENAME == "eureka" ]
then
    echo "eureka start"
    docker service create --name eureka \
     --replicas 1 \
     --detach \
     --network $1 \
     --with-registry-auth \
     --env SPRING_PROFILES_ACTIVE=$1 \
     -p 8761:8761 \
     xushikuan/sillyhat.cloud.eureka:$2
fi

if [ $DOCKERFILENAME == "all" ] || [ $DOCKERFILENAME == "customer" ]
then
    echo "customer start"
    docker service create --name customer \
      --replicas 1 \
      --detach \
      --network $1 \
      --with-registry-auth \
      --env SPRING_PROFILES_ACTIVE=$1 \
      xushikuan/sillyhat.cloud.customer:$2
fi

if [ $DOCKERFILENAME == "all" ] || [ $DOCKERFILENAME == "web-app" ]
then
    echo "web-app start"
    docker service create --name web-app \
      --replicas 1 \
      --detach \
      --network $1 \
      --with-registry-auth \
      --env SPRING_PROFILES_ACTIVE=$1 \
      xushikuan/sillyhat.cloud.web-app:$2
fi
