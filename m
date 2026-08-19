Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67119478E49
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149701; cv=none; b=tKtyvEGefV6RKbz2GSFv8E+jrRlGqpEqBrECP1ktbT7cRbXjtbOqAcy8TKBhU8IHi2JQ4uzqSisTQWgA7ZYNE0k5Cco/4zLHJr7ubXiyiUxtSIgMDA7XyQI+lvNv6ZSzV+nz383rwylw/3VDISz0TNgTZplMIFpgYIs7Vrs1IaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149701; c=relaxed/simple;
	bh=NdR/r5cs4L7ZRKp84zLL5vTM42zkOs6f/D8Mq7IpFms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qij4c1+JKU8Yo3UG67FB88HJds4DmuuvV4/ip/qmawKw5vXsQqnIdPu3LZonqsQr+Qpy1xscURkKhoEfRQOuX5CnZNcimQW1cg/ib5JpIKKFMWManwY85BwmRdBpgwE/PSAOivcCE37qrFBq4c91Wq+rBl7iuqvsFT/nPL21wZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxLIa+Oi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxLIa+Oi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so8557075e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787149687; x=1787754487; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7un4O3L9YLxIWNurYwHJNMBBiutfCLK9e9so1V1Jlvw=;
        b=QxLIa+OitKCiehiaW8mxC+S8O9Bk0pLa8p+pHr0hJLiHIUrdvCUDp88yASlfqcV1rl
         iDACjBiExOwmH3OOSyiszg8ajWnQz7F0aYhZJpe9PrGDFixXOPZUBRrhduN9Sphuhk26
         BiETZ0eeD28hElYFPhnQ6yocFtdcOHSRbaH4L9iiqiz6gSRxmOo9tmWbKTNQHIyy4y/3
         ka1FJPYOiOgeGckslYXMo+WNqzNnoBlSaN52ZJc3cImwmMBjobxZ7w3noRdc+awt7SFN
         f4KR5jVT2gG9M6FlE2HN8lgGRFGhv/qJgWc7/mxn1E2zZpdbqvdYhaoAxVQxCqTl+GoQ
         46uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149687; x=1787754487;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7un4O3L9YLxIWNurYwHJNMBBiutfCLK9e9so1V1Jlvw=;
        b=Bqz4mPfwzCry9u0XA0dIqp2NkE2+n1/MIoOTW85G+JadwxEAkctclCAXi+7ZbpwWuc
         /9CUFFqeHIEygKJJ27P18/L85uXYMGIBPGA2EYG/T8VBjcFtCSOb4CuW44HC3YzeUSHB
         3yFkK/qXGJrsQssYsuleIrPnmjBc+FzQNmyBTDpBG2tPOZgKd6nvNodxzlPGF9s3Vwh0
         5NrE8eNaKOa0h86bhXOoHDKcPv+Q8ulhc6VpBd6v9wr7gaEGJuLMfTH30KDIKOOPxfso
         SDWbefopPpb139idZeoeZZHXvjVULxulZr/pi1s8VYGD31nPcl5/GhdRnzqCHVit8VE2
         W56A==
X-Forwarded-Encrypted: i=1; AHgh+Ro7frjZK6v0yYAXgV8bZUws53KgxIhMywHw/hgcXJz/SLXuuyDi+ZEBgGJzUrCmBRK8B7hR9MH2Yezu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/gg9CB/DC1hx14RDYxF5xjtomTnKloKaxWpO+GOgwWzg7zJNB
	ifVb2k7tQ8rFHeZT46WPEPniT12CB9e18dpmlra8F/XAVJiZ96VsJfJ/
X-Gm-Gg: AR+sD11kov2/WkZ+HRK2Qqx/dfLX/97BQl6drdAVb6RLJauEAgDK3tpkvtvwVo2pwLZ
	5FEe6r1lJ4pyGb79DUXebbAu0ttmiibEFhOBvo3d2NUXAFFDsMEfAWCaKRl0yA+2KU1XApJhBw/
	SOZqRsPOSQrwDJ/I8W7P4serrT7l+qkQ6nqkwjTw3j4lyfPvGg9vv57hqghKuw4Xd742HeCI9t8
	OhgF4fehqlOzcJorR6d9/2J0lrsNEb/cKJ4VGHtFHtYSiWluFU+zLrsZS7jyw1POtI5LgzyRNmN
	hIO0UMPmwxGIu+bnyX1jLp9ERawr+AXvGcYBBpozyrdIVo0DHgSOXEa32l/zkT1zn4lVR2wHrvQ
	bN5Lemtup+6sFoNr1AgosWS2eoxMr9E1XZcZpEk4ebt1N1yFjWkIBuMoMI4ONN/hFO6xublmdHv
	HVtw0Z5L/Ji/tg5kgK8TXMcdQN1heXesG9g2GE8W+XNoLMWzbNT0IQJAvBcf5EkPgGY4z99k8PK
	rPG0ShEpVPlxJVs7hAYJJT1kxZrgpgPTgUBLyOw5dZSvnaSj4NjYOM=
X-Received: by 2002:a05:600c:8b71:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-499aa100de8mr89119795e9.7.1787149686732;
        Wed, 19 Aug 2026 07:28:06 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9ddee1esm39709255e9.2.2026.08.19.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 16:21:14 +0200
Message-Id: <DKSZJMQ4KJ2W.1HB8IJEZ9WDFX@gmail.com>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
Subject: Re: [PATCH v15 16/22] media: i2c: maxim-serdes: add MAX96717 driver
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-16-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-16-7212e9e5156a@analog.com>

I only went through the clock, pinctrl and CSI-2 lane code, not the
whole patch.

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]
> +	{ "maxim,jitter-compensation", MAX96717_PINCTRL_JITTER_COMPENSATION_EN,=
 0 },

The automated review already raised this: maxim,jitter-compensation is a
boolean in the binding, so the property is present but zero length.
Reading a zero-length property as a u32 gives -EOVERFLOW.
pinconf-generic treats only -EINVAL as absent and substitutes the
default above on any other error, so 0 lands.
max96717_conf_pin_config_set_one() then takes the arg ? en_val : ~en_val
branch with arg =3D=3D 0 and clears the bit. That means the property for
enabling jitter compensation never sets this bit, and nothing else in
the driver sets it either. Giving it a value does not help, since
maxim,jitter-compensation =3D <1> is rejected by the schema.
pinctrl-k210.c uses 1 for its boolean params. Should the default value
here be 1 as well?

> [...]
> +	/* Configure a lane count. */
> +	ret =3D regmap_update_bits(priv->regmap, MAX96717_MIPI_RX1,
> +				 MAX96717_MIPI_RX1_CTRL_NUM_LANES,
> +				 FIELD_PREP(MAX96717_MIPI_RX1_CTRL_NUM_LANES,
> +					    num_data_lanes - 1));

max96717_init_phy() calculates num_data_lanes - 1 without
checking for zero. The binding requires data-lanes, so this needs a
non-conforming DT, but the driver removed in patch 21 still rejected it
with "Invalid data lanes must be 1 to 4". Here num_data_lanes remains 0
and the write sets 0b11, so the count becomes four, silently.
max_ser_find_phys_config() compares num_data_lanes against the single
{ 4 } entry in max96717_phys_configs, so zero passes there too. The
automated review asked about the upper bound on this line, this is the
lower one. Shall the range check come back?

> [...]
> +	val =3D FIELD_PREP(MAX96717_REF_VTG0_REFGEN_PREDEF_FREQ,
> +			 predef_freq->val);
> +
> +	if (predef_freq->is_alt)
> +		val |=3D MAX96717_REF_VTG0_REFGEN_PREDEF_FREQ_ALT;
> +	if (!predef_freq->is_rclk)
> +		val |=3D MAX96717_REF_VTG0_REFGEN_EN;
> +
> +	val |=3D MAX96717_REF_VTG0_REFGEN_RST;
> +
> +	ret =3D regmap_write(priv->regmap, MAX96717_REF_VTG0, val);

max96717_clk_set_rate() sets REFGEN_PREDEF_FREQ and its ALT bit, but not
the predefined frequency enable bit. The REF_VTG0 defines stop at
PREDEF_FREQ. Bit 6 is not part of the composed value, and this is a full
regmap_write(), so the write clears it. The driver removed in patch 21
sets REFGEN_PREDEF_EN (BIT(6)) in its own write of that register, with
the same encodings for the six rates the two tables share. Currently,
that bit is left 0 on every rate that goes through REFGEN, including the
24 MHz default programmed at probe. The datasheet has REFGEN_PREDEF_EN
reset to 1, and describes REF_VTG4/5 as the feedback divider fraction
used when predefined mode is disabled, which this driver never writes.
Was that on purpose, or should it be set here too?

> [...]
> +static int max96717_register_clkout(struct max96717_priv *priv)
> +{
> +	struct device *dev =3D &priv->client->dev;
> +	struct clk_init_data init =3D { .ops =3D &max96717_clk_ops };
> +	int ret;
> +
> +	ret =3D max96717_mux_set_rclkout(priv, MAX96717_RCLK_MFP);
> +	if (ret)
> +		return ret;

max96717_register_clkout() routes RCLKOUT to mfp4 and sets that pin to
the fastest slew rate. It runs after max96717_gpiochip_probe(), which
calls pinctrl_enable(), so at that time the pin setup from the max96717
node itself has already been applied. The binding in patch 03 allows
function =3D "rclkout" on mfp2, so a config that asks for the RCLK there
gets it, but loses it a few lines later: max96717_mux_set_rclkout()
clears RCLK_ALT for any group other than mfp2. A slew rate set on mfp4
is overwritten the same way. Should this leave alone a mux state that
pinctrl has already selected?

Moreover, the driver names seven slew fields for eleven pins. The
binding allows slew-rate on every pin, but max96717_get_pin_config_reg()
returns -EINVAL for it on mfp5, mfp6, mfp9 and mfp10, so a slew-rate
that passes the schema on one of those four makes pinctrl_select_state()
fail. Another device pointing its pinctrl-0 at such a node fails to
probe, since pinctrl_bind_pins() returns -EINVAL. On the max96717 node
itself it does not: pinctrl_claim_hogs() logs the error and returns 0.
Either way pinctrl_commit_state() stops at the failing setting, so the
pin configs after it are never applied. Table 13 in the datasheet lists
no pin slew for mfp5, mfp6, mfp9 and mfp10, so the driver looks right
here. Should the binding restrict slew-rate to the seven pins that have
the field?

Kind Regards,
Artur Andrzejczak

