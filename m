From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: remove eMMC hardware reset pin-mux
Date: Tue, 31 Oct 2017 10:15:37 +0100
Message-ID: <CACRpkdYRg-mkqZ7_bCt6aKkd=vBm2sCeu_xhJ15KdsaLvgOAwg@mail.gmail.com>
References: <1508818271-6298-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508818271-6298-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 24, 2017 at 6:11 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This is handled by the mmc-pwrseq-emmc driver, which controls
> an eMMC hardware reset via a GPIO line.
>
> Remove it from the function pin-mux settings.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
