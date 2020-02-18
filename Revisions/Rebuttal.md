---
title: "Rebuttal"
fontfamily: fourier
linestretch: 1
fontsize: 10pt
output:
  pdf_document:
    latex_engine: xelatex
---


<!--
rmarkdown::render('./Revisions/Rebuttal.md')
-->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Letter to the editor
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

Dear Dr. Otto,

We are submitting a revised version of the manuscript "Next Generation Planning - Structuring and Sharing Environmental Drivers Data for the St. Lawrence System" (ID: 469411) for publication in Frontiers in Marine Science. We would like to thank the reviewer for their very constructive comments. We feel that we were able to address all of their comments and are now submitting an improved manuscript. Below we explain how we have revised our manuscript based on the reviews.

We thank you for considering our revised manuscript and I am looking forward to hearing from you.

Best regards,

David Beauchesne


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 1
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please summarize the main findings of the study***

*This article presents 22 environmental drivers and uses these environmental drivers to identify areas of high cumulative exposure and characterize areas with similar cumulative exposure in the St. Lawrence System. In particular, the article introduces an open knowledge platform named eDrivers, though it doesn’t seem to be working at this moment (https://github.com/eDrivers - this site contains zero repositories, zero people, zero projects; the R package dDrivers is not available on CRAN). When this R package and the website become available, I believe the article and its related sources will be beneficial to the scientific and management communities. Despite its weaknesses (shown below), I believe this work is a good start for assessing and managing cumulative effects in the St. Lawrence System and can serve as a good example for other marine ecosystems.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
**Answer:**

> - The material has yet to be released publicly on GitHub as we were waiting for the review process to be completed. We can however provide access to the repositories in the interim.

> - As for the package, we will not be releasing a version on CRAN just yet. The material is not yet implemented on the SLGO servers (our partners on this project) and the data is currently contained directly in the package. Our goal is to publish the package and submit it for peer-review once the data is available and accessible through SLGO's API. However, the package will/can? be available on github in the interim.
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 2
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please highlight the limitations and strengths***

*Weaknesses (and potential solutions) are listed below:*

***Comment 1:***

*Authors need to make it clear up in the front that this work is only focusing on one of the four elements required to evaluate environmental impacts. Besides moving Lines 119-122 to around Line 77, it will be helpful to introduce the best practices in cumulative effects assessment and management: (1) selecting valued (ecosystem) components, (2) selecting indicators, (3) setting temporal and spatial scales, (4) addressing uncertainties, and (5) public participation. It will also be helpful to differentiate the two different indicators: effects-based and stressor-based. Effects-based indicators are direct measurements of the valued components (such as species abundance, biodiversity, etc.) and inherently encompass cumulative effects of multiple drivers. However, because of the poorly understood cause-effect linkages between stressors and valued components, it is currently hard to be used for decision-making. In comparison, stressor-based indicators (i.e., driver-based as this article defines and the type that this article uses) are usually better understood and can be proactively linked to management actions. However, these indicators do not capture the effects of all stressors and are not able to discern non-additive cumulative effects (e.g. synergism, antagonism). This point leads to the next weakness of this article.*


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - We agree with reviewer 1 on the importance of clearly stating that we are solely focusing on drivers in our manuscript. The goal of our manuscript and the *eDrivers* initiative is to facilitate the widespread accessibility of such data for environmental assessments and integrative management. We believe it is clear that we are presenting but one element of a fully operational impact assessment given the title of the manuscript and the 3rd sentence in the abstract: "Our objective in this paper is to systematically characterize the distribution and intensity of drivers in the St. Lawrence System.". Our goal is  not to discuss cumulative effects assessments in particular. It is rather to provide knowledge on an element common to most holistic approaches, *i.e.* drivers characterization. We have strived to make this as clear as possible throughout the manuscript, namely in the introduction and in the perspectives sections, as noted by reviewer 1. As such, and considering the focus of the manuscript, we are hesitant to accept the suggestion of reviewer 1 to discuss cumulative effects assessment, best practices and indicator types at the beginning of the introduction. We feel that, considering the objective of this manuscript, the beginning of the introduction should rather focus on drivers specifically.

> - We nonetheless agree with reviewer 1's suggestions. We are therefore proposing the following modifications to the manuscript that we believe consolidates the essence of the suggestions made by reviewer 1:

  > 1. We modified the introduction to broadly state the major steps undertaken in holistic environmental approaches in general (lines 91 to 96).

  > 2. We modified the statement of the objectives of the manuscript at the end of the introduction to clearly state that we are focusing on drivers (lines 119 to 124).

  > 3. We modified the pre-existing paragraph presenting the importance of valued components in the perspective sections (lines 487 to 509). It is now presenting *eDrivers* as a suite of stressor-based indicators that hold certain advantages, but fail to capture effects on valued components and non-additive effects. We present effects-based indicators and their importance for understanding cumulative effects. We then argue that both are jointly required to properly diagnose causes of ecosystem change (Dube 2003, Environmental Impact Assessment Review 23(6):723-745; Jones 2016, Environmental Reviews 24(2):187-204).


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 2:***

*Because of this inherent weakness of stressor-based indicators, the dealing and conclusion of this article related to driver interactions (Sections 3.4 and 4.2) are inadequate. How different stressors (or drivers) interact to create nonlinear, non-additive cumulative effects are dependent on a specific valued component of interest. This article simply assumes the summed intensity of two drivers as interactions, which is inaccurate and misleading. Consequently, the results based on the two drivers (hypoxia and fisheries) are not convincing (Section 4.2). How to create indicators that truly reflect negative impacts is essential and can be specific to a specific value component. For instance, temperature positive anomalies may have negative impact on certain species, it may not necessarily degrade ecosystem production. While the calculation of drivers intensity in Appendix is only one way of doing it, it is important for the computer package to provide users with flexibility to define their own indicators (i.e., one potential solution to the weakness).*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - We begin by thanking the reviewer for pointing out this obvious weakness in the manuscript. We realize now that, even though we did not want to mislead readers in thinking we were evaluating driver interactions, we are in fact doing just that. As mentionned in reviewer 1 comments, driver co-occurrence provides no information on valued component-specific driver interactions and non-additive effects. Under the assumption that driver co-occurrence is necessary for driver interactions to exist, we believe it is reasonable to predict that driver interactions and non-additive effects will most likely be observed in areas where drivers overlap at high relative intensities. These areas indeed delineate where the effects of both drivers are most likely to impact valued components simultaneously. In presenting sections 3.4 and 4.2, our goal was to provide an illustration of how a simple two-drivers case could be used to identify areas of high relative intensity driver overlap. This should be used as segway to the more integrative cumulative footprint and hotspot indicators. As rightfully identified by reviewer 1, however, the manuscript is indeed misleading on the topic of driver interactions. We have therefore made the following modifications to the manuscript:

  > 1. We removed objective 2 from the manuscript and mentions of driver interactions, except in the context of discussing the likelihood on observing interactions in areas of driver co-occurrence.

  > 2. The methodology and results/discussions sections on driver interactions were moved to sections 3.3 and 4.1, respectively, and renamed *Driver co-occurrence*. We then modified the section as a simplified example of driver co-occurrence (lines XXX to XXX). We however did not modify the results/discussion section. The only mention of driver interactions was in the title itself. In the discussion, we merely discuss the areas of high intensity co-occurrence between the two drivers and present adverse effects that these drivers may have on species individually or simultaneously. We did however add a closing statement to the section stating that individual and interactive effects of both drivers is species- and community-dependent and that the co-occurrence of drivers in itself is not an evidence of driver interaction. We then state that assuming that driver co-occurrence is a prerequisite for driver interactions, however, it is reasonable to expect interactions to occur in areas where both drivers co-occur at high relative intensities (lines XXX to XXX)

> - Ultimately, this portion of the manuscript should serve as a simple illustration to better understand the complete cumulative footprint indicator. In this sense, if the reviewer still feels that proposed changes are not sufficient, we propose removing these sections from the manuscript.

> - As for providing flexibility in indicator definition, it is a feature that we wish to provide in future iterations of the package and the platform. We would however rather not include such enhancements at this point, as they are more technical in nature and should not preclude us from publishing this work. We however added a statement to the manuscript that presents this idea as a perspective and future work to be accomplished (lines XXX to XXX in perspectives).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 3:***

*Because of the paramount importance of defining valued components in the process of cumulative effects assessment and management, the absence of this element is the third weakness of this article. This weakness can potentially be overcome by adding “Future work”. In the future, similar work can be carried out to select and mapping valued components, which will allow explicit linkages between drivers and value components to be explored for better understanding cumulative effects.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - We agree with reviewer 1 on the importance of valued components for cumulative effects assessments. Presenting a full cumulative impacts assessments and defining valued components is however not the objective of this manuscript, nor is it to discuss cumulative impacts in particular. The choices of valued components are fully dependent on the objective of a particular assessment or management scheme. In our experience, time and money is spent on recurring initiatives that seek to characterize sources of stress in a system for impacts assessments and integrative management. This is, in our view, unacceptable. Our goal was therefore to build an initiative that would limit this and provide access to formatted and comparable knowledge on sources of stress that are typically used for impact assessments and integrative management. This integrative dataset can then be used and adapted to the need of a user to assess impacts on a single or multiple valued components of interest, or the user can identify gaps in knowledge in the platform and ultimately contribute to the knowledge contained in the platform. We were therefore very deliberate in our decision not to include and discuss specific valued components. This manuscript is in fact part of a broader project that aims at evaluating cumulative impact on the ecological communities of the St. Lawrence. The description of drivers will thus be used on specific valued components in the St. Lawrence System.

> - As proposed by reviewer 1, we had already included a paragraph on the importance of valued components and their vulnerability to soures of stress in the conclusion. We however realize now that it was underwhelming in its ability to provide perspective and direction to how eDrivers may be used in the future. We therefore extended this paragragh, also in response to reviewer 1's first comment, to better discuss the significance of valued components and the different types of indicators for cumulative effects assessment (lines 487 to 509).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 3
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please provide your detailed review report to the editor and authors (including any comments on the Q4 Check List):***

*This article is generally well written, presenting 22 environmental drivers. It uses these environmental drivers to identify areas of high cumulative exposure and characterize areas with similar cumulative exposure in the St. Lawrence System. In particular, the article introduces an open knowledge platform named eDrivers, though it doesn’t seem to be working at this moment (https://github.com/eDrivers - this site contains zero repositories, zero people, zero projects; the R package dDrivers is not available on CRAN). When this R package and the website become available, I believe the article and its related sources will be beneficial to the scientific and management communities. Despite its weaknesses (shown below), I believe this work is a good start for assessing and managing cumulative effects in the St. Lawrence System and can serve as a good example for other marine ecosystems.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 1
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Weaknesses (and potential solutions) are listed below:*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Comment 1:***

*Authors need to make it clear up in the front that this work is only focusing on one of the four elements required to evaluate environmental impacts. Besides moving Lines 119-122 to around Line 77, it will be helpful to introduce the best practices in cumulative effects assessment and management: (1) selecting valued (ecosystem) components, (2) selecting indicators, (3) setting temporal and spatial scales, (4) addressing uncertainties, and (5) public participation. It will also be helpful to differentiate the two different indicators: effects-based and stressor-based. Effects-based indicators are direct measurements of the valued components (such as species abundance, biodiversity, etc.) and inherently encompass cumulative effects of multiple drivers. However, because of the poorly understood cause-effect linkages between stressors and valued components, it is currently hard to be used for decision-making. In comparison, stressor-based indicators (i.e., driver-based as this article defines and the type that this article uses) are usually better understood and can be proactively linked to management actions. However, these indicators do not capture the effects of all stressors and are not able to discern non-additive cumulative effects (e.g. synergism, antagonism). This point leads to the next weakness of this article.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 2:***

*Because of this inherent weakness of stressor-based indicators, the dealing and conclusion of this article related to driver interactions (Sections 3.4 and 4.2) are inadequate. How different stressors (or drivers) interact to create nonlinear, non-additive cumulative effects are dependent on a specific valued component of interest. This article simply assumes the summed intensity of two drivers as interactions, which is inaccurate and misleading. Consequently, the results based on the two drivers (hypoxia and fisheries) are not convincing (Section 4.2). How to create indicators that truly reflect negative impacts is essential and can be specific to a specific value component. For instance, temperature positive anomalies may have negative impact on certain species, it may not necessarily degrade ecosystem production. While the calculation of drivers intensity in Appendix is only one way of doing it, it is important for the computer package to provide users with flexibility to define their own indicators (i.e., one potential solution to the weakness).*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 3:***

*Because of the paramount importance of defining valued components in the process of cumulative effects assessment and management, the absence of this element is the third weakness of this article. This weakness can potentially be overcome by adding “Future work”. In the future, similar work can be carried out to select and mapping valued components, which will allow explicit linkages between drivers and value components to be explored for better understanding cumulative effects.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Comment on the methods, results and data interpretation: The method on dealing with driver interactions is inadequate, and the resultant conclusions with regard to interactions are not convincing.*

***Answer:***

> - See answer to question 2




***Minor comments:***

*Line 229: add “on” before the analysis.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - This was modified in the text (lines XXX to XXX).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Lines 327-328: fix language issue.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - We have modified the sentences on lines 327-328 (now lines XXX to XXX).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Figure 5 caption: tp becomes to*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - Figure caption was modified accordingly (line XXX).
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Please check Appendix carefully for language errors. In addition, Appendix can be tightened up.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - We have performed a thorough review of the material presented in the Appendix.

TODO:

- [ ] review appendix
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 4
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please comment on the methods, results and data interpretation. If there are any objective errors, or if the conclusions are not supported, you should detail your concerns.***

*The method on dealing with driver interactions is inadequate, and the resultant conclusions with regard to interactions are not convincing.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Question 5
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

*Is the English language of sufficient quality?
- Yes*

Is the quality of the figures and tables satisfactory?
- Yes

Does the reference list cover the relevant literature adequately and in an unbiased manner?
- Yes

Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
- Not Applicable

Are the methods sufficiently documented to allow replication studies?
- Yes

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - All the code to reproduce the driver layers and the analyses of the paper will be openly available once the GitHub repositories are made public.

TODO:

- [ ] Make GitHub repositories public
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


Are the data underlying the study available in either the article, supplement, or deposited in a repository? (Sequence/expression data, protein/molecule characterizations, annotations, and taxonomy data are required to be deposited in public repositories prior to publication) (yes/no/not applicable)
- No

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - The formatted driver data will be available through the package and the raw data are now archived on Zenodo (link XXX) and accessible upon request to the authors.

TODO:

- [ ] Archive rawdata on Zenodo.
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

Does the study adhere to ethical standards including ethics committee approval and consent procedure?
- Not Applicable

Have standard biosecurity and institutional safety procedures been adhered to?
- Not Applicable
