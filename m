From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/2] gpio: acpi: acpi_dev_gpio_irq_get: ignore the status
 of unselected irqs
Date: Mon, 13 Mar 2017 20:23:05 +0100
Message-ID: <ef81a5ba-edaa-d6cc-70df-74180269c409@redhat.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
 <1489425824.20145.223.camel@linux.intel.com>
 <3133c2fe-427e-f742-9647-d1f45eeaed4a@redhat.com>
 <1489432753.20145.226.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37720 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754395AbdCMTXS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 15:23:18 -0400
In-Reply-To: <1489432753.20145.226.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

Hi,

On 13-03-17 20:19, Andy Shevchenko wrote:
> On Mon, 2017-03-13 at 18:56 +0100, Hans de Goede wrote:
>> On 13-03-17 18:23, Andy Shevchenko wrote:
>>> On Fri, 2017-03-10 at 21:58 +0100, Hans de Goede wrote:
>
>>> I will incorporate slightly different version of this (due to
>>> changes
>>> happened) into my branch. Please verify if everything is okay.
>>
>> I just noticed that my patch was botched up a bit, it is
>> taking a more complex approach then needed and it contained a bug
>> (it did lookup->index = index, which should be lookup->index = i).
>>
>> I've just finished writing a v2 (sorry).
>
> NP.
>
> Does it mean this one replaces both from v2? (to me looks like)

Yes it replaces both.

>>  I've attached the v2 here,
>> note this is against an unmodified v4.11-rc2 rather then your branch
>> as I needed a clean base to debug some problems. But it should be
>> easy to adapt to your branch I think.
>>
>> Note this can go upstream either way (through your branch or
>> directly since it is based on a clean v4.11-rc2 now) but it is
>> probably easier to take it upstream through your branch to
>> avoid conflicts.
>
> I will rebase my series on your patch, but I'm going to slightly modify
> it anyway (basically squash one of my patches).

Ok, sounds good. If you're going to use my patch as a base,
shall I cherry-pick the version with your changes squashed and
submit that upstream stand-alone ?

Regards,

Hans
