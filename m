From: "Fried, Ramon" <ramon.fried@linux.intel.com>
Subject: Re: RFC: gpio: mmio: add support for 3 direction regs
Date: Thu, 3 Jan 2019 10:51:02 +0200
Message-ID: <28205214-d395-1c17-51ee-970300b6a14e@linux.intel.com>
References: <32edfd70-95dc-26a1-2ea6-143344cb2384@linux.intel.com>
 <ca7c1b99-4166-652b-aa53-8272aa66eb73@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca7c1b99-4166-652b-aa53-8272aa66eb73@mentor.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linus.walleij@linaro.org, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vladimir.kondratiev@linux.intel.com
List-Id: linux-gpio@vger.kernel.org


On 1/3/2019 10:07, Vladimir Zapolskiy wrote:
> Hi Ramon,
>
> On 01/03/2019 09:36 AM, Fried, Ramon wrote:
>> Hi.
>>
>> I'm working on a driver for STA2X11 GPIO controller who seems to fit
>> best to the generic mmio driver,
> I hope you have seen the existing driver drivers/gpio/gpio-sta2x11.c
I surely did. we have the same IP in our soc but it was changed a lot internally, don't want to litter the original.
>
>> the only problem I have is with the dir register case. The STA2X11
>> has 3 registers for dir, one for data, one for set and one for
>> clear. The generic-mmio driver has support for this fashion for the
>> dat & set & clear registers but not for dirout/dirin registers.
>>
>> I wonder if support for this is generic enough to deserve a patch, if
>> so I'm willing to quickly add this support, if not, adding a flag
>> such as below, will allow partly using the generic mmio driver only
>> for set/get and the direction can be handled outside the driver.
>>
> If gpio-mmio fits well, then it might be simpler to set a flag
> BGPIOF_UNREADABLE_REG_DIR, then call bgpio_init() and then overwrite
> .direction_input, .direction_output and .get_direction callbacks,
> as a reference you can take a look at gpio-74xx-mmio.c

Nice.
That's an option I didn't think of, better than setting the flag. what about adding the generic support ?

>
> --
> Best wishes,
> Vladimir
