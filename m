From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rzn1: remove unnecessary unsigned integer comparison
Date: Fri, 12 Oct 2018 11:17:27 +0200
Message-ID: <CACRpkdb9b6kxgj736OmLhBvzhR26DT+bE2Y=jGaMB3411oa3yw@mail.gmail.com>
References: <20181011204042.GA17125@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011204042.GA17125@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Sorry for top-posting, Geert is maintainer for this driver.

Yours,
Linus Walleij

On Thu, Oct 11, 2018 at 10:40 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> There is no need to compare ipctl->mdio_func[mdio] with => 0, because
> such comparison is always true. Notice that *mdio_func* is of type
> u32 (32 bits, unsigned).
>
> Fix this by removing such comparison.
>
> Addresses-Coverity-ID: 1474166 ("Unsigned compared against 0")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/pinctrl/pinctrl-rzn1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
> index ce05e3a..b5650d8 100644
> --- a/drivers/pinctrl/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/pinctrl-rzn1.c
> @@ -195,7 +195,7 @@ static void rzn1_hw_set_lock(struct rzn1_pinctrl *ipctl, u8 lock, u8 value)
>  static void rzn1_pinctrl_mdio_select(struct rzn1_pinctrl *ipctl, int mdio,
>                                      u32 func)
>  {
> -       if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
> +       if (ipctl->mdio_func[mdio] != func)
>                 dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n", mdio);
>         ipctl->mdio_func[mdio] = func;
>
> --
> 2.7.4
>
