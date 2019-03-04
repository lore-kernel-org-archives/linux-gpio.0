From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] tools: testing: selftests: Remove duplicate headers
Date: Mon, 4 Mar 2019 16:19:29 +0530
Message-ID: <CAFqt6zYqa6aCAcs51AdePtBSL58hMa1BSA87ZMLbwUJA=rWNLA@mail.gmail.com>
References: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
 <87tvgr1fr4.fsf@concordia.ellerman.id.au> <CAFqt6zY0HV7E+_6_s5A3eG+jEj+4hgQnAgJQm-Pc1gyX4Vnbpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqt6zY0HV7E+_6_s5A3eG+jEj+4hgQnAgJQm-Pc1gyX4Vnbpg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Bamvor Zhang <bamv2005@gmail.com>, shuah@kernel.org, "David S. Miller" <davem@davemloft.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey Dobriyan <adobriyan@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, Paul McKenney <paulmck@linux.ibm.com>, boqun.feng@gmail.com, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, sboyd@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Sabyasachi Gupta <sabyasachi.linux@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 26, 2019 at 10:59 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Tue, Feb 26, 2019 at 7:18 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Souptick Joarder <jrdr.linux@gmail.com> writes:
> > > Remove duplicate headers which are included twice.
> > >
> > > Signed-off-by: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
> > > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > ---
> > ...
> > >  tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -
> >
> > I took this hunk via the powerpc tree.
>
> How about taking this entirely through a single tree ?
> or Shall I send these changes in different patches ?

If no comment, can we get this patch in queue for 5.1 ?

>
> >
> > > diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > index 167135b..af1b802 100644
> > > --- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > +++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > @@ -11,7 +11,6 @@
> > >  #include <sys/wait.h>
> > >  #include <unistd.h>
> > >  #include <setjmp.h>
> > > -#include <signal.h>
> > >
> > >  #include "ebb.h"
> >
> >
> > cheers
