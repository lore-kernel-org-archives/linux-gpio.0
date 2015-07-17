From: Vitaly Andrianov <vitalya@ti.com>
Subject: Re: [PATCH] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Fri, 17 Jul 2015 08:18:55 -0400
Message-ID: <55A8F2AF.6080701@ti.com>
References: <1434647449-5393-1-git-send-email-vitalya@ti.com> <CACRpkda-OSsFdGHN9de00TsQjgdzC1Eg=vHXpeSvqBKH64wPmg@mail.gmail.com> <55A77392.30400@ti.com> <55A7ECE1.2060704@ti.com> <55A88C53.7090408@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:36409 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756933AbbGQMNz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Jul 2015 08:13:55 -0400
In-Reply-To: <55A88C53.7090408@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>



On 07/17/2015 01:02 AM, Sekhar Nori wrote:
> On Thursday 16 July 2015 11:11 PM, Vitaly Andrianov wrote:
>>
>>
>> On 07/16/2015 05:04 AM, Sekhar Nori wrote:
>>> On Tuesday 14 July 2015 07:31 PM, Linus Walleij wrote:
>>>> On Thu, Jun 18, 2015 at 7:10 PM, Vitaly Andrianov <vitalya@ti.com>
>>>> wrote:
>>>>
>>>>> Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
>>>>> "binten" register (offset 8). Previous versions of GPIO only
>>>>> used bit 0, which enables GPIO 0-15 interrupts.
>>>>>
>>>>> Signed-off-by: Reece Pollack <x0183204@ti.com>
>>>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>>>
>>>> Sekhar/Kevin: OK with this? We don't have a maintainer
>>>> listed for davinci GPIO so I assume it's you guys...
>>>
>>> Hi Linus, I had reviewed this patch and there was a v2 send based on my
>>> comments on July 03.
>>>
>>>> Should this be tagged for stable?
>>>
>>> Not sure about that. It affects Keystone devices. Vitaly?
>>>
>>> Thanks,
>>> Sekhar
>>>
>> We used this patch for a long time. So, I guess it is stable.
>
> You misunderstood. Should this patch be marked for backporting to older
> kernels because it fixes a critical issue on devices otherwise working
> in that kernel? See Documentation/stable_kernel_rules.txt
>
> Thanks,
> Sekhar
>
Sorry. As I understand from the stable_kernel_rules.txt this patch _IS_ 
_NOT_ for "-stable"

Thanks,
Vitaly
