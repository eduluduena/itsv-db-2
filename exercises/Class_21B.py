import redis
from datetime import date
r = redis.Redis(
host='localhost',
port=6379)
print("Sistema de venta de autos")
auto = 'a'
today = str(date.today())
fecha = 'a'

while auto!="":
    auto = input("Inserte su auto")
    if auto == "":
        pass
    else:
        r.lpush(today, auto)
print('Los autos del dia '+ today+' fueron:')
for a in r.lrange(today, 0, -1):
    print(str(a.decode('utf-8')))

print('Estas son todas las fechas que en las que se guardaron autos: ')
for key in r.scan_iter():
    print(str(key.decode('utf-8')))

while fecha!='':
    fecha=input('Inserte la fecha de la que desea saber si guardo un auto o presione enter para salir ')
    for x in r.lrange(fecha, 0, -1):
        print(str(x.decode('utf-8')))
