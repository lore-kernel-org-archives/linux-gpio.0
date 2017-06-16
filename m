From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 11:50:01 -0700
Message-ID: <20170616185001.GD17640@tuxbook>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:34960 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751835AbdFPSuG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 14:50:06 -0400
Received: by mail-pg0-f45.google.com with SMTP id k71so23825225pgd.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2017 11:50:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <6fb0390e-296d-526f-c526-6b13f3021e45@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On Fri 16 Jun 11:10 PDT 2017, Timur Tabi wrote:

> On 06/16/2017 12:44 PM, Bjorn Andersson wrote:
> > > An ACPI property in the TLMM node that lists the approved GPIOs by number.
> > > It currently looks like this:
> > > 
> > > Name (_DSD, Package ()
> > > {
> > > 	ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> > > 	Package ()
> > > 	{
> > > 		// Expose only the qdss_tracedata pins as GPIOs,
> > > 		// numbered sequentially, so that "gpio X" maps
> > > 		// to qdss_tracedata[X].  These can be used as
> > > 		// generic GPIOs.
> 
> > But what does this actually mean?
> 
> Well, the more I think about it, less it means.
> 
> > I assume that on this platform the qdss_tracedata is an alternative
> > pinmux function (configured by someone else). Which normally means that
> > the pins are routed to some internal hardware block.
> 
> Yes, I just realized my mistake.  The qdss_tracedata[] pins are alternative
> functions for the GPIO, so calling them qdss_tracedata GPIOs is wrong.  They
> just happen to be the pins that can be used as qdss_tracedata, but we're
> expecting them to be configured as GPIOs (function 0) instead.
> 
> Ugh.
> 
> > Or are you just running these in gpio-function and then have some
> > software to decode the data? Where is this piece of software?
> 
> I have another patch to pinctrl-qdf2xxx.c that reads the "gpios" property
> and maps the gpios to gpio0..gpioN.  Basically, the driver first does this:
> 
> u32 *gpios;
> ret = device_property_read_u32_array(&pdev->dev, "gpios", gpios,
> 				     num_gpios);
> 
> so gpios[0] is 116 and gpios[31] is 39.
> 
> And then in a loop:
> 
> 	for (i = 0; i < num_gpios; i++) {
> 		unsigned int gpio = gpios[i];
> 
> 		snprintf(names[i], NAME_SIZE, "qdss_tracedata[%u]", i);
> 
> 		pins[i].number = i;
> 		pins[i].name = names[i];
> 
> 		groups[i].npins = 1;
> 		groups[i].name = names[i];
> 		groups[i].pins = &pins[i].number;
> 
> 		groups[i].ctl_reg = 0x10000 * gpio;  <-----
> 
> > > 		Package (2) {"gpios", Package ()
> > > 			{116, 117, 118, 119, 120, 121, 122, 123,
> > > 			 124, 125, 126, 127, 128, 129, 130, 131,
> > > 			 80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
> > > 			 90, 50, 36, 37, 38, 39}}
> > Does these pins make up some sort of communication bus? Or is it 32
> > individual states? Does it really make sense to expose these as 32
> > "random" GPIOs - which on some platforms will be sequential in your
> > made-up GPIO controller and on others be scattered.
> 
> Well, these are 32 pins that can be used as qdss_tracedata, and so are
> considered "open" by some arbitrary standard that doesn't seem very stable.
> 
> The idea is that pin 116 is qdss_tracedata[0], which I expose as gpio[0].
> 

So what you're saying is that it's decided that you're not going to use
"qdss_tracedata" and in some document it's described that these 32 TLMM
pins are available for customers to utilize as GPIOs?

If so I think the GPIOs should still be numbered based on their
numbering in the datasheet (i.e. gpio116), but that you should be using
"line-names" to define the logical naming of these 32 gpios based on
your customer documentation.

> > I think that it would be nice to come up with a solution that works for
> > the other users of pinctrl-msm as well.
> 
> I agree. It's hard for me to wrap my head around it, though, because the
> whole groups vs pins things keeps confusing me.  The driver pretends that
> you can have more than one pin per group, but that's just not true, and
> instead it only works if each group represents a single TLMM block.
> 

A pin represents a pad on the chip and a group represents a
"configurable entity" in TLMM.

For GPIOs this doesn't make a difference, but rather than naming the
pins "sdc2_data" there should be pins named "SDC2_DATA_0" ...
"SDC2_DATA_3". But the configurable entity is "sdc2_data", so that's
what should go in the "group".

According to the pinctrl documentation we should actually have called
the pins of the sdc2_data group "P3", "R6", "T7" and "P7" (for
APQ8016E). If nothing else this would probably have made things less
confusing.


That said, I never tested that this works...

Regards,
Bjorn
