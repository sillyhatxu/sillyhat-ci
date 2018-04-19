echo "zuul start"
docker service create --name zuul \
 --replicas 1 \
 --detach \
 --network dt \
 --env SPRING_PROFILES_ACTIVE=dt \
 -p 8080:8080 \
 xushikuan/sillyhat.cloud.zuul:latest

echo "eureka start"
docker service create --name eureka \
 --replicas 1 \
 --detach \
 --network dt \
 --env SPRING_PROFILES_ACTIVE=dt \
 -p 8761:8761 \
 xushikuan/sillyhat.cloud.eureka:latest

docker service create --name customer \
  --replicas 1 \
  --detach \
  --network dt \
  --env SPRING_PROFILES_ACTIVE=dt \
  xushikuan/sillyhat.cloud.customer:latest