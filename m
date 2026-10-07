Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8829486E68
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369178; cv=none; b=fa73wJXDprNvT/T8kvZAqoMWNi953oG2nv/MeakAg9AfEPQQ5a+dnc6UarTqtcZnwEufA3rX1422DwEcuqE5kcilV/0Fs1nJVVMNgh5rGTM3aSP5mBIuFT4fcOhtc01lALpt/KRjo0DgzZjXmCt54DE9x3MuazonvdvMfETroPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369178; c=relaxed/simple;
	bh=9oVWb69ye6d2njaXoyoGmeFsDZ5OqzzUsKteeito8/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMIkSgaPCtjEHE9tSQK2ARIxyqzQA4RoGtXVuPbUTGGN4SxsoLkLDRfzdrSQc2tOxzpO3TsuOV7WX1x2/Q89NRwbcFMjd+tIsLa6cMq5oYetOZEAexsgXTU14JT47zO4QTm9aDEQH0WvT/LZXvkvsJxpfFxOlJBTeWabfg67Q7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwCE6VPT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwCE6VPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7200C1F0089F
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369147;
	bh=9oVWb69ye6d2njaXoyoGmeFsDZ5OqzzUsKteeito8/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WwCE6VPTKmh0z2WYkF1ftc6xP/p3rFr1SOM2PLy8a6xNDq4CL5+oOOkQG4Nacii7H
	 Rbk8F7Ez7JCanSA9H4scO0nj4ImXe9mCKXGuMMuJyvtuIqocQlwz1NlUQP/L5CaJWI
	 o8b0Uq3sOpIalvmzPjqW7IM69I63OIemAp4nm00QZncxHnbfH4DKf//fHOVNV+yM4l
	 lbGxe0unfV3rUhMEmrNOjVoTLwewFKG1j0wo4Dokl/SnMvCgvyXKLdN59RP0YtS86d
	 T/kt5K4FuT6SCllY/GP8n1LCzw6tI0071ywEL0mR8aMb4jADCeEEnUi7VXNQ/sSCJp
	 bpSJXVpC24c4g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bb7c8f6501so954320e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 03:32:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlnh41Lzea4MQr6Nru1eO5vaw+QMBI33pCq6jPckBImC3LfVCvWv5oH52/XwZMk5bcYD6nPOg3bx/0@vger.kernel.org
X-Gm-Message-State: AFq9FYKJZctjVhdjkTy71qKlRuQ3C/l4OhmjP8R6Ru+S8QFW4zRflrt+
	c6/RpKlyM4TXwHtViaAAwnExmTxxchKozULGnr0GA+Od+AhFEFr0AcMPJxEMbSqfi1AGYGPoDqU
	DLBoZQJXi80P3EKJNKQhcrL/p+06zjv8=
X-Received: by 2002:a05:6512:3091:b0:5b8:c174:c98f with SMTP id
 2adb3069b0e04-5bcd072e011mr626080e87.47.1791369145191; Wed, 07 Oct 2026
 03:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org> <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
In-Reply-To: <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:32:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLmm2KrsuaCPznjY-_t577D-hWZqcaafHXSeTcugBsG-yQ@mail.gmail.com>
X-Gm-Features: AclHuK_OngjnXsvCqah6XeVHOfyhFcVTH5dTjPiY0oqEZpBecitNEwT07XJY1uA
Message-ID: <CAD++jLmm2KrsuaCPznjY-_t577D-hWZqcaafHXSeTcugBsG-yQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: imx: Match the standard SCMI pinctrl device
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:37=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
> "pinctrl-imx" name. Standard devices no longer have exclusive request
> tracking, so the i.MX and generic pinctrl drivers can register for the
> same protocol/name pair. Their probe checks select the appropriate
> driver for the platform.
>
> This solves the issue that occurs when both "pinmux" and "pinmux-imx"
> devices that share the same fwnode as only the first device registered
> is assigned as the owner of the fwnode. If this owner device fails to
> probe (e.g., its driver is blocklisted or missing), it never reaches
> the driver_bound() stage and the system skips cleaning up its supplier
> links. Even if a alternative device binds successfully, the system
> still looks to the broken original owner. As a result, all dependent
> hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
> forever, halting the boot process.
>
> Note that the solution doesn't support same fwnode being shared by
> multiple devices and associated fw_devlink feature.
>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: imx@lists.linux.dev
> Reported-by: Peng Fan <peng.fan@oss.nxp.com>
> Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f3=
2@nxp.com
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

I guess it needs to go in with the rest of the patches to firmware?

Else tell me and I'll just apply it.

Yours,
Linus Walleij
