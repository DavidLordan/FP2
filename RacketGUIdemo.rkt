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
