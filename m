From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Thu, 16 Jul 2015 14:34:18 +0530
Message-ID: <55A77392.30400@ti.com>
References: <1434647449-5393-1-git-send-email-vitalya@ti.com> <CACRpkda-OSsFdGHN9de00TsQjgdzC1Eg=vHXpeSvqBKH64wPmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda-OSsFdGHN9de00TsQjgdzC1Eg=vHXpeSvqBKH64wPmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Vitaly Andrianov <vitalya@ti.com>, Kevin Hilman <khilman@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tuesday 14 July 2015 07:31 PM, Linus Walleij wrote:
> On Thu, Jun 18, 2015 at 7:10 PM, Vitaly Andrianov <vitalya@ti.com> wrote:
> 
>> Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
>> "binten" register (offset 8). Previous versions of GPIO only
>> used bit 0, which enables GPIO 0-15 interrupts.
>>
>> Signed-off-by: Reece Pollack <x0183204@ti.com>
>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
> 
> Sekhar/Kevin: OK with this? We don't have a maintainer
> listed for davinci GPIO so I assume it's you guys...

Hi Linus, I had reviewed this patch and there was a v2 send based on my
comments on July 03.

> Should this be tagged for stable?

Not sure about that. It affects Keystone devices. Vitaly?

Thanks,
Sekhar
