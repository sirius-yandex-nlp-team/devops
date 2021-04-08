# devops

1. Install evironment
```
bash scripts/setup.sh
```

2. Run training
```
sudo dvc repro reproduce_{task_1 | task_2}_{cbow | bert | roberta}
```

3. Add credentials to environment variables
4. Submit results
```
dvc push
git add .
git commit -m "Example results"
git push
```
