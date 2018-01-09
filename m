From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: Add Microsemi Ocelot SoC driver
Date: Tue, 9 Jan 2018 14:56:36 +0100
Message-ID: <CACRpkdaCfjW7hWS1VnC6MR+j48=Q0uo7OSMA_6G90D7Cz7NMZA@mail.gmail.com>
References: <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
 <20180106000926.13770-1-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180106000926.13770-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jan 6, 2018 at 1:09 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:

> The Microsemi Ocelot SoC has a few pins that can be used as GPIOs or take
> multiple other functions. Add a driver for the pinmuxing and the GPIOs.
>
> There is currently no support for interrupts.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  - use  pinctrl_gpio_direction_input/output from
>    ocelot_gpio_direction_input/output
>  - add a comment for ALT0/ALT1
>  - fill .max_register of ocelot_pinctrl_regmap_config

Patch applied. And it looks very good too.

This was all I had to do, right? No dependent patches?

Yours,
Linus Walleij
