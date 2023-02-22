#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Title:: *)
(*MATH 330, Assignment 4 (Mikhail Smirnov)*)
(**)


(* ::Text:: *)
(*Solving Txx(x,y) + Tyy(xy) = 0 on domain [0,1]*)
(*With boundary conditions:*)
(*T(x,0) = 100x, T(x,1) = 100x^2,*)
(*T(0,y) = 0, T(1,y) = 100*)


PDE = D[T[x,y],x,x] + D[T[x,y],y,y];
BCs={T[x,0]==100*x,
T[x,1]==100*x^2,
T[0,y]==0,
T[1,y]==100};
homogenousSol=NDSolve[{PDE==0, BCs},T,{x,0,1},{y,0,1}];
Plot3D[Evaluate[T[x,y]/.homogenousSol,{x,0,1},{y,0,1}]]


(* ::Text:: *)
(*Solving Txx(x,y) + Tyy(xy) = 6400sin(4\[Pi]x)cos(4\[Pi]y) on domain [0, 1]*)
(*With boundary conditions *)
(*T(x,0) = 100x, T(x,1) = 100x^2,*)
(*T(0,y) = 0, T(1,y) = 100*)


PDE = D[T[x,y],x,x] + D[T[x,y],y,y];
BCs={T[x,0]==100*x,
T[x,1]==100*x^2,
T[0,y]==0,
T[1,y]==100};
nonHomogenousSol=NDSolve[{PDE==6400*Sin[4*Pi*x]*Cos[4*Pi*y], 
BCs},T,{x,0,1},{y,0,1}];
Plot3D[Evaluate[T[x,y]/.nonHomogenousSol,{x,0,1},{y,0,1}]]
