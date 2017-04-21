From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] pinctrl-armada-xp: Use devm_kmalloc_array() in
 armada_xp_pinctrl_probe()
Date: Fri, 21 Apr 2017 19:22:11 +0000
Message-ID: <efa23d0481504229be1dd3678fa8078a@svr-chch-ex1.atlnz.lc>
References: <d109d375-6e91-420d-eb9a-fcaea4fbc5f7@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Markus,=0A=
=0A=
On 15/04/17 05:04, SF Markus Elfring wrote:=0A=
> From: Markus Elfring <elfring@users.sourceforge.net>=0A=
> Date: Fri, 14 Apr 2017 18:48:15 +0200=0A=
>=0A=
> * A multiplication for the size determination of a memory allocation=0A=
>   indicated that an array data structure should be processed.=0A=
>   Thus use the corresponding function "devm_kmalloc_array".=0A=
>=0A=
>   This issue was detected by using the Coccinelle software.=0A=
>=0A=
> * Replace the specification of a data type by a pointer dereference=0A=
>   to make the corresponding size determination a bit safer according to=
=0A=
>   the Linux coding style convention.=0A=
>=0A=
> * Delete the local variable "nregs" which became unnecessary with=0A=
>   this refactoring.=0A=
>=0A=
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>=0A=
> ---=0A=
>  drivers/pinctrl/mvebu/pinctrl-armada-xp.c | 10 +++++-----=0A=
>  1 file changed, 5 insertions(+), 5 deletions(-)=0A=
>=0A=
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c b/drivers/pinctrl/=
mvebu/pinctrl-armada-xp.c=0A=
> index b854f1ee5de5..457c54c8fed3 100644=0A=
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c=0A=
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c=0A=
> @@ -574,7 +574,6 @@ static int armada_xp_pinctrl_probe(struct platform_de=
vice *pdev)=0A=
>  	struct mvebu_pinctrl_soc_info *soc =3D &armada_xp_pinctrl_info;=0A=
>  	const struct of_device_id *match =3D=0A=
>  		of_match_device(armada_xp_pinctrl_of_match, &pdev->dev);=0A=
> -	int nregs;=0A=
>=0A=
>  	if (!match)=0A=
>  		return -ENODEV;=0A=
> @@ -628,10 +627,11 @@ static int armada_xp_pinctrl_probe(struct platform_=
device *pdev)=0A=
>  		break;=0A=
>  	}=0A=
>=0A=
> -	nregs =3D DIV_ROUND_UP(soc->nmodes, MVEBU_MPPS_PER_REG);=0A=
> -=0A=
> -	mpp_saved_regs =3D devm_kmalloc(&pdev->dev, nregs * sizeof(u32),=0A=
> -				      GFP_KERNEL);=0A=
> +	mpp_saved_regs =3D devm_kmalloc_array(&pdev->dev,=0A=
> +					    DIV_ROUND_UP(soc->nmodes,=0A=
> +							 MVEBU_MPPS_PER_REG),=0A=
> +					    sizeof(*mpp_saved_regs),=0A=
> +					    GFP_KERNEL);=0A=
=0A=
I personally think having nregs makes the code a bit more readable but =0A=
that's just me.=0A=
=0A=
With or without a change=0A=
=0A=
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
>  	if (!mpp_saved_regs)=0A=
>  		return -ENOMEM;=0A=
>=0A=
>=0A=
=0A=
