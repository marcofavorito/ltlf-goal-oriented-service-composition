- Generate PDDL files:
```
rm -f output.sas policy.dot policy.svg examples/chip_production/*.pddl
cd examples/chip_production/
python3 chip_production_example.py
cd ../../
```

Then, use `./scripts.run.sh`:

- TB mode 1, MyND with heuristic HMAX:
```
./scripts/run.sh examples/chip_production/domain.pddl examples/chip_production/problem.pddl TB 1 mynd "-heuristic hmax -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 2, MyND with heuristic HMAX:
```
./scripts/run.sh examples/chip_production/domain.pddl examples/chip_production/problem.pddl TB 2 mynd "-heuristic hmax -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 1, MyND with heuristic FF:
```
./scripts/run.sh examples/chip_production/domain.pddl examples/chip_production/problem.pddl TB 1 mynd "-heuristic ff -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 2, MyND with heuristic FF:
```
./scripts/run.sh examples/chip_production/domain.pddl examples/chip_production/problem.pddl TB 2 mynd "-heuristic ff -exportDot ../../policy.dot -dumpPlan"
```
