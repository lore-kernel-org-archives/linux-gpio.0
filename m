From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 10:49:33 -0500
Message-ID: <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41820 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdFPPtg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 11:49:36 -0400
In-Reply-To: <20170616154125.GK20170@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On 6/16/17 10:41 AM, Stephen Boyd wrote:
> On 06/16, Timur Tabi wrote:
>> On 6/16/17 10:07 AM, Stephen Boyd wrote:
>>> I'm not aware of anything in pinctrl-msm to support this.
>>
>> It seems to me like the 'npins' field in msm_pingroup should be
>> deleted, because it can only ever be 1.
> 
> Ok. But does that change anything about this problem?

No, but at least no one would ever be fooled into thinking that you can 
have sparse GPIO maps when using pinctrl-msm.

>> Unfortunately, thanks to https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/pinctrl/qcom?id=8e51533780ba223a3562ff4382c6b6f350c7e9a4
>> we now read the direction of every pin at boot, and so we always get
>> an XPU violation early in the boot process.
> 
> Oops. Why not allow read to work, but write to fail? Can the XPU
> be configured so it doesn't blow up when we read registers?

We debated that, and decided we really want to reject access to any 
GPIOs that are "off limits".  Our TLMM memory map was designed 
specifically to allow this to be enforced.

> Otherwise, it sounds like some driver surgery is needed to
> indicate that the gpio number space has plenty of holes in it and
> that we should return failures for those protected pins.

I was thinking about adding support for "npins == 0", but I don't know 
how to tell the pinctrl/gpio core that specific pins don't actually 
exist.  Is there a place where I can do something like this:

	if (!g->npins)
		return -ENODEV;

> We've already run into this problem on mobile platforms where
> certain pins are locked down and the approach has been to not
> care. But I don't think we have your patch yet, so you're the
> first one to run into this problem.

For now, I've decided that I'm just going to expose the qdss_tracedata[] 
pins as GPIOs, numbered 0 .. n-1.  However, there's no consensus on 
that, either.

Being able to designate specific pins as absent would make everyone happy.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
