From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/3] [v2] Revert "gpio: set up initial state from
 .get_direction()"
Date: Wed, 13 Dec 2017 14:37:00 -0800
Message-ID: <20171213223700.GQ7997@codeaurora.org>
References: <1513189818-7384-1-git-send-email-timur@codeaurora.org>
 <1513189818-7384-2-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54638 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752468AbdLMWhC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Dec 2017 17:37:02 -0500
Content-Disposition: inline
In-Reply-To: <1513189818-7384-2-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>

On 12/13, Timur Tabi wrote:
> This reverts commit 72d3200061776264941be1b5a9bb8e926b3b30a5.
> 
> We cannot blindly query the direction of all GPIOs when the pins are
> first registered.  The get_direction callback normally triggers a
> read/write to hardware, but we shouldn't be touching the hardware for
> an individual GPIO until after it's been properly claimed.
> 
> Signed-off-by: Timur Tabi <timur@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
