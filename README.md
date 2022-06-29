# 批量上传到Git
替换为项目和路径即可
```
SET /A counter=0
SET dir_path[%counter%]=项目路径1
SET dir_name[%counter%]=项目名称1

SET /A counter=%counter%+1
SET dir_path[%counter%]=项目路径2
SET dir_name[%counter%]=项目名称2
```

## Demo
```
SET /A counter=0
SET dir_path[%counter%]=测试路径1
SET dir_name[%counter%]=D:/test1

SET /A counter=%counter%+1
SET dir_path[%counter%]=测试路径2
SET dir_name[%counter%]=D:/test2

SET /A counter=%counter%+1
SET dir_path[%counter%]=测试路径3
SET dir_name[%counter%]=D:/test3
```
