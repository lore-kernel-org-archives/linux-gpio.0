From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] ARM: pinctrl: sunxi-pinctrl: fix pin funtion can
 not be match correctly.
Date: Wed, 10 Jan 2018 14:45:06 +0100
Message-ID: <CACRpkdZrNp7eBCLLPOmCTjdZpi1hzLVrzYSYSw7DeoXMnAWGNw@mail.gmail.com>
References: <20180109055902.GA1306@arx-s1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180109055902.GA1306@arx-s1>
Sender: linux-kernel-owner@vger.kernel.org
To: hao_zhang <hao5781286@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 9, 2018 at 6:59 AM, hao_zhang <hao5781286@gmail.com> wrote:

> Pin function can not be match correctly when SUNXI_PIN describe with
> mutiple variant and same function.
>
> such as:
> on pinctrl-sun4i-a10.c
>
> SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
>                 SUNXI_FUNCTION(0x0, "gpio_in"),
>                 SUNXI_FUNCTION(0x1, "gpio_out"),
>                 SUNXI_FUNCTION_VARIANT(0x2, "pwm",    /* PWM0 */
>                         PINCTRL_SUN4I_A10 |
>                         PINCTRL_SUN7I_A20),
>                 SUNXI_FUNCTION_VARIANT(0x3, "pwm",    /* PWM0 */
>                         PINCTRL_SUN8I_R40)),
>
> it would always match to the first variant function
> (PINCTRL_SUN4I_A10, PINCTRL_SUN7I_A20)
>
> so we should add variant compare on it.
>
> Regards
> Hao
>
> Signed-off-by: hao_zhang <hao5781286@gmail.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
