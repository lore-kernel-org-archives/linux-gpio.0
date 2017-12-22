From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Fri, 22 Dec 2017 18:49:26 +0100
Message-ID: <6085637.glixkFOZBH@debian64>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com> <5e17a846-b2c6-c078-3d90-bbf19aea2a8a@opengear.com> <CACRpkdaSxJLbk_hN0mgURLk4u4ATbE-HvmX1yM+BWjcrzcKjXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:43359 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756259AbdLVRt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Dec 2017 12:49:29 -0500
In-Reply-To: <CACRpkdaSxJLbk_hN0mgURLk4u4ATbE-HvmX1yM+BWjcrzcKjXA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Cooks <andrew.cooks@opengear.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, alan@mizrahi.com.ve

On Friday, December 22, 2017 8:48:22 AM CET Linus Walleij wrote:
> On Fri, Dec 22, 2017 at 2:17 AM, Andrew Cooks <andrew.cooks@opengear.com> wrote:
> > On 21/12/17 23:02, Christian Lamparter wrote:
> 
> >> Just a FYI: due to these difficulties with getting a gpio driver
> >> upstream, Alan Mizrahi upstreamed an in-kernel led-apu.c driver [0]
> >> that sort of bypasses the whole pinctrl vs gpio issue.
> >
> > Thanks, I saw that and was somewhat surprised to see it accepted.
> 
> I looked at the driver and it seems actually good and doing the
> right thing. If I understand it right:
> 
> - It does a bunch of magic dmi_match() on DMI_BOARD_NAME
>   to figure out what board this is.
> 
> - It then proceeds to register LEDs using some bits in the MMIO
>   area that are used for LEDs.
> 
> So these bits/lines are actually not GPIO, since GPIO means
> "general purpose input/output" - they are specific purpose and the
> specific purpose can be detected.
> [...]
> If only these few GPIO lines are actually used and only used for
> these LEDs, (the rest of the bits in the register unused) then this
> driver is as good as any.

Yeah :) I wanted to point this out Andrew Cooks too.

Hence:
>>If you are just after LEDs or gpio-keys you probably can go 
>>the same route?"

But thank you for confirming this as well. This special led driver
will do in a pinch. That said, the APU1/APU2 also has a pushbutton
(modeswitch) wired to one of the FCH's other pins. So, this is were
having a pinctrl/gpio driver would become *convenient*. Because 
leds-gpio and gpio-keys-polled make it possible to support
all these bits and bobs without having to duplicate the MMIO access.
(Furthermore, the LEDS and pushbutton/modeswitch lines are also 
accessible through the J4 Header on the board).

Note: the vendor (PC Engines) happily provides PDFs and schematics 
for their boards:
<https://www.pcengines.ch/pdf/apu1.pdf>
<https://www.pcengines.ch/schema/apu1c.pdf>
<https://www.pcengines.ch/pdf/apu2.pdf>
<http://pcengines.ch/schema/apu2c.pdf>

So, it's possible to repurpose several test points as additional
GPIOs and more.

Note2:
On both boards there is also a dedicated GPIO pin header J19, but
these pins are controlled by the SuperIO Nuvoton NCT5104D.

Thanks,
Christian
