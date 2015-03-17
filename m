From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Tue, 17 Mar 2015 17:39:01 +0100
Message-ID: <CACRpkdaC6A1D-rOeCywR9QHRc9wdKTcHVjEMfYCHrg0Jz0vwxg@mail.gmail.com>
References: <20150219085303.GI21469@belle.intranet.vanheusden.com>
	<CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
	<CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
	<CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
	<CAAVeFuJxki5mqY91ugumpDEuq9BMbBin4ypr1H2qcA_uzWGT9Q@mail.gmail.com>
	<20150302072655.GA17089@deathray>
	<CAAVeFu+J0toG+3Yzncw+c11Fk_FK0oQeHBB=0MmExCX3z9Sh0g@mail.gmail.com>
	<CACRpkdZRXAokttK7uc6PtfOGvRa74ydQRo6Kn1V1ofGUcGbSiQ@mail.gmail.com>
	<CAAVeFuJ+T-4ew+ACJpestMtH4D+ggcwOD3SumAwYNO5yGT=jiQ@mail.gmail.com>
	<CACRpkdZBc3ry_0sOVRpwnTHNZ1M7CmHw9Us_XPen3pQQP0OazA@mail.gmail.com>
	<20150309202258.GA3398@deathray>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36169 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932146AbbCQQjC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 12:39:02 -0400
Received: by obdfc2 with SMTP id fc2so11715247obd.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 09:39:02 -0700 (PDT)
In-Reply-To: <20150309202258.GA3398@deathray>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, folkert <folkert@vanheusden.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 9, 2015 at 9:22 PM, Michael Welling <mwelling@ieee.org> wrote:
> On Mon, Mar 09, 2015 at 04:52:26PM +0100, Linus Walleij wrote:

>> Whoever comes up with a cleaner sysfs or a clean device interface
>> will win the argument and lock the path for the other approach.
>> It's like a forking path with no going back or something.
>
> There is no need to fork and in fact it would probably be a bad idea.

For the record I am *NOT* talking about this:
https://en.wikipedia.org/wiki/Fork_%28software_development%29

> At EMAC we support both sysfs and character device simultaneously.
> Sysfs for the ease of use and ioctl for real time advantages.

What is EMAC?

> Not saying that it is a good reference but the two interfaces "could" co-exist.

Hm....

I would more think about deprecating the sysfs in favor of the dev
node.

But this is getting terribly academic since we're just talking, noone is
really implementing anything.

Yours,
Linus Walleij
