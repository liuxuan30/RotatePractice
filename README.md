# RotatePractice

A demo to understand how to rotate text or image correctly. 
I draw a normal, translated, and rotated text with different colors to demonstrate

One thing needs to mention:
the positive/negative degrees for UIView is clockwise/counterclockwise

Quote:

*The direction that the context is rotated may appear to be altered by the state of the current transformation matrix prior to executing this function. For example, on iOS, a UIView applies a transformation to the graphics context that inverts the Y-axis (by multiplying it by -1). Rotating the user coordinate system on coordinate system that was previously flipped results in a rotation in the opposite direction (that is, positive values appear to rotate the coordinate system in the clockwise direction).*
