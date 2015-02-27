From: folkert <folkert@vanheusden.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Fri, 27 Feb 2015 14:19:23 +0100
Message-ID: <20150227131923.GX21469@belle.intranet.vanheusden.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
 <20150130234552.GA20407@sysresccd>
 <20150131083300.GZ21469@belle.intranet.vanheusden.com>
 <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
 <20150203090325.GA29693@deathray>
 <CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
 <20150219085303.GI21469@belle.intranet.vanheusden.com>
 <CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
 <CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
 <CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from keetweej.vanheusden.com ([80.101.105.103]:34834 "EHLO
	keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752072AbbB0NTZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Feb 2015 08:19:25 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michael Welling <mwelling@ieee.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

> > Mmm, I was thinking it would be nice to have a (new, redesigned) sysfs
> > interface for this. :P
> >
> > Aren't we going to make things less accessible if we use a char device?
> 
> Since sysfs has a "one value per file" paradigm, it also has a
> "one context switch per operation" paradigm, meaning any
> efficiency-oriented use cases where a lot of stuff needs to be
> changed in one context switch are by the very construction
> not suitable for sysfs IMO. That is the use case for ioctl()
> operations that can pass an entire struct of stuff over.
> 
> And things like bit-banging a clock+data line which would in
> a sysfs case involve two context switches (one per value, since
> that is one file per GPIO line) in an ioctl() case it would be
> just one, already 50% less context switches for a very basic
> use case.
> 
> But I may be just so wrong ... input welcome.

Another bad thing of the current sysfs versions: it is ascii.
So I need to convert a=1 to a='1' first before write()ing it to the
file. Very inconvenient because it adds boilerplate code.
On the other hand, the sysfs is very much extensible.


Folkert van Heusden

-- 
You've probably gotten really fed up with never winning in the Mega-
Millions lottery. Well, weep no longer: www.smartwinning.info tells
you everything that might help you deciding what numbers to choose.
With nice graphs and pretty animations!
