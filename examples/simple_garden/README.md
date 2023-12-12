```
rm -f output.sas policy.dot policy.svg examples/simple_garden/*.pddl
cd examples/simple_garden/
python3 simple_garden_example.py
cd ../../

cd prologex
./convert.sh ../examples/simple_garden/domain.pddl ../examples/simple_garden/problem.pddl "dp" 1 && cp ../prologex/tmp/domain-problem_problem_dp.pddl ../examples/simple_garden/domain_tb_m1.pddl && cp ../prologex/tmp/problem_dp.pddl ../examples/simple_garden/problem_tb_m1.pddl
cd ../

python3 scripts/fix_tb_oneof.py --domain-file examples/simple_garden/domain_tb_m1.pddl

./planners/mynd/translator-fond/translate.py examples/simple_garden/domain_tb_m1.pddl examples/simple_garden/problem_tb_m1.pddl

cd ./planners/mynd
./mynd.sh -exportDot ../../policy.dot -dumpPlan -search aostar ../../output.sas
cd ../../
dot -Tsvg policy.dot -o policy.svg
```