Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B53CA6F;
	Tue, 24 Mar 2026 00:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311977; cv=none; b=q1vo8EW2qJ1KR2ACM+ni9fZylaHSmOSdReFiUG4vqUdHWWTULEEGhGCiMeN1hqfquh30eSDQ9vT0wbocrRQmjRXIZ0vXxlrO6ze8l3lca91UqCCw+p4zjS6CUeOFYy+DqQPucqGfooX5ocil9ZB/2dGiSiTGFv1gDM4ojp0EcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311977; c=relaxed/simple;
	bh=SNXCxleRSN8NVYfk9akXpkn+YDALBCbRBxpgxcLbA1k=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hSj5pZtOjarJtY9vZWMRaMxIYmZ9YN+zNPRWug7fGGHYU/5sFfmAxDYFxrk4X4BUfyks+wPEGX+gXybkRZS0JqX78H/+x+pMWAAJHINWAKn3yvlv/ln3RaUoDYpsvlSSOMNNxeJjUlmcrS7P3W61xCNK7vs8p/rBismuaojNLyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKo6Ohww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKo6Ohww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52ECC4CEF7;
	Tue, 24 Mar 2026 00:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311976;
	bh=SNXCxleRSN8NVYfk9akXpkn+YDALBCbRBxpgxcLbA1k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cKo6Ohww4WYxB/0+rFOY2ZM/Hm79RSYufbanUWAtdFL3kTqe0ZixF/5rCK+zdn5z8
	 Q9cIZm5d2SXS+YIOrwhOE9ewQXTIEReuf2019psWH0ZydCK4gNHjee6hR9UZ3pyzYx
	 u4NC286xKp+JxBBjTsxh1F0CtOwWg7aTbkwh+Aa6CC5yYL3AVHDuqex7wuHFHE24Gj
	 GCoE+pOhQkdd1BdvmmrmyTiuM06nBjscWAGwr10o1qBfxDUmEHcxvi7DgX6WdlEgeP
	 gQ6CjtoqhWm4g5CSJn/mSCjoRZeo7J7vgxUNVpMFDx8JhWDxQa0mGn+5JtVDY42KK+
	 dfDCi35RMUQeA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260226-eyeq6lplus-v3-8-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com> <20260226-eyeq6lplus-v3-8-9cbeb59268b0@bootlin.com>
Subject: Re: [PATCH v3 08/13] clk: eyeq: Adjust PLL accuracy computation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:26:14 -0700
Message-ID: <177431197491.5403.14876582631937151389@lazor>
User-Agent: alot/0.12

Quoting Beno=C3=AEt Monin (2026-02-26 05:33:52)
> The spread spectrum of the PLL found in eyeQ OLB is in 1/1024 parts of the
> frequency, not in 1/1000, so adjust the computation of the accuracy. Also
> correct the downspreading to match.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
