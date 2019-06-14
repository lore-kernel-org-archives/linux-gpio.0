From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] pinctrl: remove unneeded #ifdef around declarations
Date: Fri, 14 Jun 2019 23:59:45 +0900
Message-ID: <CAK7LNAQ4KmXd0J2UYfi9WiisnfGa4g62BH2S46ELn4fYG05UcA@mail.gmail.com>
References: <20190613015532.19685-1-yamada.masahiro@socionext.com> <cc68b375-6011-6bbf-8f0b-c2963237a743@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cc68b375-6011-6bbf-8f0b-c2963237a743@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 14, 2019 at 10:21 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 13.06.19 03:55, Masahiro Yamada wrote:
> > What is the point in surrounding the whole of declarations with
> > ifdef like this?
> >
> >   #ifdef CONFIG_FOO
> >   int foo(void);
> >   #endif
> >
> > If CONFIG_FOO is not defined, all callers of foo() will fail
> > with implicit declaration errors since the top Makefile adds
> > -Werror-implicit-function-declaration to KBUILD_CFLAGS.
> >
> > This breaks the build earlier when you are doing something wrong.
> > That's it.
>
> hmm, in general I like the idea of breaking the build as early as
> possible. depending on your available cpu power, a kernel build can
> take a while, and it could be a huge waste of time when having to
> wait for link stage, just to find out about missing functions.
>
> @linus: what's your oppinion ?
>
>
> --mtx
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287


My previous clean-up (http://patchwork.ozlabs.org/patch/1112656/)
broke this build.

And, this patch will fix the build issue.

Did you realize the madness of
surrounding the forward declarations with #ifdef ?


All GPIO/pinctrl headers are written in a bad way.

Linus Walleij must realize he was doing *wrong*.


-- 
Best Regards
Masahiro Yamada
