From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 13:42:22 -0500
Message-ID: <b5227d97-e5d3-a30b-6279-bc59372083cc@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616155517.GY12920@tuxbook>
 <4d56b425-10c3-9568-e88c-4ac22ca0c50d@codeaurora.org>
 <20170616163551.GB17640@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47468 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdFPSmY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 14:42:24 -0400
In-Reply-To: <20170616163551.GB17640@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>

On 06/16/2017 11:35 AM, Bjorn Andersson wrote:

> The npins here would allow us to properly name the multiple pins in e.g.
> sdcX_data. But we're not doing this and I would be surprised if anyone
> found it useful to get this in.

But how would that work?  Each group is a single TLMM block, which only 
has one bit for I/O.  You can't actually program more than one pin from 
a group.

struct msm_pingroup {
...
	unsigned in_bit:5;
	unsigned out_bit:5;

This only lets you define one bit for input, and one bit for output, for 
any group.

> So it make sense to hardcode this value in msm_get_group_pins() and drop
> it from the struct.

I might submit a patch for that later.

> 
>>> It's not an awesome solution for mobile either. But to solve this we
>>> have two problems to solve;
>>>
>>> 1) as the XPU configuration isn't fixed we need to be dynamic or
>>> configurable in some sensible way
>>
>> I was planning on updating the TLMM ACPI node to include a property that
>> lists the acceptable GPIOs.
>>
> 
> But this list is related to your XPU configuration and not the TLMM
> block, so the list of enabled/disabled pins should not go in the driver.

It goes in the ACPI table, and the driver reads that, and then (ideally) 
creates an array of msm_pingroup objects that reflects the list in ACPI.

I'm hoping there's a way to modify msm_gpio_init() so that it parses the 
array, and looks for "unavilable" groups.  For example, if npins == 0, 
that would be one way to know that this group doesn't actually exist.

For example, instead of calling gpiochip_add_pin_range(), maybe it would 
call gpiochip_add_pingroup_range() instead.  Unfortunately, I just don't 
understand the gpiochip functions well enough to know what to do.  I 
need help in this area.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
