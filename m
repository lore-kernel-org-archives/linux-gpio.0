From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Mon, 9 Mar 2015 16:52:26 +0100
Message-ID: <CACRpkdZBc3ry_0sOVRpwnTHNZ1M7CmHw9Us_XPen3pQQP0OazA@mail.gmail.com>
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
	<CACRpkdZRXAokttK7uc6PtfOGvRa74ydQRo6Kn1V1ofGUcGbSiQ@mail.gmail.com>
	<CAAVeFuJ+T-4ew+ACJpestMtH4D+ggcwOD3SumAwYNO5yGT=jiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:46931 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753769AbbCIPw0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 11:52:26 -0400
Received: by oiav63 with SMTP id v63so30095358oia.13
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 08:52:26 -0700 (PDT)
In-Reply-To: <CAAVeFuJ+T-4ew+ACJpestMtH4D+ggcwOD3SumAwYNO5yGT=jiQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Michael Welling <mwelling@ieee.org>, folkert <folkert@vanheusden.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 4, 2015 at 1:43 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, Mar 3, 2015 at 7:31 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Mar 3, 2015 at 9:27 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>>
>>> It really comes down to how user-space wants to access GPIOs. I
>>> suspect the majority of sysfs accesses is done by scripts and other
>>> simple programs. If we introduce a char device that takes requires
>>> ioctls, it is then customary to add a small user-space library to
>>> abstract that (for both convenience and safety - think libdrm). Do we
>>> want to maintain libgpio?
>>
>> Good point.
>>
>> We have no clue about how the majority out there use the GPIO
>> sysfs, but I have heard of mission-critical systems just hammering
>> GPIOs from userspace.
>>
>> Sadly many of these industrial users are "I just want it to work, now"
>> types and they don't step forward much on these mailing lists.
>> (Learned from private conversations...)
>>
>> Maybe if noone voice their opinion and offer to help with this, we can
>> assume they don't exist (well obviously a community does not exist)
>> and their specific needs be ignored until they put their money where
>> their mouth is.
>
> That's the only way we can handle the situation if people don't
> manifest their needs. But does this mean that you would agree with a
> cleaner, multi-GPIO friendly sysfs-based solution, or I am
> misunderstanding you?

I guess I'm just a bit grumpy.

Whoever comes up with a cleaner sysfs or a clean device interface
will win the argument and lock the path for the other approach.
It's like a forking path with no going back or something.

Yours,
Linus Walleij
