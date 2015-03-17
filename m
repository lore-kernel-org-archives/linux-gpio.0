From: Michael Welling <mwelling@ieee.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Tue, 17 Mar 2015 11:47:25 -0500
Message-ID: <20150317164724.GA3610@deathray>
References: <CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
 <CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
 <CAAVeFuJxki5mqY91ugumpDEuq9BMbBin4ypr1H2qcA_uzWGT9Q@mail.gmail.com>
 <20150302072655.GA17089@deathray>
 <CAAVeFu+J0toG+3Yzncw+c11Fk_FK0oQeHBB=0MmExCX3z9Sh0g@mail.gmail.com>
 <CACRpkdZRXAokttK7uc6PtfOGvRa74ydQRo6Kn1V1ofGUcGbSiQ@mail.gmail.com>
 <CAAVeFuJ+T-4ew+ACJpestMtH4D+ggcwOD3SumAwYNO5yGT=jiQ@mail.gmail.com>
 <CACRpkdZBc3ry_0sOVRpwnTHNZ1M7CmHw9Us_XPen3pQQP0OazA@mail.gmail.com>
 <20150309202258.GA3398@deathray>
 <CACRpkdaC6A1D-rOeCywR9QHRc9wdKTcHVjEMfYCHrg0Jz0vwxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:32971 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753562AbbCQQrc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 12:47:32 -0400
Received: by iecvj10 with SMTP id vj10so16126696iec.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 09:47:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdaC6A1D-rOeCywR9QHRc9wdKTcHVjEMfYCHrg0Jz0vwxg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, folkert <folkert@vanheusden.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 17, 2015 at 05:39:01PM +0100, Linus Walleij wrote:
> On Mon, Mar 9, 2015 at 9:22 PM, Michael Welling <mwelling@ieee.org> wrote:
> > On Mon, Mar 09, 2015 at 04:52:26PM +0100, Linus Walleij wrote:
> 
> >> Whoever comes up with a cleaner sysfs or a clean device interface
> >> will win the argument and lock the path for the other approach.
> >> It's like a forking path with no going back or something.
> >
> > There is no need to fork and in fact it would probably be a bad idea.
> 
> For the record I am *NOT* talking about this:
> https://en.wikipedia.org/wiki/Fork_%28software_development%29
>

Okay.
 
> > At EMAC we support both sysfs and character device simultaneously.
> > Sysfs for the ease of use and ioctl for real time advantages.
> 
> What is EMAC?

It is the company that I am currently working for.
www.emacinc.com

> 
> > Not saying that it is a good reference but the two interfaces "could" co-exist.
> 
> Hm....
> 
> I would more think about deprecating the sysfs in favor of the dev
> node.

What happens to all of the users of the sysfs interface when this happens?

> 
> But this is getting terribly academic since we're just talking, noone is
> really implementing anything.

Without a specification nothing is ever going to be implemented.

If not here, where will we be able to discuss the implementation details?

> 
> Yours,
> Linus Walleij
