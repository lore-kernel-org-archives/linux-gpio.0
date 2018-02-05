From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Mon, 5 Feb 2018 10:58:32 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1802051057120.3292@hadrien>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com> <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com> <CA+55aFztiKehjo7OQQFboAEfe_BrxJQG_5wxak2a_GdNBEFiMw@mail.gmail.com> <CA+55aFzhp2QW9JeMwV6=W4skf0CW6E+Zg4K90n3Bo+yZmz485Q@mail.gmail.com>
 <CACRpkdZGABVtdF1HWHfx-5JPyaEhtt+Q_sjM=bkJu6cZ5WfPCA@mail.gmail.com> <alpine.DEB.2.20.1802051023540.3292@hadrien> <CACRpkdb0P38+cvVeSw7imzehb5VM51fmxOBWJWgzdnuEP9ryDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb0P38+cvVeSw7imzehb5VM51fmxOBWJWgzdnuEP9ryDQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On Mon, 5 Feb 2018, Linus Walleij wrote:

> On Mon, Feb 5, 2018 at 10:27 AM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> > On Mon, 5 Feb 2018, Linus Walleij wrote:
>
> >> We definitely need some better tooling to find these things,
> >> using Ingo's head and your occasional frustration is not going to
> >> scale.
> >>
> >> Julia: do you have ideas on tooling that can loosen #include
> >> deps and advise on when to replace #includes with forward
> >> declarations of structs (etc) to bring down rebuild-triggering
> >> dependencies?
> >
> > Could you explain more?  Is the point that you want to remove an include
> > but it has one declaration that you need, and so you want to bring it down
> > into the .c file?  Would the need for that actually indicate that the
> > include file is designed incorrectly?
> >
> > Can one assume that each include is self contained, ie it includes the
> > things that it needs and does not rely on the .c file having included
> > other things beforehand?
>
> Usually (in my limited experience, le's see what Ingo and Torvalds
> say) the problem manifests mainly in include files including other
> include files.
>
> So say <linux/foo.h>:
>
> #include <linux/bar.h>
>
> struct foo {
>    struct bar *barp;
> };
>
> Since this is only putting a pointer inside its struct and doesn't
> need the information on the whole structs, as the size of a pointer
> is well known we can reduce it to:
>
> struct bar;
>
> struct foo {
>    struct bar *barp;
> };
>
> And thus as <linux/bar.h> is not even included, it can change
> all it wants, our foo.h include file is not affected, neither will
> any driver just casually #including <linux/foo.h> need to be
> rebuilt.
>
> This type of case (and variations on this theme) is the reason
> we put a bunch of forward-declarations in kernel .h-files
> just to break dependencies to stuff just referenced by pointer.
>
> There is a counter-pattern saying "files should #include the
> headers prototypes, structs (etc) it uses" that drives a truck
> through this approach. But IMO when done properly, this
> forward-declaring approach is quite readable.
>
> I have very limited idea of where, whether in the preprocessor
> or the compiler itself, the decision to treat struct bar *barp
> as "just some pointer" happens, but it is a real neat trick, the
> dependency chain is broken in CPP AFAICT anyways, and cuts
> down the rebuilds.

OK, thanks for the explanation.  It seems like a very interesting problem.
I will think about it and see if something can be done.  It seems like it
may need careful checking by a human, due to macros, ifdefs, etc, but
perhaps it can at least be heplful to narrow down the opportunities.

julia
