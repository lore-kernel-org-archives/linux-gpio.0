Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB02DB798;
	Tue,  9 Jun 2026 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985742; cv=none; b=TeCDBLtNjUUaeFbepHahON22ARvrBvXBdp4ypp/QGKnqMUbcU97V9arC5QqzUKmoVG3ISjew/17ztgMpDN6z/eUpZm0KMTiQ3qhAp7jcNXWGyoCnxG1j9dNz4HZZUMr6SkjUNchFWJ4nTg3U8q6ZBYOiaFkmFMDJMjhTUMMnln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985742; c=relaxed/simple;
	bh=OA9+vXUeZ+UQccVDXQoE6wVX3AVKLvo/5iHGD9Xu3xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3mzf5Ntf0m7a+hSTsO2bmAEO0+O+OzScSLOUoj3uByxh2g+OxUSkrZ1C0GRpER0SrhdbNga+zznDj4oC50zYFTVHESARb1NhcEBt+0QqkAYIwJdZ5GwOAEO5T/3feMc242qCPIg/6V5Ldb4MPiGZjM16D246Xt49Xcgh2f7WXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4jOmEGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4jOmEGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6038B1F00893;
	Tue,  9 Jun 2026 06:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985740;
	bh=7zbhbgbor1E1JAoHOKXANvflw7c5UsmJuOJ1lQkpXPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L4jOmEGMLdZbnUFC91Xcv90XokSk4w+AGxkV6H8bmHE4evsewi07htRX2eJZgwXM/
	 aGC1buDENkv8iOVsrg/REQRMHn1/elvJuUYp+yLamckNGNo6UBOsBuAP+m0kZliTZp
	 B1bvXI33G7e54G3jA89KZTR3sgUkC2fnk29FIbpH5HsQddeE1wVPLdAjZFujnew6cr
	 JscsRfG4+lZQ0t9rCzSZXM63QWHupcbc/k8p4Elc0jgbqw08TXLhsOsjNp1gsQtXmn
	 4FFtM23t72nByckqY8ucUnFBtckMF8tt3VCcgqWif8gjJdXapIr0WVZtXSRLAlSCDS
	 loS6WtMFeNCag==
Date: Mon, 8 Jun 2026 23:15:39 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
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
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys
 clocks
Message-ID: <aievi0s-3SO8hV6a@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
 <aier9XppLeCkJydw@thelio>
 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>

On Tue, Jun 09, 2026 at 02:01:43PM +0800, Icenowy Zheng wrote:
> 在 2026-06-08一的 23:00 -0700，Drew Fustini写道：
> > On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng wrote:
> > > The TH1520 SoC contains a MISC_SUBSYS clock controller, which
> > > allows
> > > controlling of USB related clocks and MMC/SD controller AHB bus
> > > clocks.
> > > 
> > > Add support for this clock controller, in order to enable USB
> > > support.
> > > 
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > >  drivers/clk/thead/clk-th1520-ap.c | 64
> > > +++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > > 
> > > diff --git a/drivers/clk/thead/clk-th1520-ap.c
> > > b/drivers/clk/thead/clk-th1520-ap.c
> > > index 3a6847f1c950f..24f785f0b329a 100644
> > > --- a/drivers/clk/thead/clk-th1520-ap.c
> > > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > [...]
> > > @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct
> > > platform_device *pdev)
> > >  			return ret;
> > >  	}
> > >  
> > > +	if (plat_data == &th1520_ap_platdata) {
> > > +		ret = devm_clk_hw_register(dev,
> > > &usb_suspend_div_clk.hw);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > 
> > Should usb_suspend_div_clk.hw instead be registered under
> > 'if (plat_data == &th1520_ap_platdata)'?
> 
> Do you mean misc_platdata?
> 
> Yes, this is an copy-n-paste error that deserves a fix.

Hah, yes, I also had a typo :)

Thanks,
Drew
