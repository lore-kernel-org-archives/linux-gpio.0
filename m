From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 08:41:25 -0700
Message-ID: <20170616154125.GK20170@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:37812 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752672AbdFPPl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 11:41:27 -0400
Content-Disposition: inline
In-Reply-To: <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On 06/16, Timur Tabi wrote:
> On 6/16/17 10:07 AM, Stephen Boyd wrote:
> >I'm not aware of anything in pinctrl-msm to support this.
> 
> It seems to me like the 'npins' field in msm_pingroup should be
> deleted, because it can only ever be 1.

Ok. But does that change anything about this problem?

> 
> >Is this
> >really a problem though? The only user that could cause an XPU
> >violation would be root. So just "don't do that" and things will
> >work fine.
> 
> Unfortunately, thanks to https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/pinctrl/qcom?id=8e51533780ba223a3562ff4382c6b6f350c7e9a4
> we now read the direction of every pin at boot, and so we always get
> an XPU violation early in the boot process.

Oops. Why not allow read to work, but write to fail? Can the XPU
be configured so it doesn't blow up when we read registers?

Otherwise, it sounds like some driver surgery is needed to
indicate that the gpio number space has plenty of holes in it and
that we should return failures for those protected pins.

We've already run into this problem on mobile platforms where
certain pins are locked down and the approach has been to not
care. But I don't think we have your patch yet, so you're the
first one to run into this problem.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
