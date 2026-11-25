Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607250;
	b=RJYFJkF/6KkeYzu5VIIYGLzNtynYdmJlwTFjRAfTNT/c3v6izVfOCmFK0z5M8/FUGVib
	 sS8PEw1uR8HWpfxx8KfWF+TcToQLWuegCAoeD6UQ/C5y+Rca/KyojZFdQ01CvmXuDUhpA
	 jVzbCnbW12rvZ/Mu3H9WmDmmY5Wrk7yrv/rl3FP3Vhb/PBIr9ji9gU2X+2XNMsMj8Whke
	 J0ODW5FzX4VXY1XGDmq/lHJw4Q+uoWbBRZ4sBQqYSFPf2L2jTMS8J6YFt+s+jovamfOAV
	 YjdbMvauhGX3wdRhLaBBIbQ3NmfcclTo+oiNw5efYQQNKvT1yU/+w322em4d8VDVG4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607250;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YZ6bHi0umed5LM1vKu1/QlN1Ny1fOK0BiX3ksQa46tA=;
	b=mAzZzYxGYrb82e4V+7Tt1erlNwBKM2aulyFQNTVRJd+w1vYHSy4fw7g65lKm/o2jvlFK
	 KE01Py/IOdJLPcJYy0zNv/JnGkzjujonMPugmfiy5S0RRjY8Cr2JOM2NADAenlhy/+y8O
	 jFNc1VCsJ/TFibKZ78J3dr4A6ocmSal5yVM+QFvOiHB48KnJ4wdft8o2hyfBRdTdvdGw0
	 LU9OU2ebyKSNyS7MTXwTn1p+nIGevgklDl0LMfIRJGyYl7oPafAZKzz+E3MpEC5zr6uDU
	 HXb8b7OKGE528q3107AFYle6qmwjJ9sxUL2FIk6b4LsZXY++5SzrZk1lFD+L6w/Odzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuwHHUrf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A6606A321;
	Wed, 25 Nov 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuwHHUrf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E6C1F000D1;
	Wed, 25 Nov 2026 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795607250;
	bh=YZ6bHi0umed5LM1vKu1/QlN1Ny1fOK0BiX3ksQa46tA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AuwHHUrfZJ3cKd0JFYPuL8EYvaGVNvPP61IZkK6zzl5Gm+WyXJl8tFwLgbjbnkTYU
	 qz2MCz8x+GfW3Nm+prVZlEW3i0WDGe724lG8d99AqVeuCfuGe6cfsFckArB3C4PaUm
	 6fnZSFJPW3NzAbvHTTU9Up1n5lFDf+fPquL7Nunu0T+Co4NYccQKn+mMaqeH1Vv8vC
	 HIdMtUjwOsxm93c7vevkB2PN5HzagTvX8wEiGHLsFoEaanXYdboOdTiij76/q92I8f
	 QIlkmNg0BAK16dl4u0G6iO8EDRam20QDAsY0FPskYLQzL0VzGEGPRs/ChfQgQ8Asfp
	 mFfJB1qQvaHkQ==
Message-ID: <sashiko-outbox-233283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: st: stm32mp15xx-dhsom: fix bridge
 reset polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-tc3-reset-v2-2-32eefcaf1460@kemnade.info>
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
 <20261125-tc3-reset-v2-2-32eefcaf1460@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:47:29 +0000
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
- [Low] ARM: dts: st: missing Fixes: trailer for tc358762 bridge reset
  GPIO polarity fix
--

commit ed072d08151b8622793e548d3a5ea860d378e59d
Author: Andreas Kemnade <andreas@kemnade.info>

> ARM: dts: st: stm32mp15xx-dhsom: fix bridge reset polarity
>
> Reset is active low. It is apparently set to active high to work around
> a driver bug but not to indicate an additional inverter in the signal
> path. Correcly describe the hardware.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

[Severity: Low]
Should this include a Fixes: tag for the commit that introduced the DT
overlay with the active-high reset polarity?

  Fixes: 77a5fde00b9a ("ARM: dts: stm32: Add DT overlays for DH STM32MP13xx=
/STM32MP15xx DHSOM")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-tc3-reset-=
v2-0-32eefcaf1460@kemnade.info?part=3D2
