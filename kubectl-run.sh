set -e -x
# https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/DAX.client.run-application-go.html
kubectl run -it --rm=true aws-dax-go-sample --image=yoichikawasaki/aws-dax-go-sample:0.0.1 --restart=Never -- "$@"

