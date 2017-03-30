From: Simon Hatliff <hatliff@cadence.com>
Subject: Re: [PATCH 1/2] gpio: Add a driver for Cadence GPIO controller
Date: Thu, 30 Mar 2017 18:26:01 +0100
Message-ID: <3422ee23-53b5-8d09-2a5e-d700358ab09d@cadence.com>
References: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
 <CACRpkdZ6w_tuzSNmFE=2BpeASNOSq0cV4fYM6F8-57Q2+3n-aQ@mail.gmail.com>
 <20170330132946.41314874@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from keymaster.Cadence.COM ([158.140.2.26]:46695 "EHLO
        mx-sanjose5.cadence.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933641AbdC3SMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Mar 2017 14:12:13 -0400
In-Reply-To: <20170330132946.41314874@bbrezillon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Hi Boris, Linus,

On 30/03/17 12:29, Boris Brezillon wrote:
> Hi Linus,
>
> On Thu, 30 Mar 2017 11:03:45 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> On Wed, Mar 29, 2017 at 6:04 PM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>>
>>> Add a driver for Cadence GPIO controller.
>> IIUC Cadence do a lot of things. Are there variants of this controller?
> I'll let Simon answer that one.
This is a controller that has been around since 2000.  It is not 
configurable in any way, so there are no variants.  Cadence do not offer 
any other GPIO controllers as IP.
>>> +static irqreturn_t cdns_gpio_irq_handler(int irq, void *dev)
>>> +{
>>> +       struct cdns_gpio_chip *cgpio = dev;
>>> +       unsigned long status;
>>> +       int hwirq;
>>> +
>>> +       /*
>>> +        * FIXME: If we have an edge irq that is masked we might lose it
>>> +        * since reading the STATUS register clears all IRQ flags.
>>> +        * We could store the status of all masked IRQ in the cdns_gpio_chip
>>> +        * struct but we then have no way to re-trigger the interrupt when
>>> +        * it is unmasked.
>>> +        */
>> It is marked FIXME but do you think it can even be fixed? It seems
>> like a hardware flaw. :(
> Maybe not. Unless Simon comes up with a magic register to re-trigger an
> interrupt :-).
There are no plans to update the controller.
> Another solution would be to write 0xffffffff into CDNS_GPIO_OUTPUT_EN
> at probe time so that each time CDNS_GPIO_DIRECTION_MODE is modified to
> set a pin in output mode, the CDNS_GPIO_OUTPUT_EN is already correctly
> configured.
> Simon, would that work? Is there a good reason to keep a bit in
> CDNS_GPIO_OUTPUT_EN set to 0 when the GPIO is in input mode (power
> consumption?)?
If direction_mode is set to input then output_en is ignored so this 
should work.  The hardware defaults to output mode, so as long as you 
set all pins to input mode before you set all output_en bits there 
should be no negative effect.

Cheers,
-- Simon
