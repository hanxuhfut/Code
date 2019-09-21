# Semi-Decoupled Image Decomposition for Low-Light Enhancement based on Gaussian Total Variation
MATLAB implementation of the algorithm in the  paper "Semi-Decoupled Image Decomposition for Low-Light Enhancement based on Gaussian Total Variation". **This paper has been submitted!!!**.

## 1 Introduction
Low-light image enhancement is important for highquality image display and other visual applications. It is a non-trivial task, as the enhancement is expected to improve the visibility of an image, while keep its visual naturalness. Despite that Retinex-based methods have been recognized as a representative technique for this task, they still have some limitations. First, various artifacts can still be introduced into some enhanced results. Second, although many kinds of priori information can be used to solve the ﬁrst issue, it requires to carefully model priori into the regularization item, and tends to make the optimization process more complex. In this paper, we propose Gaussian Total Variation, and use it as the regularization term to build our Retinex decomposition model, which gradually reﬁnes the decomposed layers in a semi-decoupled way. Qualitative and quantitative experiments on several public datasets were conducted to evaluate our method. The results demonstrate that ourmethodproducesimageswithhighervisibilityandacceptable visual quality simultaneously, which outperforms other state-ofthe-artlow-lightenhancementmethodsintermsofafewobjective and subjective evaluation metrics.

## 2 Demo
Image 1-7 were downloaded from the Internet, and 8-10 were taken in the authors' campus.

- **Image 1**
![image1](/Demo/fig1.png)

- **Image 2**
![image1](/Demo/fig2.png)

- **Image 3**
![image1](/Demo/fig3.png)

- **Image 4**
![image1](/Demo/fig4.png)

- **Image 5**
![image1](/Demo/fig5.png)

- **Image 6**
![image1](/Demo/fig6.png)

- **Image 7**
![image1](/Demo/fig7.png)

- **Image 8**
![image1](/Demo/fig8.png)

- **Image 9**
![image1](/Demo/fig9.png)

- **Image 10**
![image1](/Demo/fig10.png)

## 3 Acknowledgments
- **Part of our code architecture is inspired by "A Joint Intrinsic-Extrinsic Prior Model for Retinex "[[code](https://github.com/caibolun/JieP), [paper](http://openaccess.thecvf.com/content_ICCV_2017/papers/Cai_A_Joint_Intrinsic-Extrinsic_ICCV_2017_paper.pdf)].**
