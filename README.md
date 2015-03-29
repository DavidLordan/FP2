# Final Project Assignment 2: Explore One More! (FP2) 
DUE March 30, 2015 Monday (2015-03-30)


### My Library: The Racket Graphical Interface Toolkit
The library's documentation can be found here: http://docs.racket-lang.org/gui/index.html

For the second exploration I decied to play around with the Racket Graphical Interface Toolkit. 
I chose this because for the final project I'd like to wrap a graphical interface around the RSound library,
and possibly build a synthezizer program. 

The first thing I did was the breif walkthrough on creating windows, canvases, and buttons.
I then experimented with different user inputs, such as a text boxes and sliders.



```
#lang racket

(require racket/gui/base)

; Make a frame by instantiating the frame% class
(define mainWindow (new frame% [label "Example"]))

; Make a static text message in the frame
(define msg (new message% [parent mainWindow]
                          [label ""]
                          [min-width 250]))
 
;;Creates text field to enter name
(define myText (new text-field%
     [label "Enter your name:"]
     [parent mainWindow]
     [min-width 50]))

;;Procedure to grab the text from a text box.
;;Must take the text field name as an argument. 
(define myGetText 
  (lambda (thisText)
  (send (send thisText get-editor) get-text)))

;; Procedure to clear out the text field for user's names. 
(define clearNameField
  (lambda (thisText)
    (send (send thisText get-editor) erase)))

;; Panel to contain the 'click here' and 'clear' buttons
(define buttonPanel (new horizontal-panel% [parent mainWindow]))

; Make a button in the main window
; Sends welcome message with name text field content.
(new button% [parent buttonPanel]
             [label "Click Here"]
             [callback (lambda (button event)
                  (send msg set-label
                        (string-append "Hello, "(myGetText myText) "!")))])

;;Button to clear content of name text field. 
(new button% [parent buttonPanel]
     [label "Clear"]
     [callback (lambda (button event)
                 (clearNameField myText))])

;; New panel to hold the slider and associated message field.
(define sliderPanel (new horizontal-panel% [parent mainWindow]))

;; Slider is added to the panel defined just above. 
(define mySlider (new slider%
     [label "Slider"]
     [min-value 0]
     [max-value 100]
     [parent sliderPanel]
     [callback (lambda (slider event)
                 (send slideMsg set-label (number->string (- 100 (send mySlider get-value)))))]))

;; Message field whose value will be set by the slider defined just above. 
(define slideMsg (new message% [parent sliderPanel]
                               [label "100"]
                               [min-width 50]))
 
; Show the frame by calling its show method
(send mainWindow show #t)

```

Write what you did!
Remember that this report must include:
 
* a narrative of what you did
* the code that you wrote
* output from your code demonstrating what it produced
* any diagrams or figures explaining your work 
 
The narrative itself should be no longer than 350 words. Yes, you can add more files and link or refer to them. This is github, handling files is awesome and easy!

Ask questions publicly in the Piazza group.

### How to Do and Submit this assignment

1. To start, [**fork** this repository][forking].
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your solution.
  2. (This assignment is just one README.md file, so you can edit it right in github without cloning)
  3. (You may need to clone and push if you want to add extra files)
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

<!-- Links -->
[piazza]: https://piazza.com/class/i55is8xqqwhmr?cid=411
[schedule]: https://piazza.com/class/i55is8xqqwhmr?cid=453
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

