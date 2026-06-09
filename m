Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCCE31E82A;
	Tue,  9 Jun 2026 06:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984824; cv=none; b=Xi2XHWqjbQHfy3HtqwAYZ2O5xhH1sdQkOieLyA/mPqUUfywseDEBA/FrVE1yW9dFBLK1NpMSZywoKiyn6p0WKIYGfzcq8uv6zG35TGaZ2lVIDp41PnBea2ZEdtnHoFDFBMZyVUdSvy8LDOlxB4Qn8ru2ya8e8a+gKE1pRAKcThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984824; c=relaxed/simple;
	bh=Q/lK+sZt7GwPlBwwK69dLZf6j3mFRNG9lHSwsTuyARA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzKoz5LDB5yyPAEqWRHvETtCqy3VGi19QMyLUflCXKm2vvVT16COsmdBXe8dEg65cM2mbjC4B/0dNn06A1MVuRjmuwdPAMo8A8SV8BEXRIp5ByvjwRV+UrodgZSL3XQCN+/WS6w7gVf293Bx9wAOMtMMN4A02teTTHLOMXJHiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drjmgkvJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drjmgkvJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93301F00893;
	Tue,  9 Jun 2026 06:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780984823;
	bh=6YEx4I/Sr7vXQXTyMNROcZn4c8xb3Zj7/Z8myQZrk0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=drjmgkvJM1vlu8xRrW9saDMhI097o+thAO1rGgg4CcKxIYNXkjoai4MOlL67qk0f9
	 ipMD7LKALWNGE3pnFM4Li6P0hW1G74wTbiEIu200rT1tGhc7O+aLWu5B3xIL9inqG+
	 pSiHYT0XfWc4Uv+fsybdjqw5adPkSoavFfeGW3+BZQq2oIl0e1/pNSRD+S4zdvOUQZ
	 GtNTIUuvabK76FdLO5RRZ8hiyJ1yvx6VhcjBbZpBuR5u7OGu2ns8clegh+1sncccvc
	 FsAY514AIekPUpsPIZDhSzDukdLHseCcHmixgB7JWXsJ4PYJ8WRh1Uz8CricT2PHTz
	 1RaRjL6MokItg==
Date: Mon, 8 Jun 2026 23:00:21 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys
 clocks
Message-ID: <aier9XppLeCkJydw@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>

On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng wrote:
> The TH1520 SoC contains a MISC_SUBSYS clock controller, which allows
> controlling of USB related clocks and MMC/SD controller AHB bus clocks.
> 
> Add support for this clock controller, in order to enable USB support.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 64 +++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 3a6847f1c950f..24f785f0b329a 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
[...]
> @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	if (plat_data == &th1520_ap_platdata) {
> +		ret = devm_clk_hw_register(dev, &usb_suspend_div_clk.hw);
> +		if (ret)
> +			return ret;
> +	}

Should usb_suspend_div_clk.hw instead be registered under
'if (plat_data == &th1520_ap_platdata)'?

Thanks,
Drew
