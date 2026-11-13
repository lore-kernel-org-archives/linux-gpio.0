Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597071;
	b=jfO/fZ31XUnKEyPZG2P8IPoOzNs3A5DOHs6HstNPXl2W4KEe4hMgCfpPyYkGKAyasxa6
	 CcbmOtQS6oU6aEM6da/k88MCapEwRXpEow5gAVM8SnFu/p9/6zI0+3KExFuZH2C7mUXTf
	 B5qgqFxwl0svbKKpfjxZQL19oOsCyObtt4ONDIinNVYH4KY06ExGOR8ty6TQYkB7hpnAA
	 Ny8N5gGFPi3fGiyIQKW4hHgXzn+PCiFZcrgnndqVv1K+FSp4SKUk2dDQgzWdw89u7ggnf
	 ppv2BlRgWOQEXosjNKqD/GZKfBl57nvKRDr85iJh/q4xpYoq70qqiOIKNK+2FIC9rIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597071;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sFGOd+ULhze9+nQBSGaqjs2TRcof5B2yBRUYAw/boTo=;
	b=zSLb/xZj3nk2HKXx6hGcNmx4oF2O2HMp21+VNakZR/gHihMYPcdUnA5JPnX+A5I2z5Mk
	 QMoht0rfFz3kjSIOPYtklua65tl5uBy+sIDGAOM54uL/BfLLny82W1/eDdKaJYmDi7taz
	 d6NkbycrsBNclOwqR+Mkulb0UUoGfl5DTVjDqE/n2oBrDvtWnOZOf0YFEPqh70+80DYBi
	 SBf4hlu8SdYV/3n9eAMH5/CPhJwPLWJEOwv0ku5DmjOvVcXlgoiKD9yadsWnGlp1kGnC6
	 YboS47gEANh9E4Bpw048a7UW9w5eR1WrUzB5ykbiL7ZyDcMz9zUooNa7MV02hP/mbSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcrcFv87;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22477606A323;
	Fri, 13 Nov 2026 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcrcFv87
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663341F000C4;
	Fri, 13 Nov 2026 19:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597070;
	bh=sFGOd+ULhze9+nQBSGaqjs2TRcof5B2yBRUYAw/boTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcrcFv87p234r+ZufGeVqeIvefxzRyMX8PQ8aY0SYWA+ZxzUnd2UoUjN0PpY1LoZe
	 lXWZJpXN8yWJrtLdHBsm04V3PTcREivZcAetALgCq57hAjw6IUl2cEPARGiLh2+rlj
	 mIckN4Fgb9UIeYTdDkx4b4lfCnrm1Lnw+NTdamlEmyqAw0CYxPeQSvaZ8eRblOLIS7
	 5Mq9QgjIBLnIC+C2YevIeJxu2hjl+7K2NbMSE8p/PuBkGDTv0s56NKuUFdl+NZDw4A
	 5sz2d0w9pIYBvO5VXiH1EwKRuQyws5XqpWmBup9v0RAXjiK+M+ZyE1uew3dzrSMLIF
	 faDxb/1YkOM1w==
Message-ID: <sashiko-outbox-213518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/23] ASoC: qcom: lpass: add support for optional
 WSA interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-9-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-9-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:11:10 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] ASoC: qcom: lpass: lpass_wsa_regmap_config uses RXTX
  callbacks and macros
- [Medium] ASoC: qcom: lpass: lpass_platform_pcmops_trigger() enables
  WSA IRQs on stop
- [Medium] ASoC: qcom: lpass: unchecked regmap_read() in
  lpass_platform_wsaif_irq()
- [Medium] ASoC: qcom: lpass: missing wsa_lpaif_map handling in suspend
  and resume
--

commit ee7ef8a5c6b3d75b7ea08d4564f71cd7fbf7abeb
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass: add support for optional WSA interface

This commit adds LPASS CPU, regmap, and platform DMA support for the
optional WSA LPAIF Codec DMA interface used for speaker SoundWire buses.

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index ea8b6083529c1..d46b72c926b2b 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -983,6 +983,16 @@ static struct regmap_config lpass_va_regmap_config =
=3D {
>  	.cache_type =3D REGCACHE_FLAT,
>  };
> =20
> +static struct regmap_config lpass_wsa_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.writeable_reg =3D lpass_rxtx_regmap_writeable,
> +	.readable_reg =3D lpass_rxtx_regmap_readable,
> +	.volatile_reg =3D lpass_rxtx_regmap_volatile,
> +	.cache_type =3D REGCACHE_FLAT,
> +};
> +
>  static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>  						struct device_node *node,
>  						const char *name)

[ ... ]

> @@ -1142,6 +1161,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct plat=
form_device *pdev)
>  		if (IS_ERR(drvdata->va_lpaif_map))
>  			return PTR_ERR(drvdata->va_lpaif_map);
> =20
> +		if (drvdata->wsa_enable) {
> +			lpass_wsa_regmap_config.max_register =3D LPAIF_CDC_RXTX_WRDMAPER_REG(=
variant,
> +						variant->wsa_wrdma_channels +
> +						variant->wsa_wrdma_channel_start,
> +						LPASS_CDC_DMA_WSA_TX0);
> +
> +			drvdata->wsa_lpaif_map =3D devm_regmap_init_mmio(dev, drvdata->wsa_lp=
aif,
> +								       &lpass_wsa_regmap_config);
> +			if (IS_ERR(drvdata->wsa_lpaif_map))
> +				return PTR_ERR(drvdata->wsa_lpaif_map);
> +		}
> +
>  		ret =3D of_lpass_cdc_dma_clks_parse(dev, drvdata);
>  		if (ret) {
>  			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);

[Severity: Medium]
Should lpass_wsa_regmap_config use dedicated WSA regmap callbacks instead
of the RXTX ones, and should max_register use LPAIF_CDC_WSA_WRDMAPER_REG()?

__lpass_rxtx_regmap_accessible() and lpass_rxtx_regmap_volatile() check
v->rxtx_* parameters and pass LPASS_CDC_DMA_RX0 / LPASS_CDC_DMA_TX3 to
LPAIF_CDC_RXTX_*_REG(), leaving the newly added v->wsa_irq_ports,
LPAIF_CDC_WSA_RDMA_INTF_REG(), and LPAIF_CDC_WSA_WRDMA_INTF_REG() unused.
Any difference between WSA and RXTX register geometry or channel counts
causes accesses on wsa_lpaif_map to fail with -EIO or return stale
REGCACHE_FLAT entries.  In addition, __lpass_rxtx_regmap_accessible()
omits adding wrdma_channel_start to i when checking
LPAIF_CDC_RXTX_WRDMACURR_REG(), so lpass_platform_pcmops_pointer() reads
of LPAIF_DMACURR_REG on WRDMA capture channels >=3D rxtx_wrdma_channels also
fail with -EIO:

sound/soc/qcom/lpass-cpu.c:__lpass_rxtx_regmap_accessible() {
    ...
	for (i =3D 0; i < v->rxtx_wrdma_channels; ++i) {
		if (reg =3D=3D LPAIF_CDC_RXTX_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_s=
tart,
							LPASS_CDC_DMA_TX3))
			return true;
    ...
		if (rw =3D=3D LPASS_REG_READ) {
			if (reg =3D=3D LPAIF_CDC_RXTX_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
				return true;
		}
    ...
}

> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platf=
orm.c
> index e162627d6f86e..9c879a8090bbf 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c

[ ... ]

> @@ -838,6 +937,22 @@ static int lpass_platform_pcmops_trigger(struct snd_=
soc_component *component,
>  			val_mask =3D LPAIF_IRQ_ALL(ch);
>  			val_irqen =3D LPAIF_IRQ_ALL(ch);
>  			break;
> +		case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
> +		case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
> +			ret =3D regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_=
OFF);
> +			if (ret) {
> +				dev_err(soc_runtime->dev,
> +					"error writing to rdmactl reg field: %d\n", ret);
> +				return ret;
> +			}
> +
> +			reg_irqclr =3D LPAIF_WSA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
> +			val_irqclr =3D LPAIF_IRQ_ALL(ch);
> +
> +			reg_irqen =3D LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
> +			val_mask =3D LPAIF_IRQ_ALL(ch);
> +			val_irqen =3D LPAIF_IRQ_ALL(ch);
> +			break;
>  		default:
>  			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai=
_id);
>  			return -EINVAL;

[Severity: Medium]
In the SNDRV_PCM_TRIGGER_STOP branch of lpass_platform_pcmops_trigger(),
doesn't setting val_irqen =3D LPAIF_IRQ_ALL(ch) keep WSA channel interrupts
enabled in LPAIF_WSA_IRQEN_REG instead of disabling them?

reg_irqclr and val_irqclr are also never written in the stop branch.  Once
lpass_platform_pcmops_close() clears drvdata->wsa_substream[data->dma_ch],
lpass_platform_wsaif_irq() ignores any pending interrupt on that channel
without clearing LPAIF_WSA_IRQCLEAR_REG while returning IRQ_HANDLED, which
can cause an interrupt storm.

[ ... ]

> @@ -1124,6 +1245,31 @@ static irqreturn_t lpass_platform_vaif_irq(int irq=
, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static irqreturn_t lpass_platform_wsaif_irq(int irq, void *data)
> +{
> +	struct lpass_data *drvdata =3D data;
> +	const struct lpass_variant *v =3D drvdata->variant;
> +	unsigned int irqs;
> +	irqreturn_t rv;
> +	int chan;
> +
> +	rv =3D regmap_read(drvdata->wsa_lpaif_map,
> +			 LPAIF_WSA_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
> +
> +	/* Handle per channel interrupts */
> +	for (chan =3D 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->wsa_substream[chan]) {
> +			rv =3D lpass_dma_interrupt_handler(
> +						drvdata->wsa_substream[chan],
> +						drvdata, chan, irqs);
> +			if (rv !=3D IRQ_HANDLED)
> +				return rv;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
What happens in lpass_platform_wsaif_irq() if regmap_read() fails?

Unlike lpass_platform_lpaif_irq() and lpass_platform_hdmiif_irq(), rv is
not checked before reading the uninitialized stack variable irqs, which
can dispatch spurious period, xrun, or bus-error events on active streams.

[ ... ]

> @@ -1359,6 +1513,34 @@ int asoc_qcom_lpass_platform_register(struct platf=
orm_device *pdev)
>  				"error initializing va dmactl fields: %d\n", ret);
>  			return ret;
>  		}
> +
> +		if (drvdata->wsa_enable) {
> +			ret =3D regmap_write(drvdata->wsa_lpaif_map,
> +				LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
> +			if (ret) {
> +				dev_err(&pdev->dev, "error writing to wsa irqen reg: %d\n", ret);
> +				return ret;
> +			}
> +			drvdata->wsaif_irq =3D platform_get_irq_byname(pdev, "lpass-irq-wsaif=
");
> +			if (drvdata->wsaif_irq < 0)
> +				return -ENODEV;
> +
> +			ret =3D devm_request_irq(&pdev->dev, drvdata->wsaif_irq,
> +					       lpass_platform_wsaif_irq, 0,
> +					       "lpass-irq-wsaif", drvdata);
> +			if (ret) {
> +				dev_err(&pdev->dev, "wsa irq request failed: %d\n", ret);
> +				return ret;
> +			}
> +
> +			ret =3D lpass_platform_alloc_wsa_dmactl_fields(&pdev->dev,
> +								     drvdata->wsa_lpaif_map);
> +			if (ret) {
> +				dev_err(&pdev->dev,
> +					"error initializing wsa dmactl fields: %d\n", ret);
> +				return ret;
> +			}
> +		}
>  	}

[Severity: Medium]
Should lpass_platform_pcmops_suspend() and lpass_platform_pcmops_resume()
also handle drvdata->wsa_lpaif_map when drvdata->wsa_enable is set?

lpass_wsa_regmap_config uses REGCACHE_FLAT, but suspend and resume only
manage hdmiif_map and lpaif_map.  If LPASS loses hardware state across
system suspend, cached WSA DMA registers are not synced on resume, and
subsequent regmap_update_bits() or regmap_fields_write() calls see the
pre-suspend values in the flat cache and skip writing to hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D9
