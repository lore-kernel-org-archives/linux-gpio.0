From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 3/4] [v6] pinctrl: qcom: disable GPIO groups with no pins
Date: Thu, 16 Nov 2017 18:43:32 -0800
Message-ID: <20171117024332.GU11955@codeaurora.org>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
 <1510096056-13765-4-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:36580 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755785AbdKQCne (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Nov 2017 21:43:34 -0500
Content-Disposition: inline
In-Reply-To: <1510096056-13765-4-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>

On 11/07, Timur Tabi wrote:
> pinctrl-msm only accepts an array of GPIOs from 0 to n-1, and it expects
> each group to support have only one pin (npins == 1).
> 
> We can support "sparse" GPIO maps if we allow for some groups to have zero
> pins (npins == 0).  These pins are "hidden" from the rest of the driver
> and gpiolib.
> 
> A new boolean 'sparse' indicates whether the GPIO map is sparse.  If any
> GPIO has an 'npins' value of 0, then 'sparse' must be set to True.
> 
> Most access to unavailable GPIOs can be blocked via the gpio_chip.request
> function.  The one exception is when gpiochip_add_data() scans all of

If patch 1 is applied is this statement still true?

> the GPIOs without "requesting" them.  To cover this case,

s/GPIOs/GPIOs for their direction/ perhaps?

> msm_gpio_get_direction() separately checks if the GPIO is available.
> 
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
