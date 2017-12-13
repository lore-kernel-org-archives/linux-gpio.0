From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/3] [v8] pinctrl: qcom: disable GPIO groups with no pins
Date: Wed, 13 Dec 2017 14:37:38 -0800
Message-ID: <20171213223738.GR7997@codeaurora.org>
References: <1513189818-7384-1-git-send-email-timur@codeaurora.org>
 <1513189818-7384-3-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58674 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751090AbdLMWhs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Dec 2017 17:37:48 -0500
Content-Disposition: inline
In-Reply-To: <1513189818-7384-3-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>

On 12/13, Timur Tabi wrote:
> pinctrl-msm only accepts an array of GPIOs from 0 to n-1, and it expects
> each group to support have only one pin (npins == 1).
> 
> We can support "sparse" GPIO maps if we allow for some groups to have zero
> pins (npins == 0).  These pins are "hidden" from the rest of the driver
> and gpiolib.
> 
> Access to unavailable GPIOs is blocked via a request callback.  If the
> requested GPIO is unavailable, -EACCES is returned, which prevents
> further access to that GPIO.
> 
> Signed-off-by: Timur Tabi <timur@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
