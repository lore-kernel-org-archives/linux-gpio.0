From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH 2/5] GPIO: MIPS: ralink: add gpio driver for ralink rt2880
 SoC
Date: Mon, 20 Oct 2014 07:27:13 +0200
Message-ID: <54449D31.9020108@openwrt.org>
References: <1412972930-16777-1-git-send-email-blogic@openwrt.org> <1412972930-16777-2-git-send-email-blogic@openwrt.org> <CAAVeFu+BAwDOV1siPkRSOes0iJETLWcKEBBFrTn6o=d+CYQPPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:49299 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751220AbaJTF1U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Oct 2014 01:27:20 -0400
In-Reply-To: <CAAVeFu+BAwDOV1siPkRSOes0iJETLWcKEBBFrTn6o=d+CYQPPw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, John Crispin <blogic@openwrt.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,


On 20/10/2014 06:41, Alexandre Courbot wrote:

On Sat, Oct 11, 2014 at 5:28 AM, John Crispin <blogic@openwrt.org> wrote:
> Add gpio driver for Ralink SoC. This driver makes the gpio core on

Makes the gpio core what?

> RT2880, RT305x, rt3352, rt3662, rt3883, rt5350 and mt7620 work.

work as it says in the last work of the sentence

[snip..]

> This (and the device tree bindings) seems the indicate that the 
> registers offset can vary depending on the chip and bank. The chip
> can be specified using the compatible property, as for the bank you
> can also require a property giving the bank number. With these two
> bits of information, this driver should be able to pick the right
> register layout out of an in-driver table. This would be much
> cleaner that letting the DT specify whatever layout it wants.

i tend to disagree. if we put the register offsets into the driver we
will have lots of static arrays (5 or 6) and with each new soc we need
to potentially need to patch the driver causing us in openwrt to carry
lots of patches and have to worry about upstreaming them. From my
understanding, the dts has this exact purpose, describing the hardware
and in turn reducing the boiler plate and static code in the drivers.
If have sent other drivers that do the same and was told there that
this is totally legit.

	John
