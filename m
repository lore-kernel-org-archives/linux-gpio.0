From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Kill unused variable in sh_pfc_remove()
Date: Fri, 29 Apr 2016 11:09:41 +0200
Message-ID: <CACRpkdYvK85EMaZLURrt6MqkV2kv7DTqsq6AdktOsp8dcUmJeQ@mail.gmail.com>
References: <1461666626-24805-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1461666626-24805-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 26, 2016 at 12:30 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> If CONFIG_PINCTRL_SH_PFC_GPIO=n:
>
>     drivers/pinctrl/sh-pfc/core.c: In function 'sh_pfc_remove':
>     drivers/pinctrl/sh-pfc/core.c:649:17: warning: unused variable 'pfc' [-Wunused-variable]
>
> Fixes: 67ec8d7b48463904 ("pinctrl: ish-pfc: Use devm_pinctrl_register() for pinctrl registration")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I won't queue this up in sh-pfc-for-v4.7, as the offending commit is not in
> that branch.

OK patch applied.

Yours,
Linus Walleij
