
import datetime as dt
import time as tm

print(tm.time())

dtnow= dt.datetime.fromtimestamp(tm.time())
print(dtnow)
print(dtnow.year,dtnow.month,dtnow.day,dtnow.hour,dtnow.minute,dtnow.second)

delta = dt.timedelta(days=100)
print(delta)

today = dt.date.today()
print(today)

print(today-delta)

print("##############################")

#example
today = dt.date.today()
past = today - delta
future = today + delta

print(past)    # 100 days before today
print(future)  # 100 days after today