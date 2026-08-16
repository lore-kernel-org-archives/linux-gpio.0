Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866422FF22;
	Sun, 16 Aug 2026 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786903925; cv=none; b=uSw0IARWRmYiX/QFpfB+vg0KERYPF+Y5RlCaXFc1pzEe80xZm0QxDb337gmRD8PDItog5ez7WH2AW3vy0QUsyeN4q0foR6bh/+UtHWafeV2CVmd3f1vFrbytjkzJ3pGQ+7kLxMu06avXQ72oj+P/DHFjudHdjC7iBi8xBmL0GY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786903925; c=relaxed/simple;
	bh=bLWgOxZ4E5zjq8KrnQLVIVwf5A++KqlHj6LmbLoKt2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHgb44BzF7ePcW+ohe3jqkskOg72i+bL/0kJPfOkjkkNYIVcOFq+Y4zLD/6336fza46EOMWA3E21sLUoapWjQ+elgiz6RjB3hZbtsS5eJ6D+0cYz8DsQRoGiupjldxGsNTPfIrIzI8z28BnX6qHsrVSytHf+8+fME4tUlLyn4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fID2NsCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fID2NsCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE301F000E9;
	Sun, 16 Aug 2026 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786903924;
	bh=shbxNjSwtOu6lTbGry+vOL2dBkYNSUjGouYEXzD95eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fID2NsCdGux2mZG02sRND6KNPxGYYqZ6FQgJ/HolCE+szt/U1siKveWp1W3lSs1B7
	 xCewy2jL2sUe8hVn0fXQqaKJXEeoE5QGDYjazRNrLxhqvGrFuc6EI+gq9bfXheOAqG
	 eCAPpnU2afoT1MFxjrbjQujw7lIMND3wYqwLewjF08pWNPC67yfgPdiNxrk7Ev9HqJ
	 M9K8EuqZNQyqYju8U0e+0hsJYWGYYoB3tlgS0GGDTsw4gqP2p7TfPro1blkbMwcj3P
	 4mifWLHPFNs7KUqFiDpkHZOGo+VTNX3crRW0AvU8O48EghulX5g9AXc4/p+XkIM1AG
	 IjrCAehb45wXw==
Date: Sun, 16 Aug 2026 11:12:02 -0700
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
Message-ID: <aoH9cvTC8vD4NYpB@x1>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
 <aier9XppLeCkJydw@thelio>
 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
 <aievi0s-3SO8hV6a@thelio>
 <aijpEqzJ7fM7rGMH@thelio>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aijpEqzJ7fM7rGMH@thelio>

On Tue, Jun 09, 2026 at 09:33:22PM -0700, Drew Fustini wrote:
> On Mon, Jun 08, 2026 at 11:15:39PM -0700, Drew Fustini wrote:
> > On Tue, Jun 09, 2026 at 02:01:43PM +0800, Icenowy Zheng wrote:
> > > 在 2026-06-08一的 23:00 -0700，Drew Fustini写道：
> > > > On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng wrote:
> > > > > The TH1520 SoC contains a MISC_SUBSYS clock controller, which
> > > > > allows
> > > > > controlling of USB related clocks and MMC/SD controller AHB bus
> > > > > clocks.
> > > > > 
> > > > > Add support for this clock controller, in order to enable USB
> > > > > support.
> > > > > 
> > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > ---
> > > > >  drivers/clk/thead/clk-th1520-ap.c | 64
> > > > > +++++++++++++++++++++++++++++++
> > > > >  1 file changed, 64 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/clk/thead/clk-th1520-ap.c
> > > > > b/drivers/clk/thead/clk-th1520-ap.c
> > > > > index 3a6847f1c950f..24f785f0b329a 100644
> > > > > --- a/drivers/clk/thead/clk-th1520-ap.c
> > > > > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > > > [...]
> > > > > @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct
> > > > > platform_device *pdev)
> > > > >  			return ret;
> > > > >  	}
> > > > >  
> > > > > +	if (plat_data == &th1520_ap_platdata) {
> > > > > +		ret = devm_clk_hw_register(dev,
> > > > > &usb_suspend_div_clk.hw);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > > +	}
> > > > 
> > > > Should usb_suspend_div_clk.hw instead be registered under
> > > > 'if (plat_data == &th1520_ap_platdata)'?
> > > 
> > > Do you mean misc_platdata?
> > > 
> > > Yes, this is an copy-n-paste error that deserves a fix.
> > 
> > Hah, yes, I also had a typo :)
> 
> Assuming that gets fixed in the next rev:
> 
> Reviewed-by: Drew Fusini <fustini@kernel.org>

I will fixup the typo and apply to thead-clk-for-next once 7.3-rc1 is
released.

Thanks,
Drew
