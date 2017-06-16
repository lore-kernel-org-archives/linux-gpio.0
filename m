From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 11:17:22 -0500
Message-ID: <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:37484 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750750AbdFPQRY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 12:17:24 -0400
In-Reply-To: <20170616160644.GA17640@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>

On 6/16/17 11:06 AM, Bjorn Andersson wrote:
> Exposing a subset of GPIOs with a different numbering than what's in the
> hardware documentation is going to be quite confusing for the users.

I agree, and that's why I was hoping to expose only the qdss_tracedata pins.

> Just to confirm, are the qdss_tracedata the only GPIOs that you want to
> expose from the TLMM now? Are those consecutive?

Well, ideally would like to expose only those pins that are:

1) Approved by the XPU

and

2) Already set to function 0 on boot

Unfortunately, doing both of these would require significant changes to 
pinctrl-msm.  Considering how unimportant this feature is (we don't need 
the TLMM any more for normal operations), I don't really want to invest 
too much time in it.

So assuming I can get approval from all stakeholders, all I want to do 
is expose the qdss_tracedata[0..n-1] pins as gpios 0..n-1.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
