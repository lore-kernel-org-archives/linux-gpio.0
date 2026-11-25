Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603565;
	b=vBlVNVcZ9g+eX0Tipw+5gNIMMwvxgsyEF7SGl9WwHuSRi8CNglrVJOk28CTkYNPWVVrY
	 wkT5rXEKEhlE4o5bMoHJXD/Jexm1tl/Zi98fjV74+j4z+PX6xt8DSUizsk6iRxUBrdsKO
	 qoD3ADlqXC4XMrlxuUp3dHBP9Lo0KiokhpElCpdS5+Sp333YZG/5kgvGJEAywLc3w19z0
	 rcn2w9kxABNv2vQMvXzLclQiLRNwyv+2wpRb/CGF4lMjN0MDayp9BYAoaijNsDGOpbZu1
	 /1+TFeXSVseWT7fFeDzFfu4xzl3K92yKJnQ7QnYDjxK5E65O4/pdm34KhTUYhdu+9rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603565;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HfN/ahiVnXduUDbp68u51qh4o9kAwPd5xT173c4gw10=;
	b=UuF8OfCNu9uxQIRsH8Wem8nOmWVNn3lFlfb8em9LWhnxLcqAEze7AGztD1eUNb3tpMbX
	 ODCqbJEJY4TV1R9bzaHs72XJczvg5fbZIjowgq015V7aLLNF8ejwLGe/oF8jL+ngtk2GH
	 F1YjJVv2kx6uu53RE7ZFneOjeZSDkb49zJYt0oXVnYU3b/x6PY/FP96gKFHEO8/GjrQ0l
	 /Xhllv0qT942YKTFHRab+QdCrONLNPW3tkZeh5u3X+HmHjjB53P5xIk4D6HyL7p9v+1Tk
	 wnx8EHA5eB7Gf0xzimBeO6++SwL3NlXLrChNi5N9ftqmPeDIl9hqi2FEQZP7KJsoP3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1qw7ada;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7F606A326;
	Wed, 25 Nov 2026 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1qw7ada
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CF01F000C6;
	Wed, 25 Nov 2026 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603564;
	bh=HfN/ahiVnXduUDbp68u51qh4o9kAwPd5xT173c4gw10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W1qw7adai1ir9+K0+6gT4+NqaxeH+//TQPY/88zyQZ3UfywpCs5FSY81zuS7cMEMb
	 +LZsr2BVBEU9atcR2+L2ySLMRvg1ldIK9zVznyz3tWgPOcnMbbfWqzpVdt0dy8LDpd
	 /lIX4m7+NmeEp2cR0Qlb3uX8krtGDWpUUadM4pd4mnbGeFGnelFROUGHkLG19/uZGU
	 6MMESdDKUCNhb/Ig4ckoaDc+Z/nm7YtEFsSfMcbQjBCw5WXBMkJLTMMqXKlwRHqHql
	 GXLO4booI9fIf3S7/2b/Pq4CwUlBTKslU+fdfIzJXVJTf74pkHZM8TABD03FGQpe9M
	 I6oxGkxlax7Bg==
Message-ID: <sashiko-outbox-233158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] clk: Add Cortina Systems CS7542 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-cs7542-syscon-v4-3-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-3-3337bb0d3b48@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:46:04 +0000
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
- [Medium] clk: cs7542_gate_is_prepared() treats regmap_test_bits()
  error as true
--

commit f8597ca556e18d2697791a53767842596741c7d5
Author: Fil Dunsky <filipp.dunsky@gmail.com>

clk: Add Cortina Systems CS7542 clocks

This commit adds a clock driver for the Cortina Systems CS7542 global
syscon, registering the APB, CPU, and AXI clocks from the boot strap along
with three PCIe clock gates.

> diff --git a/drivers/clk/clk-cs7542.c b/drivers/clk/clk-cs7542.c
> new file mode 100644
> index 0000000000000..5aa83dc71c2e9
> --- /dev/null
> +++ b/drivers/clk/clk-cs7542.c

[ ... ]

> +static int cs7542_gate_is_prepared(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate =3D container_of(hw, struct cs7542_gate, hw);
> +
> +	return regmap_test_bits(gate->map, GLOBAL_CONFIG, gate->mask);
> +}

[Severity: Medium]
Can a regmap_test_bits() error cause cs7542_gate_is_prepared() to report
the clock gate as prepared?  regmap_test_bits() returns a negative errno if
reading GLOBAL_CONFIG fails, and clk_core_is_prepared() assigns the result
of .is_prepared() directly to a bool, converting any negative error into
true and causing clk_unprepare_unused_subtree() to unprepare the gate.
Checking regmap_test_bits(...) > 0 would treat read failures as unprepared.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-cs7542-sys=
con-v4-0-3337bb0d3b48@gmail.com?part=3D3
