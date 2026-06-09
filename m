Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5F3CFF79;
	Tue,  9 Jun 2026 06:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985680; cv=none; b=WPlf8TOdYWZyff7jNr1eFogrmSZqNnfsbn3QGfGvsE6WDpLjROasDfcVrk2tcZZDiUIAHBwZgXW4FiY+CFy5qROD5Hrbts2qlkETJvjPixdBqL/IXuqtEs6/CdYrfgZzmzZPK/JHrsVcQvFASr5Oj9CjNz2VaC3paEZOt7caUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985680; c=relaxed/simple;
	bh=R8i0xMZtwuBC16/9xFHQgNRiMzXhl4V9tYi/JiQR3gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BU7ebjCYPq1NGpQpnObg0TP+z2HVPFLvQ+kPWfOw3ArtRcaOkzjDWunVTqjTanYYvzkpHuxmIk+sxI79eyVLEQUYUyhbu6q74onDpty9HAlwx7K1FuzR+g/StF+w0aRYRDDlEEoj3uyJK1nS6Dy+JgsWoPs6ZunHOtOY87AcifY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qsoqzpe3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qsoqzpe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A4B1F00893;
	Tue,  9 Jun 2026 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985679;
	bh=BKUNXUXBCi8bnRLind/MhqgA2mObgw9K4PguVb33Mmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qsoqzpe3Yk+cO7Df3L6n87Tsa501qYTF85v7NibFO81JuTOpF/9VVBbBEIshF4FQ9
	 S4vwi0nKt8ogH1X7kI9H/Rhq0EPB0EyOHw7tuQMNzktwHuIw2luQ6BTn6TUeZEL8eO
	 vgPLAZ57mxcWnQwBpAs9iv1dJlTICNf3kSyXtvU4HwZAw5zTh5cDPKWuJzj1ceArPY
	 GytvvBxI3gQv0131i4COZdD/7gqNeu65JbcPR/SEIUgTqKHbu6lCio7XaAdZY/cpLy
	 fb3+MruIQUjkr7CMm46WJZk/89hvk6Hek0AFRF+SF55Lhg92P9ljW2FZjDq+YdrhlY
	 Es0iOU1l36zAg==
Date: Mon, 8 Jun 2026 23:14:37 -0700
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
Subject: Re: [PATCH 00/12] Add TH1520 USB support
Message-ID: <aievTZ5hqHGL-pTh@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <aieT4WmWK9416M9E@thelio>
 <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>

On Tue, Jun 09, 2026 at 01:10:41PM +0800, Icenowy Zheng wrote:
> 在 2026-06-08一的 21:17 -0700，Drew Fustini写道：
> > On Thu, May 07, 2026 at 04:16:58PM +0800, Icenowy Zheng wrote:
> > > This patchset adds support for T-Head TH1520's USB functionality,
> > > and
> > > enabled it on the Lichee Pi 4A board.
> > > 
> > > The first 3 patches add support for the MISC subsystem clock
> > > contrtoller, which contains some USB clocks.
> > > 
> > > The next 2 patches add support for the USB PHY of T-Head TH1520,
> > > which
> > > is a wrapped Synopsys USB3.0 FemtoPHY with a little integration
> > > quirk;
> > > the controller itself is a properly configured DWC3 controller with
> > > sane
> > > default register values set.
> > > 
> > > Then one patch adds the USB PHY and controller nodes to the TH1520
> > > DTSI
> > > file.
> > > 
> > > The remaining half of this patchset dedicates to enablement of USB
> > > on
> > > TH1520, because of the onboard hub of that board -- its USB2
> > > signals are
> > > behind a switch that needs to be toggled on, and Vbus supplies for
> > > both
> > > the hub itself and downstream ports are managed via I2C-expanded
> > > GPIOs
> > > (because the SoC does not have enough GPIO pins).
> > 
> > Hi, thanks for working on USB. I tried to apply it to next-20260601
> > and
> > several of the dts patches no longer apply cleanly. Could you rebase?
> 
> I think the reason is that one of the GPIO expansion chip is added to
> the DT for enabling Wi-Fi.

Yeah, I tried to resolve the conflicts but I'm not sure what the correct
resolution is.

a20241c08385 ("riscv: dts: thead: Enable WiFi on Lichee Pi 4A") adds
'clock-frquency = <400000>' to &i2c1 while this series instead sets
'clock-frequency = <100000>'. That commit also sets i2c1_pins
'bias-pull-up = <2100>' while this series sets bias-disable.

> I am not sure whether the next revision of this patchset will contain
> all things, maybe I will split out at least the USB PHY part.

I think splitting out would work, too.

Thanks,
Drew
