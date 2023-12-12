```
rm -f output.sas policy.dot policy.svg examples/garden/*.pddl
cd examples/garden/
python3 garden_example.py
cd ../../

cd prologex
./convert.sh ../examples/garden/domain.pddl ../examples/garden/problem.pddl "dp" 1 && cp ../prologex/tmp/domain-problem_problem_dp.pddl ../examples/garden/domain_tb_m1.pddl && cp ../prologex/tmp/problem_dp.pddl ../examples/garden/problem_tb_m1.pddl
cd ../

python3 scripts/fix_tb_oneof.py --domain-file examples/garden/domain_tb_m1.pddl

./planners/mynd/translator-fond/translate.py examples/garden/domain_tb_m1.pddl examples/garden/problem_tb_m1.pddl

cd ./planners/mynd
./mynd.sh -exportDot ../../policy.dot -dumpPlan -search aostar ../../output.sas
cd ../../

python scripts/simplify-policy.py --dot-file policy.dot
dot -Tsvg policy.dot -o policy.svg
```