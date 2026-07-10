Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46593064AE;
	Fri, 10 Jul 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698937; cv=none; b=J56b7thSfNxJ/7sOzzqagF7F62Cz7EFaXTeyRmIh7XebSL1N9ujqv5219tePwgWggSQT8gYQyRpeZ60jClid1+CCAYa5J1/dw+rpCi9ymvYpFUNl0CCZZEIa0cLonhesSiHH0UOOyALK4hXpVhXVZR/tqvB+/a+hFw/dnWMKkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698937; c=relaxed/simple;
	bh=hODZdIRLKtZI2OTDibqWc8vf1QCRK5j84bqQrg4FUKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geyv2gdmBfX22j8x1i9d8ucZuPAcShy8WB+BeKtPRTG6CEDl2B7DjjqCBtFhNnJ8NPrksFdeDO3VWUNUUpL/ZJbigpTINAvdrx9nBdrGBcTru6hii3XelALqPIOWwt4J4KobPwpdyw3O+gD9DdiWCB3rBvHyshlnOvyxLfF4sLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPenvW+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPenvW+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3C31F000E9;
	Fri, 10 Jul 2026 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698935;
	bh=SuBn+qM9tZrJlvXW+nzoxQ4e9HtFDIaF9zBrPfyVFeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UPenvW+mFXYRa5Xjsm6aXAqYufOqCJ5V7fxPkJr2mIKaD/B0InGGoaeo1ry1282gY
	 AKm5H+mLP65IpFPClBzRBZkk1fVyz+2KA6R4USZWlbw3NxAH1sCRKDSuxbd5xRWFoe
	 qG/9OoIrV5HUXKI0DQSKkd8vxf+nCDV6NZpa7GSZJtpHqyQzFJcA+EcpyJbc/YfGMC
	 ss0/TyqbVZdom5eYeAoAIDtmYbVvZntsEud+VeGpomsb648OJ3lhr6X1B64K/dkdK1
	 AKoIEXnVP11RNyMIAsXL6yCd1UhMyxG9mx6yfj7Fk92OCkFdnzvZhI+i8410pJGon1
	 lY1HoUNgUt8yg==
Date: Fri, 10 Jul 2026 08:55:33 -0700
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
	Yao Zi <ziyao@disroot.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH 11/12] riscv: dts: thead: Add Lichee Pi 4A IO expansions
Message-ID: <alEV9XJ2pr23CJ3B@gen8>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
 <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>

On Fri, Jul 10, 2026 at 10:56:08PM +0800, Icenowy Zheng wrote:
> 在 2026-05-07四的 16:17 +0800，Icenowy Zheng写道：
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > 
> > Lichee Pi 4A has 3 I2C IO expansion chips onboard, connected to the
> > I2C0/1/3 busses.
> > 
> > Add device tree nodes for them.
> > 
> > Signed-off-by: Emil Renner Berthing
> > <emil.renner.berthing@canonical.com>
> > [Icenowy: added commit description]
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> 
> I am going to send a newer revision of PATCH 9~11 in a few days,
> because the I2C1 controller is already added to the mainline device
> tree for Wi-Fi support, although the already-merged patches are a
> little weird.

Thanks, that would be great if you can submit the series again. I'll
make sure to promptly review this time as it would be get to have USB
support upstream. Hopefully there is a way to configure I2C1 so that it
works for both USB and WiFi module.

Drew
