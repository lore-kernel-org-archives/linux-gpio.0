From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] gpiolib: Replace WARN_ON with WARN_ON_ONCE
Date: Mon, 2 Dec 2013 07:02:30 -0300
Message-ID: <20131202100229.GA2466@localhost>
References: <1385296665-23713-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131128191655.GC13182@localhost>
 <CACRpkdYEPo9J006k67EZB7Xdyb0iU3iE7wuve6VexhozJf1khQ@mail.gmail.com>
 <CAAVeFu+Kn5Fad7rtgDfWYeX=xAvYhvAHQRom9a=qogUPreDdgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:50852 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752547Ab3LBKCl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2013 05:02:41 -0500
Content-Disposition: inline
In-Reply-To: <CAAVeFu+Kn5Fad7rtgDfWYeX=xAvYhvAHQRom9a=qogUPreDdgg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Dec 01, 2013 at 12:07:26PM +0900, Alexandre Courbot wrote:
> On Fri, Nov 29, 2013 at 9:27 PM, Linus Walleij <linus.walleij@linaro.=
org> wrote:
> > On Thu, Nov 28, 2013 at 8:16 PM, Ezequiel Garcia
> > <ezequiel.garcia@free-electrons.com> wrote:
> >> Hi Linus,
> >> On Sun, Nov 24, 2013 at 09:37:45AM -0300, Ezequiel Garcia wrote:
> >>> These warnings can be very spammy, since they could be called fro=
m
> >>> kernel threads. Use WARN_ON_ONCE, which is enough to warn develop=
ers
> >>> about the 'can_sleep' usage.
> >>>
> >>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.co=
m>
> > (...)
> >> Any comments on this?
> >
> > I'm a bit hesitant because I don't know the conventions for WARN_ON=
_ONCE()
> > vs WARN_ON().
> >
> > I'd like some wider input if possible, Alexandre, Grant, what do yo=
u say?
>=20
> I'd say WARN_ON() is just appropriate here. Calling a preemptible
> function from a context that cannot sleep is a serious issue and you
> cannot nag the user enough about it. At least if something bad happen=
s
> due to this condition the warning is guaranteed to be one of the last
> messages the user will see before the system locks. Change it with
> WARN_ON_ONCE() and chances are high that the system will hang without
> any meaningful log near the point of failure.
>=20
> Each caller should know whether it is running in preemptible context
> or not and can thus use the right function, so I don't see any reason
> to relax the rules here.
>=20
> If we could know for sure at runtime whether we are running in
> preemptible context or not we could probably merge these functions
> into one and warn more appropriately on a per-case basis, but as far
> as I know (which is not very far) there is no such way.
>=20

OK, that's fine by me.

Thanks for the feedback,
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
