docker service create --name eureka --replicas 1 --detach --network dev --with-registry-auth --env SPRING_PROFILES_ACTIVE=dt -p 8761:8761 xushikuan/sillyhat.cloud.eureka:master
docker service create --name zuul --replicas 1 --detach --network dev --with-registry-auth --env SPRING_PROFILES_ACTIVE=dt -p 8080:8080 xushikuan/sillyhat.cloud.zuul:master
docker service create --name customer --replicas 1 --detach --network dev --with-registry-auth --env SPRING_PROFILES_ACTIVE=dt xushikuan/sillyhat.cloud.customer:master

docker service create --name eureka --replicas 1 --detach --network dev --with-registry-auth --env SPRING_PROFILES_ACTIVE=dt -p 8761:8761 xushikuan/sillyhat.cloud.eureka:latest
docker service create --name zuul --replicas 1 --detach --network dev --with-registry-auth --env SPRING_PROFILES_ACTIVE=dt -p 8080:8080 xushikuan/sillyhat.cloud.zuul:latest
docker service create --name customer --replicas 1 --detach --network dev --with-registry-auth --env SPRING_PROFILES_ACTIVE=dt xushikuan/sillyhat.cloud.customer:latest




docker service create --name eureka --replicas 1 --detach --with-registry-auth -p 8761:8761 xushikuan/sillyhat.cloud.eureka:latest
docker service create --name zuul --replicas 1 --detach --network dev --with-registry-auth -p 8080:8080 xushikuan/sillyhat.cloud.zuul:latest
docker service create --name customer --replicas 1 --detach --with-registry-auth xushikuan/sillyhat.cloud.customer:latest