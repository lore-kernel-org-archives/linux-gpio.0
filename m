From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH] drivers/gpio/gpio-sch311x: check return value of gpiochip_remove()
Date: Fri, 04 Jul 2014 12:15:56 +0530
Message-ID: <53B64DA4.3070400@gmail.com>
References: <1404455851-9996-1-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404455851-9996-1-git-send-email-varkab@cdac.in>
Sender: linux-kernel-owner@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>, linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

Please drop this patch which generating an another warning.

I will send v2 for this.

Thanks.

On 07/04/2014 12:07 PM, Varka Bhadram wrote:
> This patch eliminates the following warning
>
> drivers/gpio/gpio-sch311x.c: In function =E2=80=98sch311x_gpio_probe=E2=
=80=99:
> drivers/gpio/gpio-sch311x.c:286:18: warning: ignoring return value of=
 =E2=80=98gpiochip_remove=E2=80=99, declared with attribute warn_unused=
_result
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>
> ---
>   drivers/gpio/gpio-sch311x.c |    8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.=
c
> index f942b80..8a4ab8f 100644
> --- a/drivers/gpio/gpio-sch311x.c
> +++ b/drivers/gpio/gpio-sch311x.c
> @@ -232,7 +232,7 @@ static int sch311x_gpio_probe(struct platform_dev=
ice *pdev)
>   	struct sch311x_pdev_data *pdata =3D pdev->dev.platform_data;
>   	struct sch311x_gpio_priv *priv;
>   	struct sch311x_gpio_block *block;
> -	int err, i;
> +	int err, i, ret;
>  =20
>   	/* we can register all GPIO data registers at once */
>   	if (!request_region(pdata->runtime_reg + GP1, 6, DRV_NAME)) {
> @@ -283,7 +283,11 @@ exit_err:
>   	release_region(pdata->runtime_reg + GP1, 6);
>   	/* release already registered chips */
>   	for (--i; i >=3D 0; i--)
> -		gpiochip_remove(&priv->blocks[i].chip);
> +		ret =3D gpiochip_remove(&priv->blocks[i].chip);
> +
> +		WARN(ret, "%s(): gpiochip_remove() failed, ret=3D%d\n",
> +		     __func__, ret);
> +
>   	return err;
>   }
>  =20


--=20
Cheers,
Varka Bhadram.
