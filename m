From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 08:55:17 -0700
Message-ID: <20170616155517.GY12920@tuxbook>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:34740 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750830AbdFPPzY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 11:55:24 -0400
Received: by mail-pg0-f50.google.com with SMTP id v18so22124265pgb.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2017 08:55:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>

On Fri 16 Jun 08:15 PDT 2017, Timur Tabi wrote:

> On 6/16/17 10:07 AM, Stephen Boyd wrote:
> > I'm not aware of anything in pinctrl-msm to support this.
> 
> It seems to me like the 'npins' field in msm_pingroup should be deleted,
> because it can only ever be 1.
> 

npins are the number of "pins" handles by the TLMM, while ngpios are the
number of GPIO lines. I.e. npins >= ngpios and non platforms where we
control e.g. sdc properties you can see that npins > ngpios.

> > Is this
> > really a problem though? The only user that could cause an XPU
> > violation would be root. So just "don't do that" and things will
> > work fine.
> 
> Unfortunately, thanks to https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/pinctrl/qcom?id=8e51533780ba223a3562ff4382c6b6f350c7e9a4
> we now read the direction of every pin at boot, and so we always get an XPU
> violation early in the boot process.
> 
> And even so, "don't do that" is just not acceptable on a server platform.
> 

It's not an awesome solution for mobile either. But to solve this we
have two problems to solve;

1) as the XPU configuration isn't fixed we need to be dynamic or
configurable in some sensible way

2) the pinctrl framework does have some support for sparse pin spaces,
but this would need to be extended to allow us to (easily) register a
sparse list of pins

Regards,
Bjorn
