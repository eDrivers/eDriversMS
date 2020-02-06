---
title: "Reviewer 1 comments"
author: David Beauchesne
date: "2020-02-05"
fontfamily: fourier
linestretch: 1
fontsize: 10pt
output:
  pdf_document:
    latex_engine: xelatex
---


<!--
rmarkdown::render('./Revisions/Reviewer1.md')
-->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 1
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please summarize the main findings of the study***

> This article presents 22 environmental drivers and uses these environmental drivers to identify areas of high cumulative exposure and characterize areas with similar cumulative exposure in the St. Lawrence System. In particular, the article introduces an open knowledge platform named eDrivers, though it doesn’t seem to be working at this moment (https://github.com/eDrivers - this site contains zero repositories, zero people, zero projects; the R package dDrivers is not available on CRAN). When this R package and the website become available, I believe the article and its related sources will be beneficial to the scientific and management communities. Despite its weaknesses (shown below), I believe this work is a good start for assessing and managing cumulative effects in the St. Lawrence System and can serve as a good example for other marine ecosystems.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
Answer:

- The material has yet to be released publicly on GitHub as we were waiting for the review process to be completed. We can however provide access to the repositories in the interim.
- As for the package, we will not be releasing a version on CRAN just yet. The material is not yet implemented on the SLGO servers (our partners on this project) and the data is currently contained directly in the package. Our goal is to publish the package and submit it for peer-review once the data is available and accessible through SLGO's API.
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 2
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please highlight the limitations and strengths***

> Weaknesses (and potential solutions) are listed below:

> 1. Authors need to make it clear up in the front that this work is only focusing on one of the four elements required to evaluate environmental impacts. Besides moving Lines 119-122 to around Line 77, it will be helpful to introduce the best practices in cumulative effects assessment and management: (1) selecting valued (ecosystem) components, (2) selecting indicators, (3) setting temporal and spatial scales, (4) addressing uncertainties, and (5) public participation. It will also be helpful to differentiate the two different indicators: effects-based and stressor-based. Effects-based indicators are direct measurements of the valued components (such as species abundance, biodiversity, etc.) and inherently encompass cumulative effects of multiple drivers. However, because of the poorly understood cause-effect linkages between stressors and valued components, it is currently hard to be used for decision-making. In comparison, stressor-based indicators (i.e., driver-based as this article defines and the type that this article uses) are usually better understood and can be proactively linked to management actions. However, these indicators do not capture the effects of all stressors and are not able to discern non-additive cumulative effects (e.g. synergism, antagonism). This point leads to the next weakness of this article.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
Answer:

- In themselves, even if more readily understood, stressor-based indicators are a challenge to characterize, especially for larger spatial extents. The goal of our manuscript and the eDrivers initiative is therefore to facilitate the widespread accessibility of such data so that environmental assessments may focus on other aspects of impact assessments.
- It is clear to us that what we are presenting is but one element of a fully operational impact assessment. We have strived to make this as cristal clear as possible throughout the manuscript, namely in the introduction (lines 119-122) and the perspectives (lines 472-477) sections. Comments from reviewer 1 are therefore well received and we have modified the manuscript throughout to clarify the purpose of our paper.

TODO:
- [ ] moving Lines 119-122 to around Line 77
- [ ] introduce the best practices in cumulative effects assessment and management
- [ ] differentiate the two different indicators: effects-based and stressor-based
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


> 2. Because of this inherent weakness of stressor-based indicators, the dealing and conclusion of this article related to driver interactions (Sections 3.4 and 4.2) are inadequate. How different stressors (or drivers) interact to create nonlinear, non-additive cumulative effects are dependent on a specific valued component of interest. This article simply assumes the summed intensity of two drivers as interactions, which is inaccurate and misleading. Consequently, the results based on the two drivers (hypoxia and fisheries) are not convincing (Section 4.2). How to create indicators that truly reflect negative impacts is essential and can be specific to a specific value component. For instance, temperature positive anomalies may have negative impact on certain species, it may not necessarily degrade ecosystem production. While the calculation of drivers intensity in Appendix is only one way of doing it, it is important for the computer package to provide users with flexibility to define their own indicators (i.e., one potential solution to the weakness).

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
Answer:

- We begin by thanking the reviewer for pointing out this obvious weakness in the manuscript. We realize now that, even though we did not want to mislead readers in thinking we were evaluating driver interactions, we are in fact doing just that. In presenting sections 3.4 and 4.2, our goal was to provide an illustration of how a simple two-drivers case could be used to identify areas of high relative intensity driver overlap. As mentionned in reviewer 1 comments, this provides no information on valued component-specific driver interactions and non-additive effects. Under the assumption that driver overlap is necessary for driver interactions to exist, we believe it is reasonable to predict that driver interactions and non-additive effects will most likely be observed in areas where drivers overlap at high relative intensities. These areas indeed delineate where the effects of both drivers are most likely to impact valued components simultaneously.
- As it currently stands, however, the manuscript is indeed misleading on the topic of driver interactions. We have therefore modified sections 3.4 (lines XXX to XXX) and 4.2 (lines XXX to XXX) to clarify this.

TODO:
- [ ] Modify section 3.4
- [ ] Modify section 4.2
- [ ] Change text to talk about driver overlap instead of driver interactions.
- [ ] Clarify that areas of overlap are those that we consider most likely to produce interations and non-additive effects, but that these will be fully dependent on the vulnerability of valued components to drivers.


- Providing flexibility in indicator definition is a feature that we wish to provide in future iterations of the package and the platform. As it currently stands, however, we have significant work still ahead of us to work with experts involved in the project. We would therefore rather not include such enhancements at this point. We however added a sentence to the text that presents this idea as a perspective and future work to be accomplished (lines XXX to XXX).

TODO:
- [ ] Add senctence on indicator enhancements in the conclusion

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


> 3. Because of the paramount importance of defining valued components in the process of cumulative effects assessment and management, the absence of this element is the third weakness of this article. This weakness can potentially be overcome by adding “Future work”. In the future, similar work can be carried out to select and mapping valued components, which will allow explicit linkages between drivers and value components to be explored for better understanding cumulative effects.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
Answer:

- We agree with reviewer 1 on the importance of valued components for cumulative effects assessments. Presenting a full cumulative impacts assessments and defining valued components is however not the objective of this manuscript. The choices of valued components are fully dependent on the objective of a particular assessment. In our experience, time and money is spent on recurring initiatives that seek to characterize sources of stress in a system for impacts assessments on specific valued component. This is, in our view, unacceptable. Our goal was therefore to build an initiative that would limit this and provide access to formatted and comparable knowledge on sources of stress that are typically used in impact assessments. This integrative dataset can then be used and adapted to the need of a user to assess impacts on a single or multiple valued components of interest, or the user can identify gaps in knowledge in the platform and ultimately contribute to the knowledge contained in the platform. We were therefore very deliberate in our decision not to include and discuss specific valued components in this manuscript.

- As proposed by reviewer 1, we had already included a paragraph on the importance of valued components and their vulnerability to soures of stress in the conclusion. In response to the comment, we have expanded this paragraph (lines XXX to XXX). We also explicitely presented valued components in the introduction and stated why we deliberately focuse solely on drivers in our initiative (lines XXX to XXX). We believe that these complements should clarify the purpose of this paper and the importance of such an initiative.

TODO:
- [ ] In the introduction, explain why we do not discuss valued components in this manuscript, rather focusing deliberately on drivers (ties in with Comment 1 from reviewer)
- [ ] In the conclusion, add more information in the paragraph that discusses the fact that we present only one element of a full impact assessment and why this is important.
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 3
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please provide your detailed review report to the editor and authors (including any comments on the Q4 Check List):***

> This article is generally well written, presenting 22 environmental drivers. It uses these environmental drivers to identify areas of high cumulative exposure and characterize areas with similar cumulative exposure in the St. Lawrence System. In particular, the article introduces an open knowledge platform named eDrivers, though it doesn’t seem to be working at this moment (https://github.com/eDrivers - this site contains zero repositories, zero people, zero projects; the R package dDrivers is not available on CRAN). When this R package and the website become available, I believe the article and its related sources will be beneficial to the scientific and management communities. Despite its weaknesses (shown below), I believe this work is a good start for assessing and managing cumulative effects in the St. Lawrence System and can serve as a good example for other marine ecosystems.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
- See answer to question 1
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> Weaknesses (and potential solutions) are listed below:

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> 1. Authors need to make it clear up in the front that this work is only focusing on one of the four elements required to evaluate environmental impacts. Besides moving Lines 119-122 to around Line 77, it will be helpful to introduce the best practices in cumulative effects assessment and management: (1) selecting valued (ecosystem) components, (2) selecting indicators, (3) setting temporal and spatial scales, (4) addressing uncertainties, and (5) public participation. It will also be helpful to differentiate the two different indicators: effects-based and stressor-based. Effects-based indicators are direct measurements of the valued components (such as species abundance, biodiversity, etc.) and inherently encompass cumulative effects of multiple drivers. However, because of the poorly understood cause-effect linkages between stressors and valued components, it is currently hard to be used for decision-making. In comparison, stressor-based indicators (i.e., driver-based as this article defines and the type that this article uses) are usually better understood and can be proactively linked to management actions. However, these indicators do not capture the effects of all stressors and are not able to discern non-additive cumulative effects (e.g. synergism, antagonism). This point leads to the next weakness of this article.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
- See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> 2. Because of this inherent weakness of stressor-based indicators, the dealing and conclusion of this article related to driver interactions (Sections 3.4 and 4.2) are inadequate. How different stressors (or drivers) interact to create nonlinear, non-additive cumulative effects are dependent on a specific valued component of interest. This article simply assumes the summed intensity of two drivers as interactions, which is inaccurate and misleading. Consequently, the results based on the two drivers (hypoxia and fisheries) are not convincing (Section 4.2). How to create indicators that truly reflect negative impacts is essential and can be specific to a specific value component. For instance, temperature positive anomalies may have negative impact on certain species, it may not necessarily degrade ecosystem production. While the calculation of drivers intensity in Appendix is only one way of doing it, it is important for the computer package to provide users with flexibility to define their own indicators (i.e., one potential solution to the weakness).

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
- See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> 3. Because of the paramount importance of defining valued components in the process of cumulative effects assessment and management, the absence of this element is the third weakness of this article. This weakness can potentially be overcome by adding “Future work”. In the future, similar work can be carried out to select and mapping valued components, which will allow explicit linkages between drivers and value components to be explored for better understanding cumulative effects.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
- See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> Comment on the methods, results and data interpretation: The method on dealing with driver interactions is inadequate, and the resultant conclusions with regard to interactions are not convincing.

- See answer to question 2

> Minor comments:

> Line 229: add “on” before the analysis.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
- This was modified in the text (lines XXX to XXX).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> Lines 327-328: fix language issue.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
- We have modified the sentences on lines 327-328 (now lines XXX to XXX).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> Figure 5 caption: tp becomes to

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
- Figure caption was modified accordingly (line XXX).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> Please check Appendix carefully for language errors. In addition, Appendix can be tightened up.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
Answer:

- We have performed a thorough review of the material presented in the Appendix.

TODO:
- [ ] review appendix
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 4
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please comment on the methods, results and data interpretation. If there are any objective errors, or if the conclusions are not supported, you should detail your concerns.***

The method on dealing with driver interactions is inadequate, and the resultant conclusions with regard to interactions are not convincing.

- See answer to question 2

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 5
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

> Is the English language of sufficient quality?
- Yes

> Is the quality of the figures and tables satisfactory?
- Yes

> Does the reference list cover the relevant literature adequately and in an unbiased manner?
- Yes

> Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
- Not Applicable

> Are the methods sufficiently documented to allow replication studies?
- Yes

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
Answer :

- All the code to reproduce the driver layers and the analyses of the paper will be openly available once the GitHub repositories are made public.

TODO:

- [ ] MAke GitHub repositories public
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


> Are the data underlying the study available in either the article, supplement, or deposited in a repository? (Sequence/expression data, protein/molecule characterizations, annotations, and taxonomy data are required to be deposited in public repositories prior to publication) (yes/no/not applicable)
- No

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
Answer :

- The formatted driver data will be available through the package and the raw data are now archived on Zenodo (link XXX) and accessible upon request to the authors.

TODO:

- [ ] Archive rawdata on Zenodo.
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

> Does the study adhere to ethical standards including ethics committee approval and consent procedure?
- Not Applicable

> Have standard biosecurity and institutional safety procedures been adhered to?
- Not Applicable
