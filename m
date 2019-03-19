From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH] pinctrl: berlin: Fix to avoid NULL pointer dereference
Date: Tue, 19 Mar 2019 05:29:18 +0000
Message-ID: <20190319132152.7e1fef48@xhacker.debian>
References: <20190318233131.9642-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318233131.9642-1-pakki001@umn.edu>
Content-Language: en-US
Content-ID: <1233552374A7074894CFA92DC7EB46D0@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: "kjlu@umn.edu" <kjlu@umn.edu>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 18 Mar 2019 18:31:29 -0500 Aditya Pakki wrote:
>=20
>=20
> of_match_device can return a NULL value when the matching device is

This could not happen. If the probe is called, it means OF registered a
device with a valid compatible string, so match cannot be NULL.

> not found. The patch avoids a potential dereference in such scenario.
>=20
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/pinctrl/berlin/berlin-bg4ct.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berl=
in/berlin-bg4ct.c
> index 6a7fe929a68b..2d5e82938ef9 100644
> --- a/drivers/pinctrl/berlin/berlin-bg4ct.c
> +++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
> @@ -456,6 +456,9 @@ static int berlin4ct_pinctrl_probe(struct platform_de=
vice *pdev)
>         struct resource *res;
>         void __iomem *base;
>=20
> +       if (!match)
> +               return -ENODEV;
> +
>         rmconfig =3D devm_kzalloc(&pdev->dev, sizeof(*rmconfig), GFP_KERN=
EL);
>         if (!rmconfig)
>                 return -ENOMEM;
> --
> 2.17.1
>=20
