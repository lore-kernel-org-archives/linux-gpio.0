From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio / ACPI: Add label to the gpio request
Date: Tue, 30 Jun 2015 08:32:30 +0200
Message-ID: <CACRpkdY-Zm+Yoh5NuVHShgGDNWKW9jqwGHNYKgGoz5YgRK4bgw@mail.gmail.com>
References: <20150614220057.GC29802@yumi.tdiedrich.de>
	<CAAVeFu+dfc3vH73_uhwDftrd0OEYrX0ZiqK1MSAqsCcpKpzRTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34982 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbbF3Gca (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 02:32:30 -0400
Received: by obbop1 with SMTP id op1so295755obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2015 23:32:30 -0700 (PDT)
In-Reply-To: <CAAVeFu+dfc3vH73_uhwDftrd0OEYrX0ZiqK1MSAqsCcpKpzRTw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Tobias Diedrich <ranma+kernel@tdiedrich.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 15, 2015 at 4:29 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Mon, Jun 15, 2015 at 7:00 AM, Tobias Diedrich
> <ranma+kernel@tdiedrich.de> wrote:
>> In leds-gpio.c create_gpio_led only the legacy path propagates the label
>> by passing it into devm_gpio_request_one. Similarily gpio_keys_polled.c
>> also neglects to propagate the name to the gpio subsystem.
>>
>> On the newer devicetree/acpi path the label is lost as far as the GPIO
>> subsystem goes (it is only retained as name in struct gpio_led.
>>
>> Amend devm_get_gpiod_from_child to take an additonal (optional) label
>> argument and propagate it so it will show up in /sys/kernel/debug/gpio.
>>
>> So instead of:
>>
>> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>>  gpio-475 (?                   ) in  hi
>>  gpio-477 (?                   ) out hi
>>  gpio-478 (?                   ) out lo
>>  gpio-479 (?                   ) out hi
>>
>> we get the much nicer output:
>>
>> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>>  gpio-475 (switch1             ) in  hi
>>  gpio-477 (led1                ) out hi
>>  gpio-478 (led2                ) out lo
>>  gpio-479 (led3                ) out hi
>
> We want to reuse higher-level information (like the con_id) as much as
> possible to generate labels, but in the case of
> devm_get_gpiod_from_child() there is no such information available
> anyway, so why not.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

I don't have the actual v2 patch in my inbox :(

Tobias, can you resend a v3 with the ACKs.

Yours,
Linus Walleij
