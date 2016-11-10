From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v2] gpio: mxc: Shift generic request/free after gpiochip
 registration
Date: Thu, 10 Nov 2016 14:35:38 +0200
Message-ID: <d7e3c21a-48ec-e654-701a-7e6b5556f03a@mentor.com>
References: <1477418567-28347-1-git-send-email-deepak_das@mentor.com>
 <CACRpkdYg2nKO5i7_5q0Hp3rvqmGiPCkueXxp7JnGTsJ-Mb1wAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:59192 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932595AbcKJMfp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2016 07:35:45 -0500
In-Reply-To: <CACRpkdYg2nKO5i7_5q0Hp3rvqmGiPCkueXxp7JnGTsJ-Mb1wAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Deepak Das <deepak_das@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>

Hi Linus, Deepak,

On 11/02/2016 12:55 AM, Linus Walleij wrote:
> On Tue, Oct 25, 2016 at 8:02 PM, Deepak Das <deepak_das@mentor.com> wrote:
>
>> generic gpio request/free should be added after gpiocip registration
>> to validate mapping of gpiochip with pinctrl subsystem.
>>
>> gpiochip->pin_ranges list contains the information used by pinctrl
>> subsystem to configure corresponding pins for gpio usage.
>> This list will be empty if gpiochip fails to map with
>> pinctrl subsystem for any reason.
>> For Ex.:-
>> generic gpio request/free should not be used if IOMUX pin controller
>> device node is disabled in device tree.
>>
>> This commit checks above list and skips adding generic gpio request/free
>> if list is found empty.
>>
>> Signed-off-by: Deepak Das <deepak_das@mentor.com>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>
> So we should not dereference gpiolib internals.
>
>> -       if (of_property_read_bool(np, "gpio-ranges")) {
>> -               port->gc.request = gpiochip_generic_request;
>> -               port->gc.free = gpiochip_generic_free;
>> -       }
>> -
>>         port->gc.to_irq = mxc_gpio_to_irq;
>>         port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
>>                                              pdev->id * 32;
>> @@ -471,6 +466,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>         if (err)
>>                 goto out_bgio;
>>
>> +       if (!list_empty(&port->gc.pin_ranges)) {
>> +               port->gc.request = gpiochip_generic_request;
>> +               port->gc.free = gpiochip_generic_free;
>> +       }
>
> Can't you just check the "gpio-ranges" property later instead?

The change was done for a kernel when of_gpiochip_add_pin_range() did not
return an error code and the change is not applicable to the vanilla kernel.

Potentially of_gpiochip_add_pin_range() may fail due to some other reason
than a missing pinctrl device from the supplied phandle (e.g. -ENOMEM),
but in that case gpiochip_add_data() will also fail and the late check
for empty pin_ranges becomes redundant.

Originally the change is needed exclusively to cover the case, when IOMUX
device node is removed or disabled in a board DTB, while GPIOs still can
be requested by other controller drivers. The disabled pinctrl device case
(pinmux/pinctrl settings are done from a bootloader only) is inapplicable
to any boards found in upstream, so I would propose *not* to include this
change or any its derivative fix to the upstream.

If somebody wants to support the scenario described above on a board not
found in vanilla, the best option is to remove gpio-ranges proporty from
the board DTS file along with disabling IOMUX, then the GPIO driver in
its currently existing state can be successfully reused without any
runtime issues.

--
With best wishes,
Vladimir
