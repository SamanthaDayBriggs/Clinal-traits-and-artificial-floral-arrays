
"""
Analyze the relationship between precipitation and floral area.

Input:
    sizedata_wprecip.csv

Required columns:
    Floral_area: floral area in mm²
    precip: precipitation in mm

Outputs:
    Summary statistics printed to the terminal
    floral_area_vs_precipitation.png
"""

from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# Load the data
# --------------------------------------------------

desktop = Path.home() / "Desktop"
input_file = desktop / "sizedata_wprecip.csv"

data = pd.read_csv(input_file)

# Check that required columns are present
required_columns = ["Floral_area", "precip"]

missing_columns = [
    column for column in required_columns
    if column not in data.columns
]

if missing_columns:
    raise ValueError(
        f"Missing required columns: {missing_columns}. "
        f"Available columns: {list(data.columns)}"
    )

# Keep only the variables needed for this analysis
data = data[required_columns].copy()

# Convert columns to numeric and remove missing or invalid values
for column in required_columns:
    data[column] = pd.to_numeric(data[column], errors="coerce")

data = data.dropna(subset=required_columns)

# Summarize the data
# --------------------------------------------------

print("\nFloral area and precipitation summary:")
print(data.describe())

print(f"\nNumber of complete observations: {len(data)}")

# Calculate the correlation
# --------------------------------------------------

correlation = data["precip"].corr(data["Floral_area"])

print(f"\nPearson correlation: {correlation:.3f}")


# Fit a simple linear trend
# --------------------------------------------------

slope, intercept = np.polyfit(
    data["precip"],
    data["Floral_area"],
    1,
)

precip_range = np.linspace(
    data["precip"].min(),
    data["precip"].max(),
    100,
)

predicted_area = intercept + slope * precip_range

print(f"Linear slope: {slope:.4f} mm² per mm precipitation")


# Plot the relationship
# --------------------------------------------------

fig, ax = plt.subplots(figsize=(8, 5))

ax.scatter(
    data["precip"],
    data["Floral_area"],
    alpha=0.7,
    label="Observations",
)

ax.plot(
    precip_range,
    predicted_area,
    label="Linear trend",
)

ax.set_xlabel("Precipitation (mm)")
ax.set_ylabel("Floral area (mm²)")
ax.set_title("Relationship Between Precipitation and Floral Area")

ax.legend()
fig.tight_layout()

# Save the figure to the Desktop
output_file = desktop / "floral_area_vs_precipitation.png"
fig.savefig(output_file, dpi=300)

print(f"\nPlot saved to: {output_file}")

plt.show()
