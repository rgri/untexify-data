import subprocess

# Convert LaTeX code to DVI
latex_code = r'\int_0^1 x^2 dx'
dvi = subprocess.check_output(['latex', '-interaction=nonstopmode', '-halt-on-error', '-output-format=dvi', '-jobname=output', '-'], input=latex_code.encode())

# Convert DVI to SVG
svg = subprocess.check_output(['dvisvgm', '--no-fonts', '-o', 'output.svg', 'output.dvi'], input=dvi)

# Save SVG to file
with open('output.svg', 'wb') as f:
    f.write(svg)
