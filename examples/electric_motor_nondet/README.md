- Generate PDDL files:
```
rm -f output.sas policy.dot policy.svg examples/electric_motor_nondet/*.pddl
cd examples/electric_motor_nondet/
python3 electric_motor_nondet_example.py
cd ../../
```

Then, use `./scripts.run.sh`:

- TB mode 1, MyND with heuristic HMAX:
```
./scripts/run.sh examples/electric_motor_nondet/domain.pddl examples/electric_motor_nondet/problem.pddl TB 1 mynd "-heuristic hmax -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 2, MyND with heuristic HMAX:
```
./scripts/run.sh examples/electric_motor_nondet/domain.pddl examples/electric_motor_nondet/problem.pddl TB 2 mynd "-heuristic hmax -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 1, MyND with heuristic FF:
```
./scripts/run.sh examples/electric_motor_nondet/domain.pddl examples/electric_motor_nondet/problem.pddl TB 1 mynd "-heuristic ff -exportDot ../../policy.dot -dumpPlan"
```

- TB mode 2, MyND with heuristic FF:
```
./scripts/run.sh examples/electric_motor_nondet/domain.pddl examples/electric_motor_nondet/problem.pddl TB 2 mynd "-heuristic ff -exportDot ../../policy.dot -dumpPlan"
```
