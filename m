Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BBD477982
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347286; cv=none; b=o1RTnfZB2SjovpF2m88ZyIvf4ZRJBLsBmTg/xjfmTUt39uyC+wcHA7pHHV+doBK7GcN0hUQ183PCyk16rE6wY+2rKXUC0OEA3jLTY8TmPWYRBYHRixVdy1wnP+Ne3jIp/fC6cVhM4Hn5uIHyqb5VDUuo7En/TtMXEK94f8EkKrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347286; c=relaxed/simple;
	bh=G0sJs0ujHiGOhjGyLliQnfeBam1mT1YiVW8eQVl48a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhWppzhGceJd+5s2n+KwW0ZWEEUf4rrfxwRO1XwI73R6xXEBj5VPIVMblTbsBHoCAL0muY1Sh8ac/MtObyqT1AkQzLU5w5D4Zqg7bCezCuO0nvEgGuJgzxj7V2E/q3mY9VIXzzfmEnzWj3QJ+zgabazuXvdPLGm0COP05XJCtcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMWMOdh+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMWMOdh+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10098855e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788347283; x=1788952083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AfNAVBz0XtGYE2d+HbSOZwCHDoc1V70sAc8HmdvpJ0=;
        b=nMWMOdh+VQ5Do53PInKQ2d9undzt+tHm6OxFVdWf5C4XcuxqrYwkQlbGwSsKGHF0pT
         Rk+7zYok5t0sEQ+YyBucQijFl4hSG/Tg//Ow4dkKUHeUFa6BYXkWtQnSbr25hrmpeSSt
         lBcvtqHoWkJixRmlMKZ8bTA+NV7YWVz+XS5thNhwusr1Z8GPQTeUaIuLrdE8j2qfvsnp
         id0HdGb8HhjI4uaFHPwGqAsrEgyeoxmlY2g+hFJfmo1fSh4T+W2Mc4rqqImvd17spGQN
         qoYZbVNAbZ6wbSI1GYLyJExCqfclgRhquCdA2eKNSzoVFcBG6GkNP2s9y3yT1VewfuKT
         +4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788347283; x=1788952083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AfNAVBz0XtGYE2d+HbSOZwCHDoc1V70sAc8HmdvpJ0=;
        b=kwEzItBr9crkHdZtEaB1VyeVcIGonZSFVkEyvRYf06NqasxngojPXJohExXY7Snx+l
         FshsA83wv1OcYbrO75HKyTFBx9FyMun3nRl4INZhEFYf0nP/eMNXz46P63xjq7kUg8A6
         aR20dDuJte/Caccs17zItvgxCwN1GBlnBTdTW8HFPu6072oWQHei8whDrRKLOxFK455V
         Pg6HCu8JJ/GpZQPN50JRhrirb6lFIW/aXt2FURze5rA9Mx/hX7ENnI2z1nS3MJzkDwCO
         nSH6gYDoZh6zI8DRmhvvU3tENgGI8twFOQIz8ZsHI/kpyQ8/Y+9Ci2dvmsd6yIU0pzJL
         VCbw==
X-Forwarded-Encrypted: i=1; AHgh+RogfeXkxROyz7ldyOMb5CpHz2GU/w9bH686OF1Id5hRSVZwbRrABK3gxaLWek6J+QDqVytXY/2ZhbyJ@vger.kernel.org
X-Gm-Message-State: AFuF++nO7Dnu13IkexsgougPzgSqbIHY82BCXbgQgbAy1T5HFgWd+SbM
	EMhjcYxNkfI7BFsRgO9dsgCBA9mm3L1dq7gm7e1N7GzX+rx/y5hk21YT5q5avEZ4
X-Gm-Gg: AR+sD10QTSratNdjrCAakhlzLGwfdhQTZt8b4obP98Lng7ZBzO3dMA57hCi2FoD87/A
	jrJC5nKwJIVEtEWm6yQZB4aaOQVdOV6Cp/7IXXsDKvUa7G2dvIwoVCuLAPJ3PlTgy7UyBRgtHT+
	CMGzzcq22zfGuLVLco0NCOyl8DU5ct22HadkdfjW5u/B04+zKG5EpbVbnfbvALl26AzoClFQ7FU
	mBe2blV2P+TopEAGd67qLv1wSxWU8AIOfqbZD3b3lkcdul5st4PeZpEY6zQj0JyRlIs5Rnri2yt
	paZKdJoTQ56+jH9UMNei8QPgOcFWE6dPPiWHWTRhHsxcxrXk3JjgtfBU3jnp2akioY8+2R8zrv2
	hF49KdKd3kA1z3/Q4k65d/ejD9cK0/g4f3gSARD1zog/2QE5JEN8PnejNHyvTO+eEkLgCSaIt8A
	wVgKwH89DkpR0iMV0SybHK3r1HIyJ5KJjdPEONwNN2hKU5T1eg5Jpy/f5U7oTdyY/CIny9HC+LX
	q7q
X-Received: by 2002:a05:600c:4f42:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49ce558e89amr70479425e9.0.1788347283266;
        Wed, 02 Sep 2026 04:08:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm96387015e9.0.2026.09.02.04.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:08:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 13:08:01 +0200
Message-ID: <20260902110801.3893392-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902075629.D0B1C1F000E9@smtp.kernel.org>
References: <20260902073946.3709080-2-mehmet.fide@gmail.com> <20260902075629.D0B1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> New issues:
> - [High] Dangerous asymmetry between `pin_config_get` (generic) and `pin_config_set` (raw) causes hardware register corruption.
> - [Medium] Incomplete transition to generic pinconf API breaks SCU-based platforms.
>
> Pre-existing issues:
> - [Critical] Out-of-bounds write during Device Tree parsing in imx_pinctrl_parse_pin_mmio

[...]
> [Severity: Medium]
> Does this bypass the generic decoding logic for SCU platforms?
>
> If a generic caller like pinctrl_gpio_get_config() queries an SCU-based
> platform, it appears the SCU path (info->imx_pinconf_get) will overwrite
> the generic parameter in *config with a raw hardware register value instead
> of unpacking it.

Yes, that slipped through: the SCU callback returns the raw pad value
like the mmio one did. v3 makes imx_pinconf_get() return -ENOTSUPP for
IMX_USE_SCU SoCs, so a generic query gets "not supported" there instead
of register bits; the debugfs dump keeps reading the raw value through
the SCU path as before.

[...]
> [Severity: High]
> Does this introduce an asymmetry between the get and set callbacks causing
> hardware corruption?
>
> While the get callback now unpacks generic parameters, imx_pinconf_set_mmio()
> remains completely raw. If a generic caller like pinctrl_gpio_set_config()
> passes a packed config (e.g., PIN_CONFIG_LEVEL), will it be blindly written
> into the hardware pad configuration register here?

It would, and it would have before this patch too; the set side is not
changed here. The fsl,pins binding hands pin_config_set the raw pad
register value and that is the only thing it accepts. The one in-tree
route for a packed config into it is gpiochip_generic_config(), and the
GPIO drivers on these pin controllers do not install it as set_config
(gpio-mmio, gpio-vf610, gpio-mxc); gpio-mxc calls it directly only on
the SCU based SoCs, with the SCU wakeup code the SCU set callback
expects, not a generic parameter. Without a set_config the gpiolib bias
and persist helpers stop at -ENOTSUPP before reaching pinctrl. A raw
value and a packed one cannot be told apart in the callback either, so
decoding on the set side means a real conversion of the driver, not a
fix that belongs in this series. v3 states that boundary in the commit
message.

[...]
> [Severity: Critical]
> This is a pre-existing issue, but can the Device Tree parsing cause an
> out-of-bounds write here?
>
> Looking at imx_pinctrl_parse_pin_mmio() in drivers/pinctrl/freescale/pinctrl-imx.c:
>
>     *pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
>     pin_reg = &ipctl->pin_regs[*pin_id];
>     pin->pin = *pin_id;
>     pin_reg->mux_reg = mux_reg;
>     pin_reg->conf_reg = conf_reg;
>
> If a maliciously crafted Device Tree overlay provides an excessively large
> mux_reg or conf_reg value, the unvalidated pin_id is used to index into
> ipctl->pin_regs, potentially overwriting arbitrary memory.

Agreed that the index is not checked against info->npins; it has been
like that since the parser was written and this patch does not touch it.
A bounds check with -EINVAL is a one-liner, I will send it as a separate
patch after this series.

Mehmet
