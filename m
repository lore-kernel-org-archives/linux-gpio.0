From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 11:26:49 -0500
Message-ID: <c32b0c54-652c-69ce-4bbc-a24e443afbf2@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook>
 <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
 <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45336 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdFPQ06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 12:26:58 -0400
In-Reply-To: <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On 6/16/17 11:21 AM, Andy Gross wrote:

>> 1) Approved by the XPU
> 
> How do you know what this is?  And this changes based on the TZ load.

An ACPI property in the TLMM node that lists the approved GPIOs by 
number.  It currently looks like this:

Name (_DSD, Package ()
{
	ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
	Package ()
	{
		// Expose only the qdss_tracedata pins as GPIOs,
		// numbered sequentially, so that "gpio X" maps
		// to qdss_tracedata[X].  These can be used as
		// generic GPIOs.
		Package (2) {"gpios", Package ()
			{116, 117, 118, 119, 120, 121, 122, 123,
			 124, 125, 126, 127, 128, 129, 130, 131,
			 80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
			 90, 50, 36, 37, 38, 39}}
	}
})

I'm not crazy about it, but it's a compromise that allows some GPIOs to 
be exposed without a lot of coding.  One idea we're debating is 
forgetting about pinctrl-msm altogether and rewrite the driver from 
scratch as a pure GPIO driver.  I'm hoping to avoid having to do that.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
