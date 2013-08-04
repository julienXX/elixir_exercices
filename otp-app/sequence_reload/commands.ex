# Start our server and see that it ignores :increment_number
Sequence.Supervisor.start_link 100
Sequence.next_number
Sequence.increment_number 20
Sequence.next_number

# Suspend the process. This is crucial. If we don't suspend it before compiling
# and loading the new version, next invocation of handle_call or handle_cast
# will use the code from the new module, but the state will still be in the old
# format. By suspending the module we make sure it doesn't handle any
# gen_server callbacks.
:sys.suspend(:sequence)

# Compile and load version 1 of the code (this is sequence.ex from the current directory)
c("sequence.ex")

# Issue the code change call. Normally this would be done by the release
# handler during the release upgrade process.
#
# The first argument is the name of our process (it could be a pid as well).
#
# The second argument is the module on which the code_change callback will be
# invoked.
#
# The third argument will become the value of oldVsn in the code_change
# callback.
#
# The fourth argument is extra information that will be passed as the last
# argument to the code_change callback.
:sys.change_code(:sequence, Sequence, "0", [])

# After the previous call you should have seen the output from our code_change
# callback. Now it's safe to resume the process.
:sys.resume(:sequence)

# Verify that the state has been preserved during the upgrade and that we are
# running the new code now.
Sequence.next_number
Sequence.increment_number 20
Sequence.next_number

