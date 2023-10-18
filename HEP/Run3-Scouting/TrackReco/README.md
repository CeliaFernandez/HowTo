# Track reconstruction stuff

Hit patter of Scouting muons if available as a `Run3ScoutingHitPatternPOD` object (see [Run3ScoutingMuon.h](https://github.com/cms-sw/cmssw/blob/master/DataFormats/Scouting/interface/Run3ScoutingMuon.h) for all information stored there).

Information of each hit is encoded in a `uint16_t` bit with this format:

```
+------------+---------------+---------------------------+-----------------+----------------+
|  tk/mu/mtd | sub-structure |     sub-sub-structure     |     stereo      |    hit type    |
+------------+---------------+---------------------------+-----------------+----------------+
|    11-10   | 9   8    7    |  6     5     4     3      |        2        |    1        0  |  bit
+------------+---------------+---------------------------+-----------------+----------------|
| tk  = 1    |    PXB = 1    | layer = 1-3               |                 | hit type = 0-3 |
| tk  = 1    |    PXF = 2    | disk  = 1-2               |                 | hit type = 0-3 |
| tk  = 1    |    TIB = 3    | layer = 1-4               | 0=rphi,1=stereo | hit type = 0-3 |
| tk  = 1    |    TID = 4    | wheel = 1-3               | 0=rphi,1=stereo | hit type = 0-3 |
| tk  = 1    |    TOB = 5    | layer = 1-6               | 0=rphi,1=stereo | hit type = 0-3 |
| tk  = 1    |    TEC = 6    | wheel = 1-9               | 0=rphi,1=stereo | hit type = 0-3 |
| mu  = 0    |    DT  = 1    | 4*(stat-1)+superlayer     |                 | hit type = 0-3 |
| mu  = 0    |    CSC = 2    | 4*(stat-1)+(ring-1)       |                 | hit type = 0-3 |
| mu  = 0    |    RPC = 3    | 4*(stat-1)+2*layer+region |                 | hit type = 0-3 |
| mu  = 0    |    GEM = 4    | 1xxx=st0, 0yxx=st y-1 la x|                 | hit type = 0-3 |
| mu  = 0    |    ME0 = 5    | roll                      |                 | hit type = 0-3 |
| mtd = 2    |    BTL = 1    | moduleType = 1-3          |                 | hit type = 0-3 |
| mtd = 2    |    ETL = 2    | ring = 1-12               |                 | hit type = 0-3 |
+------------+---------------+---------------------------+-----------------+----------------+
```



