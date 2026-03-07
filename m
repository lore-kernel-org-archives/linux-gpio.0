Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DBA39E6C5;
	Sat,  7 Mar 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772896962; cv=none; b=Sk/Nklgqu7K30x0sVgbr5f4l5Lr8+gu1TOJUaotMF+WHnIFDQMhS4rqTJvt9Gfc+QKg5IYLUi4I37tf/vWjNbhhWqYhHcXJvYDAdEQY7AbtuDT7Bu//pH46rE/b1m70a6L33Xbs1lYLWy6QbDTuZpWjRj717HI52wY0byoU50yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772896962; c=relaxed/simple;
	bh=V4gJkObjDah6lfhZK4kMUJ5jS923Ftcsg+YsORY2fqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhvIR4/FM4A5Oy8SpxWbJrTLRgvHJhUlgQ0VSPgkw3e/ipO1DdpBcT08+BEsSBACkXkEMXTpcywdQcJDaNGxMBHuyTUo2ks2YQ5kHeB9pH5tI27tTX2Je85ERkCQrpTqO0ZW17LYmEy0SQX6crDfx3Bud0NggsTxEYm683VJPVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFSPckRd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFSPckRd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1808C19422;
	Sat,  7 Mar 2026 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772896962;
	bh=V4gJkObjDah6lfhZK4kMUJ5jS923Ftcsg+YsORY2fqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFSPckRdirXEZoprnvirmE+J4vPSBEGLeS/jigwnzsPrQTBxL9YaxgNdTwy7fjFMy
	 Gb8h8+O5EZ7uY/QhgAIjiNsoeTzD4ESeYIlIhndF69pDk6A6Z4aAtezxS7e0uEi14C
	 jh4FZjmGQJzmp08WlOb4hLuFeLyHDeFSJpTo8RgWPFCXZ0XrV1bWtl5+dhYnnNc1Jp
	 K/lkSnbpAK+Qmq707U+Ixa96Fi5WjqatwPpov5mygZGQqnOO4UaxUqtXM80U66Dvoe
	 b8ZyCGYx1e3t8b26GB0NtbGwzW+e1+2I75XxQwDSXglb2zJ1QeuBar6uspqis88oBE
	 Ppurrsmwk8HtA==
Date: Sat, 7 Mar 2026 16:22:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, jank@cadence.com, cix-kernel-upstream@cixtech.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for
 sky1
Message-ID: <20260307-efficient-fancy-gaur-db7df8@quoll>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <20260306093238.2715269-2-zichar.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306093238.2715269-2-zichar.zhang@cixtech.com>

On Fri, Mar 06, 2026 at 05:32:38PM +0800, Zichar Zhang wrote:
> From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
> 
> Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
> sky1.dtsi, and enable those controllers on sky1-orion-o6.
> 
> Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
> ---
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 123 ++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> index 4dee8cd0b86d..4dc76e0135ee 100644
> --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -89,3 +89,31 @@ &pcie_x1_1_rc {
>  &uart2 {
>  	status = "okay";
>  };
> +
> +&s5_gpio0 {

I already asked cixtech contributors to read DTS coding style. More than
once. Does it mean I need to ask EACH contributor that? Maybe create
internal guideline to avoid trivial mistakes?

> +	status = "okay";
> +};
> +
> +&s5_gpio1 {
> +	status = "okay";
> +};
> +
> +&s5_gpio2 {
> +	status = "okay";
> +};
> +
> +&fch_gpio0 {
> +	status = "okay";
> +};
> +
> +&fch_gpio1 {
> +	status = "okay";
> +};
> +
> +&fch_gpio2 {
> +	status = "okay";
> +};
> +
> +&fch_gpio3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 72f3b195a927..9ceaf8f68e83 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -185,6 +185,13 @@ psci {
>  		method = "smc";
>  	};
>  
> +	s5_gpio_apb_clk: s5-gpio-apb-clk {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "s5_gpio_apb_clk";
> +	};
> +
>  	soc@0 {
>  		compatible = "simple-bus";
>  		ranges = <0 0 0 0 0x20 0>;
> @@ -354,6 +361,74 @@ syscon: syscon@4160000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		fch_gpio0: gpio-controller@4120000 {

Again, read DTS coding style.

> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x4120000 0x0 0x1000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
> +			clock-names = "fch_gpio_apb_clk";

This is pointless name. GPIO block does not take some "fch" input. You
just called the input clock based on clock output which is completely
misunderstanding of the DTS.

Best regards,
Krzysztof

