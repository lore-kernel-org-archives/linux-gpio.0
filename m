Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001129;
	b=GcCPthHzJ/XDeSkZLWH/UhXMzM5getiVKFFMJcEFHL8NKEfkCGTogCxhGLld73CACVaT
	 Qp7vNmL6qEOnZEUcPdtEv7S9mwMPaBvhbsa5BnGTBdaptayh2WllOVZceNiDp3bEfaPac
	 uSwTMlYLjMdYJUo9ctZkYM1M07/EKzJdGvkaEEVrxzamMohwGVfdtiJ81DWrBRhef3vvM
	 H2WtDE3lDdQ6cJbT+3WAKrfJaERSnKywXUB5kxIYk/laBqVHhGQwj1nqSYb8nsZn9mkaT
	 nIHzvLst98ZjyagRxZ+hNUf71Xus9TvyKlMLgsidZvwCRdmftHcotTAxy1e5P1XbQcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=35Yg8T9ZDVHDd1qHH998RWdPpKVYx9bibsidq80qzLs=;
	b=JG8ugJwm3TzXHsXDJ2P+EoSMYzpFIUpgD2vodSJ17N8Bio0uWcz8cYEyKpporRKxed1P
	 E5IgGbu8BkMk50fxkfWAlx/40BZu4ZA4kg1SQGIrvFxvvt04b3vomZ2WsabMuF8IvLCVj
	 19jBJxObdfxgo7p5ncxxFM1PmVBvQQtT/FljRl5BstTSRmChBWSIetFnjYd4tsSpLzdsA
	 L+avA53I7M6hJXv3MKmXTKS9dXpZ4+2QV2/fSKzeVFxZLQyHIQFArErioc64eW339pWZd
	 byS6OnxyUVWYTDpsLxRhQqY+ysFsSvFuIl4bYepWXOUvavh271eFvwYfJ6jCFoucUGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q+r/ikLA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380E606A32C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q+r/ikLA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEC31F000C5;
	Wed, 18 Nov 2026 11:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795001129;
	bh=35Yg8T9ZDVHDd1qHH998RWdPpKVYx9bibsidq80qzLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q+r/ikLA2MhbvVl4IwB90obq5o2ArAG7e2EAfVGwQLGcue/n32AIC5V+/aMlysDLZ
	 q1JzxdOOcO/jlfe9v8t/u34NYcoR5OewwjGyUZkjLm4YapjHAyFRCIqLHaghnO1NQL
	 XE3vk3lxgHZzAmvg+dSh+DZCeAi5MeRe5ULF97CK1/KES1/s5Ze/D23M68L71SYRAP
	 MOOPwSmKC94+JdFCeTB9/neTFJhLSdMBSBWssBnrZ93cr0lzwAYQnj624Z7Q933U66
	 gU9ti5npMKYdmx4C1LqvP8FnVIl6l8FopF5L/SOsOu94C5rRiivLAFian7vJi/ZmBK
	 GlZH6jA+H06lA==
Message-ID: <sashiko-outbox-220822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Krishna Potthuri" <sai.krishna.potthuri@amd.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com>
References: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 11:25:28 +0000
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
- [Low] pinctrl: zynqmp: missing Fixes trailer for NUL termination fix
--

commit 9edfc24329d75f5063aa1d16738b9cc9a5a2b745
Author: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

> pinctrl: zynqmp: Ensure function names are NUL terminated
>
> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> 16-byte field and does not guarantee NUL termination. A 16-character
> name fills the entire field.
> The driver copies this field into a 16-byte buffer and subsequently
> uses it as a C string. For a non-NUL-terminated name, string operations
> can read past the end of the buffer into the adjacent groups pointer.
>
> Reserve an extra byte for the NUL terminator and explicitly terminate
> the copied function name.
>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

[Severity: Low]
Since this fixes an out-of-bounds string read when a 16-character function
name is returned without a NUL terminator, should it include a Fixes: tag?

  Fixes: 8b242ca700f8 ("pinctrl: Add Xilinx ZynqMP pinctrl driver support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118111816.2483=
052-1-sai.krishna.potthuri@amd.com?part=3D1
