From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] pinctrl: paris: fix check on EINT_NA comparison
Date: Tue, 25 Sep 2018 17:58:21 +0300
Message-ID: <20180925145821.bwumsuzz4tgsxc4b@mwanda>
References: <20180925132130.27044-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180925132130.27044-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 25, 2018 at 02:21:30PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently, the check on desc->eint.eint_n == EINT_NA is always false
> because this is comparing a u16 to -1 which can never be true.  Fix
> this by casting EINT_NA to u16.
> 
> Fixes: fb5fa8dc151b ("pinctrl: mediatek: extend struct mtk_pin_desc to pinctrl-mtk-common-v2.c")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 4cf0fea30b7d..77d380145dfd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -729,7 +729,7 @@ static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
>  
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>  
> -	if (desc->eint.eint_n == EINT_NA)
> +	if (desc->eint.eint_n == (u16)EINT_NA)

Adding casts is ugly...  I reported this earlier and think Sean Wang is
going to send a fix for it.

regards,
dan carpenter
