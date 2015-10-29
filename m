From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: guard uniphier directory with CONFIG_PINCTRL_UNIPHIER
Date: Thu, 29 Oct 2015 14:34:29 +0100
Message-ID: <CACRpkdZ286dBTvd3EO_GTixnS=Cz-ch-H+AzNOJhZwoB63K6jw@mail.gmail.com>
References: <1445912911-1292-1-git-send-email-yamada.masahiro@socionext.com>
	<1445912911-1292-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445912911-1292-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2015 at 3:28 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> CONFIG_PINCTRL_UNIPHIER is more suitable than CONFIG_ARCH_UNIPHIER
> to guard the drivers/pinctrl/uniphier directory.
>
> The current CONFIG_PINCTRL_UNIPHIER_CORE is a bit long
> (it would break the indentation in drivers/pinctrl/Makefile),
> so rename it into CONFIG_PINCTRL_UNIPHIER.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Holding this back until we know what to do with the first patch
but it looks OK.

Yours,
Linus Walleij
