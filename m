Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883263;
	b=G1QwsdjVIrim8490wCSua9V/WFaqnBrml63m/a7b1emFTI6BJO+YGcexfUGX9qlrDgBo
	 aVxPjBv3gGG3YVw7w0wOa+A7e5kYD8gtSCv0x8ysmtZYyJsY2T4+CfzvaHMnP+Iasog5v
	 UQeEaWQfu1xQKBnPooqRE4LuFCCNDzh1h341i5JalYUmeRyVbLDRsWcj7DUjzeJ8Qa7pV
	 WF4wGDjcz2L0QF/fQf7XuAqjS4r4DvIgrenTLV8uQYxij+v3ddSnhQiZW+ak+TxaaxgwI
	 udgcaHxfZsQW6wHmVo5nj4XbwidxGd0bMASKBrTQhmNk0zWFcsT3igWDQ2Z4wMYwz2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883263;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lkBo5zyUxUnl8iyvBAURQ5rw5tEWapFQyBQ/5hCa8Iw=;
	b=oqsXKJclG5voAAdAtUQnG7IX4Y3es3ORXY20iGAe3UAsVoOnwAu2hEEg+zKe0wBSDliK
	 LlbQFceuMlcxAIKcGkGea8ouAYmvhuifCFd4kM+nUTZ6sjZ6nVPnpp4nuYNavrHPYioIR
	 vfFj2QJU8OGvswJ7jEEK6b7CcQv3kPlQ2gNjkX9DSOqXRZRr4UEQ39vUW26SqNy8lt6Yl
	 /HcxPqPOwO8ZSvMbRXdKsOrDLGY6GY2GosmNmKwsNd+ewIAuLPyvX9puoLFhHmSbtWTvP
	 IHMWWG6+iHfRN3Zy9rkakGlUFBvEzjodphufrTdNbpUQ+l8y+2yzHCeU1eQGLDC1auw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7P2oSMW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C6606D80C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7P2oSMW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70651F00919;
	Thu,  5 Nov 2026 12:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883263;
	bh=lkBo5zyUxUnl8iyvBAURQ5rw5tEWapFQyBQ/5hCa8Iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F7P2oSMWfoAtXGsgEuij2ip/PRRs+9ouCBGtkYWRAioXi/Fmfp5ne8JIMrz4pJulT
	 cK0jQyCbZQCMMGrXxyuQh/j75kUw5Qv57QYiNTYqervCM/s+d1swcFfaVXrzEGmhGp
	 te20EbUcUwnTf6vnim1rswFYKLGWgV08Q+0uXR+wZKldTKGwN5afl8avmIW7Rf6n5K
	 hZV0KQvDP3CaflSDxxGndjtB/3gtEQtI27q1N2ajMpq46UV9NPwttJpUr/S6csZERR
	 Sleti7KXjcb2XQY2y5iKFZUhRGvH7EDlGCbTDsr5NvQTN9X2sdmCI4miKoIiT+k4pF
	 ZOqzyNClq/ybQ==
Message-ID: <sashiko-outbox-199076@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: mvebu: fix sleeping-while-atomic in
 mvebu_gpio_level_irq_mask()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261105-gpio-mvebu-sleeping-while-atomic-v1-1-3ad7bb1c9e36@oss.qualcomm.com>
References: <20261105-gpio-mvebu-sleeping-while-atomic-v1-1-3ad7bb1c9e36@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:54:22 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: mvebu: missing use_raw_spinlock in mvebu_gpio_percpu_regmap_=
config
--

commit 7ad64e668b066c72ed4810dd8de43859b3810544
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()

This commit sets use_raw_spinlock on mvebu_gpio_regmap_config to avoid
taking a sleepable spinlock_t on PREEMPT_RT kernels when accessing GPIO
registers while holding a raw_spinlock_t in the IRQ callbacks.

> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 267e6d5bacd0d..02d9ae5869d75 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -603,6 +603,7 @@ static const struct regmap_config mvebu_gpio_regmap_c=
onfig =3D {
>  	.reg_bits =3D 32,
>  	.reg_stride =3D 4,
>  	.val_bits =3D 32,
> +	.use_raw_spinlock =3D true,
>  };
> =20
>  static const struct regmap_config mvebu_gpio_percpu_regmap_config =3D {

[Severity: High]
Should mvebu_gpio_percpu_regmap_config also set .use_raw_spinlock =3D true?

In mvebu_gpio_probe_raw(), mvchip->percpu_regs is initialized with
mvebu_gpio_percpu_regmap_config:

	mvchip->percpu_regs =3D
		devm_regmap_init_mmio(&pdev->dev, base,
				      &mvebu_gpio_percpu_regmap_config);

When mvchip->soc_variant is MVEBU_GPIO_SOC_VARIANT_ARMADAXP,
mvebu_gpioreg_level_mask(), mvebu_gpioreg_edge_mask(), and
mvebu_gpioreg_edge_cause() select mvchip->percpu_regs instead of
mvchip->regs:

	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
		cpu =3D smp_processor_id();
		*map =3D mvchip->percpu_regs;
		*offset =3D GPIO_LEVEL_MASK_ARMADAXP_OFF(cpu);
		break;

The irq_chip callbacks mvebu_gpio_level_irq_mask(),
mvebu_gpio_level_irq_unmask(), mvebu_gpio_edge_irq_mask(),
mvebu_gpio_edge_irq_unmask(), and mvebu_gpio_irq_ack() acquire the raw
spinlock gc->lock before calling mvebu_gpio_write_level_mask(),
mvebu_gpio_write_edge_mask(), or mvebu_gpio_write_edge_cause(), and
mvebu_gpio_irq_handler() reads these registers in hardirq context. Without
use_raw_spinlock on mvebu_gpio_percpu_regmap_config, won't Armada XP
systems still hit the same sleeping-while-atomic issue on PREEMPT_RT?

Also, the IRQ callbacks were converted to regmap in commit 2233bf7a92e7
("gpio: mvebu: convert to regmap") and mvebu_gpio_percpu_regmap_config was
split out in commit 4d305c227312 ("gpio: mvebu: name regmaps"), whereas
commit 48f32a835373 ("gpio: mvebu: switch pwm duration registers to
regmap") only moved mvebu_gpio_regmap_config earlier in the file. Should
the Fixes tag reference those commits instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-gpio-mvebu=
-sleeping-while-atomic-v1-1-3ad7bb1c9e36@oss.qualcomm.com?part=3D1
