From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 09:35:51 -0700
Message-ID: <20170616163551.GB17640@tuxbook>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616155517.GY12920@tuxbook>
 <4d56b425-10c3-9568-e88c-4ac22ca0c50d@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:33361 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750750AbdFPQf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 12:35:56 -0400
Received: by mail-pf0-f179.google.com with SMTP id 83so24711875pfr.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2017 09:35:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4d56b425-10c3-9568-e88c-4ac22ca0c50d@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>

On Fri 16 Jun 09:07 PDT 2017, Timur Tabi wrote:

> On 6/16/17 10:55 AM, Bjorn Andersson wrote:
> > npins are the number of "pins" handles by the TLMM, while ngpios are the
> > number of GPIO lines. I.e. npins >= ngpios and non platforms where we
> > control e.g. sdc properties you can see that npins > ngpios.
> 
> I'm talking about the 'npins' in struct msm_pingroup:
> 
> struct msm_pingroup {
> 	const char *name;
> 	const unsigned *pins;
> 	unsigned npins;
> 
> Every client driver of pinctrl-msm sets this value to 1 for every group.
> 

The npins here would allow us to properly name the multiple pins in e.g.
sdcX_data. But we're not doing this and I would be surprised if anyone
found it useful to get this in.

So it make sense to hardcode this value in msm_get_group_pins() and drop
it from the struct.

> > It's not an awesome solution for mobile either. But to solve this we
> > have two problems to solve;
> > 
> > 1) as the XPU configuration isn't fixed we need to be dynamic or
> > configurable in some sensible way
> 
> I was planning on updating the TLMM ACPI node to include a property that
> lists the acceptable GPIOs.
> 

But this list is related to your XPU configuration and not the TLMM
block, so the list of enabled/disabled pins should not go in the driver.

> > 2) the pinctrl framework does have some support for sparse pin spaces,
> > but this would need to be extended to allow us to (easily) register a
> > sparse list of pins
> 
> I was hoping there would be a way in pinctrl-msm to tell the framework, "Oh,
> you want to export this pin? Sorry, I forgot to tell you that it doesn't
> exist."
> 

There are quite a few functions in pinctrl-msm that would need to be
augmented with such checks, so I don't like this approach.

Regards,
Bjorn
