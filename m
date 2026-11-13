Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596687;
	b=DumcVSnznLuPn6pOMR8pnc+6BULjPCKnUm7tqPGNux/K7Lw09m08loLlNmV+basGN1ty
	 TkarS0sRHpN7J8cPy5IH8qdQVWgPgKrskxUYUQJC81PwQHxc+qVEYfIR0hVEGjahURKbH
	 LouBbI4+OUr9BFbTV6DmQYBukhj1nr3cs1gP+mJx5XgH+lBZv5SPeAex904dr6OOxX84z
	 Xa0f6WaEmPNaWzlpAkiBXtkb3Sh3r4LmMS3tp6EjEfyI3w0yZQYmcf+v1XGdTiND2pPyB
	 w7+ueMeyTVmo85n9fK0iQi/wMoKOZgU6qFlwr1guE3BUYW3lpbAAt3LQoVuovNy2LUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=96uMxzMr+QLWkHNXqLJouCT7WfpYZD6Ob8Fg/ar+4HU=;
	b=ueS5uXLoPP2hp3HNvvU5GjeYRfasISydWofhhgbmqvgmGw/8wUL2sMSPqm19N0m7yX7o
	 OKn4iHmvW4L94JNyVYU6owHMvOHfnR8xdVxbNoBLj/e8uvt9sCc+thCNPjLSVo4Rxu/a4
	 fj0GObp6/5GJkVD9VuDz5+HanzJXVQkRw3+UC4biiOioE5c4MRddAy4MVS1oRLVvxL85f
	 tQxplCf73fcINYQd8mxmUEx2sgVGD1Z6p1GqSYGJ/eQUVc2pQh3FwVRyNtrlQ6IQ1stAI
	 rtkiZRmIao1R5Ja6oX/1fY2WJ+eti0xqP0snqCVV0ni9Y++KvTgRyAK54bbQZK7VezA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WF5PrbHQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF8606A323;
	Fri, 13 Nov 2026 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WF5PrbHQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009691F000C4;
	Fri, 13 Nov 2026 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596687;
	bh=96uMxzMr+QLWkHNXqLJouCT7WfpYZD6Ob8Fg/ar+4HU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WF5PrbHQMknlHypHmVqXVqHDNaaj4xcRiaJGp3cjoBwxfEviDLU8Zfd6oSvTpzrIF
	 OXul3asIR3LzzQYC/aaEcsAo/4p63G74LTuxGC7vxGoxKOKgrDArUe4CnjO6En40cF
	 Wkuj29XwEq+3C/mAvkU8dehiDeC9UPDOhCDyO0w02M5Mz6bSXA8knZX2BelzNSyQTn
	 vXWnkeGiWIucFkqLMsImpE5mmxyzeEWNZjRGHzQL5kumrPU6HaMF3reA2LwwVgxxn/
	 EcpLmYp3m4yljDJbiOXX9LvI8xnyQrVmlTUhm6raEdj7Yzd2HQ4x25EDbQVl7QKDVz
	 zhaUOi6YZM7SQ==
Message-ID: <sashiko-outbox-213497@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 13/23] ASoC: qcom: lpass: support mapping I2S ports
 to multiple LPAIFs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-13-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-13-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:04:46 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: qcom: lpass: NULL deref in lpass_cpu_daiops_probe() on
  unprobed LPAIF
--

commit 4c412765d7dfc4828c0e1ec1c2ada16e697ee595
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs

This commit adds an optional lpaif_mi2s_desc descriptor to struct
lpass_variant so MI2S ports can be mapped to and probed across multiple
LPAIF instances.

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index f8b9b2ec90553..411eecd9cbb93 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1079,6 +1079,8 @@ static void of_lpass_cpu_parse_dai_data(struct devi=
ce *dev,
>  			data->mi2s_capture_sd_mode[port_id] =3D
>  				of_lpass_cpu_parse_sd_lines(dev, node,
>  						    "qcom,capture-sd-lines");
> +
> +			set_bit(port_id, &data->lpaif_port_enable);
>  		} else {
>  			dev_err(dev, "invalid dai id: %d\n", id);
>  			continue;
> @@ -1121,12 +1123,33 @@ static int lpass_cpu_init_lpaif(struct platform_d=
evice *pdev, int idx,
>  	struct regmap_config cfg =3D lpass_cpu_regmap_config;
>  	struct device *dev =3D &pdev->dev;
>  	void __iomem *base;
> -	int ret;
> +	int ret, i;
> +
> +	/* Only probe an LPAIF if one of the port is described in DT */
> +	if (v->mi2s_desc) {
> +		const struct lpaif_mi2s_desc *desc =3D &v->mi2s_desc[idx];
> +		bool enabled =3D false;
> +
> +		for (i =3D 0; i < desc->port_desc_count; ++i) {
> +			unsigned int port_id =3D mi2s_port_id(desc->port_desc[i].id);
> +
> +			if (test_bit(port_id, &drvdata->lpaif_port_enable)) {
> +				enabled =3D true;
> +				break;
> +			}
> +		}
> +
> +		if (!enabled)
> +			return 0;
> +	}

[ ... ]

> @@ -1283,8 +1320,30 @@ int asoc_qcom_lpass_cpu_platform_probe(struct plat=
form_device *pdev)
> =20
>  		port_id =3D mi2s_port_id(variant->dai_driver[i].id);
> =20
> -		drvdata->mi2s_lpaif[port_id] =3D &drvdata->lpaif[0];
> -		drvdata->mi2s_intf[port_id] =3D port_id;
> +		if (variant->mi2s_desc) {
> +			unsigned int lpaif_idx, lpaif_port;
> +			const struct lpaif_mi2s_desc *desc;
> +
> +			for (lpaif_idx =3D 0; lpaif_idx < variant->num_mi2s_desc; ++lpaif_idx=
) {
> +				desc =3D &variant->mi2s_desc[lpaif_idx];
> +
> +				for (lpaif_port =3D 0;
> +				     lpaif_port < desc->port_desc_count;
> +				     ++lpaif_port) {
> +					if (desc->port_desc[lpaif_port].id !=3D
> +							variant->dai_driver[i].id)
> +						continue;
> +
> +					drvdata->mi2s_lpaif[port_id] =3D
> +						&drvdata->lpaif[lpaif_idx];
> +					drvdata->mi2s_intf[port_id] =3D
> +						desc->port_desc[lpaif_port].intf;
> +				}
> +			}
> +		} else {
> +			drvdata->mi2s_lpaif[port_id] =3D &drvdata->lpaif[0];
> +			drvdata->mi2s_intf[port_id] =3D port_id;
> +		}

[Severity: Medium]
Can this cause a NULL pointer dereference in lpass_cpu_daiops_probe() when
a sound card links to an MI2S DAI whose LPAIF was skipped by
lpass_cpu_init_lpaif()?

of_lpass_cpu_parse_dai_data() only sets lpaif_port_enable for MI2S ports
that have an explicit child node under the lpass-cpu DT node, while
leaving child nodes optional when using the default 8-channel SD line
configuration.  When lpass_cpu_init_lpaif() returns 0 early because
lpaif_port_enable is not set for any port on that LPAIF, lpaif->drvdata,
lpaif->map and lpaif->i2sctl remain NULL, and lpass_platform_init_lpaif()
likewise skips initializing lpaif->rd_dmactl and lpaif->wr_dmactl.

However, asoc_qcom_lpass_cpu_platform_probe() still points
drvdata->mi2s_lpaif[port_id] at &drvdata->lpaif[lpaif_idx] (or leaves it
NULL if the DAI is not listed in variant->mi2s_desc) and registers all
variant->dai_driver DAIs.  Unlike the platform suspend/resume paths,
lpass_cpu_daiops_probe() and lpass_platform_pcmops_open() do not check
whether the LPAIF was initialized before dereferencing lpaif and passing
lpaif->map to regmap_write():

sound/soc/qcom/lpass-cpu.c:lpass_cpu_daiops_probe() {
	struct lpass_data *drvdata =3D snd_soc_dai_get_drvdata(dai);
	unsigned int port_id =3D mi2s_port_id(dai->driver->id);
	struct lpass_lpaif *lpaif =3D drvdata->mi2s_lpaif[port_id];
	int ret;

	/* ensure audio hardware is disabled */
	ret =3D regmap_write(lpaif->map,
			LPAIF_I2SCTL_REG(drvdata->variant, drvdata->mi2s_intf[port_id]), 0);
    ...
}

Checking !lpaif || !lpaif->drvdata in lpass_cpu_daiops_probe() and
returning -ENODEV would prevent probing an uninitialized LPAIF.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D13
