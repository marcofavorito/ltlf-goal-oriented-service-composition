# -*- coding: utf-8 -*-
#
# Copyright 2021 -- 2023 WhiteMech
#
# ------------------------------
#
# This file is part of Plan4Past.
#
# Plan4Past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Plan4Past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Plan4Past.  If not, see <https://www.gnu.org/licenses/>.
#

"""Rewrite the formula with basic operators visitor."""
from functools import singledispatch

from pylogics.syntax.base import And as LTLAnd
from pylogics.syntax.base import Equivalence as LTLEquivalence
from pylogics.syntax.base import Formula
from pylogics.syntax.base import Implies as LTLImplies
from pylogics.syntax.base import Not as LTLNot
from pylogics.syntax.base import Or as LTLOr
from pylogics.syntax.base import _UnaryOp
from pylogics.syntax.ltl import Atomic as LTLAtomic
from pylogics.syntax.ltl import (
    Next,
    FalseFormula,
    Always,
    Eventually,
    PropositionalFalse,
    PropositionalTrue,
    Until,
    Release,
    WeakNext
)
from pylogics.utils.to_string import to_string


def rewrite_unaryop(formula: _UnaryOp):
    """Rewrite the formula for a unary operator."""
    return rewrite(formula.argument)


@singledispatch
def rewrite(formula: object) -> str:
    """Rewrite a formula."""
    raise NotImplementedError(
        f"handler not implemented for object of type {type(formula)}"
    )


@rewrite.register
def rewrite_prop_true(formula: PropositionalTrue) -> str:
    """Compute the basic formula for the true formula."""
    return "true"


@rewrite.register
def rewrite_prop_false(formula: PropositionalFalse) -> str:
    """Compute the basic formula for the false formula."""
    return "false"


@rewrite.register
def rewrite_false(formula: FalseFormula) -> str:
    """Compute the basic formula for a formula that is always false."""
    return "false"


@rewrite.register
def rewrite_atomic(formula: LTLAtomic) -> str:
    """Compute the basic formula for an atomic formula."""
    return formula.name


@rewrite.register
def rewrite_and(formula: LTLAnd) -> str:
    """Compute the basic formula for an And formula."""
    sub = [rewrite(f) for f in formula.operands]
    return "(and " + " ".join(sub) + ")"


@rewrite.register
def rewrite_or(formula: LTLOr) -> str:
    """Compute the basic formula for an Or formula."""
    sub = [rewrite(f) for f in formula.operands]
    return "(or " + " ".join(sub) + ")"


@rewrite.register
def rewrite_not(formula: LTLNot) -> str:
    """Compute the basic formula for a Not formula."""
    sub = rewrite_unaryop(formula)
    return "(not " + sub + ")"


@rewrite.register
def rewrite_implies(formula: LTLImplies) -> str:
    """Compute the basic formula for an Implies formula."""
    head = [rewrite(LTLNot(f)) for f in formula.operands[:-1]]
    tail = rewrite(formula.operands[-1])
    return "(or " + " ".join(head) + " " + tail + ")"


@rewrite.register
def rewrite_equivalence(formula: LTLEquivalence) -> str:
    """Compute the basic formula for an Equivalence formula."""
    positive = LTLAnd(*formula.operands)
    negative = LTLAnd(*[LTLNot(f) for f in formula.operands])
    rewrite_positive = rewrite(positive)
    rewrite_negative = rewrite(negative)
    return "(or " + rewrite_positive + " " + rewrite_negative + ")"


@rewrite.register
def rewrite_next(formula: Next) -> str:
    """Compute the basic formula for a Next formula."""
    sub = rewrite_unaryop(formula)
    return "(next " + sub + ")"


@rewrite.register
def rewrite_weaknext(formula: WeakNext) -> str:
    """Compute the basic formula for a WeakNext formula."""
    f = LTLNot(Next(LTLNot(formula.argument)))
    return rewrite(f)


@rewrite.register
def rewrite_until(formula: Until) -> str:
    """Compute the basic formula for a Until formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Until(*formula.operands[1:])
        return rewrite(Until(head, tail))
    assert len(formula.operands) == 2
    sub = [rewrite(f) for f in formula.operands]
    return "(until " + sub[0] + " " + sub[1] + ")"

@rewrite.register
def rewrite_release(formula: Release) -> str:
    """Compute the basic formula for a Release formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Release(*formula.operands[1:])
        return rewrite(Release(head, tail))
    assert len(formula.operands) == 2
    sub = [rewrite(f) for f in formula.operands]
    return "(release " + sub[0] + " " + sub[1] + ")"


@rewrite.register
def rewrite_eventually(formula: Eventually) -> str:
    """Compute the basic formula for a Eventually formula."""
    sub = rewrite_unaryop(formula)
    return f"(eventually {sub})"


@rewrite.register
def rewrite_always(formula: Always) -> str:
    """Compute the basic formula for a Always formula."""
    sub = rewrite_unaryop(formula)
    return f"(always {sub})"
