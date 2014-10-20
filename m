From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/5] GPIO: MIPS: ralink: add gpio driver for ralink rt2880 SoC
Date: Mon, 20 Oct 2014 15:19:45 +0900
Message-ID: <CAAVeFu+qScOxf1My4K9nj7kaAWRqBGewG-ar6ELY03a2LC7aFA@mail.gmail.com>
References: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
 <1412972930-16777-2-git-send-email-blogic@openwrt.org> <CAAVeFu+BAwDOV1siPkRSOes0iJETLWcKEBBFrTn6o=d+CYQPPw@mail.gmail.com>
 <54449D31.9020108@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:64582 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752485AbaJTGUK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Oct 2014 02:20:10 -0400
Received: by mail-ie0-f174.google.com with SMTP id tr6so3962246ieb.5
        for <linux-gpio@vger.kernel.org>; Sun, 19 Oct 2014 23:20:06 -0700 (PDT)
In-Reply-To: <54449D31.9020108@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 20, 2014 at 2:27 PM, John Crispin <blogic@openwrt.org> wrote:
> Hi,
>
>
> On 20/10/2014 06:41, Alexandre Courbot wrote:
>
> On Sat, Oct 11, 2014 at 5:28 AM, John Crispin <blogic@openwrt.org> wrote:
>> Add gpio driver for Ralink SoC. This driver makes the gpio core on
>
> Makes the gpio core what?
>
>> RT2880, RT305x, rt3352, rt3662, rt3883, rt5350 and mt7620 work.
>
> work as it says in the last work of the sentence

Right, I stopped reading after the 4th or 5th chip name. Never mind. :)

>
> [snip..]
>
>> This (and the device tree bindings) seems the indicate that the
>> registers offset can vary depending on the chip and bank. The chip
>> can be specified using the compatible property, as for the bank you
>> can also require a property giving the bank number. With these two
>> bits of information, this driver should be able to pick the right
>> register layout out of an in-driver table. This would be much
>> cleaner that letting the DT specify whatever layout it wants.
>
> i tend to disagree. if we put the register offsets into the driver we
> will have lots of static arrays (5 or 6) and with each new soc we need
> to potentially need to patch the driver causing us in openwrt to carry
> lots of patches and have to worry about upstreaming them. From my
> understanding, the dts has this exact purpose, describing the hardware
> and in turn reducing the boiler plate and static code in the drivers.
> If have sent other drivers that do the same and was told there that
> this is totally legit.

With each new SoC you would have to patch the driver to add the new
compatible property anyway. If your devices differ as much as by
having a different register layout, they need a dedicated compatible
property. In that case, you may as well add the register layout for
this new property into the driver.

The purpose of the DT is to describe the hardware layout, not its
internal workings. Saying "this function is fulfilled by this GPIO
because that's how the components are wired on my board" is something
that belongs to the DT. However, "This device is almost the same as
this one but with this particular register layout", is just moving the
boilerplate from one place to another. The DT has no vocation of
taking care of the differences between several revisions of a device ;
that's the job of the driver.
