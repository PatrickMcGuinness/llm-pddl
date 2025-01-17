import os
import sys
from collections import namedtuple
import glob

# PDDLStream https://github.com/caelan/pddlstream/blob/526b450a7d3913d3833e1413df416efa7e71ca6a/pddlstream/algorithms/downward.py
def find_build(fd_path):
    for release in ['release', 'release64', 'release32']:  # TODO: list the directory
        path = os.path.join(fd_path, 'builds/{}/'.format(release))
        if os.path.exists(path):
            return path
    # TODO: could also just automatically compile
    raise RuntimeError('Please compile FastDownward first [.../pddlstream$ ./downward/build.py]')

directory = os.path.dirname(os.path.abspath(__file__))
FD_PATH = os.path.join(directory, '../../../downward')
TRANSLATE_PATH = os.path.join(find_build(FD_PATH), 'bin/translate')
sys.path.append(TRANSLATE_PATH)

from pddl_parser import pddl_file

Domain = namedtuple('Domain', ['name', 'requirements', 'types', 'type_dict', 'constants',
                               'predicates', 'predicate_dict', 'functions', 'actions', 'axioms'])
Problem = namedtuple('Problem', ['task_name', 'task_domain_name', 'task_requirements',
                                 'objects', 'init', 'goal', 'use_metric'])

domain_file = "domain.pddl"
problem_path = os.path.join(directory, 'p*.pddl')
problem_files = glob.glob(problem_path)

for problem_file in problem_files:

    task = pddl_file.open(domain_file, problem_file)
    count = {}
    description = ""
    for obj in task.objects:
        if obj.type_name not in count.keys():
            count[obj.type_name] = 0
        count[obj.type_name] += 1
    object_count = count["object"]
    description += f"You have {object_count} blocks. \n"
    for atom in task.init:
        if "on" == atom.predicate:
            description += f"{atom.args[0]} is on top of {atom.args[1]}. \n"
    for atom in task.init:
        if "on-table" == atom.predicate:
            description += f"{atom.args[0]} is on the table. \n"
    for atom in task.init:
        if "clear" == atom.predicate:
            description += f"{atom.args[0]} is clear. \n"
    for atom in task.init:
        if "arm-empty" == atom.predicate:
            description += f"Your arm is empty. \n" 
    description += f"Your goal is to move the blocks. \n"
    if len(task.goal.parts) > 0:
        goals = task.goal.parts
    else:
        goals = [task.goal]      
    for goal in goals:
        description += f"{goal.args[0]} should be on top of {goal.args[1]}. \n"            
    nl_file = os.path.splitext(problem_file)[0] + ".nl"
    with open(nl_file, 'w') as f:
        f.write(description)
