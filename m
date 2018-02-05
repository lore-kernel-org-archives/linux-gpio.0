From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Mon, 5 Feb 2018 14:08:51 -0500
Message-ID: <20180205190851.GD20138@windriver.com>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com>
 <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com>
 <CA+55aFztiKehjo7OQQFboAEfe_BrxJQG_5wxak2a_GdNBEFiMw@mail.gmail.com>
 <CA+55aFzhp2QW9JeMwV6=W4skf0CW6E+Zg4K90n3Bo+yZmz485Q@mail.gmail.com>
 <CACRpkdZGABVtdF1HWHfx-5JPyaEhtt+Q_sjM=bkJu6cZ5WfPCA@mail.gmail.com>
 <alpine.DEB.2.20.1802051023540.3292@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:45999 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753780AbeBETJF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Feb 2018 14:09:05 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1802051023540.3292@hadrien>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

[Re: [GIT PULL] pin control bulk changes for v4.16] On 05/02/2018 (Mon 10:27) Julia Lawall wrote:

> 
> 
> On Mon, 5 Feb 2018, Linus Walleij wrote:
> 

[...]

> >
> > Another thing that comes to mind was Paul Gortmaker's tedious
> > work to remove #include <linux/module.h> from drivers that cannot
> > be built as modules that happened in the last few months. 

I also took aim at headers including giant headers ; see below.

[...]

> Could you explain more?  Is the point that you want to remove an include
> but it has one declaration that you need, and so you want to bring it down
> into the .c file?  Would the need for that actually indicate that the
> include file is designed incorrectly?

I put a bit of an explanation in this commit:

commit d47529b2e9fe0ec2eb1f072afad8849f52e385c4
Author: Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Mon Sep 12 18:16:31 2016 -0400

    gpio: don't include module.h in shared driver header
    
    Most shared headers in include/linux don't need to know what the
    internals of a struct module are; all they care about is that it
    is a struct and hence they may require a pointer to one.
    
    The advantage in this is that module.h is including a lot of stuff
    itself, and an otherwise empty C file that just contains module.h
    will result in ~750kB from CPP (compared to say 12kB from init.h)
    
    So we have approximately 50 instances of "struct module;" in the
    various include/linux headers already that help us keep module.h
    out of other headers; here we do the same for gpio.
    
    Cc: Linus Walleij <linus.walleij@linaro.org>
    Cc: Alexandre Courbot <gnurou@gmail.com>
    Cc: linux-gpio@vger.kernel.org
    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I'm sure I've got more of these type of commits sitting around locally,
unfortunately there have been other "interesting" things going on in the
linux world in the last month that have prevented me from touching any
of them.  :-/

Paul.
--

> 
> Can one assume that each include is self contained, ie it includes the
> things that it needs and does not rely on the .c file having included
> other things beforehand?
> 
> julia
