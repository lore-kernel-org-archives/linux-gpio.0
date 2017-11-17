From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/4] [v6] pinctrl: qcom: disable GPIO groups with no pins
Date: Thu, 16 Nov 2017 20:58:57 -0600
Message-ID: <dff45d26-e9df-6a4f-00a9-7d9ec5cbdf49@codeaurora.org>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
 <1510096056-13765-4-git-send-email-timur@codeaurora.org>
 <20171117024332.GU11955@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44560 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756126AbdKQC7E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Nov 2017 21:59:04 -0500
In-Reply-To: <20171117024332.GU11955@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>

On 11/16/17 8:43 PM, Stephen Boyd wrote:
>> Most access to unavailable GPIOs can be blocked via the gpio_chip.request
>> function.  The one exception is when gpiochip_add_data() scans all of

> If patch 1 is applied is this statement still true?

Nope.

>> the GPIOs without "requesting" them.  To cover this case,
> s/GPIOs/GPIOs for their direction/ perhaps?

Ok.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
