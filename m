Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6A2E7391;
	Tue,  9 Jun 2026 06:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985773; cv=none; b=WL2y4VXjUaJuFUNxpiY+fIYt/gPHIHS+Fn8NYh0evploJF//U10eh+0Hst37/YLEKU1iKg/IF+kl11Is1BpIghegs1kV4z5vAcCpUu80Q2oplu9pFUVolgfCnkmHVrq2voLSTsJXGeszEQWIcpAr3lttNpsEsCPmqPq/5RDGBVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985773; c=relaxed/simple;
	bh=gZ1kkCFzmNSbTCDKfw8Q0P/VBoZB9c/r9Yianq/IU14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYl40FhjOJShObgIk+KMjFgaKC+t3HKHCKiK//uDGrUr75N9Tm9xnhfSUBjTFlgXuazJnMlSBPosWc9P9djR3hWqZXvmgn8lo9BO7qbudAnUBwuNLqIZvFeNUMnOUa9kspGtle/uEzurlgxBJqQMfpr/ROSeg+J3g9QR+exQDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnkwVPhQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnkwVPhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A581F00893;
	Tue,  9 Jun 2026 06:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985772;
	bh=GRmx4DwqEvH8Sj/Hh6Skbn6x441MCdzscjye44bXYhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gnkwVPhQb1ZwNiquck1wvt/I4u7Xwi7KfygraCnUeVOcnNjZoHwgzswIY7tGx4q21
	 9xqTDQdDBnROooohabC/eJx7QexicCmG6FBAPHdY5lC7YXSGxW/AM8t+XAVWxjkLgQ
	 f5HCzHfyyLcNsmqOf+WPOHLJANZnbEuvwb1vjdJiABe1OFQuXv2W/0UURrRaIVk4na
	 gaNBLcthN5C57QLJajeCAn8uMU+eq6ohIfBWseszie91vLW2b8SbBmPrnqMFHLR3Iz
	 Ocj0FlWFqf2FqQEWX7v82OtzUcllX4I+cnPg1oNqK+xZyxvrGyKK6/6fvh5OMcTubt
	 eupEoMmaF6uvA==
Date: Mon, 8 Jun 2026 23:16:11 -0700
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
Subject: Re: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC
 clock controller
Message-ID: <aievq4dae3GHHq0c@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
 <aiehUzl-qZeZDjXP@thelio>
 <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>

On Tue, Jun 09, 2026 at 01:35:11PM +0800, Icenowy Zheng wrote:
> 在 2026-06-08一的 22:14 -0700，Drew Fustini写道：
> > On Thu, May 07, 2026 at 04:17:01PM +0800, Icenowy Zheng wrote:
> > > The MISC_SUBSYS clock controller on TH1520 SoC is a clock
> > > controller
> > > mainly controlling USB-related clocks (which isn't utilized yet)
> > > and
> > > MMC/SD controllers' AHB bus clocks.
> > > 
> > > Add the device tree node for it along with the missing bus clock
> > > references for MMC/SD controllers.
> > 
> > Is there a functional reason to modify the mmc nodes in this series?
> 
> When the clock isn't referenced, Linux will disable it unless
> `clk_ignore_unused` parameter is passed.

Ah ok, thanks for explaining.

Drew
