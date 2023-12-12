```
rm -f output.sas policy.dot policy.svg examples/electric_motor/*.pddl
cd examples/electric_motor/
python3 electric_motor_example.py
cd ../../

cd prologex
./convert.sh ../examples/electric_motor/domain.pddl ../examples/electric_motor/problem.pddl "dp" 2 && cp ../prologex/tmp/domain-problem_problem_dp.pddl ../examples/electric_motor/domain_tb_m1.pddl && cp ../prologex/tmp/problem_dp.pddl ../examples/electric_motor/problem_tb_m1.pddl
cd ../

python3 scripts/fix_tb_oneof.py --domain-file examples/electric_motor/domain_tb_m1.pddl

./planners/mynd/translator-fond/translate.py examples/electric_motor/domain_tb_m1.pddl examples/electric_motor/problem_tb_m1.pddl

cd ./planners/mynd
./mynd.sh -exportDot ../../policy.dot -dumpPlan -search aostar ../../output.sas
cd ../../

python scripts/simplify-policy.py --dot-file policy.dot
dot -Tsvg policy.dot -o policy.svg
```