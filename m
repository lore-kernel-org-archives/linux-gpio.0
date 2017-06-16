From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 14:07:59 -0500
Message-ID: <5dcca3bd-7a14-271c-ab5e-0eea3e0a575c@codeaurora.org>
References: <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook>
 <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
 <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
 <c32b0c54-652c-69ce-4bbc-a24e443afbf2@codeaurora.org>
 <20170616174438.GC17640@tuxbook>
 <6fb0390e-296d-526f-c526-6b13f3021e45@codeaurora.org>
 <20170616185001.GD17640@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33872 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750983AbdFPTIC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 15:08:02 -0400
In-Reply-To: <20170616185001.GD17640@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On 06/16/2017 01:50 PM, Bjorn Andersson wrote:
> So what you're saying is that it's decided that you're not going to use
> "qdss_tracedata" and in some document it's described that these 32 TLMM
> pins are available for customers to utilize as GPIOs?

Well, nothing is "decided" just yet, but that is the idea.

> If so I think the GPIOs should still be numbered based on their
> numbering in the datasheet (i.e. gpio116), but that you should be using
> "line-names" to define the logical naming of these 32 gpios based on
> your customer documentation.

That's what I was hoping on doing, but that requires a sparse GPIO map. 
gpio116 is valid, but gpio1 is not.  Any attempt to access that gpio 
causes an XPU violation.

>>> I think that it would be nice to come up with a solution that works for
>>> the other users of pinctrl-msm as well.
>> I agree. It's hard for me to wrap my head around it, though, because the
>> whole groups vs pins things keeps confusing me.  The driver pretends that
>> you can have more than one pin per group, but that's just not true, and
>> instead it only works if each group represents a single TLMM block.
>>
> A pin represents a pad on the chip and a group represents a
> "configurable entity" in TLMM.

Fair enough, but each TLMM entry only maps to 0 or 1 pins.

> For GPIOs this doesn't make a difference, but rather than naming the
> pins "sdc2_data" there should be pins named "SDC2_DATA_0" ...
> "SDC2_DATA_3". But the configurable entity is "sdc2_data", so that's
> what should go in the "group".

I don't understand the SDC_PINGROUP() macro.  Most of the values are set 
to -1:

		.intr_cfg_reg = 0,			\
		.intr_status_reg = 0,			\
		.intr_target_reg = 0,			\
		.mux_bit = -1,				\
		.pull_bit = pull,			\
		.drv_bit = drv,				\
		.oe_bit = -1,				\
		.in_bit = -1,				\
		.out_bit = -1,				\

I'm not familiar with that SOC, but this looks to me like it's a 
non-TLMM GPIO. In that case, what's the point of including it?  What 
does this actually do?  It's a "configurable entity", but there doesn't 
appear any way to configure it.

> According to the pinctrl documentation we should actually have called
> the pins of the sdc2_data group "P3", "R6", "T7" and "P7" (for
> APQ8016E). If nothing else this would probably have made things less
> confusing.

Not for me.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
