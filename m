From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Fwd: [PATCH 2/4] gpiolib: add bitmask for valid GPIO lines
Date: Wed, 15 Nov 2017 09:15:15 -0600
Message-ID: <98107fc7-d5b4-9347-4713-868414c5e41f@codeaurora.org>
References: <1510096056-13765-3-git-send-email-timur@codeaurora.org>
 <b2b5374b-17a6-e068-ef8b-edc90d34c352@codeaurora.org>
 <20171115062837.GA22802@codeaurora.org>
 <1510745919.25007.234.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47644 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758389AbdKOPPV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 10:15:21 -0500
In-Reply-To: <1510745919.25007.234.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Varadarajan Narayanan <varada@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>

On 11/15/2017 05:38 AM, Andy Shevchenko wrote:
> I suppose you meant kmalloc_array.
> Anyway, it's a separate change if you wish, because Timur didn't change
> the original approach here.

Unfortunately for me, all of the irq stuff has moved into its own 
structure in 4.15, so I need to rewrite all this code anyway.  I'll drop 
the use of kcalloc.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
