From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Thu, 5 Oct 2017 14:30:35 -0700
Message-ID: <20171005213035.GF457@codeaurora.org>
References: <CACRpkdaUV1Mjh7U9bBAgZA5Zq1oqN0HBT=VH5NkvPnY4gHxDVw@mail.gmail.com>
 <d53e67a2-4f69-752f-ba35-53872d9b9760@codeaurora.org>
 <CACRpkdYfAcKrgbgybccurUKTyR0E+tHDyzp7sbXxXxKuyMOGhQ@mail.gmail.com>
 <619f48d2-59c7-c090-4ace-9e8db9f92064@codeaurora.org>
 <CACRpkdZFunwQ=tiQqsapap7Ozz42hr=df5vqbC0S5xy5Wn+ZWw@mail.gmail.com>
 <255ad0dc-2d16-ae7f-0b45-500e23cff1a4@codeaurora.org>
 <20171003220311.GU457@codeaurora.org>
 <40a0ab68-dc3a-10e2-f78e-9a386b4a72bd@codeaurora.org>
 <20171004215023.GA457@codeaurora.org>
 <f8c20994-230e-0028-c46a-d001e59223ce@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57798 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbdJEVah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2017 17:30:37 -0400
Content-Disposition: inline
In-Reply-To: <f8c20994-230e-0028-c46a-d001e59223ce@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On 10/04, Timur Tabi wrote:
> On 10/04/2017 04:50 PM, Stephen Boyd wrote:
> 
> Yes.  A recent firmware update enabled the "XPU" block which is
> being programmed with a select subset of individual GPIOs.  On our
> silicon, each TLMM GPIO is in a separate 64k page, and so the XPU
> can block any individual GPIO.  Any attempt to touch those registers
> causes an XPU violation which takes the whole system down.

Yes it's the same sort of design with the hardware I have too.

> 
> >
> >If it's in gpiochip_add_pin_range() would we still read the
> >hardware when creating the pin ranges?
> 
> I presume so.  The idea is that pinctrl-qdf2xxx/pinctrl-msm only
> submit pin ranges that are present in the ACPI tables.

Ok.

> 
> > I don't want to have to describe pin ranges of "valid" pins that
> > won't cause the system
> > to blow up if we touch them, because those pins are never used by
> > Linux so reading them is not useful.
> 
> Well, that's exactly what I'm trying to do with current patch set
> :-) It seems the most logical approach to me.  I don't understand
> the dislike for it.  What else are pin ranges for, other than to
> specify ranges of pins that can be accessed?

I have no idea. To describe non-contiguous pin ranges? Linus?

> 
> Another alternative was to enumerate all of the GPIOs starting from
> 0. So the first GPIO in ACPI would be gpio0, regardless of what gpio
> number it actually was.  E.g. GPIO 37 would appear as gpio0, GPIO 38
> would appear as gpio1, and so on.  That also worked, but it meant
> that customers would need to figure out which GPIO that "gpio0"
> actually pointed to.  That was not acceptable, so I dropped it.

Agreed.

> 
> I'm at a loss on how else to do it.  I think a gpio_chip.available
> callback is far less elegant than define pin ranges.  There is no
> chance that unavailable GPIOs can be accessed because the physical
> addresses are not in the msm_pingroup array.  That is,
> groups[0].ctrl_reg == 0, not 0xFF02010000.
> 

Yes, thinking more about it I don't want an available callback
either. It will add burden on DT platforms where we have to
describe per-firmware pin ranges just because gpiolib is reading
the direction of gpios we don't use.

Instead, I'd prefer we delay reading the direction until a
consumer requests the gpio, this way we don't touch the hardware
unless a consumer wants to. That seems simpler and doesn't
require anything special from the driver.

Don't get me wrong, I'm willing to describe with DT/ACPI which
pins are available if we have a need for it, but so far I don't
see the requirement and I'm a lazy person so I like avoiding more
work.

Does my patch fail on your platform for some reason? I can only
guess that somewhere we don't request the gpio before using it
and then you don't see the proper direction.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
