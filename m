From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: msm: allow the gpio base to be configurable
Date: Fri, 26 Jan 2018 07:16:51 -0600
Message-ID: <5bcf9545-37ee-18b5-33d9-7ce3da9b0048@codeaurora.org>
References: <1516915209-28295-1-git-send-email-timur@codeaurora.org>
 <CACRpkda6FLfUhqOPqJfCHm1PHOWg=CY=wOCDyrd78eMx+-zrZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60336 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751377AbeAZNQy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jan 2018 08:16:54 -0500
In-Reply-To: <CACRpkda6FLfUhqOPqJfCHm1PHOWg=CY=wOCDyrd78eMx+-zrZw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>

On 1/26/18 7:01 AM, Linus Walleij wrote:
> This is a feature not a bug. It encourages people not to
> depend on the global GPIO numberspace.
> 
> Just set it to -1.

If I change it to -1, then I think I'm going to break every existing MSM 
platform that depends on the base address being 0, because then every 
MSM driver will have a non-zero base, and none of the existing drivers 
register more than one GPIO device.

So how about this:

	static int base = 0;

	chip->base = base;
	base = -1;

This way, existing code works as before.  If any driver registers two 
GPIO devices, the first one will get a base of 0, and the second one 
will get some other base.

>> gpiochip_find_base: found new base at 437
> (...)
>> gpiochip_find_base: found new base at 362
> These are awesome bases, just beautiful. Use this.
> 
> If you don't like seeing GPIO base numbers like this: use things
> like the chardev and the tools in tools/gpio or libgpiod when
> developing, and you will never see them. They should not make
> a difference anyway.

Can you tell me more about the chardev?  I've always been using "echo X 
 > /sys/class/gpio/export", so I guess that's not the right way to do 
things.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
