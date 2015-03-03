From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Tue, 3 Mar 2015 11:31:08 +0100
Message-ID: <CACRpkdZRXAokttK7uc6PtfOGvRa74ydQRo6Kn1V1ofGUcGbSiQ@mail.gmail.com>
References: <20150130234552.GA20407@sysresccd>
	<20150131083300.GZ21469@belle.intranet.vanheusden.com>
	<CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
	<20150203090325.GA29693@deathray>
	<CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
	<20150219085303.GI21469@belle.intranet.vanheusden.com>
	<CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
	<CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
	<CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
	<CAAVeFuJxki5mqY91ugumpDEuq9BMbBin4ypr1H2qcA_uzWGT9Q@mail.gmail.com>
	<20150302072655.GA17089@deathray>
	<CAAVeFu+J0toG+3Yzncw+c11Fk_FK0oQeHBB=0MmExCX3z9Sh0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:43626 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751535AbbCCKbJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2015 05:31:09 -0500
Received: by iebtr6 with SMTP id tr6so55941051ieb.10
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2015 02:31:08 -0800 (PST)
In-Reply-To: <CAAVeFu+J0toG+3Yzncw+c11Fk_FK0oQeHBB=0MmExCX3z9Sh0g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Michael Welling <mwelling@ieee.org>, folkert <folkert@vanheusden.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 3, 2015 at 9:27 AM, Alexandre Courbot <gnurou@gmail.com> wrote:

> It really comes down to how user-space wants to access GPIOs. I
> suspect the majority of sysfs accesses is done by scripts and other
> simple programs. If we introduce a char device that takes requires
> ioctls, it is then customary to add a small user-space library to
> abstract that (for both convenience and safety - think libdrm). Do we
> want to maintain libgpio?

Good point.

We have no clue about how the majority out there use the GPIO
sysfs, but I have heard of mission-critical systems just hammering
GPIOs from userspace.

Sadly many of these industrial users are "I just want it to work, now"
types and they don't step forward much on these mailing lists.
(Learned from private conversations...)

Maybe if noone voice their opinion and offer to help with this, we can
assume they don't exist (well obviously a community does not exist)
and their specific needs be ignored until they put their money where
their mouth is.

Yours,
Linus Walleij
