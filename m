From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpiolib: tighten up ACPI legacy gpio lookups
Date: Tue, 15 Dec 2015 10:47:55 -0800
Message-ID: <20151215184755.GA7471@dtor-ws>
References: <20151111194530.GA26559@dtor-ws>
 <CACRpkdbXaXzQ38sy9JJGEhx+ix3WzheAsKJqsXum2T9n00YEvA@mail.gmail.com>
 <20151127173721.GC27040@dtor-ws>
 <CACRpkda7fRZ=CB=Ec2iHmA=u9w6T7-WH2RNVvxBS5jL8he77Tg@mail.gmail.com>
 <20151209172133.GC27131@dtor-ws>
 <CACRpkda21=_XZyDYYTAUB4PrKVGhNxz4X-Cubn_eSNn3GY9StQ@mail.gmail.com>
 <CAKdAkRRxL1s=8FpehMaVx482M_ST7be46n0BLzBfeP0nH-FcUg@mail.gmail.com>
 <CACRpkdZgQNtSopGgCSWmzfK6_T2PG_WxpNGML_DWGDA604mMxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:35477 "EHLO
	mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754105AbbLOSr6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 13:47:58 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZgQNtSopGgCSWmzfK6_T2PG_WxpNGML_DWGDA604mMxA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Johan Hovold <johan@kernel.org>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 15, 2015 at 02:24:05PM +0100, Linus Walleij wrote:
> On Sun, Dec 13, 2015 at 5:44 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Sun, Dec 13, 2015 at 8:37 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> >> On Wed, Dec 9, 2015 at 6:21 PM, Dmitry Torokhov
> >> <dmitry.torokhov@gmail.com> wrote:
> >>
> >>>> > Hmm, I'd like to get this patch into my tree as well to apply Irina's
> >>>> > goodix pieces on top to make sure they do not break. Would it be OK for
> >>>> > me to just apply the patch and hope git will sort it out when we merge
> >>>> > into next/mainline, you maybe you could prepare a 4.3-based branch with
> >>>> > the patch for me to pull?
> >>>>
> >>>> I had to fuzz the patch so then you need to get the version I applied out
> >>>> of my tree.
> >>>>
> >>>> But I'm not going to rebase the tree so you can pull commit
> >>>> 9c3c9bc9cc980d8981f75109f3921576daf75723
> >>>> from the GPIO tree if you like. Or I can make a tag there if
> >>>> you prefer, just tell me.
> >>>
> >>> Both would mean I will end up with parts of your work-in-progress queue,
> >>> which I would rather avoid. If you create a branch (lets call it A) off
> >>> v4.3 and apply that one patch there and merge branch A it into your main
> >>> branch (even though you already have a version of the same patch in your
> >>> main branch) and I will merge that branch A into my tree then we are
> >>> guaranteed not to have conflicts as git will resolve everything nicely.
> >>
> >> I can't do that, as this patch is not applying cleanly on v4.3.
> >>
> >> It applies cleanly to v4.4-rc1 though, would you like an immutable
> >> branch like such based on v4.4-rc1 instead?
> >
> > Yep, that would work too.
> 
> OK here is a for-dmitry branch:
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/log/?h=for-dmitry
> 
> Absolutely nothing happens when I merge it to my devel branch so I guess
> git will cope, but whatever, this one is safe :)

Thank you Linus!

-- 
Dmitry
