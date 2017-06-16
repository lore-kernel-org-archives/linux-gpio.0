From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 11:07:41 -0500
Message-ID: <4d56b425-10c3-9568-e88c-4ac22ca0c50d@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616155517.GY12920@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60720 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750899AbdFPQHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 12:07:44 -0400
In-Reply-To: <20170616155517.GY12920@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>

On 6/16/17 10:55 AM, Bjorn Andersson wrote:
> npins are the number of "pins" handles by the TLMM, while ngpios are the
> number of GPIO lines. I.e. npins >= ngpios and non platforms where we
> control e.g. sdc properties you can see that npins > ngpios.

I'm talking about the 'npins' in struct msm_pingroup:

struct msm_pingroup {
	const char *name;
	const unsigned *pins;
	unsigned npins;

Every client driver of pinctrl-msm sets this value to 1 for every group.

> It's not an awesome solution for mobile either. But to solve this we
> have two problems to solve;
> 
> 1) as the XPU configuration isn't fixed we need to be dynamic or
> configurable in some sensible way

I was planning on updating the TLMM ACPI node to include a property that 
lists the acceptable GPIOs.

> 2) the pinctrl framework does have some support for sparse pin spaces,
> but this would need to be extended to allow us to (easily) register a
> sparse list of pins

I was hoping there would be a way in pinctrl-msm to tell the framework, 
"Oh, you want to export this pin? Sorry, I forgot to tell you that it 
doesn't exist."

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
