From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Sat, 3 Feb 2018 11:45:59 +0100
Message-ID: <20180203104559.hyhjbmab7oo5zzx2@gmail.com>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com>
 <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:39487 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750821AbeBCKqE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Feb 2018 05:46:04 -0500
Content-Disposition: inline
In-Reply-To: <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I also wonder if there are any automated tools that try to find these
> kinds of crazy things. I suspect a lot of our build times is the poor
> compiler just reading and parsing header files over and over again,
> and a lot of them are probably not needed.

Yes. I'd guesstimate that in a typical defconfig kernel build the compiler is 
building at least 10x as much as it should with a cleaner header file layout, 
based on preprocessed source code file sizes.

Interestingly the .i file linecount difference isn't all that large between 
allmodconfig and allnoconfig kernels - which I think is further proof of our 
'header spaghetti bloat' problems.

While central files like fork.c or sched/*.c are expected to have a lot of 
dependencies, we also have a lot of bloat if we build much more isolated, 
standalone core kernel functionality:

  # allmodconfig:

  triton:~/tip> wc -l kernel/task_work.i
  43522 kernel/task_work.i

  # allnoconfig:

  triton:~/tip> wc -l kernel/task_work.i
  37123 kernel/task_work.i

  # source code size:

  triton:~/tip> wc -l kernel/task_work.c
  118 kernel/task_work.c

We are bringing in 37 KLOC of headers to build a 0.1 KLOC .c file ...

> A year ago, Ingo did patches limit some of the header file issues for
> the core headers (<linux/sched.h> in particular). Maybe he had
> tooling? Ingo?

No, unfortunately I didn't use much tooling: I only used simple manual tools like 
'grep' and small ad-hoc shell scripts to discover some of the deeper dependencies 
(long lost - nor was there any real value in them). What I relied on mostly was 
randconfig build coverage.

In that sched.h split-up effort a year ago I literally removed/moved the 
prototypes and header files one by one and tried to see what breaks. If the 
breakage was too widespread I tried to grep.

But based on the sched.h experiment I do think our kernel build times could be 
significantly improved by organizing the headers better. Splitting up sched.h also 
improved readability and maintainability, so it was a win-win all around.

With a more aggressive reorganization of our header architecture I believe we 
could achieve a more than 5x improvement in kernel build times (!) - but that 
would involve some trade-offs for header maintainability: a finer grained 
hierarchy is somewhat harder to maintain.

With extreme measures that would involve runtime performance trade-offs as well 
(to get rid of excessive inlining cross-dependencies) we could possibly achieve a 
30x improvement in kernel compilation times: the build would be link time and 
build parallelism limited on most systems.

Thanks,

	Ingo
