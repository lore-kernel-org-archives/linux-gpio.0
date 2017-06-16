From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 09:06:44 -0700
Message-ID: <20170616160644.GA17640@tuxbook>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:35589 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750986AbdFPQGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 12:06:50 -0400
Received: by mail-pg0-f53.google.com with SMTP id k71so22176770pgd.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2017 09:06:49 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>

On Fri 16 Jun 08:49 PDT 2017, Timur Tabi wrote:

> On 6/16/17 10:41 AM, Stephen Boyd wrote:
> > On 06/16, Timur Tabi wrote:
> > > On 6/16/17 10:07 AM, Stephen Boyd wrote:
> > > > I'm not aware of anything in pinctrl-msm to support this.
> > > 
> > > It seems to me like the 'npins' field in msm_pingroup should be
> > > deleted, because it can only ever be 1.
> > 
> > Ok. But does that change anything about this problem?
> 
> No, but at least no one would ever be fooled into thinking that you can have
> sparse GPIO maps when using pinctrl-msm.
> 

As GPIOs are both identified by name and by index within the controller
I don't see it as sufficient to play games with just lowering
npins/ngpios and compacting the lists.

[..]
> > We've already run into this problem on mobile platforms where
> > certain pins are locked down and the approach has been to not
> > care. But I don't think we have your patch yet, so you're the
> > first one to run into this problem.
> 
> For now, I've decided that I'm just going to expose the qdss_tracedata[]
> pins as GPIOs, numbered 0 .. n-1.  However, there's no consensus on that,
> either.
> 

Exposing a subset of GPIOs with a different numbering than what's in the
hardware documentation is going to be quite confusing for the users.


Just to confirm, are the qdss_tracedata the only GPIOs that you want to
expose from the TLMM now? Are those consecutive?

> Being able to designate specific pins as absent would make everyone happy.
> 

I agree.

Regards,
Bjorn
