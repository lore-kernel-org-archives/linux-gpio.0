Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717548;
	b=2hSyIDNtlav6e8jzv5uI1F7ku1vqSoFXAZPjGYSdpzjWOEhFtzgNwAaqGIc79YkxyPgb
	 HArY7YjQef5QOvvK8gymgMQ7KYAIWsoteOu+tfCdq+Yvr/sDULYXDWSNqVEcqyQvECs7E
	 AuctGwQUNuPhMJc5Hs7d/4uETlb7pR4mIs1DffsJcPpiRf4kfnNvbPyADvdStYP0+MeLH
	 WiMNGggUPaBsSQP0T2sZxhuZmZe6wKxYdRBiKJ5DIhFwKNVSZD/+xVNIlTHFhrR7s42Bn
	 McO4aPMgj0TKwLXON05wyMIh4MZgX68ASgCRBKsm28/Nvuk1pofF6CLy25KhifB6cnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717548;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RaRQ7AHJuQmpRMUutOLmkVXbHk2ov2IN2LM+imwFq8c=;
	b=Gu36TMmBoZd2z5q/zrR1yQYtkJcgkjdjO3KZAMCmXjDJZl0ZhgqqAvlqeQtFgokH19N5
	 +bZHV1kNahJWEI9JB10jctTkjRmd53n/n+BIpRSHopd6MXcudc8ngKOvxgcwpFhgipNLv
	 69q55tTRLWGYbMZvWqiK/KuJhdNd6IKRXjTHGOMk59iCsYA1Uyiz62zoZNlextfdFrrHD
	 uztZYzpUYKcTBlvlXCoWnuItfwy8Zf1p4CJL1ShdRpBXAb5DGnxUp0dKdwj5uTOv7UTZC
	 zCqNnev7snVbjKF8DWo76UUnaZhm2jLTrc5Mg3tYRlC+NVzc5PDwHNAOEqNuUFrRR2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BDR4CMFA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D6606A31E;
	Thu, 26 Nov 2026 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BDR4CMFA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3999F1F000C6;
	Thu, 26 Nov 2026 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717548;
	bh=RaRQ7AHJuQmpRMUutOLmkVXbHk2ov2IN2LM+imwFq8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BDR4CMFA6E7Vpi7g1a8MIzCX8HJD/ZXr2nYZq5/wC3ZyYXWLfgyVM1sL2bhd99aRk
	 8H7PA48WoHfL4z4aN8qfyoWnsPfDWCYx9ez7O6iEV8O1ld5dLhPCmRKVNkNL2d7b1o
	 SiJyjWoY73emHswONKRAcuY8wrz7GNczfuv1o3TsGdmH6t9om8cyUbD8ovHjgHTYIR
	 vKjChEEUZD2WC3bO07Q6l+sWJk0aWpnD8lee+phltGxLInl5fI5hmuvBN/dKF87hrG
	 svkxvs+3Hyg24Ua486En4zgC3vUhFL2QqCQYalG0wAFrMM9WDnBTk2uHh/Dv3vBW2n
	 dDA1WWzV1jvcA==
Message-ID: <sashiko-outbox-236017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] gpio: fxl6408: Add interrupt controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gianfranco Mariotti" <gianfranco.mariotti94@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126180315.98034-6-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
 <20261126180315.98034-6-gianfranco.mariotti94@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:25:46 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] gpio: fxl6408: level-low IRQ storm and stale INT_STS in
  fxl6408_resume()
- [High] gpio: fxl6408: spurious and lost IRQs on unmask in
  fxl6408_probe()
--

commit 727720e716ae84ca553c153e1d2e86dd4241253c
Author: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

gpio: fxl6408: Add interrupt controller support

This commit adds interrupt controller support for the FXL6408 and
PI4IOE5V6408 GPIO expanders via regmap-irq and gpio-regmap, marks
FXL6408_REG_DEVICE_ID and FXL6408_REG_INT_STS as precious, and clears
RST_INT on resume.

> diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
> index ae9003fc513a1..d503383fb119b 100644
> --- a/drivers/gpio/gpio-fxl6408.c
> +++ b/drivers/gpio/gpio-fxl6408.c

[ ... ]

> @@ -206,12 +276,43 @@ static int fxl6408_probe(struct i2c_client *client)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to write 'output high Z' regist=
er\n");
> =20
> +	if (client->irq > 0) {
> +		struct regmap_irq_chip *irq_chip;
> +
> +		irq_chip =3D devm_kzalloc_obj(dev, *irq_chip);
> +		if (!irq_chip)
> +			return -ENOMEM;
> +
> +		irq_chip->name =3D dev_name(dev);
> +		irq_chip->status_base =3D FXL6408_REG_INT_STS;
> +		irq_chip->mask_base =3D FXL6408_REG_INT_MASK;
> +		irq_chip->config_base =3D fxl6408_irq_config_base;
> +		irq_chip->num_config_bases =3D ARRAY_SIZE(fxl6408_irq_config_base);
> +		irq_chip->num_config_regs =3D 1;
> +		irq_chip->num_regs =3D 1;
> +		irq_chip->irqs =3D fxl6408_regmap_irqs;
> +		irq_chip->num_irqs =3D ARRAY_SIZE(fxl6408_regmap_irqs);
> +		irq_chip->init_ack_masked =3D true;
> +		irq_chip->clear_on_unmask =3D true;
> +		irq_chip->set_type_config =3D fxl6408_irq_set_type_config;

[Severity: High]
Does configuring FXL6408_REG_INPUT_DEFAULT_STATE through config_base
with clear_on_unmask cause spurious interrupts and drop pending ones on
other lines?

In drivers/base/regmap/regmap-irq.c, regmap_irq_sync_unlock() reads and
discards status_base (FXL6408_REG_INT_STS) first, writes mask_base
(FXL6408_REG_INT_MASK) second, and writes config_base
(FXL6408_REG_INPUT_DEFAULT_STATE) last.  When IRQ_TYPE_EDGE_FALLING is
requested on a line that is already low, FXL6408_REG_INT_STS is cleared
while FXL6408_REG_INPUT_DEFAULT_STATE still holds 0, the line is
unmasked, and setting the default state bit to 1 makes hardware latch
an immediate interrupt because the current input (0) differs from the
new default state (1).

In addition, reading FXL6408_REG_INT_STS clears all eight status bits
at once and requires an input to return to its default state before
another interrupt can latch.  When clear_on_unmask discards
FXL6408_REG_INT_STS while enabling one line, any interrupt already
latched on the other seven lines is lost, leaving an active peripheral
on another pin unable to trigger again.

> +
> +		gpio_config.regmap_irq_chip =3D irq_chip;
> +		gpio_config.regmap_irq_line =3D client->irq;
> +		gpio_config.regmap_irq_flags =3D IRQF_ONESHOT | IRQF_SHARED;
> +	}
> +
>  	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
>  }
> =20
>  static int fxl6408_resume(struct device *dev)
>  {
>  	struct regmap *regmap =3D dev_get_drvdata(dev);
> +	int val, ret;
> +
> +	/* Clear RST_INT in case power was lost during suspend. */
> +	ret =3D regmap_read(regmap, FXL6408_REG_DEVICE_ID, &val);
> +	if (ret)
> +		return ret;
> =20
>  	regcache_mark_dirty(regmap);
>  	return regcache_sync(regmap);

[Severity: High]
Can losing power during suspend trigger an interrupt storm before
fxl6408_resume() runs, and spurious interrupts after regcache_sync()?

On power-on reset, RST_INT in FXL6408_REG_DEVICE_ID asserts the
active-low INT line until register 0x01 is read.  Because fxl6408_pm_ops
has no suspend callback to disable client->irq, resume_device_irqs()
unmasks the parent IRQ in dpm_resume_noirq() before fxl6408_resume()
runs in dpm_resume().  regmap_irq_thread() then wakes repeatedly and
only reads FXL6408_REG_INT_STS, which does not clear RST_INT in
FXL6408_REG_DEVICE_ID.

Furthermore, while FXL6408_REG_INPUT_DEFAULT_STATE and the pull
registers are at their 0x00 reset values (and while regcache_sync()
restores register 0x09 before the pull registers at 0x0b and 0x0d), any
input that is high latches its bit in FXL6408_REG_INT_STS.  Without
reading FXL6408_REG_INT_STS after restoring configuration and before
unmasking FXL6408_REG_INT_MASK, unmasking fires those stale interrupts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126180315.9803=
4-1-gianfranco.mariotti94@gmail.com?part=3D5
