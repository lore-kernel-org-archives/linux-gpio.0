From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 0/2] GPIO support for Socionext Synquacer
Date: Tue, 31 Oct 2017 12:59:33 +0000
Message-ID: <CAKv+Gu9iGLsmhOkBfJkcVKUaV26-dwTHaFgDsiwutAahkG6BrA@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
 <CACRpkdbfM6SuXxkbfcmJ-JxK1Mt=oxy1qN3rEawoNb8gpmjM9Q@mail.gmail.com> <CAKv+Gu-20f8VXW1x1T5BVoFwFiiNsS1XYvrA7XPo438-C6=u+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:52456 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdJaM7e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 08:59:34 -0400
Received: by mail-io0-f194.google.com with SMTP id f20so34812274ioj.9
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 05:59:34 -0700 (PDT)
In-Reply-To: <CAKv+Gu-20f8VXW1x1T5BVoFwFiiNsS1XYvrA7XPo438-C6=u+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>

On 31 October 2017 at 12:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 31 October 2017 at 12:20, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Oct 27, 2017 at 10:21 PM, Ard Biesheuvel
>> <ard.biesheuvel@linaro.org> wrote:
>>
>>> The Socionext Synquacer SC2A11, which is used in the arm64 Developer Box,
>>> shares its GPIO IP with a Fujitsu SoC for which we already have support
>>> in the tree. So let's tweak it so that we can reuse it.
>>>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Ard Biesheuvel (2):
>>>   gpio: mb86s7x: share with other SoCs as module
>>>   gpio: mb86s70: Revert "Return error if requesting an already assigned
>>>     gpio"
>>
>> Nice. We might need to look into the following wrt this driver:
>>
>> - Using generic MMIO GPIO, i.e. select GPIO_GENERIC in Kconfig
>>   and a patch such as commit 6d125412fc16802012a17665638f49b0b0c81f18
>>   "gpio: iop: Use generic GPIO MMIO functions for driver"
>>   apart from reduced code size this brings the .get_multiple() and
>>   .set_multiple() callbacks for FREE.
>>   The fact that the driver is so simple that it should have been using
>>   MMIO/GENERIC GPIO is a plain oversight during review.
>>
>
> Does this work with the layout if this chip? It has 32 GPIO lines,
> whose controls are mapped onto the lowest 8 bits of 4 adjacent 32-bit
> registers.
>
>> - When submitting the DTS for that developer box, make sure that
>>   the 96boards header has proper GPIO line names from day 1,
>>   see e.g.
>>   commit bbaf867e2d3796bca465d07ffcd800a3bd570861
>>   "arm64: dts: hikey: name the GPIO lines"
>>
>
> I currently have this in my DTS:
>
> &gpio {
>     dsw3_1 {
>         gpios = <0 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_2 {
>         gpios = <1 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_3 {
>         gpios = <2 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_4 {
>         gpios = <3 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_5 {
>         gpios = <4 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_6 {
>         gpios = <5 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_7 {
>         gpios = <6 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_8 {
>         gpios = <7 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
> for the 8 DIP switches that are connected to GPIO lines. There are
> more assigned, to various function, and 8 of them are routed to the
> 96boards low speed connector as well.
>
>> Ard: if you have this machine on your desk help with the above would
>> be much appreciated (plus it's fun!) thanks a bunch :)
>>
>
> Of course, if you help me understand it :-)
>
> So I can add the names for all the lines that have a purpose, but is
> that orthogonal to hogging?

OK, so i now have

# cat /sys/kernel/debug/gpio
gpiochip0: GPIOs 480-511, parent: platform/51000000.gpio, 51000000.gpio:
 gpio-480 (DSW3-PIN1           |dsw3_1              ) in  lo
 gpio-481 (DSW3-PIN2           |dsw3_2              ) in  lo
 gpio-482 (DSW3-PIN3           |dsw3_3              ) in  lo
 gpio-483 (DSW3-PIN4           |dsw3_4              ) in  hi
 gpio-484 (DSW3-PIN5           |dsw3_5              ) in  hi
 gpio-485 (DSW3-PIN6           |dsw3_6              ) in  lo
 gpio-486 (DSW3-PIN7           |dsw3_7              ) in  lo
 gpio-487 (DSW3-PIN8           |dsw3_8              ) in  lo
 gpio-488 (NC                  )
 gpio-489 (PWROFF#             )
 gpio-490 (GPIO-A              )
 gpio-491 (GPIO-B              )
 gpio-492 (GPIO-C              )
 gpio-493 (GPIO-D              )
 gpio-494 (PCIE1EXTINT         )
 gpio-495 (PCIE0EXTINT         )
 gpio-496 (PHY2-INT#           )
 gpio-497 (PHY1-INT#           )
 gpio-498 (GPIO-E              )
 gpio-499 (GPIO-F              )
 gpio-500 (GPIO-G              )
 gpio-501 (GPIO-H              )
 gpio-502 (GPIO-I              )
 gpio-503 (GPIO-J              )
 gpio-504 (GPIO-K              )
 gpio-505 (GPIO-L              )
 gpio-506 (PEC-PD26            )
 gpio-507 (PEC-PD27            )
 gpio-508 (PEC-PD28            )
 gpio-509 (PEC-PD29            )
 gpio-510 (PEC-PD30            )
 gpio-511 (PEC-PD31            )

after adding this

    gpio-line-names = "DSW3-PIN1", "DSW3-PIN2", "DSW3-PIN3", "DSW3-PIN4",
                      "DSW3-PIN5", "DSW3-PIN6", "DSW3-PIN7", "DSW3-PIN8",
                      "NC", "PWROFF#",
                      "GPIO-A", "GPIO-B", "GPIO-C", "GPIO-D",
                      "PCIE1EXTINT", "PCIE0EXTINT",
                      "PHY2-INT#", "PHY1-INT#",
                      "GPIO-E", "GPIO-F", "GPIO-G", "GPIO-H",
                      "GPIO-I", "GPIO-J", "GPIO-K", "GPIO-L",
                      "PEC-PD26", "PEC-PD27", "PEC-PD28",
                      "PEC-PD29", "PEC-PD30", "PEC-PD31";

to the DT node of the GPIO controller.
