From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH] pinctrl: berlin: as370: Fix to avoid NULL pointer
 dereference
Date: Tue, 19 Mar 2019 05:30:46 +0000
Message-ID: <20190319132319.098c5fa3@xhacker.debian>
References: <20190318233734.9991-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318233734.9991-1-pakki001@umn.edu>
Content-Language: en-US
Content-ID: <F1F7E10119CB6B439D3E4AAD9A843A63@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: "kjlu@umn.edu" <kjlu@umn.edu>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 18 Mar 2019 18:37:27 -0500 Aditya Pakki wrote:
>=20
>=20
> of_match_device in as370_pinctrl_probe can return a NULL value
> when the matching device is not found. The patch avoids a potential

Similar as the comment to your previous patch, this could not happen.
If the probe is called, it means OF registered a device with a valid
compatible string, so match cannot be NULL.

> dereference in such scenario.
>=20
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/pinctrl/berlin/pinctrl-as370.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/berlin/pinctrl-as370.c b/drivers/pinctrl/ber=
lin/pinctrl-as370.c
> index 44f8ccdbeeff..78bb5b866c99 100644
> --- a/drivers/pinctrl/berlin/pinctrl-as370.c
> +++ b/drivers/pinctrl/berlin/pinctrl-as370.c
> @@ -337,6 +337,8 @@ static int as370_pinctrl_probe(struct platform_device=
 *pdev)
>         struct resource *res;
>         void __iomem *base;
>=20
> +       if (!match)
> +               return -ENODEV;
>         rmconfig =3D devm_kzalloc(&pdev->dev, sizeof(*rmconfig), GFP_KERN=
EL);
>         if (!rmconfig)
>                 return -ENOMEM;
> --
> 2.17.1
>=20
