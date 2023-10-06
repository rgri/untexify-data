from subprocess import call

# Example usage
call(["echo", "x^2", "|", "tex2svg", ">", "x2.svg"])
