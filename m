From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/7] pinctrl: UniPhier: add UniPhier ProXstream2
 pinctrl driver
Date: Thu, 16 Jul 2015 09:33:29 +0200
Message-ID: <CACRpkdZjiMc81F1=FeG7jGY7kxeaFOc-gKNZ9-Ud2f_x5b9KBg@mail.gmail.com>
References: <1436841607-7556-1-git-send-email-yamada.masahiro@socionext.com>
	<1436841607-7556-7-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436841607-7556-7-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 14, 2015 at 4:40 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Add pin configuration and pinmux support for UniPhier ProXstream2
> SoC.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - sort groups and funcs alphabetically
>   - add i2c pin-mux settings
>   - sort members of platform_driver
>   - change to tristate
>   - add THIS_MODULE to pinctrl_desc
>   - use module_platform_driver

Patch applied.

Yours,
Linus Walleij
