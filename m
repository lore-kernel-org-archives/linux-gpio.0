From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 0/3] [v11] pinctrl: qcom: add support for sparse GPIOs
Date: Thu, 28 Dec 2017 08:15:56 -0800
Message-ID: <20171228161556.GG7997@codeaurora.org>
References: <1513797033-9494-1-git-send-email-timur@codeaurora.org>
 <CACRpkdYtMbACG0D2zjgw-kN_3pb_VDGH_3DDhyMQD92eE5P0Gw@mail.gmail.com>
 <20171227020142.GZ7997@codeaurora.org>
 <CACRpkda5FQg3W4rnxihVB9y2yv-oF1CwBzFJsKB8cxzQ+zoHNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda5FQg3W4rnxihVB9y2yv-oF1CwBzFJsKB8cxzQ+zoHNg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, Andrew Cooks <andrew.cooks@opengear.com>
List-Id: linux-gpio@vger.kernel.org

On 12/28, Linus Walleij wrote:
> On Wed, Dec 27, 2017 at 3:01 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> 
> > The different approaches come down to expressing
> > which pins are available through the gpio valid mask, or through
> > the npins field of the msm pinctrl driver. Also, my approach
> > covers more than just GPIOs, it covers irqs and adjusts the
> > pinctrl pin request function so that pinctrl can't request
> > unavailable pins.
> 
> I agree, this is better.

Thanks for the feedback. I'll update and resend my patch to the
list.

> 
> Would even patch 1 be needed after this? Maybe I should
> revert that too. Leaving that code in has the upside of showing
> the actual initial directions of GPIO lines even if they have
> not been requested, in e.g. debugfs.
> 

Patch 1 is still needed. Without that patch, we'll be poking each
GPIO to figure out the direction at boot without checking any
valid mask or calling the request APIs. I don't see the part in
debugfs where we show the direction of a GPIO if it hasn't been
requested. Don't we skip over the unrequested GPIOs because of
this code in gpiolib_dbg_show()?

	if (!test_bit(FLAG_REQUESTED, &gdesc->flags)) {
		...
		continue;
	}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
