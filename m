From: Andrew Cooks <andrew.cooks@opengear.com>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Fri, 22 Dec 2017 11:17:25 +1000
Message-ID: <5e17a846-b2c6-c078-3d90-bbf19aea2a8a@opengear.com>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
 <2142688.oNeEzK9Weu@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-co1nam03on0063.outbound.protection.outlook.com ([104.47.40.63]:53374
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752165AbdLVBRn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Dec 2017 20:17:43 -0500
In-Reply-To: <2142688.oNeEzK9Weu@debian64>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, alan@mizrahi.com.ve

Hi Christian

On 21/12/17 23:02, Christian Lamparter wrote:
> On Thursday, December 21, 2017 8:25:03 AM CET Andrew Cooks wrote:
>> I'm working on gpio for an AMD Family 16h Model 30h system[1]. 
>> The SoC is the same as the GX412-TC used in the PC Engines APU2. 
>>
>> There is an out-of-tree gpio driver (gpio-amd) for this SoC in the
>> meta-amd yocto layer[2]. Another driver (gpio-sb8xx) was submitted
>> for upstream inclusion, but was knocked back with the suggestion
>> that pinctrl is the way forward[3].
>>
>> I would much prefer to use a mainline driver for the system I'm 
>> working on, so I'm looking at the pinctrl-amd driver to see
>> whether it applies to our SoC, or whether it could be extended,
>> or used as starting point for a new driver.
>>
>> The out-of-tree drivers apply to the GX412-TC SoC and uses PCI
>> for probing:
> 
> Just a FYI: due to these difficulties with getting a gpio driver
> upstream, Alan Mizrahi upstreamed an in-kernel led-apu.c driver [0]
> that sort of bypasses the whole pinctrl vs gpio issue.

Thanks, I saw that and was somewhat surprised to see it accepted.

> 
> If you are just after LEDs or gpio-keys you probably can go the same
> route?

I could. The gpio-amd driver in the meta-amd yocto layer, which is already functional, is another workable alternative. However, I would prefer the more elegant mainline pinctrl solution, if it's attainable.

Thanks

Andrew

