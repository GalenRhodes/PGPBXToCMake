# Rubicon

Rubicon is an Objective-C library designed to speed cross-platform development by
filling in the missing pieces between the official Apple version of it's Foundation 
classes and the [GNUstep](http://www.gnustep.org) version of the Foundation classes.

## CMake and Building on Linux

I have the project where it will build on Linux using [GNUstep](http://www.gnustep.org)
using [CMake](https://cmake.org/overview/). I tried it with both Unix Makefiles and
with Ninja and it built just fine.

**NOTE:** The [CMake](https://cmake.org/overview/) scripts I have put together don't
build _Framework Bundles_ like XCode does. It creates a simple shared library
(_libRubicon.so_) and installs it into the **~/lib** folder.  It also copies
the public header files into the **~/include/Rubicon** folder. The default
install path, _the user's home directory_, can be changed by setting the install path
in [CMake](https://cmake.org/overview/) by specifying the
[_-DCMAKE_INSTALL_PREFIX=<install-path>_](https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX.html)
flag. So, given the following example:

```bash
cmake -DCMAKE_INSTALL_PREFIX=/usr/local ...
```

This will cause the library to be installed in "_/usr/local/lib_" and the public
headers to be installed in "_/usr/include/Rubicon_".

**NOTE:** There is no Windows support for right now. Maybe one day if I get time.

## Better SAX2 Support than NSXMLParser

This one has been a long time coming what with the time constraints of having to have a day
job (and a life in general) but I finally think I have it pretty well nailed down.
One of the biggest disappointments in the Apple Foundation Classes was NSXMLParser.
It really was written for Apple's own use for very simple XML files and beyond that you
can tell they really didn't care. In particular support for entities (internal or external)
is completely broken and the way they chose to handle prefix/URI mappings was not very
optimal. Also, they chose to omit some little used information (in their opinion) from
the attribute and element declarations and encounters. Things like if the attribute's
value was defaulted and what, if any, the possible values for the attribute was in the
first place.

When I have time I will try to document it's use but in the meantime look in the *MyDelegate.m*
file for the test program in the *TypeSizes* target.  I will include the sample files 
(*Test3.xml* and *compname.txt*) that I used as but you'll have to adjust the filename defined
towards the top of *MyDelegate.h* to point to it's actual location on your system.

## Linux vs macOS

Rubicon also attempts to smooth out some of the more glaring differences between
the Linux operating system and the macOS operating system such as the former's
glaring omission of the [int clock_gettime(clockid_t clk_id, struct timespec *tp);](https://linux.die.net/man/3/clock_gettime)
function in versions prior to 10.12 (_macOS Sierra_).

## Additions

Rubicon also provides some of my own additions, (defines, functions, classes,
protocols,and categories) to make development easier in general even if it's not
cross-platform. For example, Rubicon includes an implementation of a full
red-black binary tree that is independent of the NSDictionary and NSSet classes.
This allows you to use a super fast binary tree in your own classes without the
overhead of the NSDictionary and NSSet collection classes.

## String Switch Statement

One of the nice additions to the Java programming language has been the ability to
[use strings in **switch** statements](https://docs.oracle.com/javase/8/docs/technotes/guides/language/strings-switch.html).
And while, in most cases, it doesn't really improve the performance of the code, it
does greatly enhance the readability of the code significantly. To that end I have
created a set of macros to provide something similar to Objective-C's NSString objects
and to standard C-style null-terminated strings.

For example, where in the past you may have coded something like the following.
```objc
        NSString *aString = @"Bob";

        if([aString isEqualToString:@"Sue"]) {
            /* Do something. */
        }
        else if([aString isEqualToString:@"Bob"]) {
            /* Do something. */
        }
        else {
            /* Do something if none of the above. */
        }
```
It can now be coded like the this.
```objc
        NSString *aString = @"Bob";

        PGSWITCH(aString);
            PGCASE(@"Sue");
                /* Do something. */
                break;
            PGCASE(@"Bob");
                /* Do something. */
                break;
            PGDEFAULT;
                /* Do something if none of the above. */
                break;
        PGSWITCHEND;
```
Also, just like a regular **switch** statement, if you omit the **break** statements
then execution will fall through to the next **case** statement.  So the following...
```objc
        NSString *aString = @"Sue";

        PGSWITCH(aString);
            PGCASE(@"Sue");
                puts("Sue");
            PGCASE(@"Bob");
                puts("Bob");
                break;
            PGDEFAULT;
                puts("Default");
                break;
        PGSWITCHEND;
```
...would produce the following output.
```text
Sue
Bob
```
For those that are curious, if given:
```objc
        PGSWITCH(str);
            PGCASE(@"Sue");
                NSLog(@"Her name was %@.", @"Sue");
                break;
            PGCASE(@"Cindy");
                NSLog(@"Her name was %@.", @"Cindy");
                break;
            PGCASE(@"Mike");
                NSLog(@"His name was %@.", @"Mike");
                break;
            PGCASE(@"Bob");
                NSLog(@"His name was %@.", @"Bob");
                break;
            PGDEFAULT;
                NSLog(@"%@ - %@", @"He who has no name", str);
                break;
        PGSWITCHEND;
```
The macros will expand as:
```objc
    do {
        NSString *__pg_casev = [str copy];
        BOOL     __pg_casefall;
        {
            __pg_casefall = NO;
        }
        if(__pg_casefall || [@"Sue" isEqualToString:__pg_casev]) {
            __pg_casefall = YES;
            NSLog(@"Her name was %@.", @"Sue");
            break;
        }
        if(__pg_casefall || [@"Cindy" isEqualToString:__pg_casev]) {
            __pg_casefall = YES;
            NSLog(@"Her name was %@.", @"Cindy");
            break;
        }
        if(__pg_casefall || [@"Mike" isEqualToString:__pg_casev]) {
            __pg_casefall = YES;
            NSLog(@"His name was %@.", @"Mike");
            break;
        }
        if(__pg_casefall || [@"Bob" isEqualToString:__pg_casev]) {
            __pg_casefall = YES;
            NSLog(@"His name was %@.", @"Bob");
            break;
        }
        {
            __pg_casefall = YES;
            NSLog(@"%@ - %@", @"He who has no name", str);
            break;
        }
    }
    while(0);
```
I know that seems like a bunch of extra unneeded code but CLANG's optimizer will remove
what's not needed - such as the surrounding do/while statement.

## PGSimpleBuffer and PGCString

Many times in writing Objective-C programs that call C libraries there is a need to
allocate memory buffers and C style strings. This is not really a problem except for
the often ugly code involved in making sure any temporary buffers or C strings get
deallocated when their time is done.
[ARC only covers Objective-C objects](https://developer.apple.com/library/archive/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html)
and not memory allocated for non-object memory such as byte buffers and C strings.
So, I created two helper classes for this.

**PGSimpleBuffer** is an Objective-C wrapper around a buffer created with the standard
[void *malloc(size_t)](http://www.manpagez.com/man/3/malloc/) function. You simply specify
the size of the buffer you want to create and then when the instance of that class is
deallocated by ARC the buffer will be freed as well. You can obtain a pointer to the
underlying buffer with the instance property [void *buffer](https://github.com/GalenRhodes/Rubicon/blob/master/Rubicon/Buffers/PGSimpleBuffer.h).

**PGCString** is an Objective-C wrapper around a copy of a C string. Like the *PGSimpleBuffer*
class, when the surrounding Objective-C instance is deallocated, the C string is
deallocated as well. This class came into being because of the lack of clarity on
just how long the pointer returned by _NSString_'s
[UTF8String](https://developer.apple.com/documentation/foundation/nsstring/1411189-utf8string?language=objc)
is valid for. The only safe way to make sure the pointer remains valid for as long as
you need it is to make a copy of it with
[char *strdup(const char *)](http://www.manpagez.com/man/3/strdup/). And again your
back to having to make sure the copy is deallocated properly. Hence you now have
[PGCString](https://github.com/GalenRhodes/Rubicon/blob/master/Rubicon/Misc/PGCString.h)
to make your life easier.  

## PGSemaphore

**PGSemaphore** is an Objective-C class that provides a wrapper around the
semaphore functions provided in the POSIX pthreads library. Additionally it
provides a handy implementation of the [sem_timedwait](http://man7.org/linux/man-pages/man3/sem_wait.3.html)
function that is found in most newer Linux versions. *see
[sem_timedwait.c](Rubicon/Concurrency/Locks/sem_timedwait.c)*

## sem_timedwait

The function **sem_timedwait** exists in most Linux implementations but because
it is a rather new addition to the POSIX pthreads specification it does not exist
everywhere and macOS is no exception. However, because it's a very handy function,
[Keith Shortridge](https://www.aao.gov.au/science/research/staff/Keith%20Shortridge "Keith Shortridge, AAO")
from the Australian Astronomical Observatory (AAO) has created an implementation
for macOS that works pretty darn good. I have included it in this library for
completeness and convienience.

## PGReadWriteLock

**PGReadWriteLock** is an Objective-C class that provides a wrapper around the POSIX
read-write locks. As with PGSemaphore, this class provides implementations for the
[pthread_rwlock_timedrdlock](http://man7.org/linux/man-pages/man3/pthread_rwlock_timedrdlock.3p.html)
and [pthread_rwlock_timedwrlock](http://man7.org/linux/man-pages/man3/pthread_rwlock_timedwrlock.3p.html)
functions that don't exist in macOS.

### NOTE 1

One change **PGReadWriteLock** makes to the POSIX pthreads specification is that
**BOTH** the read and write locks are re-entrant rather than just the read locks.
The POSIX specification states that the behaviour when trying to obtain multiple
concurrent write locks by the same thread is undefined. The MAN page states that
a deadlock *could* occur in this case. The implementation of **PGReadWriteLock**
is to treat it the same as obtaining multiple read locks. The specification for
multiple read locks states:

> A thread may hold multiple concurrent read locks on rwlock (that is, successfully
> call the pthread_rwlock_rdlock() function n times). If so, the application shall
> ensure that the thread performs matching unlocks (that is, it calls the
> pthread_rwlock_unlock() function n times).

**PGReadWriteLock** handles this by maintaining it's own per-thread count of the
number of times the same thread obtains a write lock and insists that
<code>pthread_rwlock_unlock</code> is called that many times.

### NOTE 2

**PGReadWriteLock** *does not* support upgrading or downgrading locks. In other words,
if a thread currently holds one or more read locks then it cannot try to get a write
lock until it releases the read locks. The same applies to trying to get a read lock
while holding a write lock. Attempting to do so will cause an exception to be thrown.

