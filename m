From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] GPIO: MIPS: ralink: add gpio driver for ralink rt2880 SoC
Date: Tue, 28 Oct 2014 10:39:46 +0100
Message-ID: <CACRpkdbHtTcT=1FCtNTu_r2n+zxmpFCT0MK5iyjPRSio7ZRQHg@mail.gmail.com>
References: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
	<1412972930-16777-2-git-send-email-blogic@openwrt.org>
	<CAAVeFu+BAwDOV1siPkRSOes0iJETLWcKEBBFrTn6o=d+CYQPPw@mail.gmail.com>
	<54449D31.9020108@openwrt.org>
	<CAAVeFu+qScOxf1My4K9nj7kaAWRqBGewG-ar6ELY03a2LC7aFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:41241 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709AbaJ1Jjr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 05:39:47 -0400
Received: by mail-ig0-f178.google.com with SMTP id a13so662321igq.11
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2014 02:39:46 -0700 (PDT)
In-Reply-To: <CAAVeFu+qScOxf1My4K9nj7kaAWRqBGewG-ar6ELY03a2LC7aFA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 20, 2014 at 8:19 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Mon, Oct 20, 2014 at 2:27 PM, John Crispin <blogic@openwrt.org> wrote:
>> On 20/10/2014 06:41, Alexandre Courbot wrote:
>> On Sat, Oct 11, 2014 at 5:28 AM, John Crispin <blogic@openwrt.org> wrote:

>>> This (and the device tree bindings) seems the indicate that the
>>> registers offset can vary depending on the chip and bank. The chip
>>> can be specified using the compatible property, as for the bank you
>>> can also require a property giving the bank number. With these two
>>> bits of information, this driver should be able to pick the right
>>> register layout out of an in-driver table. This would be much
>>> cleaner that letting the DT specify whatever layout it wants.
>>
>> i tend to disagree. if we put the register offsets into the driver we
>> will have lots of static arrays (5 or 6) and with each new soc we need
>> to potentially need to patch the driver causing us in openwrt to carry
>> lots of patches and have to worry about upstreaming them. From my
>> understanding, the dts has this exact purpose, describing the hardware
>> and in turn reducing the boiler plate and static code in the drivers.
>> If have sent other drivers that do the same and was told there that
>> this is totally legit.
>
> With each new SoC you would have to patch the driver to add the new
> compatible property anyway. If your devices differ as much as by
> having a different register layout, they need a dedicated compatible
> property. In that case, you may as well add the register layout for
> this new property into the driver.

I agree. +1 on this.

Yours,
Linus Walleij
