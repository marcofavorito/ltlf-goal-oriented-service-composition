- Generate PDDL files:
```
rm -f output.sas policy.dot policy.svg examples/garden/*.pddl
cd examples/garden/
python3 garden_example.py
cd ../../
```

Then, use `./scripts.run.sh`:

- TB mode 1, MyND with heuristic HMAX:
```
./scripts/run.sh examples/garden/domain.pddl examples/garden/problem.pddl TB 1 mynd "-heuristic hmax -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 2, MyND with heuristic HMAX:
```
./scripts/run.sh examples/garden/domain.pddl examples/garden/problem.pddl TB 2 mynd "-heuristic hmax -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 1, MyND with heuristic FF:
```
./scripts/run.sh examples/garden/domain.pddl examples/garden/problem.pddl TB 1 mynd "-heuristic ff -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 2, MyND with heuristic FF:
```
./scripts/run.sh examples/garden/domain.pddl examples/garden/problem.pddl TB 2 mynd "-heuristic ff -exportDot ../../policy.dot -dumpPlan"
```
