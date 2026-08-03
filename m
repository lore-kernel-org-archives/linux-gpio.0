Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F7A78C9C;
	Mon,  3 Aug 2026 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770911; cv=none; b=s5EDm8LsI6q/D++sBFMokQ51Mqo/gBq/19UIolTcnakDlNr5w/OCJvRWJM0wD+Hv4EfCBJQleNkqWlCxD8su8m+GB05Az3S7IizU7lqZ6HpT+SOjqRFNq/zv45Bybqi2zhMy/UdFiu1QJl5sQKLAHqEWaKyi0y1a305kZMmAGcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770911; c=relaxed/simple;
	bh=Il91EhoP4Phk7G/yDjvz8suglswJ/932hw6ZVHbVI4I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nXLpdsa3HN+ANZ/mVlIROgHS2Y1qFTR/Ac6QI3/qaS+NP/3wxOaAPHl+B36CD7OcSCKR848wWGO06qibIjRy6JQ9fjz7h7DGqHntgQsdmwf7fJNKpcmLUvaQNRV6L7meKmCyQvvXlubnCvZKGOarBCMZcacUqd/cnfs80RKMEsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 69855200425;
	Mon, 03 Aug 2026 17:28:22 +0200 (CEST)
Message-ID: <a4a807f1f0a4ea49feb0a3f39474ad0cb0b2ec49.camel@pengutronix.de>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Emil Renner
 Berthing	 <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou	
 <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Lianfeng
 Ouyang	 <lianfeng.ouyang@starfivetech.com>
Date: Mon, 03 Aug 2026 17:28:22 +0200
In-Reply-To: <20260801072711.153217-5-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
	 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sa, 2026-08-01 at 00:26 -0700, Changhuang Liang wrote:
> Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>=20
> Simultaneously add a generic pinctrl driver framework for registering
> the pinctrl of other domains (sys1, sys2, and so on) in the JHB100 SoC.
>=20
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |    9 +
>  drivers/pinctrl/starfive/Kconfig              |   20 +
>  drivers/pinctrl/starfive/Makefile             |    3 +
>  .../starfive/pinctrl-starfive-jhb100-sys0.c   |  119 ++
>  .../starfive/pinctrl-starfive-jhb100.c        | 1456 +++++++++++++++++
>  .../starfive/pinctrl-starfive-jhb100.h        |  159 ++
>  6 files changed, 1766 insertions(+)
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0=
.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
>=20
[...]
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c b/dr=
ivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> new file mode 100644
> index 000000000000..ed23c0c43960
> --- /dev/null
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> @@ -0,0 +1,119 @@
[...]
> +int jhb100_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct gpio_irq_chip *girq;
> +	const struct jhb100_pinctrl_domain_info *info;
> +	struct jhb100_pinctrl *sfp;
> +	struct pinctrl_desc *jhb100_pinctrl_desc;
> +	const struct starfive_pinctrl_regs *pinctrl_regs;
> +	struct reset_control *rst;
> +	struct clk *clk;
> +	int ret;
> +
> +	info =3D of_device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	pinctrl_regs =3D info->regs;
> +
> +	sfp =3D devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> +	if (!sfp)
> +		return -ENOMEM;
> +
> +	sfp->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sfp->base))
> +		return PTR_ERR(sfp->base);
> +
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable clock\=
n");
> +
> +	rst =3D devm_reset_control_array_get_optional_shared(dev);

The dt-binding specifies a single reset control. Why does this use the
array API?

Using devm_reset_control_get_optional_shared_deasserted() could
simplify this a little bit.

regards
Philipp
