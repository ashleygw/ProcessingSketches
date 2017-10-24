import random
import time
import threading
import time

class myThread (threading.Thread):
   def __init__(self, threadID, name, listo):
      threading.Thread.__init__(self)
      self.threadID = threadID
      self.name = name
      self.listo = listo
   def run(self):
      print "Starting " + self.name
      #print(self.listo)
      sortfun(self.listo)
      #print(self.listo)
      print "Exiting " + self.name

thelist = []
rectWidth = 0;

def compare(i, j, dir, a):
    if(dir == (a[i]>a[j])):
        exchange(i,j,a)

def exchange(i, j, a):
    time.sleep(0.001)
    t= a[i]
    a[i] = a[j]
    a[j] = t
      
def bitonicMerge(lo, n, dir, a):
    #time.sleep(0.001)
    if n > 1:
        m = n/2
        for i in range(lo , lo+m):
            compare(i, i + m, dir, a)
        bitonicMerge(lo, m, dir, a)
        bitonicMerge(lo + m, m, dir, a)
 
def bitonicSort(lo, n, dir, a):
    if n > 1:
          m = n/2
          bitonicSort(lo, m, True, a)
          bitonicSort(lo + m, m, False, a)
          bitonicMerge(lo, n, dir, a)
 
def sortfun(a):
    bitonicSort(0, len(a), True, a)

def setup():
    colorMode(HSB, 800)
    size(128*8,800)
    frameRate(60)
    runSort()
    #mThread.start()
    background(0)
    #numItems = 128;
    #rectWidth = width/numItems
    #thelist = random.sample(range(800), numItems)
    
def runSort():
    global thelist, rectWidth, mThread
    background(0)
    numItems = 512;
    rectWidth = width/numItems
    
    thelist = random.sample(range(800), numItems)
    mThread = myThread(1, "Main Thread", thelist)
    mThread.start()
    
        
def draw():
    #TODO IMPLEMENT COLOR
    background(0)
    global rectWidth, mThread, thelist

    if(not mThread.isAlive()):
        time.sleep(1)
        runSort()

    for i,x in enumerate(thelist):
        #fill(x)
        rect(i*rectWidth, height - x,rectWidth, x)
        
    
    