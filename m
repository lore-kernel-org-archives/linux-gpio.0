Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8B3C3BF7;
	Sun,  4 Oct 2026 19:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791143139; cv=none; b=QiWMwIwdQoyLG/L2tyR7QNzAhltnFDuxMCuDyMICCZwggP3ZVokX8gPmzBRTPWm7x8MVuW4bTiLAzvoj7DzzzdBEzOZ0EjWGU/MdOnqkQQOjZFt1sKi4B4NOidC1egCalFqClSROf1kLDITt2mjgaiNw8pcxIaetUqRJMHP81xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791143139; c=relaxed/simple;
	bh=W/m4BXAPtaXV9qlKPDGDaJok2KwyRdNXSvtRhQ89TEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZO56Iq+4aqLGNGYsRkS6brWWQ22OLOdXPqc5Cco2zEf9hw8ufNjelZv3+jvWQNs79mrjs1s6aR1To8r/eni4rNzCLbq1UACmQz7Lt5xTjwSqGTxI6jjzQ+UP5g5fIwncfxxlRPO3Ned5HUf5IARKKm4jNGnNPKeeqch0Vyza++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGaCjY8E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGaCjY8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32EA1F000FF;
	Sun,  4 Oct 2026 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791143138;
	bh=W/m4BXAPtaXV9qlKPDGDaJok2KwyRdNXSvtRhQ89TEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZGaCjY8E9ztvKVSPeiHf4Dj98lMLVzdbf+Ri/LTWkKTmJBxKYkS6ZQfIIxU8d4cxE
	 1sbOZxWxNOkP/CDve179jweoRS6ZoReJF/21DehTcKvA8Wn33innII+VcIbI0HOaKP
	 6fxvH0sBfsm74JkAyn6ogp4cxOyHsBlbE8a6Uv343qT/HkoF7Lxbq44AVlMycwVYND
	 4FOiVMmgRhZmK5Fi9AMNFC7e+CitDq5C6jugn1v0AQVfAD0A3XjEs4ZpYGQKkvgcxt
	 a4LfVgdPBZiDN14gL89h3teOzTOdbe4ejQ2majT20hMt+UyiG/1w65ny1EklV0YnWf
	 PHAfjiEwenn2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] pinctrl: tegra: Add support for Tegra268
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prateek Agarwal" <praagarwal@nvidia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261004192921.2460405-4-praagarwal@nvidia.com>
References: <20261004192921.2460405-1-praagarwal@nvidia.com>
 <20261004192921.2460405-4-praagarwal@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 19:45:37 +0000
Message-Id: <20261004194537.D32EA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pinctrl: tegra: missing -1 initialization in PIN_PINGROUP_ENTRY_Y =
corrupts pinmux
- [Medium] pinctrl: tegra: missing hardware pins (SDMMC1, UART9) from confi=
guration arrays
- [Medium] pinctrl: tegra: NULL pointer dereference in tegra268_pinctrl_pro=
be()
--

commit 6edd21c4b852f6086992a569432d8b85b70c1f2d
Author: Prathamesh Shete <pshete@nvidia.com>
Subject: pinctrl: tegra: Add support for Tegra268

This commit adds the Tegra268 pinctrl driver supporting the MAIN, AON, and
UPHY pin controllers.

[Severity: High]
In the file drivers/pinctrl/tegra/pinctrl-tegra268.c, looking at the
PIN_PINGROUP_ENTRY_Y macro around line 1475, does this leave unsupported
pinconf fields like odrain_bit, ioreset_bit, and rcv_sel_bit
zero-initialized? Since omitted fields in a designated initializer default
to zero, they might pass the validity check in tegra_pinconf_reg() which
verifies if the bit is less than zero. If a device tree node attempts to
write an unsupported parameter, could this end up writing to bit 0 of the
register and silently corrupt the active pin multiplexing configuration
because mux_bit is also explicitly set to 0?

[Severity: Medium]
Also in drivers/pinctrl/tegra/pinctrl-tegra268.c, are the hardware pins for
SDMMC1, UART9, and PU0-PU7 missing from the tegra268_main_pins array around
line 275 and the tegra268_main_groups array around line 1737? The driver
defines pin ID enumerations like TEGRA_PIN_SDMMC1_CLK_PX0 and the
associated drive group helpers, but omitting them from the tracking arrays
means they will never be registered with the pinctrl core. Could this
prevent these pins from being configured and render critical peripherals
like the SDMMC1 interface unusable?

[Severity: Medium]
In the tegra268_pinctrl_probe function around line 1909 of the same file,
is it possible for device_get_match_data() to return a NULL pointer if the
platform device is manually created and bound via sysfs without a matching
device tree node? Passing a NULL soc pointer into the core
tegra_pinctrl_probe() function might lead to a kernel panic when it
unconditionally dereferences soc_data->ngroups. Would adding a validation
check before passing the pointer to the core prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004192921.2460=
405-1-praagarwal@nvidia.com?part=3D3
