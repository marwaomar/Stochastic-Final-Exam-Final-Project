
### Objectives
>• Wiener filter design.<br>
>• Signal estimation.<br>
>• Using signal models in signal prediction.<br>
>• Documentation with either Latex or Word.<br>
Notes
• This is an idividual project. Every student must submit his own solution to prob-
lems of this project.<br>
• you have to submit your project online. No discussion for this project.<br>
• Solution must be on your own. Be creative and avoid plagiarism and cheating.<br>
• You can implement your project using either Python or Matlab.<br>
Project Signals Data
• This is the data link.<br>
• Data contain two ECG signals one distorted and the other original.<br>
• Use the distorted ECG signal only to implement your project.<br>
• Use the original ECG signal to validate your result.<br>
## Project to implement
> Given a distorted ECG signal. We have modelled the distortion as follow:<br>
y ( n ) = c 0 x ( n ) + c 1 x ( n − 1 ) + c 2 x ( n − 2 ) + c 3 x ( n − 3 ) + ε ( n )
(1)
<br>
Where y ( n ) is the distorted signal. x ( n ) is the source signal, and ε ( n ) is WGN ε ( n ) ∼
N ( 0, σ ε 2 ) . c 0 = − 1, c 1 = − 0.75, c 2 = − 0.5, c 3 = − 0.25, and σ ε 2 = 0.01.<br>


• Using provided model, build a fifth order Wiener filter.<br>
• Apply this filter on the signal and show the output.<br>
• Calculate the mean square error of the filtered signal (Source signal is provided
for that)<br>
