@echo off
echo Forwarding ports for Kubernetes services...

:: Port forward for mysql services
start /B cmd /c "kubectl port-forward svc/mysql-k8s-services 3306:3306 -n ims"

:: Port forward for springboot service
start /B cmd /c "kubectl port-forward svc/springboot-k8s-services 8080:8080 -n ims"

:: Port forward for react service
start /B cmd /c "kubectl port-forward svc/react-k8s-services 3000:3000 -n ims"

echo All ports are being forwarded.
pause
