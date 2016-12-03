---
layout: post
title:  "Towards the Modeling of Behavioral Trajectories of Users in Online Social Media"
date:   2016-12-01
categories: preprint
---

Over the last decade, the rise of online social media has caused a huge shift in the way people find information, interpret facts, and shape their opinions. Facebook news feeds, Twitter timelines, and blogs are replacing morning newspapers and nightly news. Nowadays everyone can produce and consume information without any filter or restriction. 
<br><br>
Such a disintermediated environment has proved to be a fiasco for the public's understanding of current affairs: clickbait news that pander to readers' worst instincts are proliferating on blogs; conspiracy theories that simplify causation and reduce the complexity of reality are spreading more than stories that are balanced and thoroughly reported; Facebook is flooded by fake news fabricated by fringe websites; Twitter is swamped by bots --- algorithmically driven entities that on the surface appear as legitimate users --- distorting the political debate; the emergence of virtual echo chambers --- non-interacting polarized communities centered on different narratives wherein enclaves of like-minded people reinforce their preexisting beliefs --- is reducing viewpoint diversity and flattening debates.
<br><br>
What is happening in online social media is worsening the political polarization, jeopardizing the quality of democratic discourse, influencing policy preferences, and encouraging behaviors strongly divergent from recommended practices. For these reasons, a better understanding of the behavioral, cognitive, and psychological processes underlying the observed dynamics is a matter that Science has to address.
<br><br>
In this work, we propose a methodology that leverages Hidden Markov Models to represent behavioral trajectories of users in online social media. A Hidden Markov Model (HMM) is a probabilistic model in which the system being modeled is assumed to be a Markov process with unobserved (hidden) states. HMMs extend the framework provided by Markov chains in order to model systems in which the states (or events) we are interested in are not directly observable. 
<br><br>
The fundamental idea behind the approach that we are introducing is the following. In social network analysis, we can observe actions performed by users --- e.g. likes, comments, shares, retweets, etc. ---, but the worldviews, inclinations, and orientations driving those actions remain hidden. It follows that Hidden Markov Models --- wherein the hidden states are supposed to cause observables outputs --- might provide an appropriate and convenient probabilistic framework for the modeling of behavioral trajectories of users in online social media. In this paper, we show that HMMs can embed time series of different length representing the comments left by users supporting conflicting narratives. For the sake of generalization and to provide platform-agnostic results, we apply our methodology to two different online social media: Facebook and YouTube.
<br><br>
Our results show that Hidden Markov Models are able to model behavioral trajectories of users by embedding their visible actions in online social media. Besides the soundness of the intuition and the straightforward idea motivating the use of HMMs in this context, the main strength of our approach is that it allows to compare users that performed a different number of actions --- i.e. users that are represented by time series of different length. Indeed, we can compare users by using a model-based distance between their HMMs, and then apply spectral clustering to discover homogeneous clusters of users showing similar trajectories.
<br><br>
**[Read the full preprint article.][arxiv]**

[arxiv]: https://arxiv.org/pdf/1611.05778v1.pdf
