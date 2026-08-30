Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B384C26E71F;
	Sun, 30 Aug 2026 20:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121163; cv=none; b=bJmcSd8ZrY0pyrnSfTxLtoYdEUvbtBEc1kUptD62GCNup5/LAZiGVplb29XkijjNpG3y7Vxm/4ONHCBaq00xU7DRoZ2Obs1e7/y9KowrlmM4uAczBZmG38NnvHXhPGyn0cXtZJT82u7GWESo8l2uqJXzZ70pfkPp8L+9CKnr4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121163; c=relaxed/simple;
	bh=BFFD9Cpn6dGprHkealy6+wEvBEyqfrHGYbkXE5B6SX8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eAjToAuXa82O1OlQQ+s12tzky/0BAASFdg8B1eddxM2VeI5aj1I4VPhuSSBknESn0m26q7FKqL4mW2oWA/p+/ox49ZVT2mh9vmG9cb0e53wKOSLFVtzWSw0DQeShT9WkHXlrcS/rPRliHQnC5PUKeAzwmEp0Pb5lEZW2u6MMkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=HPDHU44V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eE8PV9Bf; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b="HPDHU44V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eE8PV9Bf"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.stl.internal (Postfix) with ESMTP id DBB671D00056;
	Sun, 30 Aug 2026 16:19:17 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-01.internal (MEProxy); Sun, 30 Aug 2026 16:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788121156;
	 x=1788207556; bh=h7uEa2ZH2PBqpx2CmwL56hO/aLIkIoIJnw3l3vrAw10=; b=
	HPDHU44Vl+t8w3B3N94/6ZTYgNI845qYLqf3xrrcWF/YKuxMmJLo8+gq7/jxp22/
	q/T100wiHXqaJpzInbcvavpQAtYGL4u9pp4ioYEgnvqUK+ftHXWpWR/DR8zch6TK
	S1Yx2Ah8NsEX1VfV/QAEr2gTkOagH/o2LPkppG6QWfHEEL7BLk+vjHz3TxEGVprZ
	gPLUJ3aUxlM172UdAYDFgw7chjCB4jjDErUCepEzRKyr9TqcTY8/5SrmQsUyO+40
	xiy7V8z2A9yC+IsZVETEpM8Xrzx89y5jMAOzColT8Uyk8rBk8AyuVRo+7yB1hIv4
	mQ1qPqHyQPtdNvEGYija7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788121156; x=
	1788207556; bh=h7uEa2ZH2PBqpx2CmwL56hO/aLIkIoIJnw3l3vrAw10=; b=e
	E8PV9BfyDCnVMYyfHX0sy3oipPF/CXruTpKF6B2LxGzHb4chtqjB2K8HhZOWYUwX
	oxV/IurZc5/+Ou8tXbCDHQMwvPGPKdslKehlGbQyIRy0HZV66aBB0ouI34BvSjq7
	LcsalgC9e/aD5ERcloMi+YiI9gDVH4tr8cs7JtFtsvM0G53gBq2DZlZLVLM6oJJx
	YxMJQxFvYyi5gvKDc3HGJPpzg8wPyOvNJ08asnKB8O3BVH9Ma7M+6+k5SauNQ2Pa
	QLBaYuZFfOYoyHrdTeHfBdIDyPRWi72PGAyrnkwDc78Ob6GaYCqMgWNqzel2KyOu
	ZcrjNntF1VuxwFI9T4mZg==
X-ME-Sender: <xms:PpCUag3Ak6H8D_IMFpS7Hq91j_xFGOaW14RwAKtGmXCHrZpvd3pWcA>
    <xme:PpCUal5H_7c5M_mPLEZOdOdHkgSJKu_MdpaeIjWKa1OJ6-6cbZUx0XIcBU3KTeoO-
    t8RAByzS4KB5c_EsiDyUS95aj9DYEryVhulhCH2ZDoyaFTVbfkHMw>
X-ME-Proxy-Cause: dmFkZTGfqbIh8kNJ8aifZ5SmZDO7eReAEmkJJ3OIMaED0VINmHQNvvMBqReqC933QT0t+P
    XB1BDplBL20p5BqFiI4k7V6NHrwBDteWQ45FW9D+1L2e6/M2EI9G5VYv6c8NsOIrGsHEVy
    quTWIf8YYUwQwrnKsVxzs1jnnN3uyvplZNydLZBA+BgiVqo8x90rn107KHZZgnjDWpratE
    uJqmAzVeg6rhwzdwXrCTR/oOnG+fS6DwZtjDPLHBiW4rpTRseB8kqLCh2f2q7GlpA5WSlj
    K3aD5FdkQM4qCBfA1QgyQJIWLBQODRBzBN1LyvwvuJSjrX6BCn/+1Hd+iVM7Tw2U+gNVtB
    nkQdtNn1u/S7FvTCXSduEHtowi+1QnDCzBSp2VslJZOVdpUWMcOm3zRdYgu63juKphHqdo
    ce98WB9Z4I5axV/dVH8+/hwqbeuN/kqZWG3fhI+Gt1P4CIquCwt3We3amZxkMbtJyNQJHE
    Unlwb3eQ6pPtPaZNnrxDo1D9hUjgMLdWByMcR7nt6hUCPvimZEmNghv4K4TlMaLf5b5uKZ
    vIk3ohUYVfsoLTdmlmzPlV6kDt2xmZ1+UTFQ+6kH2sXa6o/J1AcQs2CrDdnz9zaDZgO91f
    ApyjRhfkMcw0qjphSgBLkBVYi2TO7BuAh2b+oqE7IWrgHswkJLN3hYBhPxIA
X-ME-Proxy: <xmx:QZCUaqeVwbEedS5NTnRGEborcLipwcyb-QW4YRyonK4KzSyOBXs32g>
    <xmx:QZCUah6p6GwTWsbLmd4W_ooWn6CE-OmiGMdzKYTOaoeY446p452r7Q>
    <xmx:QZCUatTfG6bOKT_UmljhY98_tsfIQnJGgfBjKE6FvAswF09K-eCGNg>
    <xmx:QZCUakd-0m8xHS6lOdoYkqVPMigbAq3qTucNrf7FJBx5bcWuCWeVfg>
    <xmx:RJCUauTfBTtCKcKTCSkuFerjsHdTRsIaaDebBQ9azVk-e22K3YtSwBkJ>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 999ADF80082; Sun, 30 Aug 2026 16:19:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4oK29WmcCJJ
Date: Sun, 30 Aug 2026 22:18:50 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: "Lee Jones" <lee@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Guru Das Srinagesh" <linux@gurudas.dev>,
 "Linus Walleij" <linusw@kernel.org>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Kees Cook" <kees@kernel.org>,
 "Tony Luck" <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, phone-devel@vger.kernel.org
Message-Id: <646d46b1-7c59-4d73-b033-f4afaf19bdd7@app.fastmail.com>
In-Reply-To: <20260812122900.GQ1072730@google.com>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-4-149dd4372ac8@alex-min.fr>
 <20260812122900.GQ1072730@google.com>
Subject: Re: [PATCH v5 4/6] mfd: qcom-pm8xxx: register PM8921 USB ID extcon
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Lee,=20

Thanks for the feedback!

For the v6 series, I'll add a proper define for the 49 IRQ and use the d=
evm api indeed.

About using the MFD api: I looked at it, but devm_mfd_add_devices() =20
doesn't seem to let me reuse the parent firmware node, which I need here=
 =20
because the DT consumer uses extcon =3D <&pm8921>.=20
So I kept  platform_device_register_full().
Let me know if I missed something here.

Thanks,
Alexandre
--=20
  MINETTE Alexandre
  contact@alex-min.fr

Mer 12 ao=C3=BBt 2026, =C3=A0 14:29, Lee Jones a =C3=A9crit=E2=80=AF:
> On Tue, 04 Aug 2026, Alexandre MINETTE via B4 Relay wrote:
>
>> From: Alexandre MINETTE <contact@alex-min.fr>
>>=20
>> PM8921 reports the USB ID pin through interrupt 49 of its interrupt
>> controller. Unlike PM8941, this path has no separate addressable misc
>> block to represent as a devicetree child node.
>>=20
>> Register a child platform device for the existing Qualcomm USB extcon
>> driver after creating the PMIC IRQ domain. Pass the USB ID interrupt =
as
>> a named resource and reuse the PM8921 firmware node, allowing consume=
rs
>> to reference the PMIC node directly as their extcon provider.
>>=20
>> Unregister the child device and dispose of the IRQ mapping when the
>> PMIC is removed or probing fails.
>>=20
>> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
>> ---
>>  drivers/mfd/qcom-pm8xxx.c | 78 +++++++++++++++++++++++++++++++++++++=
++++++++--
>>  1 file changed, 76 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
>> index 0cf374c015ce..884fc99a1488 100644
>> --- dangerously/mfd/qcom-pm8xxx.c
>> +++ b/drivers/mfd/qcom-pm8xxx.c
>> @@ -7,6 +7,7 @@
>> =20
>>  #include <linux/kernel.h>
>>  #include <linux/interrupt.h>
>> +#include <linux/ioport.h>
>>  #include <linux/irqchip/chained_irq.h>
>>  #include <linux/irq.h>
>>  #include <linux/irqdomain.h>
>> @@ -64,12 +65,15 @@
>> =20
>>  struct pm_irq_data {
>>  	int num_irqs;
>> +	int usb_id_irq;
>>  	struct irq_chip *irq_chip;
>>  	irq_handler_t irq_handler;
>>  };
>> =20
>>  struct pm_irq_chip {
>>  	struct regmap		*regmap;
>> +	struct platform_device	*usb_extcon;
>> +	unsigned int		usb_id_irq;
>>  	spinlock_t		pm_irq_lock;
>>  	struct irq_domain	*irqdomain;
>>  	unsigned int		num_blocks;
>> @@ -492,6 +496,13 @@ static const struct pm_irq_data pm8xxx_data =3D {
>>  	.irq_handler =3D pm8xxx_irq_handler,
>>  };
>> =20
>> +static const struct pm_irq_data pm8921_data =3D {
>> +	.num_irqs =3D PM8XXX_NR_IRQS,
>> +	.usb_id_irq =3D 49,
>
> Magic numbers should be defined.
>
>> +	.irq_chip =3D &pm8xxx_irq_chip,
>> +	.irq_handler =3D pm8xxx_irq_handler,
>> +};
>> +
>>  static const struct pm_irq_data pm8821_data =3D {
>>  	.num_irqs =3D PM8821_NR_IRQS,
>>  	.irq_chip =3D &pm8821_irq_chip,
>> @@ -501,11 +512,60 @@ static const struct pm_irq_data pm8821_data =3D=
 {
>>  static const struct of_device_id pm8xxx_id_table[] =3D {
>>  	{ .compatible =3D "qcom,pm8058", .data =3D &pm8xxx_data},
>>  	{ .compatible =3D "qcom,pm8821", .data =3D &pm8821_data},
>> -	{ .compatible =3D "qcom,pm8921", .data =3D &pm8xxx_data},
>> +	{ .compatible =3D "qcom,pm8921", .data =3D &pm8921_data},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
>> =20
>> +static int pm8xxx_add_usb_extcon(struct platform_device *pdev,
>> +				 struct pm_irq_chip *chip,
>> +				 unsigned int hwirq)
>> +{
>> +	struct irq_fwspec fwspec =3D {
>> +		.fwnode =3D dev_fwnode(&pdev->dev),
>> +		.param_count =3D 2,
>> +		.param =3D { hwirq, IRQ_TYPE_EDGE_BOTH },
>> +	};
>> +	struct platform_device_info pdevinfo =3D {
>> +		.parent =3D &pdev->dev,
>> +		.fwnode =3D dev_fwnode(&pdev->dev),
>> +		.of_node_reused =3D true,
>> +		.name =3D "qcom-pm8xxx-usb-id",
>> +		.id =3D PLATFORM_DEVID_NONE,
>> +	};
>> +	struct resource resource;
>> +
>> +	chip->usb_id_irq =3D irq_create_fwspec_mapping(&fwspec);
>> +	if (!chip->usb_id_irq)
>> +		return -ENXIO;
>> +
>> +	resource =3D DEFINE_RES_IRQ_NAMED(chip->usb_id_irq, "usb_id");
>> +	pdevinfo.res =3D &resource;
>> +	pdevinfo.num_res =3D 1;
>> +
>> +	chip->usb_extcon =3D platform_device_register_full(&pdevinfo);
>
> Why aren't you using the MFD API for this?
>
>> +	if (IS_ERR(chip->usb_extcon)) {
>> +		int ret =3D PTR_ERR(chip->usb_extcon);
>> +
>> +		chip->usb_extcon =3D NULL;
>> +		irq_dispose_mapping(chip->usb_id_irq);
>> +		chip->usb_id_irq =3D 0;
>> +
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void pm8xxx_remove_usb_extcon(struct pm_irq_chip *chip)
>> +{
>> +	if (chip->usb_extcon)
>> +		platform_device_unregister(chip->usb_extcon);
>> +
>> +	if (chip->usb_id_irq)
>> +		irq_dispose_mapping(chip->usb_id_irq);
>> +}
>
> Why not devm_*
>
>>  static int pm8xxx_probe(struct platform_device *pdev)
>>  {
>>  	const struct pm_irq_data *data;
>> @@ -570,9 +630,22 @@ static int pm8xxx_probe(struct platform_device *=
pdev)
>> =20
>>  	irq_set_irq_wake(irq, 1);
>> =20
>> +	if (data->usb_id_irq) {
>> +		rc =3D pm8xxx_add_usb_extcon(pdev, chip, data->usb_id_irq);
>> +		if (rc)
>> +			goto err_domain;
>> +	}
>> +
>>  	rc =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->d=
ev);
>>  	if (rc)
>> -		irq_domain_remove(chip->irqdomain);
>> +		goto err_extcon;
>> +
>> +	return 0;
>> +
>> +err_extcon:
>> +	pm8xxx_remove_usb_extcon(chip);
>> +err_domain:
>> +	irq_domain_remove(chip->irqdomain);
>> =20
>>  	return rc;
>>  }
>> @@ -582,6 +655,7 @@ static void pm8xxx_remove(struct platform_device =
*pdev)
>>  	struct pm_irq_chip *chip =3D platform_get_drvdata(pdev);
>> =20
>>  	of_platform_depopulate(&pdev->dev);
>> +	pm8xxx_remove_usb_extcon(chip);
>>  	irq_domain_remove(chip->irqdomain);
>>  }
>> =20
>>=20
>> --=20
>> 2.43.0
>>=20
>>=20
>
> --=20
> Lee Jones
