Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132935;
	b=szQQKaPBhB1Q40442p8s+gDAw06SYCc7Qmjl7yc77gzytDmYJGckQ8Ang0NNHLCeYzHH
	 4/KWyR+AITbJ3KpFDz8Igu+Isc7GAPzweTLmAvp/5qb6FZsOG9ywDpm8cdyDRm16nSv2y
	 zR5kSZIiv9PN6mvDHniCVbqN7M/xXzr4jIaCqbHlGVgusQxaLJlaQuH6Pfr3Yf23s60yK
	 bng5NCNS3oDpFGMsnCxKwqp3D4IdQkpn1y1mdbow7X5lmbK1Xp7ushTcTNxih4NB8yRIz
	 A9kPqO2xDIr1eLHy4dugoCMW/O56IYJHVBLXnLMPFDGk/OG+PJ8kphnmk1khBIWm94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132935;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YFCzt/Vwe6pZRI0k5Xr+pQiYfwueTGjDA0wz5bCB6U8=;
	b=shzL4rQlfQYEUJ9yscRpbyw5ZXdzJ6xg1jjCza41RRrGwC3YQ9SDdXRIP9WaUOegBV7V
	 9kfK9wYq8vqdVZHV/IIwnFicjLi8ku72PKd9wTPc561Gf87sUgfhvlslPDp4YO0Iph2lR
	 uK6W2qBgd9JdHxWJDfbsJjeqjzQBfx9Bp+FQzTY3T4KZDCVrjK1FLwucaq3BErSDa029k
	 6vuzJVdC/pfpvveliHakEaG5C/biWAu1cE3Lt6xRojcs2XEbZTp9oYyA4zW6yVT5Fdj4o
	 F8o9k+XKsz2GtjuP0G9n196eiH6C0w71mrxtzxS8VWjQXWFyCR/gQie+h8SQvwQYJNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7FmlKTE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74E606A31C;
	Sun,  8 Nov 2026 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7FmlKTE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12601F0089F;
	Sun,  8 Nov 2026 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794132935;
	bh=YFCzt/Vwe6pZRI0k5Xr+pQiYfwueTGjDA0wz5bCB6U8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T7FmlKTEtQK21eV24yodsMn18pm37NTEsMUf9Cp2Y3Gz0WuZUOVRM8ObTu4wJc5vk
	 9ojiQVHnWxECO2hZLJZYbx5fF6OYrU5ogCa7r8Emn+jmdkLdMRZxxNvIQbisRfvVoM
	 k3+T/Nao7GmID7Z0yXW8zgVVB5ADdIi6uId/U/goCNk9E+gDPZgdpXuMkKBMI0CLBk
	 gocsGI5DqJ3Ybg2LbIyktyelJekS+8JmpJAyyYQ2o1ozJg/zyb5HDlbH+jf5TOwsBY
	 VHJ4gh1JqfN+hrzbH8ma5FQHeypPYSUcGurVknyjuAqlRKDG4vsvAALnXNIvLtISm2
	 f4af4ZE8AazSA==
Message-ID: <sashiko-outbox-203680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: lx2160a: describe the pad muxes as
 the DCFG RCW override
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-5-5a0063f1da9e@free.fr>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-5-5a0063f1da9e@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 10:15:34 +0000
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
- [Low] arm64: dts: lx2160a: missing Fixes trailer for commit
  8a1365c7bbc1
--

commit 3777e1216f9485c20e69631bad60b9ee0a491582
Author: Vincent Jardin <vjardin@free.fr>

> arm64: dts: lx2160a: describe the pad muxes as the DCFG RCW override
>
> The pad muxes are fields of the RCW: read-only in RCWSR12..14, changed
> at runtime through the override registers in the DCSR view of DCFG,
> which read 0 until written.
>
> pinctrl-single on those registers, since commit 8a1365c7bbc1
> ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery"),
> clears every other field of the word with its first pin state:
> a board whose RCW programs a non-zero pad mux loses those pads at the
> first I2C probe.
>
> Describe the pad mux as a child of the dcfg node, which gains its DCSR
> view and, as on the LS1028A, the addressing of its children:
> the child is at its RCWSR12 to RCWSR14 window, one group per RCW field,
> one function per encoding, driven by fsl,lx2160a-rcw-pinmux using
> fsl-guts. Labels and pin node names stay, so no consumer changes.
> The pinctrl-single node goes.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

[Severity: Low]
Since this fixes the pad mux clearing issue introduced by the
pinctrl-single description, should this include a Fixes: trailer?

  Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to sup=
port bus recovery")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-for-upstre=
am-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr?part=3D5
