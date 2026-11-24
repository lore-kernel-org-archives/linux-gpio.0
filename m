Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549990;
	b=0nKuVRrJobGdNChWd8B25CIm8gKOe7mLYZzcUajB4DnFZBR2MHGBhrXhn7n2jPg78WKM
	 3ZctsVXzONvYdA5SK5fj+FKLw+Tc8TPjci115233jqFjblH5Oyy3GxKg8S52APoPeaWRR
	 xHdJ9lqYC4lZwRH/YUtT4hwUW5yfp12dBvZiMxVMctq/yqz9zrScIjPYlILMZR5uTR6pN
	 gIjeehZP3GGD2RrKf6OMxc7l2g/CxZQAin2S402TctYZ8RJY/Y6eaoZknYaMD/44TMTjH
	 alHgLUA/Av/kr81BrQYcK+l3Tqr6vR8IyKwMWCQ7odFXOlefPl7fV0sjqJp7bwtYI+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549990;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RumJVU2fyeIBgsPQcKKCaCPpS/w2DrR8cb6jiXDvUqQ=;
	b=qz4dtjobpty1WDA31hhEJsE973CAi9+Rni+1T3DyZECDzJ5d45Fi/SEHq8LmAEptJgFq
	 OhVcUkCxgi0INoiiHXcKznUPObCCewaILW7p1+KLYdB10KrW2I5HO45nwnV0O777sxuZi
	 w67EBytOKanZPKKvCiLj0z6jV7q7liwCUVnNKA/5dXtrEw1PKOQ3W5tCL9kGC/ZYq4Dkj
	 1FV/j5m1DoUM38sJkadyAUqMhHsf/ljAT+gC6AuoiL2P7B9zzFZEh0gM7bXRoAkozg902
	 Yjq8YE+chL1mZ00l0WWbWoWazIwPxcrF1bHF2eqN5IkFg//79MJyb68Mo1swXUncqYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TpapYsxX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C429606A31E;
	Tue, 24 Nov 2026 19:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TpapYsxX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9E51F000CA;
	Tue, 24 Nov 2026 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549989;
	bh=RumJVU2fyeIBgsPQcKKCaCPpS/w2DrR8cb6jiXDvUqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TpapYsxXs0e/Mhxv9ycjbdYGMdhMy+TA8GsFxkKtYoHva2Pk7Z5iql5+Tp6jhEQ/Y
	 qNpcpD/IXuBD4Jg3KucVvZwgAwkglbqRI9TmX1wAtPCGrTLazhDD7izyOJ+QfFjMiA
	 nauXAy8HA2TVAJaw7neFNg4vZMosP+XjJSUnbxlY99RsnEVOb6RplIlHDROUU7mA9/
	 D2cXwNRPoPbXlfZQhVIflB6lBQPppTIvkNARiVD1xL682Njp+i0fDLsOlNSNuWA61N
	 YP5Y6Pw9E97CxE4r3WEL3SUf8fuxy15iIzgw5fzt8+VAqsw5FrROhlC1Nshup0T81S
	 x7q4p9XspGodQ==
Message-ID: <sashiko-outbox-231910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-1-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-1-98db26a87500@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 19:53:08 +0000
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
- [Low] dt-bindings: clock: qcom: redundant word bindings in commit
  subject
--

commit 014c9445d6141d97936e8971e3c43aff457ee953
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider

This commit adds the device tree binding schema for the Qualcomm Peripheral
Web's PDM GP_MN clock divider.

> dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider

[Severity: Low]
This isn't a bug, but the dt-bindings: prefix already indicates that the
patch adds a binding, so "bindings for" in the subject line is redundant
and can be dropped (for example, "dt-bindings: clock: qcom: Add PDM GP_MN
clock divider").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-pdm_clk=
_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com?part=3D1
