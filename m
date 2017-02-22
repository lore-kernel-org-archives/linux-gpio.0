From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] gpio: aspeed: Add debounce support
Date: Thu, 23 Feb 2017 00:19:05 +1030
Message-ID: <CACPK8XcvoS=UJ37OG1EMeOydQP0k4edte_G4h8AZZsAg2u+rmQ@mail.gmail.com>
References: <20170220144004.10809-1-andrew@aj.id.au> <CACPK8XeJ0fgYZbBGcfGGaRsbqfeH5ZUbrHq3PvHE1DhM3fCQxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33482 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932179AbdBVNt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 08:49:27 -0500
In-Reply-To: <CACPK8XeJ0fgYZbBGcfGGaRsbqfeH5ZUbrHq3PvHE1DhM3fCQxA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Wed, Feb 22, 2017 at 2:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>> +               /*
>> +                * Check if a timer is already configured for the requested
>> +                * debounce period. If so, just add @offset as a user of this
>> +                * timer
>> +                */
>> +               for (i = 0; i < ARRAY_SIZE(debounce_timers); i++) {
>> +                       u32 cycles;
>> +
>> +                       addr = gpio->base + debounce_timers[i];
>> +                       cycles = ioread32(addr);
>> +
>> +                       if (requested_cycles == cycles)
>> +                               break;
>> +               }
>> +
>> +               /* Otherwise, allocate a timer */
>
> Is "otherwise" in reference to the check above? Is the break above
> supposed to be a goto?

I realised later that the if i == ARRAY_SIZE test below will always be
false when the break was hit, so in effect we are doing a goto
"Register @offset as a user of timer i".

I think adding a goto would make it easier to read.

If you're not a fan then perhaps tweak the comment?

Cheers,

Joel

>
>> +               if (i == ARRAY_SIZE(debounce_timers)) {
>> +                       for (i = 0; i < ARRAY_SIZE(gpio->timer_users); i++) {
>> +                               if (gpio->timer_users[i] == 0)
>> +                                       break;
>> +                       }
>> +
>> +                       /* We have run out of timers */
>> +                       if (i == ARRAY_SIZE(gpio->timer_users)) {
>> +                               dev_warn(chip->parent,
>> +                                               "Debounce timers exhausted, cannot debounce for period %luus\n",
>> +                                               usecs);
>> +                               rc = -EPERM;
>> +                               goto err;
>> +                       }
>> +
>> +                       /* Timer update */
>> +                       addr = gpio->base + debounce_timers[i];
>> +                       iowrite32(requested_cycles, addr);
>> +               }
>> +
>> +               /* Register @offset as a user of timer i */
>> +               newdt->offset = offset;
>> +               newdt->timer = i;
>> +               hash_add(gpio->offset_timer, &newdt->node, offset);
