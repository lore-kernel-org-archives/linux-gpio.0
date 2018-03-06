From: Javier Arteaga <javier@emutex.com>
Subject: Re: [PATCH] pinctrl: intel: Implement intel_gpio_get_direction
 callback
Date: Tue, 6 Mar 2018 15:29:06 +0000
Message-ID: <44e5cabd-c772-9fb6-52a4-887ba3c98fcc@emutex.com>
References: <20180306134213.16898-1-javier@emutex.com>
 <3585081b-70af-5c31-08c0-84e96b6055bc@emutex.com>
 <1520348165.10722.438.camel@linux.intel.com>
 <1520348368.10722.440.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520348368.10722.440.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 06/03/2018 14:59, Andy Shevchenko wrote:
> On Tue, 2018-03-06 at 16:56 +0200, Andy Shevchenko wrote:
>> On Tue, 2018-03-06 at 14:31 +0000, Javier Arteaga wrote:
> 
>>>> +static int intel_gpio_get_direction(struct gpio_chip *chip,
>>>> unsigned int offset)
>>>> +{
> 
>>>> +	if (padcfg0 & PADCFG0_PMODE_MASK)
>>>> +		return -EINVAL;
>>
>> Actually we might return direction of GPIO function while pin is in
>> some
>> other mode, though it would probably make not much sense in practice.
> 
> One more though, this is a call back for GPIO function anyway, so, above
> condition should never happen. I think it's safe to remove it
> completely.

The story behind that check is likely *not* a valid usecase: the current
iteration of the UP board drivers use gpiod_get_direction() *while*
requesting GPIOs to mirror SoC GPIO config on the on-board FPGA. So the
direction doesn't make sense for pins set to function mode.

As per your other feedback that driver should be reworked anyway -
that's not a reason to keep the check. I just thought it's a bit more
defensive, and saw there's some precedent of doing this:

    f002d07c56c7 ("gpio: tegra: Implement gpio_get_direction callback")

That being said I don't have a strong argument either way :)
I'll resend if you still feel it's unnecessary.

Thanks for reviewing!
