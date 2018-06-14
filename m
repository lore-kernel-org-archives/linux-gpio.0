From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: Re: [PATCH 2/2] gpio: davinci: Do not assume continuous IRQ numbering
Date: Thu, 14 Jun 2018 23:02:09 +0530
Message-ID: <3ac5bf3e-6e56-b190-aa97-df850f2545bb@ti.com>
References: <1528276734-1483-1-git-send-email-j-keerthy@ti.com>
 <1528276734-1483-2-git-send-email-j-keerthy@ti.com>
 <CACRpkdbFyZwG4S9t3ts3wmVWioadd7NjpdMUkq-wujH=g68zvw@mail.gmail.com>
 <711dc0a5-9099-dbc9-6f8f-f37caf69105f@ti.com>
 <CACRpkdYOrg2M4zcomaGu_uUGMdnajwtoD-voETp-dRvL2WJpCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYOrg2M4zcomaGu_uUGMdnajwtoD-voETp-dRvL2WJpCA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org



On 6/14/2018 4:48 PM, Linus Walleij wrote:
> On Thu, Jun 14, 2018 at 10:51 AM, Keerthy <j-keerthy@ti.com> wrote:
> 
>>> I think the idea is to make it possible to use GPIOLIB_IRQCHIP
>>> for banked IRQs but the infrastructure is not yet inside the gpiolib
>>> so it is a bit taped on the side right now.
>>
>> Okay. I will take a look at that. The key issue that this patch
>> addresses is that currently driver only calls platform_get_irq once and
>> assumes the rest are continuous which is wrong hence the key issue
>> addressed with this patch is to call platform_get_irq for each interrupt.
>>
>> The version 4 is here:
>>
>> https://patchwork.kernel.org/patch/10461537/
>>
>> I will try to follow up with generic gpiochip_irq_map/unmap once i get
>> that working. Hope that is okay?
> 
> Oh that's fine, I'll merge it.

Thanks!

> 
> Just wanted you to have a look at Thierry's stuff so we can share
> more code, you're a core developer so I wanted some smart people
> to look at this.

Sure Linus!

> 
> Yours,
> Linus Walleij
> 
