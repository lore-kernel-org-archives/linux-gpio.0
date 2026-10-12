Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017793AE1A8
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784431; cv=pass; b=dD4yxYivJquy6tbwjJ8ubADl9BVZH9pN73jTB2XnOx73UvZ6gLzDhtJXvQHRjZPGJI+ZuOdQyhlHpGv/yn72poAewwD/sdp028Mvp9vZ9/FZxdkBJoDI6zzhAvmjSele83B002olMcIG/T7IUNJw5N6Tp4u+AvxAUaubgmrHxcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784431; c=relaxed/simple;
	bh=3SgrV3BQIpw/BKeX2coBnxDkspQuXkrqKJSDqrsxklo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg/C/zFepe0LpWQ47dfcfmyirXXvt9mxSh4vmkWzo9J8nFqOhgNHSpwAX3SloMEcZU6RI78CmElFOC70jXvsBFwUgsc5nlMns+MHhLmSc1uk1telZbgeaLOpqQJAlHFw2sL7HT+81GVmYbyv/L4zctvrBwdYaU3D8bMG04mrjt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/egVOmh; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/egVOmh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8917c712f32so604156b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 22:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791784429; cv=none;
        d=google.com; s=arc-20260327;
        b=phFcDzuraon4io4lqn0sW3CZsQpYPKj2TYJX5C/hPMWiaFU/kAygGYUeaqcpfN8FDZ
         t9xLezav2LANm2xY9vJH4XOUFWsETQvtSN1Ycql2ACJoVvHeXtItWFOohR3I2fM/TDeX
         KumPe5GYDntimmR30F+6MV4A1oUsYDsPJHMdW9+U/YBIKITJEbtC8qUwOnjn5CsH1Qn0
         q+Jvmx99W3IAg5g1Hb+LfTQTwDXjpFMHa7W2R7L3Byk+hTmpVrZqwKvre4YESKEMcLhn
         sp9SeSIN22YvvTrljTwjy0soBWvEuaUxNrEQhLGU3YxnmQAeh+ZkcEClL1P6evy8FK/f
         Wt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZO2SHHnYvNeqH5LGzfvAAyT6x/fjDGlAXnTAwdDQ/Q4=;
        fh=2X+7ByAkRO1QUnLaoP6/vLuZ9I3/VniOzD48dugxJcU=;
        b=VgYL5VyO2g/7Ynb1ltzT3H8stm+HW/tdjQcwtmdyHKucxvgXGiT0XzcO9DRjp7xbf3
         OhvcsgTQ1g984wqd3EhxM41BauhjP0odAAgY5zajS7Hf5YFV0pcCA/Cmjxn3U5uyBs42
         gx4XtLv4c/m34kdhzA7iZpnNTln2jMAL4Wwq9LgMwd/lK1+9aj9u4WWWieSoV0SSVtNS
         NzXq1W4s6ohv6K8XUxlCPWPNT0TdcMaRjAF6Q4uFF9KwZICNYPgZSYyLIlmKDO9VDzo1
         XEVY/3Hra3VDttTuMej4Zi2vQ4NATePVs4DuBbQNaYGef34KGd6BCkWSNNOmnHiBRXqK
         UfaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784429; x=1792389229; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO2SHHnYvNeqH5LGzfvAAyT6x/fjDGlAXnTAwdDQ/Q4=;
        b=W/egVOmhEvc+egmbAJX7YILUsMmgTzBFO+lKqJNZmxWNIlqUklcPR7jCBCfIpi9iRs
         VUTPfimIPDW4eV3GA+xbqXpzgVaIzYLMdUIzQ2JP8DXec2moKqcwCl1kD08kE1MBd+bK
         2fTsckhv+p8vILAle4CDiRfHxR1XXgsK2/JIZa/G0YPuo4y0Dq75bTQgAcKe++lJiIag
         nsyVw0Pt1kelhFQt3rbj/H94FMdbBj/a/CoxGxQ73Eb5Ixy3cwF3V0yqdz2OOOd6ZshX
         GDbzDifEJvMMDGoNI90h9/p9rnboY3nlHvj0dr31bHzizFnMI0TiW2ghN8UqD9Dfa/gy
         GLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784429; x=1792389229;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZO2SHHnYvNeqH5LGzfvAAyT6x/fjDGlAXnTAwdDQ/Q4=;
        b=krRewgVKuDNSdPd/Hnfj8bmVif/i31u9EChrXUjJOoxrmFJPqM0RG3T8PRWNvOS8tJ
         NFi8sJxRlD8bYchbwh3AQ0M6ZamNUpcL2k8/thkzQruzx+ZffORnfD373UBuBfSsqREp
         mnEKRvAhfolPfVBsp3VTJ7uM/R+ngJSa7N9TmQlvkrCzO6ksVYqrtPSUru3vOCcMmAiK
         pStZpu71Cmx1SPPhnhJ0DAGBXRSD7gINY9CbcaKCm6edwG0L6i0WM9DaCs3BeR+b7YqV
         gELRaZ/5AvHzoYcvjWtyeqFEEuwtKUfSt4CQqsmMNIX27zlVtxZ4eaLpTwpqsHtdVdy2
         3n4Q==
X-Gm-Message-State: AFq9FYKh6YT43IeviaslyAk9huww/R2lviTwJexYwRK3i6s0gVS7OVb+
	1rOvoZau32N6+NstFZ0bOBkS26zXlZKCaD3v9ij+rOlOP0B8eVzIeITyMz2NbEz8pG9DVnfyjFY
	w1/p6kdi1FHIVQVzH1pyv2RiAavkbIc6Kof6a
X-Gm-Gg: AYBFou3QuULxps1rN/gO1gv2JhstQ5upq9DFE1eQfUXfEUqJsiJrKKDhKnCTTWCkJPf
	Yrp2xeNoJ4AJqT0sSzxk+yUAGl4BXkdGg3AxfulChuTdRd7jdjooZd5JZSkU6tO5VaeO+Xtqauw
	vGaPIBYhG6Jv3RytHjZ/uzow1iiSeERncSGZdywtp31tiaG5kOHxcB633f0LANYnW9Ls0gphElX
	nJjqMBb3wUgH9jGnPc/2zbBzSkRHLCnDvO41ttGfzTgTQbACehfpFFL5IP7arCjtjxW8Y1IzU4O
	JPDMVSbcNFVXZiwuiB+2vEe1m/i3TsKTrjbpxP3sVq24Vbq1ckrHsz4rYa6oVI3hTpaFb5i2/5e
	SsGxf8dxcpbod8ACb2UrXD0iFUNU1v/mzX32gzZEFFwzKG87Hk+5TgqZeWerg6Zdko6Q=
X-Received: by 2002:a05:6a20:b78a:b0:3de:8825:15b with SMTP id
 adf61e73a8af0-3e16be899c6mr7214244637.12.1791784429226; Sun, 11 Oct 2026
 22:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012015433.6155-1-phucduc.bui@gmail.com> <sashiko-outbox-167547@kernel.org>
In-Reply-To: <sashiko-outbox-167547@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 12:53:37 +0700
X-Gm-Features: AclHuK8accYR9YlUU51RFCxSlQ8XGVvYal9shsHWXg0w-Rp09FTRK_kAe2k46dE
Message-ID: <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
To: sashiko-reviews@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: High]
> Does this cause a regression for multi-chip SPI configurations by aborting the
> probe due to -EBUSY?
>
> In the SPI driver, multiple physical chips can share a single SPI chip select.
> This is handled in drivers/pinctrl/pinctrl-mcp23s08_spi.c:mcp23s08_probe() by
> iterating over spi_present_mask and calling mcp23s08_probe_one() for each:
>
> drivers/pinctrl/pinctrl-mcp23s08_spi.c:mcp23s08_probe() {
>         ...
>         for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
>                 ...
>                 ret = mcp23s08_probe_one(data->mcp[addr], dev, MCP23S08_SPI_BASE | (addr << 1),
>                                          info->type, -1);
>                 if (ret < 0)
>                         return ret;
>         }
>         ...
> }
>
> Because all logical chips share the same SPI device, the same struct device
> *dev pointer is passed to every mcp23s08_probe_one() call.
>
> During the first iteration, the reset GPIO is successfully requested
> exclusively.
>
> During the second iteration, devm_gpiod_get_optional() is called again on the
> same dev pointer for the same "reset" connection ID. The GPIO core will
> attempt to request the same descriptor again, which will return -EBUSY because
> it is already requested and does not use GPIOD_FLAGS_BIT_NONEXCLUSIVE.
>
> Prior to this patch, the -EBUSY error was ignored, allowing the second and
> subsequent chips to probe successfully (which was safe since the reset line
> was already asserted and deasserted by the first chip).
>
> >
> >       /* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
> >        * and MCP_IOCON.HAEN = 1, so we work with all chips.
>



I looked at how the cs35l35 and aic3x drivers handle -EBUSY
when the reset GPIO is shared:
- cs35l35: https://elixir.bootlin.com/linux/v7.3-rc6/source/sound/soc/codecs/cs35l35.c#L1524
- aic3x: https://elixir.bootlin.com/linux/v7.3-rc6/source/sound/soc/codecs/tlv320aic3x.c#L1815

I think handling -EBUSY similarly to cs35l35 may be more
appropriate here, preserving the existing behavior for shared
reset GPIOs while propagating other errors.

Linus, could you confirm whether this approach would be OK for
mcp23s08?

Best regards,
Phuc
