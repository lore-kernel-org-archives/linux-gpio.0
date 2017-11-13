From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 0/4] [v7] pinctrl: qcom: add support for sparse GPIOs
Date: Mon, 13 Nov 2017 13:19:02 -0600
Message-ID: <c219c289-9cad-f96c-f766-ec28af8f078d@codeaurora.org>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:32776 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752547AbdKMTTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 14:19:05 -0500
In-Reply-To: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>

On 11/07/2017 05:07 PM, Timur Tabi wrote:
> A series of patches that add support for GPIO maps that have holes in
> them.  That is, even though a client driver has N consecutive GPIOs,
> some are just unavailable for whatever reason, and the hardware should
> not be accessed for those GPIOs.

Any chance of these patches going into 4.15?  I've been making lots of 
changes, but I haven't gotten a lot of feedback.  I still think that v7 
is more intrusive and risky than v5, with no real benefit.  But at this 
point, I just want something to be merged so that I stop thinking about it.



-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
