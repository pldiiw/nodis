#!/usr/bin/env awk

# Required environment variables
BEGIN { CURRENT_TIME=CURRENT_TIME }

# Match nodis formatted lines
/#?127\.0\.0\.1 .* ## ([0-9]{2}.?){4}/ {
  # Make start and end times match CURRENT_TIME format
  start_time = $4
  gsub(/[^0-9]/, "", start_time)
  end_time = $5
  gsub(/[^0-9]/, "", end_time)

  should_entry_be_active = 0
  if (CURRENT_TIME >= start_time && CURRENT_TIME <= end_time)
    should_entry_be_active = 1

  if (index($1, "#") == 1 && should_entry_be_active)
    print substr($0, 2)
  else if (index($1, "#") == 0 && !should_entry_be_active)
    print "#"$0
  else
    print $0
}

# Match all other lines
!/#?127\.0\.0\.1 .* ## ([0-9]{2}.?){4}/ { print $0 }

