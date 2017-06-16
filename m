From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 10:44:38 -0700
Message-ID: <20170616174438.GC17640@tuxbook>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook>
 <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
 <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
 <c32b0c54-652c-69ce-4bbc-a24e443afbf2@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:34976 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751639AbdFPRon (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 13:44:43 -0400
Received: by mail-pf0-f176.google.com with SMTP id l89so25468319pfi.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2017 10:44:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <c32b0c54-652c-69ce-4bbc-a24e443afbf2@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On Fri 16 Jun 09:26 PDT 2017, Timur Tabi wrote:

> On 6/16/17 11:21 AM, Andy Gross wrote:
> 
> > > 1) Approved by the XPU
> > 
> > How do you know what this is?  And this changes based on the TZ load.
> 
> An ACPI property in the TLMM node that lists the approved GPIOs by number.
> It currently looks like this:
> 
> Name (_DSD, Package ()
> {
> 	ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> 	Package ()
> 	{
> 		// Expose only the qdss_tracedata pins as GPIOs,
> 		// numbered sequentially, so that "gpio X" maps
> 		// to qdss_tracedata[X].  These can be used as
> 		// generic GPIOs.

But what does this actually mean?

I assume that on this platform the qdss_tracedata is an alternative
pinmux function (configured by someone else). Which normally means that
the pins are routed to some internal hardware block.

Or are you just running these in gpio-function and then have some
software to decode the data? Where is this piece of software?

> 		Package (2) {"gpios", Package ()
> 			{116, 117, 118, 119, 120, 121, 122, 123,
> 			 124, 125, 126, 127, 128, 129, 130, 131,
> 			 80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
> 			 90, 50, 36, 37, 38, 39}}

Does these pins make up some sort of communication bus? Or is it 32
individual states? Does it really make sense to expose these as 32
"random" GPIOs - which on some platforms will be sequential in your
made-up GPIO controller and on others be scattered.

> 	}
> })
> 
> I'm not crazy about it, but it's a compromise that allows some GPIOs to be
> exposed without a lot of coding.  One idea we're debating is forgetting
> about pinctrl-msm altogether and rewrite the driver from scratch as a pure
> GPIO driver.  I'm hoping to avoid having to do that.
> 

I think that it would be nice to come up with a solution that works for
the other users of pinctrl-msm as well.

Regards,
Bjorn
