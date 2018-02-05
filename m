From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Mon, 5 Feb 2018 10:27:43 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1802051023540.3292@hadrien>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com> <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com> <CA+55aFztiKehjo7OQQFboAEfe_BrxJQG_5wxak2a_GdNBEFiMw@mail.gmail.com> <CA+55aFzhp2QW9JeMwV6=W4skf0CW6E+Zg4K90n3Bo+yZmz485Q@mail.gmail.com>
 <CACRpkdZGABVtdF1HWHfx-5JPyaEhtt+Q_sjM=bkJu6cZ5WfPCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:6744 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751705AbeBEJ1t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Feb 2018 04:27:49 -0500
In-Reply-To: <CACRpkdZGABVtdF1HWHfx-5JPyaEhtt+Q_sjM=bkJu6cZ5WfPCA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org



On Mon, 5 Feb 2018, Linus Walleij wrote:

> On Sat, Feb 3, 2018 at 1:51 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Fri, Feb 2, 2018 at 4:44 PM, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >>
> >> Stupid patch attached. I don't know how much this helps the insane
> >> dependency hell for <linux/pinctrl/devinfo.h>, but it's bound to help
> >> _some_.
> >
> > Testing it, that patch definitely cuts down on recompiles after
> >
> >      touch include/linux/pinctrl/devinfo.h
> >
> > a lot.
>
> Hey very nice. Sorry I was offline this weekend and didn't provide
> much feedback.
>
> Indeed it is smarter to forward-declare struct dev_pin_info.
>
> I rebuilt my platforms with the mainline and all is working just fine
> of course.
>
> > It still ends up rebuilding a fair amount of odd drivers, but now the
> > files it rebuilds at least make _some_ sense.
>
> Yeah :/
>
> I guess the lesson learned is that when I push stuff into device
> core like this, it needs to be done as exquisitely as cache-aligned
> structs because of the overall impact on the build systems.
>
> > One odd header include down. Ten million to go.
>
> Sorry about contributing to that :(
>
> Another thing that comes to mind was Paul Gortmaker's tedious
> work to remove #include <linux/module.h> from drivers that cannot
> be built as modules that happened in the last few months. My
> subsystems had a few of those and it visibly impacted build
> time. As usual clean and consistent code is code that compiles
> quickly...
>
> We definitely need some better tooling to find these things,
> using Ingo's head and your occasional frustration is not going to
> scale.
>
> Julia: do you have ideas on tooling that can loosen #include
> deps and advise on when to replace #includes with forward
> declarations of structs (etc) to bring down rebuild-triggering
> dependencies?

Could you explain more?  Is the point that you want to remove an include
but it has one declaration that you need, and so you want to bring it down
into the .c file?  Would the need for that actually indicate that the
include file is designed incorrectly?

Can one assume that each include is self contained, ie it includes the
things that it needs and does not rely on the .c file having included
other things beforehand?

julia
