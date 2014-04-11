From: Axel Lin <axel.lin@ingics.com>
Subject: Re: gpio: rdc321x: Question about rdc_gpio_direction_input implementation
Date: Fri, 11 Apr 2014 13:56:34 +0800
Message-ID: <CAFRkauAEH68Qhh9hNNdPZdjKEVGyRvFWs4gXnrZQWYvwYKO_AQ@mail.gmail.com>
References: <1397186924.30538.2.camel@phoenix>
	<CAGVrzcbDmm3T7D8GszzeG__fqWuN_fk6SPD1GS8b+bLyqPa+tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:43447 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754610AbaDKF4f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Apr 2014 01:56:35 -0400
Received: by mail-qc0-f178.google.com with SMTP id i8so5448490qcq.37
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 22:56:35 -0700 (PDT)
In-Reply-To: <CAGVrzcbDmm3T7D8GszzeG__fqWuN_fk6SPD1GS8b+bLyqPa+tg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <florian@openwrt.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2014-04-11 12:53 GMT+08:00 Florian Fainelli <florian@openwrt.org>:
> Hi Axel,
>
> 2014-04-10 20:28 GMT-07:00 Axel Lin <axel.lin@ingics.com>:
>> Hi Florian,
>> Current implementation in rdc_gpio_direction_input() looks wrong to me
>> because calling rdc_gpio_config(chip, gpio, 1) actually set the gpio to
>> OUTPUT HIGH rather than set the direction to INPUT.
>>
>> I cannot find the datasheet, I'm wondering if below diff works.
>> Any chance to test it? I can send a formal patch if it works.
>
> The datasheet is available here:
> http://www.atekmicro.com/download/r8610/R8610-G.pdf
>
> I do not have access to the hardware at this very moment, but I should
> be able to give this a try. I do not think GPIO input was tested at
> all, the GPIO LEDs and such were driven as active outputs.
>
Just check the datasheet and I got confused.

The bits in reg1_ctrl_base/reg2_ctrl_base register is to enable/disable GPIOx
function.
However, I cannot find the register to set gpio direction.

There is a note in 4.4 says
"Note 4: Programmed by the GPIO mode & dir. Register. ".
But I cannot find the GPIO mode & dir. Register.

Regards,
Axel
