From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 10:15:01 -0500
Message-ID: <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57924 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752439AbdFPPPE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 11:15:04 -0400
In-Reply-To: <20170616150721.GJ20170@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On 6/16/17 10:07 AM, Stephen Boyd wrote:
> I'm not aware of anything in pinctrl-msm to support this. 

It seems to me like the 'npins' field in msm_pingroup should be deleted, 
because it can only ever be 1.

> Is this
> really a problem though? The only user that could cause an XPU
> violation would be root. So just "don't do that" and things will
> work fine.

Unfortunately, thanks to 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/pinctrl/qcom?id=8e51533780ba223a3562ff4382c6b6f350c7e9a4 
we now read the direction of every pin at boot, and so we always get an 
XPU violation early in the boot process.

And even so, "don't do that" is just not acceptable on a server platform.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
