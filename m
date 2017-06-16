From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 13:10:21 -0500
Message-ID: <6fb0390e-296d-526f-c526-6b13f3021e45@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook>
 <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
 <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
 <c32b0c54-652c-69ce-4bbc-a24e443afbf2@codeaurora.org>
 <20170616174438.GC17640@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40474 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750864AbdFPSKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 14:10:24 -0400
In-Reply-To: <20170616174438.GC17640@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On 06/16/2017 12:44 PM, Bjorn Andersson wrote:
>> An ACPI property in the TLMM node that lists the approved GPIOs by number.
>> It currently looks like this:
>>
>> Name (_DSD, Package ()
>> {
>> 	ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>> 	Package ()
>> 	{
>> 		// Expose only the qdss_tracedata pins as GPIOs,
>> 		// numbered sequentially, so that "gpio X" maps
>> 		// to qdss_tracedata[X].  These can be used as
>> 		// generic GPIOs.

> But what does this actually mean?

Well, the more I think about it, less it means.

> I assume that on this platform the qdss_tracedata is an alternative
> pinmux function (configured by someone else). Which normally means that
> the pins are routed to some internal hardware block.

Yes, I just realized my mistake.  The qdss_tracedata[] pins are 
alternative functions for the GPIO, so calling them qdss_tracedata GPIOs 
is wrong.  They just happen to be the pins that can be used as 
qdss_tracedata, but we're expecting them to be configured as GPIOs 
(function 0) instead.

Ugh.

> Or are you just running these in gpio-function and then have some
> software to decode the data? Where is this piece of software?

I have another patch to pinctrl-qdf2xxx.c that reads the "gpios" 
property and maps the gpios to gpio0..gpioN.  Basically, the driver 
first does this:

u32 *gpios;
ret = device_property_read_u32_array(&pdev->dev, "gpios", gpios,
				     num_gpios);

so gpios[0] is 116 and gpios[31] is 39.

And then in a loop:

	for (i = 0; i < num_gpios; i++) {
		unsigned int gpio = gpios[i];

		snprintf(names[i], NAME_SIZE, "qdss_tracedata[%u]", i);

		pins[i].number = i;
		pins[i].name = names[i];

		groups[i].npins = 1;
		groups[i].name = names[i];
		groups[i].pins = &pins[i].number;

		groups[i].ctl_reg = 0x10000 * gpio;  <-----

>> 		Package (2) {"gpios", Package ()
>> 			{116, 117, 118, 119, 120, 121, 122, 123,
>> 			 124, 125, 126, 127, 128, 129, 130, 131,
>> 			 80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
>> 			 90, 50, 36, 37, 38, 39}}
> Does these pins make up some sort of communication bus? Or is it 32
> individual states? Does it really make sense to expose these as 32
> "random" GPIOs - which on some platforms will be sequential in your
> made-up GPIO controller and on others be scattered.

Well, these are 32 pins that can be used as qdss_tracedata, and so are 
considered "open" by some arbitrary standard that doesn't seem very stable.

The idea is that pin 116 is qdss_tracedata[0], which I expose as gpio[0].

> I think that it would be nice to come up with a solution that works for
> the other users of pinctrl-msm as well.

I agree. It's hard for me to wrap my head around it, though, because the 
whole groups vs pins things keeps confusing me.  The driver pretends 
that you can have more than one pin per group, but that's just not true, 
and instead it only works if each group represents a single TLMM block.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
