# LTLf Goal-oriented Service Composition

## Preliminaries

We tested the instructions on Ubuntu 22.04 platform.

## Main code dependencies

- Make sure you have Python 3.11 installed
- Install Pipenv: https://pipenv.pypa.io/en/latest/
- Clone the repository:
```
git clone https://github.com/marcofavorito/ltlf-goal-orientd-service-composition.git --recursive
cd ltlf-goal-orientd-service-composition
```

- Use Pipenv to set up the virtual environment:
```
pipenv shell --python=3.11
pipenv install --dev
```

- In each new terminal, run the following
```
export PYTHONPATH=${PYTHONPATH:+$PYTHONPATH:}$(pwd)
```

## T&B code dependencies

Torres & Baier's software, stored in `prologex`, has been kindly given by the authors.

To use it, you need to install SWI-Prolog.

- Download and install SWI-Prolog: https://www.swi-prolog.org/download/stable. 
  On Ubuntu you can run:
```
sudo apt install swi-prolog
```

## MyND Planner

To use the MyND planner, you have to install Java >=8, <15.

You can use [SdkMan](https://sdkman.io/):
```
sdk install java 14.0.2-open
sdk install maven 3.9.6
```

Then, build MyND:
```
cd planners/mynd/
./build.sh
```

Apply the Git patch to fix a minor compatibility issue with newer versions of Python:
```
git apply ../../mynd.patch
cd ../../
```

