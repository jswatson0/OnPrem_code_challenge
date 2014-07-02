OnPrem_code_challenge
=====================

Rotational Cypher

  current functionality:
    - takes a string and any integer to serve as key and creates an encoded string
    
        ex) rotx(57, 'Hello, World')
            --> "mjqqt, btwqi."

    - takes encoded string, key integer used to encode string, and `false` value to return decoded string

        ex) rotx(57, 'mjqqt, btwqi.', false)
            --> "hello, world."
