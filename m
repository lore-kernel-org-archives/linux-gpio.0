Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429707;
	b=wAW2tGVWmhv+ohkQjbqAMJW83VeZqAewBAvQ10w5sEU08IqlvK1CKNADq4qw9cN4H4Xy
	 PObLXPwj3HdEJtz0pZJgkfN5Ez3gUkXbHYW7PFL1dWsIj0htnSZwQEYyZmgPnur3PFXUm
	 dwby2/lr4L7lZ7hdDbqHiKXqP18yEQJCp1M4dnBL5d3U0gN5sfypVZyk7ocSz2nUDpoGG
	 h+xVIizv+AVuiw2+7T351mfIZ5yN+0i8CHWiskkgJgC36TtsUvbdfpNutf8vediPrYBTA
	 I5/uPCTMGz6tbiYE7GWfFaULQD0ijEYxKnAc2sz13vjarz06T12St/dFyUGO/KSmDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429707;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uRvs7fQAGdtCGvkJ3snStvEqLH0FK7lvdttUmANxyQ8=;
	b=XNIQNJb5bxjynz5x+9nco042xuC9SOp+zrq15ivb+2sFNZRqgQ4eYtR9V/9Z/0g6UWTO
	 zMvVSbVrp09xhINe2i6N7iyWjkEH7X/qAWiWCHzlg7BsBbqxGT504JwdTKDOeUEt+Jsha
	 /bu7F9l4yw/X3FYCW/Zgy/Rbw1hO3n/0y1iDC3l7BC+on+wjaIF9Vs/pderrJPS89hedv
	 prTnb1LiFrbk+ii1yoZmLjKTqJ41XpJc3G7ilLc3eOzaTBfj9sOIu4+D3ozNquKfuHB4b
	 vhN63Ssefaqfkp/YTdZ5TiXLf8K8VEHpYPn5+IPz+rJEkKJqMJmeydLT1nl68y7GV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACWgmqId;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB718606A31E;
	Mon, 23 Nov 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACWgmqId
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6047D1F000C0;
	Mon, 23 Nov 2026 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429707;
	bh=uRvs7fQAGdtCGvkJ3snStvEqLH0FK7lvdttUmANxyQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ACWgmqIdTvAKP9biy9TxqwCZQymZWl9GphAWGqbq09erfJOwKW93tRNNzWDZlp/rJ
	 mXFxCKpQb0Nc//PHmLY/d/m0vfzJtXGVgtHM33YP1+mdOhV95VTEjJ+f1M1H/n4Lxm
	 qTXbvlTFLdMzTpDBGU/PXahPjcdgDuZ0k6hMYa0IzxWI+NhUUKsnlb4lpjrft5guGR
	 RpL1b+pB2mlrQ52ptuvMdxY3KhBzt3LH0kv4kRMECa5rkcVWAHGJhfM7/R8mwiMxYJ
	 IP82yI4Ydm97onHXwqlh47Sjb2SVsZaHXL8o5xIRsxtbaNVjkk0rfWq9XwF78N3hdf
	 2GKusOBw6NhHA==
Date: Mon, 23 Nov 2026 11:28:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 05/13] dt-bindings: soc: synaptics: add SL2610 system
 controllers
Message-ID: <20261123-bold-neat-albatross-e92a2b@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-6-jszhang@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-6-jszhang@kernel.org>

On Sun, Nov 15, 2026 at 06:23:44PM +0800, Jisheng Zhang wrote:
> Describe the SoC, MCU, AVIO and CPU system control blocks, including their
> clock inputs, clock and reset providers, and pin configuration subnodes.
> The clock and reset providers share each register block node.
> 
> Add the clock and reset identifiers used by consumers of these blocks.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++++++++++++++++
>  MAINTAINERS                                   |   3 +
>  include/dt-bindings/clock/syna,sl2610.h       | 131 +++++++++++++
>  include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++++++++
>  4 files changed, 392 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
>  create mode 100644 include/dt-bindings/clock/syna,sl2610.h
>  create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> new file mode 100644
> index 000000000000..cdf947cb3e0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/synaptics/syna,sl2610-soc-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics SL2610 system control registers
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description: |
> +  The SL2610 family has separate SoC, MCU, AVIO, and CPU system control
> +  register blocks. The SoC and MCU blocks provide clocks, resets, and pin
> +  control. The CPU block provides clocks. The AVIO block contains audio PLLs.
> +
> +  Clock and reset specifiers refer directly to the system control node.
> +  Pin group configurations are direct children of the SoC or MCU node.
> +  There are no separate clock, reset, or pin controller child nodes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - syna,sl2610-soc-syscon
> +          - syna,sl2610-mcu-syscon
> +          - syna,sl2610-avio-syscon
> +          - syna,sl2610-cpu-syscon
> +      - const: syscon

Split the binding file, you combined multiple different devices.

Also, bindings should be placed in respective directories, not soc.

Best regards,
Krzysztof

