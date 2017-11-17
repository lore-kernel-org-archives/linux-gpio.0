From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 3/4] [v6] pinctrl: qcom: disable GPIO groups with no pins
Date: Fri, 17 Nov 2017 09:46:17 -0800
Message-ID: <20171117174617.GA29777@codeaurora.org>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
 <1510096056-13765-4-git-send-email-timur@codeaurora.org>
 <20171117024332.GU11955@codeaurora.org>
 <dff45d26-e9df-6a4f-00a9-7d9ec5cbdf49@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60734 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161135AbdKQRqT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Nov 2017 12:46:19 -0500
Content-Disposition: inline
In-Reply-To: <dff45d26-e9df-6a4f-00a9-7d9ec5cbdf49@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>

On 11/16, Timur Tabi wrote:
> On 11/16/17 8:43 PM, Stephen Boyd wrote:
> >>Most access to unavailable GPIOs can be blocked via the gpio_chip.request
> >>function.  The one exception is when gpiochip_add_data() scans all of
> 
> >If patch 1 is applied is this statement still true?
> 
> Nope.
> 

Ok. So what's the point of this patch then? Put another way, is
there some path that doesn't request the gpio still even with
patch 1 applied?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
