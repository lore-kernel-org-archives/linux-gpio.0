Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F14BD78C;
	Wed,  7 Oct 2026 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382947; cv=none; b=SwiOS9I6NVbHAPNojqx0cOJMSXRSa2Oddo7QhTxF4A1EXmQ57OW/wHsF48cn3pw/KLMd71yfe0cU0pNaSUG/gOVZDWfKYY/4Jm0Api37KClrcsUor/gsCUrEf4xxMU5wB1NLWL45ujmUHp5tTw/iDUCcC1m2ddDn6x2IKWG6sPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382947; c=relaxed/simple;
	bh=R6oSdPTY5e89KgcREP3UwqYI1AViHqSYt87uxgdvNOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlD2OvC74SV2ziSyt+Kfxxdspwg/klXbR/PRKYacrdqG7vN43qjtJc9vj7GlduuLq6TdHg6lKjqAAAyqltKFB4HKweKmJdUiw/nqgElALmqZITIgZwJA5INU0z4lY30+enEO4kgOR8VjJKp1+Ks29hyKeDotWG/qbLq68/syjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=la54SX36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="la54SX36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AE71F0089B;
	Wed,  7 Oct 2026 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382937;
	bh=B3TyTpfZLGpd+5ls3OsWuVN1piDNohC884542mzb1oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=la54SX36x+HUdaXl9QXTXiJF2qnIikfyoukPUVUUes3kBSyBqvO/ylGOToiYdwwOY
	 T6W5s2IIio08pehohBPSaXEA3RgPFTyehvxHYAbu4rS3tmFEMRvPTgbZMp+A+UTiaZ
	 uN9BXnYJDVBZmdZdbqJr6w/o79y3obTQ5ReHBd+hLDIFqSidzH60q0HRMfdmqLDU1A
	 6wpl2u+D7Y+DMgBJffZbSUazIPQaGlsn698Ack5f0KwH5zTrLPKznF9/PftfyihRb8
	 hi6AICOfiJ2p6acNdxd32kqdrMIpYbU3ObK03t43kQVGL0Gh/MRsQ4ckn26/hoYOvT
	 Bo3PS6u9lfY0A==
Date: Wed, 7 Oct 2026 15:22:13 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/4] pinctrl: imx: Match the standard SCMI pinctrl device
Message-ID: <20261007-glossy-wandering-okapi-c0cfd6@sudeepholla>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
 <CAD++jLmm2KrsuaCPznjY-_t577D-hWZqcaafHXSeTcugBsG-yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmm2KrsuaCPznjY-_t577D-hWZqcaafHXSeTcugBsG-yQ@mail.gmail.com>

On Wed, Oct 07, 2026 at 12:32:12PM +0200, Linus Walleij wrote:
> On Fri, Oct 2, 2026 at 11:37 AM Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
> > "pinctrl-imx" name. Standard devices no longer have exclusive request
> > tracking, so the i.MX and generic pinctrl drivers can register for the
> > same protocol/name pair. Their probe checks select the appropriate
> > driver for the platform.
> >
> > This solves the issue that occurs when both "pinmux" and "pinmux-imx"
> > devices that share the same fwnode as only the first device registered
> > is assigned as the owner of the fwnode. If this owner device fails to
> > probe (e.g., its driver is blocklisted or missing), it never reaches
> > the driver_bound() stage and the system skips cleaning up its supplier
> > links. Even if a alternative device binds successfully, the system
> > still looks to the broken original owner. As a result, all dependent
> > hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
> > forever, halting the boot process.
> >
> > Note that the solution doesn't support same fwnode being shared by
> > multiple devices and associated fw_devlink feature.
> >
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: NXP S32 Linux Team <s32@nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>
> > Cc: linux-gpio@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Reported-by: Peng Fan <peng.fan@oss.nxp.com>
> > Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Acked-by: Linus Walleij <linusw@kernel.org>
> 

Thanks!

> I guess it needs to go in with the rest of the patches to firmware?
> 
> Else tell me and I'll just apply it.

Yes for the functionality to work, it needs to be part of the series.

-- 
Regards,
Sudeep
