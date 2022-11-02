## Script to take climdiv data and clean it

## library
require(here)

## Handling GDD

raw=read.csv(here("1_raw_data", "daily-measures.csv"))

table(raw$NAME, !is.na(raw$TMAX))
#can we use ashburnham?
# It's a 25 mile drive - that seems decent

dat.use=raw[raw$STATION=="USC00190190",]
dat.use=dat.use[order(as.character(dat.use$DATE)),]
## Steps: break down by year,
## pmax((TMAX-TMIN)/2,0)
## cumsum(that thing)

year=as.numeric(gsub("-.*","",as.character(dat.use$DATE)))

tbase=10
gdd.day=pmax(0,(dat.use$TMAX+dat.use$TMIN)/2-tbase)
## empty out gdd
year.vec=gdd.july1=NULL
for(cur.year in 2012:2019){
  dat.cur=dat.use[year==cur.year,]
  date.cur=as.character(dat.cur$DATE)
  mo.day=substr(date.cur,6,10)
  gdd.cur=cumsum(gdd.day[year==cur.year])
  gdd.july1=c(gdd.july1, gdd.cur[mo.day=="07-01"])
  year.vec=c(year.vec,cur.year)
}

dat.fin=data.frame(year=year.vec,
                   gdd.july1=gdd.july1)

saveRDS(dat.fin, file=here("2_data_wrangling","climate-covar.rds"))