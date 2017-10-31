From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] GPIO support for Socionext Synquacer
Date: Tue, 31 Oct 2017 14:10:05 +0100
Message-ID: <CACRpkdbRKLyWhBiLr7CPh26nQ2-KRKyy=pk_SO0TWi97BUssdw@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
 <CACRpkdbfM6SuXxkbfcmJ-JxK1Mt=oxy1qN3rEawoNb8gpmjM9Q@mail.gmail.com>
 <CAKv+Gu-20f8VXW1x1T5BVoFwFiiNsS1XYvrA7XPo438-C6=u+A@mail.gmail.com> <CAKv+Gu9iGLsmhOkBfJkcVKUaV26-dwTHaFgDsiwutAahkG6BrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:52508 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751539AbdJaNKH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 09:10:07 -0400
Received: by mail-io0-f195.google.com with SMTP id f20so34889662ioj.9
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 06:10:07 -0700 (PDT)
In-Reply-To: <CAKv+Gu9iGLsmhOkBfJkcVKUaV26-dwTHaFgDsiwutAahkG6BrA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>

On Tue, Oct 31, 2017 at 1:59 PM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> OK, so i now have
>
> # cat /sys/kernel/debug/gpio

"lsgpio" from tools/gpio/lsgpio.c is even nicer, but OK :)

> gpiochip0: GPIOs 480-511, parent: platform/51000000.gpio, 51000000.gpio:
>  gpio-480 (DSW3-PIN1           |dsw3_1              ) in  lo
>  gpio-481 (DSW3-PIN2           |dsw3_2              ) in  lo
>  gpio-482 (DSW3-PIN3           |dsw3_3              ) in  lo
>  gpio-483 (DSW3-PIN4           |dsw3_4              ) in  hi
>  gpio-484 (DSW3-PIN5           |dsw3_5              ) in  hi
>  gpio-485 (DSW3-PIN6           |dsw3_6              ) in  lo
>  gpio-486 (DSW3-PIN7           |dsw3_7              ) in  lo
>  gpio-487 (DSW3-PIN8           |dsw3_8              ) in  lo
>  gpio-488 (NC                  )
>  gpio-489 (PWROFF#             )
>  gpio-490 (GPIO-A              )
>  gpio-491 (GPIO-B              )
>  gpio-492 (GPIO-C              )
>  gpio-493 (GPIO-D              )
>  gpio-494 (PCIE1EXTINT         )
>  gpio-495 (PCIE0EXTINT         )
>  gpio-496 (PHY2-INT#           )
>  gpio-497 (PHY1-INT#           )
>  gpio-498 (GPIO-E              )
>  gpio-499 (GPIO-F              )
>  gpio-500 (GPIO-G              )
>  gpio-501 (GPIO-H              )
>  gpio-502 (GPIO-I              )
>  gpio-503 (GPIO-J              )
>  gpio-504 (GPIO-K              )
>  gpio-505 (GPIO-L              )
>  gpio-506 (PEC-PD26            )
>  gpio-507 (PEC-PD27            )
>  gpio-508 (PEC-PD28            )
>  gpio-509 (PEC-PD29            )
>  gpio-510 (PEC-PD30            )
>  gpio-511 (PEC-PD31            )
>
> after adding this
>
>     gpio-line-names = "DSW3-PIN1", "DSW3-PIN2", "DSW3-PIN3", "DSW3-PIN4",
>                       "DSW3-PIN5", "DSW3-PIN6", "DSW3-PIN7", "DSW3-PIN8",
>                       "NC", "PWROFF#",
>                       "GPIO-A", "GPIO-B", "GPIO-C", "GPIO-D",
>                       "PCIE1EXTINT", "PCIE0EXTINT",
>                       "PHY2-INT#", "PHY1-INT#",
>                       "GPIO-E", "GPIO-F", "GPIO-G", "GPIO-H",
>                       "GPIO-I", "GPIO-J", "GPIO-K", "GPIO-L",
>                       "PEC-PD26", "PEC-PD27", "PEC-PD28",
>                       "PEC-PD29", "PEC-PD30", "PEC-PD31";
>
> to the DT node of the GPIO controller.

Perfect. Proper naming of GPIO-A thru L gives userspace an
easy time to get a grip on the right GPIO line on the Low Speed
Connector.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
