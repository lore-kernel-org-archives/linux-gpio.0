From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: lpc18xx: undefined Kconfig option ARCH_LPC18XX
Date: Tue, 12 May 2015 16:57:49 +0200
Message-ID: <20150512145749.GA2324@station.rsr.lip6.fr>
References: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
 <CACRpkdbYpTHrALrYkLNhOBxx5H7dnGrkjbBr1rO6aGPN-4Bnvw@mail.gmail.com>
 <CAD3Xx4LQOR=W6iXkFsGJMfXLrdM39HwUphqX7j=S=EPzUz73yw@mail.gmail.com>
 <CACRpkdaeJKsrZrn4o0BAyCWREUg-QuJ5LGF39bca8YuzM95f0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38672 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932488AbbELO6A (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 10:58:00 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdaeJKsrZrn4o0BAyCWREUg-QuJ5LGF39bca8YuzM95f0Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joachim Eastwood <manabian@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>

Hi Linus,

thanks a lot for taking your time to give such detailed answer, I
appreciate that.

On Tue, May 12, 2015 at 02:03:33PM +0200, Linus Walleij wrote:
> On Tue, May 12, 2015 at 12:48 PM, Valentin Rothberg
> <valentinrothberg@gmail.com> wrote:
> > On Tue, May 12, 2015 at 12:40 PM, Linus Walleij
> > <linus.walleij@linaro.org> wrote:
> >> On Wed, May 6, 2015 at 10:02 AM, Valentin Rothberg
> >> <valentinrothberg@gmail.com> wrote:
> >>
> >>> Hi Joachim,
> >>>
> >>> there are two of your commits [1, 2] in today's linux-next (i.e.,
> >>> next-20150506).  Both of them add Kconfig options that depend on
> >>> ARCH_LPC18XX, which is not defined in Kconfig, see:
> >>>
> >>> +       depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> >>>
> >>> Is there a patch queued somewhere to add ARCH_LPC18XX ?
> >>
> >> Yes, and in this case it solves more problems to merge these
> >> patches out-of-order than not to.
> >
> > Could you explain those problems?  I have some research interest in
> > such cases and want to understand and identify reasons for such
> > things.
> 
> What we want as maintainers is to keep GIT trees in isolation
> without too much cross-dependencies. Often done by assuming
> optimistically that patches are orthogonal.
> 
> Non-trivial dependencies are for example if one patch introduce
> a header file that another patch is using, the result will
> not compile, so we need to resolve to the exit strategies of:
> 
> - (A) Applying the same patch to two trees, which will be
>   handled by git as the patches are textually identical.
> - (B) Creating an immutable branch pulled into both trees, which
>   is better since it means the same hash is in both trees
> - (C) apply to one tree, wait for the merge window, and postpone
>   to the next kernel cycle, which delays development
> 
> Whenever we can orthogonalize patches it makes our job
> easier.
> 
> Kconfig symbols added in one tree and used in another
> does not create compilation wreckage and will resolve nicely
> in linux-next and during the merge window, however the
> trees still have a formal dependency which would argue that
> you should go back to option (B) above in the ideal case
> and create an immutable branch.
> 
> However doing that for something that you, as a human
> maintainer, know will fix itself later, is surplus process for
> the sake of process and "never making mistakes" which
> cost more than it yields in maintainer time, thus making it
> a time-cost economically rational decision not to go to all
> the trouble of setting up an immutable branch but instead
> rely on some uncertainty and laziness to save time.
> 
> The answer to whether a certain maintainer will dare to do so
> or not is per individual preference. The crucial point is that
> "time savings" trumps "nothing can ever go wrong".

I understand your point completely.  However, I see some cases critical,
especially when configuration conditional code is added that cannot be
compiled since the Kconfig option is not added yet or due to some other
reason.  In precise, I see a conflict in the golden rule of "don't break
the build".  As the code cannot be compiled, nobody knows if it's broken
or not.  I see such things happening nearly daily.

But I am no maintainer, so I am not experienced in the daily challenges
of managing so many trees and understand the desire to save time.

Thanks again!

Kind regards,
 Valentin

> Yours,
> Linus Walleij
