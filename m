From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: disable GPIO groups with no pins
Date: Fri, 14 Jul 2017 10:35:55 -0700
Message-ID: <20170714173555.GP20973@minitux>
References: <1499982763-29619-1-git-send-email-timur@codeaurora.org>
 <1499982763-29619-2-git-send-email-timur@codeaurora.org>
 <20170714164455.GM20973@minitux>
 <be10e365-95fa-dfa4-9900-4af05d8f41a9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:36612 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754660AbdGNRf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jul 2017 13:35:58 -0400
Received: by mail-pf0-f174.google.com with SMTP id q86so48487771pfl.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2017 10:35:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <be10e365-95fa-dfa4-9900-4af05d8f41a9@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri 14 Jul 10:01 PDT 2017, Timur Tabi wrote:

> On 07/14/2017 11:44 AM, Bjorn Andersson wrote:
> > We would have to drop the "const" on the groups arrays of the other
> > platform in order to use this, but I don't have a better suggestion at
> > this time.
> 
> Why?  I don't modify any data in this patch, and I build just fine with
> these options enabled:
> 
> CONFIG_PINCTRL_MSM8916=y
> CONFIG_PINCTRL_MSM8994=y
> CONFIG_PINCTRL_MSM8996=y
> CONFIG_PINCTRL_QDF2XXX=m
> 

What I mean is that if we want to specify that any pin of those drivers
are locked down we would make npins = 0.

But as this is a system configuration thing this information would
preferably be injected in runtime (like you do), but the
soc_data->groups arrays are currently all const (see e.g.
msm8x74_groups), so we can't change npins in runtime.


But I think this is fine for now.

Regards,
Bjorn
