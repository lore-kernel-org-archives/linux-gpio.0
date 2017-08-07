From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nomadik: fix incorrect type in return expression
Date: Mon, 7 Aug 2017 15:14:12 +0200
Message-ID: <CACRpkdYtgZ-iMeDBXYhtW94Vkvcj81QhqAfz3z-zajCNJV7j3w@mail.gmail.com>
References: <1501822187-25303-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501822187-25303-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 4, 2017 at 6:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Sparse reports "warning: incorrect type in return expression (different
> address spaces)" because nmk_gpio_populate_chip() is supposed to return
> (struct nmk_gpio_chip *) whereas devm_ioremap_resource() returns
> (void __iomem *).  ERR_CAST() is needed to fix the warning.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
