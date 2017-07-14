From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: disable GPIO groups with no pins
Date: Fri, 14 Jul 2017 10:23:36 -0700
Message-ID: <20170714172336.GO20973@minitux>
References: <1499982763-29619-1-git-send-email-timur@codeaurora.org>
 <1499982763-29619-2-git-send-email-timur@codeaurora.org>
 <20170714171148.GH22780@codeaurora.org>
 <6ca041fa-533d-6c6b-8c77-4c079cb7e9f6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:34549 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753124AbdGNRXk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jul 2017 13:23:40 -0400
Received: by mail-pf0-f175.google.com with SMTP id q85so48389092pfq.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2017 10:23:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <6ca041fa-533d-6c6b-8c77-4c079cb7e9f6@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri 14 Jul 10:17 PDT 2017, Timur Tabi wrote:

> On 07/14/2017 12:11 PM, Stephen Boyd wrote:
> 
> > > +/*
> > > + * Request a GPIO. If the number of pins for this GPIO group is zero,
> > > + * then assume that the GPIO is unavailable.
> > > + */
> > > +static int msm_request(struct pinctrl_dev *pctldev, unsigned int offset)
> > 
> > These names are awful. Reminds me of the serial driver that has
> > functions like msm_reset(). But when in Rome this is how it goes
> > I suppose.
> 
> I can change it to msm_pinctrl_request().
> 

msm_pinmux_request()

Regards,
Bjorn
