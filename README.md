# Blood Vessel Segmentation in Retinal Images

This repository presents a classical image processing pipeline developed in MATLAB for segmenting blood vessels in retinal fundus images. The project addresses challenges in early-stage diagnosis of vascular retinal diseases such as diabetic retinopathy and glaucoma, focusing on robustness, reproducibility, and low computational complexity.

## 🎯 Objective

The primary objective is to develop a robust and interpretable algorithm for the automatic segmentation of retinal blood vessels. The method leverages classical image processing techniques and is suitable for resource-constrained environments or as a baseline for deep learning comparisons.

## 🧠 Methodology

The segmentation pipeline consists of the following stages:

1. **Preprocessing**
   - Conversion from RGB to grayscale using weighted luminance formulation.
   - Optional green channel enhancement due to high vessel-background contrast.

2. **Contrast Enhancement**
   - Application of Adaptive Histogram Equalization (AHE) to improve local vessel visibility.
   - Suppression of uneven illumination artifacts.

3. **Background Subtraction**
   - Gaussian filtering to estimate and remove low-frequency background content.

4. **Vessel Enhancement and Thresholding**
   - Global and adaptive thresholding applied to enhance vessel connectivity.
   - Optional use of matched filtering for improved vessel detection.

5. **Post-processing**
   - Morphological operations (e.g., erosion, dilation) to remove noise and refine vessel structure.
   - Connected component analysis to retain major vascular branches.

## 📁 Directory Structure

```
retinal-vessel-segmentation/
├── src/                     # MATLAB source code
│   ├── preprocessing.m
│   ├── histogram_equalization.m
│   ├── thresholding.m
│   └── segmentation.m
├── demo/                    # Sample outputs and video
│   ├── Demo_Video.mp4
│   └── sample_output/
├── report/                  # Final report slides
│   └── Image_Processing_Final_Project_HL_AE.pptx
├── images/                  # Screenshots for README
│   └── pipeline_example.png
├── README.md
└── LICENSE
```

## 📦 Requirements

- MATLAB R2020a or later
- Image Processing Toolbox

## ▶️ How to Run

Open MATLAB and run the following commands:

```matlab
cd src
segmentation('your_image.jpg'); % Replace with your fundus image
```

The output will be saved in `sample_output/` and includes:
- The original image
- Vessel binary mask
- Overlay visualization

## 🧪 Evaluation

The pipeline has been tested on standard retinal datasets with consistent visual outcomes. Quantitative analysis can be added by integrating labeled ground truth masks for metrics like sensitivity, specificity, and Dice coefficient.

## 📽️ Demonstration

A visual demonstration of the full pipeline is provided in:

- `demo/Demo_Video.mp4`
- Screenshots in `images/pipeline_example.png`

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 👥 Contributors

- **Hussein Loubani** — Université de Technologie de Belfort-Montbéliard (UTBM)
- **AE Collaborator** — Image Processing Project Partner

---

For academic or clinical use, please cite appropriately or contact the author for extended collaboration.
