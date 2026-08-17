Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509D282F1E;
	Mon, 17 Aug 2026 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787010757; cv=none; b=QKcGeLVZPzgcCSgDAt5qVpdn8FCBdtZu89ixINvixRraMwGy/5TgSVfuRow6LT4uhQ5cNNdDUrPoVGkjNaCAnK8w/8NirQcP+ltvfxLhYgueYp0J3Nyf/AwGTVUXZpKt2MFUsSg/gmu946NuJuTjAfSavdpwniHCYbVaY7d/YK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787010757; c=relaxed/simple;
	bh=AtD4uFG6MYanMiiRIeueL3WGyuyNAhrdDqYLDHsIitM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osVFz+PjBX4F20SyLVHxkKFRk6ujrHkm/WZYxG4PEJJCD3utCTwHJBqEtx48ebfkTKdhO0B25tOS3t8WpyWpodO6afXWrDRZrnyzJMIv7v/fvwZ57xQG/Xasqbdcn4NJPU/GSqNekxOYHQUExOl4tEsAgyTSO04mtQ6GnWFQEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+hk+Lyc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+hk+Lyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF5D1F000E9;
	Mon, 17 Aug 2026 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787010756;
	bh=koWf55vaeY/YK5s2sXLfuXSB87tJXPWVCUmNqitRZhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V+hk+LycGEcXLRgSUp/flcYt0TOp/+5nxDJSpjbCXKVph6Y0rL4yhAwebZhCRcbjc
	 XQgcNqYrGmOp9ZXyY7mN+58t17njbPXI29hVNP5O6mNWvR/ODCTjkqY15Wg6N61DGt
	 8tQFTaKg/ZJ27xleGoqhaczD3VcAYDCrUyzfVHDSsx/zdzWn1hdP8SlilEuqUdj6Be
	 NCzOqG0Msb/3GqAlpsJkiwbgymrR0B8qzBG+I+gkB6KZDzKbVl5QP51Un3gHUyQgMX
	 klOxX9iyqfyFxSglHVTEIL+dUHGLGWQnktVu8sGC/gWiu3jmiiC2sgrvK0ApX1uJcT
	 /aZAG5R8VkYGA==
Date: Mon, 17 Aug 2026 16:52:34 -0700
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
Message-ID: <aoOewlbMfey0DLwp@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
 <aier9XppLeCkJydw@thelio>
 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
 <aievi0s-3SO8hV6a@thelio>
 <aijpEqzJ7fM7rGMH@thelio>
 <aoH9cvTC8vD4NYpB@x1>
 <3f0268a19aab46d602dffc9e14fc6683af7a20cd.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f0268a19aab46d602dffc9e14fc6683af7a20cd.camel@icenowy.me>

On Mon, Aug 17, 2026 at 12:24:26PM +0800, Icenowy Zheng wrote:
> 在 2026-08-16日的 11:12 -0700，Drew Fustini写道：
> > On Tue, Jun 09, 2026 at 09:33:22PM -0700, Drew Fustini wrote:
> > > On Mon, Jun 08, 2026 at 11:15:39PM -0700, Drew Fustini wrote:
> > > > On Tue, Jun 09, 2026 at 02:01:43PM +0800, Icenowy Zheng wrote:
> > > > > 在 2026-06-08一的 23:00 -0700，Drew Fustini写道：
> > > > > > On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng
> > > > > > wrote:
> > > > > > > The TH1520 SoC contains a MISC_SUBSYS clock controller,
> > > > > > > which
> > > > > > > allows
> > > > > > > controlling of USB related clocks and MMC/SD controller AHB
> > > > > > > bus
> > > > > > > clocks.
> > > > > > > 
> > > > > > > Add support for this clock controller, in order to enable
> > > > > > > USB
> > > > > > > support.
> > > > > > > 
> > > > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > > > ---
> > > > > > >  drivers/clk/thead/clk-th1520-ap.c | 64
> > > > > > > +++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 64 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/clk/thead/clk-th1520-ap.c
> > > > > > > b/drivers/clk/thead/clk-th1520-ap.c
> > > > > > > index 3a6847f1c950f..24f785f0b329a 100644
> > > > > > > --- a/drivers/clk/thead/clk-th1520-ap.c
> > > > > > > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > > > > > [...]
> > > > > > > @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct
> > > > > > > platform_device *pdev)
> > > > > > >  			return ret;
> > > > > > >  	}
> > > > > > >  
> > > > > > > +	if (plat_data == &th1520_ap_platdata) {
> > > > > > > +		ret = devm_clk_hw_register(dev,
> > > > > > > &usb_suspend_div_clk.hw);
> > > > > > > +		if (ret)
> > > > > > > +			return ret;
> > > > > > > +	}
> > > > > > 
> > > > > > Should usb_suspend_div_clk.hw instead be registered under
> > > > > > 'if (plat_data == &th1520_ap_platdata)'?
> > > > > 
> > > > > Do you mean misc_platdata?
> > > > > 
> > > > > Yes, this is an copy-n-paste error that deserves a fix.
> > > > 
> > > > Hah, yes, I also had a typo :)
> > > 
> > > Assuming that gets fixed in the next rev:
> > > 
> > > Reviewed-by: Drew Fusini <fustini@kernel.org>
> > 
> > I will fixup the typo and apply to thead-clk-for-next once 7.3-rc1 is
> > released.
> 
> BTW I think the binding patch should go through your tree too.

Yes, I will plan to take patch 1 and 2 through thead-clk-for-next and
patch 3 through thead-dt-for-next.

Thanks,
Drew
