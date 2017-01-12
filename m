From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/3] gpio: gpio-rz: GPIO driver for Renesas RZ series
Date: Thu, 12 Jan 2017 11:50:29 +0100
Message-ID: <a837aa4e-4f77-b29f-2032-c4005f984261@jmondi.org>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1483990318-26927-3-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdbMVu1pe9fYf+DRsnm7Uy_S3T+TONs5qKYWXOLfLDJzwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50318 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751620AbdALKuk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 05:50:40 -0500
In-Reply-To: <CACRpkdbMVu1pe9fYf+DRsnm7Uy_S3T+TONs5qKYWXOLfLDJzwQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, chris.brandt@renesas.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,
     thanks for review

On 11/01/2017 15:55, Linus Walleij wrote:
> On Mon, Jan 9, 2017 at 8:31 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

>
>> +static void rz_gpio_free(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       pinctrl_free_gpio(chip->base + offset);
>> +
>> +       /* Set the GPIO as an input to ensure that the next GPIO request won't
>> +       * drive the GPIO pin as an output.
>> +       */
>> +       rz_gpio_direction_input(chip, offset);
>> +}
>
> Very close to gpiochip_generic_free()
>
> Maybe we should actually set lines as input in the
> generic routine!
>

Is it ok then to simply substitute "pinctrl_free_gpio" with 
"gpiochip_generic_free" and keep rz_gpio_direction_input here?


>> +       gpio_chip = &p->gpio_chip;
>> +       gpio_chip->direction_input = rz_gpio_direction_input;
>> +       gpio_chip->get = rz_gpio_get;
>> +       gpio_chip->direction_output = rz_gpio_direction_output;
>
> Please implement .get_direction() as well.
>

That's funny how a simple addition like this one would require several 
changes (possibly even in the dts ABI defined by this driver).

This is more a question for the original driver author I hope is 
listening here:

To read the pin direction I would need to add one more register to the 
"reg" property range provided in the DTS.
This is of course doable, but I would have two questions here:
- why did you chose to use PMSR register instead of reading/writing 
directly to PM? Am I missing something?
- wouldn't it be better to just receive the port base address from the 
"reg" property and offset from that instead of having the 3 register 
addresses specified in the dts?

See, the dts now looks like this:

reg = <0xfcfe3100 0x4>, /* PSR */
       <0xfcfe3200 0x2>, /* PPR */
       <0xfcfe3800 0x4>; /* PMSR */

Shouldn't we just receive the gpiochip base address and the offset as we 
like?

Thanks
    j
