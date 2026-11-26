Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698439;
	b=BZ7u+I9EOpWqj0G5tNlcxMYPZMTchXOHu+I62S6UwIAwmf660ZHwsFi7n7Ii/amQeLgT
	 aMvRpKk55oUGqKlBwwwoTSJhX2vsRlujT17ZI5t2auAkv+7NC7QzBgqWoKPBW7fOCquKI
	 qLxzd6td9l1MrG3lhYfLdKFqZFZymMBlFJzdpzqcUBInEW4lXSUs0wHkHA75gSdMBmVkQ
	 /PyFhj+Y3mFEJqT3aycE5TsgmrdaVzaz7y0Yxy8TalXSgytkYEpKmCabp2P20s4Ogk1uv
	 xwW/z0L9Jjj1Aq8Ri78EsCWh62o7c8lnb0OJAA6wLPRrMufO1q/dcLP2U8oPIDhYICg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698439;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k6MLydfrU5dN1iQDZDbtilSOMTOBZOStE4iUqdVk/Q4=;
	b=b+Y7HwrVgC8PEORLtzVTUYPJS40Ew/SFU2s8u7mTASNageQAN4GW+dzBSVv9t5Ngj6sX
	 Ebgri7PJMzA0ksnVcYRyLb93ZNfmrFKbGKWbKUau2eLO9RAk3FyRO897PBbu+mcUUDTVU
	 vH/01k8JHO5Wp/vnbhNYwugmybNj2jbYhataOnlenwgEDlZhbSAVefub2V1PAu6j7fAzc
	 hflr2Z5R9n6JfpKLroDhIIGhkkLBzKkguOZzR6GltOfYnazVLgyMhD4HvsNBJopycHiG4
	 rTsGikFPcIRe3+nZu7OB0cXK/GUJ1Q/YK8vBKjSxTwasOYbkCRqmm9dqvbwYdbB3GqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkwy0Pw6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1750606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkwy0Pw6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D431F000C6
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698438;
	bh=k6MLydfrU5dN1iQDZDbtilSOMTOBZOStE4iUqdVk/Q4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jkwy0Pw6kheEy3Bf54lDMZfIwZbTP0UhNeq6TrUDmAwiib+pNkpMEpSZMLBkMFpk0
	 9QxxnryKn7D4iRJQunPjHgv0MQcyA4WveEXdsAh4Om4HwcNHnppuzXiYMAVG/nBxfM
	 N451kxiOk4jDmJMI4fXYIqZP8XMVWFZ9R1NFLO8BHJhZYp9ryFtXWPMXRf3Qk/Nlt1
	 7uRpvWq3GVmLQcMoyat6UoUTOwsrACZdsRoz89k8wxpNUi6OMcStndOvPUP+whZgSK
	 2ls2p8yhJSgYsHw2e5RZZYqbZu1YhAaobwvMmyRZwQJ98xWNZqwM9j82olirp2/kv4
	 YR8u2DQqYHCeA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c126f80426so6725966e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 05:07:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFeYVmrknvTupHIOgasNnbH2W1Nz7BAB5m62qILKMLsibH5f0Ym20hd+J3IzbqfBGNsq2yYNylhbmw5@vger.kernel.org
X-Gm-Message-State: APuU4Z9WZIVNjIIQ4nRlOIjO6DhKupciaXfN5260kDmqGMg9lZuhXc2m
	H7mTYiH5J62+yAzyZCBdzyxGLS5T8/NF/9kbT709Ogp0NY3MGzwUGcMe8bCfg9oa6zL8zAgjVCy
	9G9z1iP3eeZKp524/xsqE9EKA/AT5nk0=
X-Received: by 2002:a05:6512:3b14:b0:5c0:465:3fb5 with SMTP id
 2adb3069b0e04-5c1bc806862mr6763468e87.10.1795698436999; Thu, 26 Nov 2026
 05:07:16 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116031043.502-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261116031043.502-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:07:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLmJt8+Yz3hWPwA7wo63crAj6E+qD2b83h9pPLSV4ktu_A@mail.gmail.com>
X-Gm-Features: Aa3M54oOpmRcJWcEY0wb-eeul9G7QcTYb_X8Hc7Y0lyAIc5DHSEcaFmVlL8EIqk
Message-ID: <CAD++jLmJt8+Yz3hWPwA7wo63crAj6E+qD2b83h9pPLSV4ktu_A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:10=E2=80=AFAM Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:

> stm32_pctl_probe() acquires an exclusive reset control for every GPIO
> bank with of_reset_control_get_exclusive(), but none of the error
> paths release them again: the bank loop returns directly on
> -EPROBE_DEFER and on a failed clock lookup, and the
> clk_bulk_prepare_enable() failure and the err_register path also
> leave the already acquired reset controls behind.
>
> On success the reset controls are kept for the lifetime of the device
> and are never released either (the driver has no .remove), but that
> is harmless.  On a failed probe, and in particular when the probe is
> retried after -EPROBE_DEFER, every attempt leaks another set of
> reset control references.
>
> Release the acquired reset controls on all error paths.
>
> Also release the clocks of the already processed banks on the
> -EPROBE_DEFER path, which was missed by the earlier clock leak fix
> dfd8259507c5 ("pinctrl: stm32: Fix clock reference leak in
> stm32_pctl_probe()").
>
> Fixes: 2254e77665d5 ("pinctrl: stm32: defer probe if reset resource is no=
t yet ready")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Patch applied for fixes.

Yours,
Linus Walleij
