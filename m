From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Wed, 28 Jun 2017 21:59:31 -0700
Message-ID: <20170629045931.GW18666@tuxbook>
References: <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook>
 <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
 <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
 <c32b0c54-652c-69ce-4bbc-a24e443afbf2@codeaurora.org>
 <20170616174438.GC17640@tuxbook>
 <6fb0390e-296d-526f-c526-6b13f3021e45@codeaurora.org>
 <20170616185001.GD17640@tuxbook>
 <5dcca3bd-7a14-271c-ab5e-0eea3e0a575c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:35834 "EHLO
        mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751544AbdF2E7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 00:59:37 -0400
Received: by mail-pf0-f177.google.com with SMTP id c73so44230149pfk.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jun 2017 21:59:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5dcca3bd-7a14-271c-ab5e-0eea3e0a575c@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On Fri 16 Jun 12:07 PDT 2017, Timur Tabi wrote:
> On 06/16/2017 01:50 PM, Bjorn Andersson wrote:
[..]
> > For GPIOs this doesn't make a difference, but rather than naming the
> > pins "sdc2_data" there should be pins named "SDC2_DATA_0" ...
> > "SDC2_DATA_3". But the configurable entity is "sdc2_data", so that's
> > what should go in the "group".
> 
> I don't understand the SDC_PINGROUP() macro.  Most of the values are set to
> -1:
> 
> 		.intr_cfg_reg = 0,			\
> 		.intr_status_reg = 0,			\
> 		.intr_target_reg = 0,			\
> 		.mux_bit = -1,				\
> 		.pull_bit = pull,			\
> 		.drv_bit = drv,				\
> 		.oe_bit = -1,				\
> 		.in_bit = -1,				\
> 		.out_bit = -1,				\
> 

In some cases SDC function can be found muxed among GPIOs, in others
there are dedicated configuration in TLMM for SDC properties. This entry
represent the latter.

You can set the bias and drive-strength, but there's no mux
configuration, no enable/disable, no interrupt and no value.

> I'm not familiar with that SOC, but this looks to me like it's a non-TLMM
> GPIO.

It's a non-GPIO configuration in TLMM.

> In that case, what's the point of including it?  What does this
> actually do?  It's a "configurable entity", but there doesn't appear
> any way to configure it.
> 

It's common to find at least the primary SDC on dedicated pins and hence
separate configuration. But as it's not available for generic IO
operations the properties/operations typical for this are not available.

> > According to the pinctrl documentation we should actually have called
> > the pins of the sdc2_data group "P3", "R6", "T7" and "P7" (for
> > APQ8016E). If nothing else this would probably have made things less
> > confusing.
> 
> Not for me.
> 

:)

Regards,
Bjorn
