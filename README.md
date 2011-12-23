A number of utility functions for working with the Corona SDK. Currently they're scattered all over my projects, and I'll be adding them to the repository as I think of them/rediscover them.

`main.lua` contains usage examples.

# Contents

## com.ludicroussoftware.Utilities

`hasEventListener(self, event, callback)` - check whether `self` has a listener for `event`. The optional `callback` parameter lets you check for a specific event listener, since multiple listeners can be added for a single event.

