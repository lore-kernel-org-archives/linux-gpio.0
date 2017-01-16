From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH][V2] pinctrl: ti-iodelay: remove redundant pin < 0 check
 on unsigned int
Date: Mon, 16 Jan 2017 09:45:57 -0600
Message-ID: <CAL_JsqKoRr+VrtgNNHCTH5492N9k+sgiGhX778OEAmsYT7wYjw@mail.gmail.com>
References: <20170113210636.5173-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170113210636.5173-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2017 at 3:06 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> pin is an unsigned int and therefore can never be < 0 so
> this check is redundant. Remove the check and the associated
> dev_err error message.

Not sure why I got copied on this...

> Fixes CoverityScan CID#1396438 ("Unsigned compared against 0")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 6 ------

This file doesn't exist in mainline.

>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> index 3b86d3d..a345166 100644
> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> @@ -665,12 +665,6 @@ static void ti_iodelay_pin_dbg_show(struct pinctrl_dev *pctldev,
>         r = iod->reg_data;
>
>         offset = ti_iodelay_pin_to_offset(iod, pin);
> -       if (pin < 0) {

Shouldn't this be "if (offset < 0)"?


> -               dev_err(iod->dev, "invalid pin offset for pin%i\n", pin);
> -
> -               return;
> -       }
> -
>         pd = &iod->pa[pin];
>         cfg = pd->drv_data;
>
> --
> 2.10.2
>
