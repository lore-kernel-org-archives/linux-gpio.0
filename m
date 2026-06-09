Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F01A9F90;
	Tue,  9 Jun 2026 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780978660; cv=none; b=ks4QfKRjN5YjEwb2OHpsAfpF79kz3FU8PdeLzPt5Gy98sebLWTVyd4tTaVNlPrzJrCzf0lADefUk//COxfxfH5heIvko+uCtCNYPIz+npwNRzc4hwlOQ7gg8GMWOoFg4o+2b5xXvH/7NOcA2eBsK3US7DNbWDU3ErIoFxcrhLrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780978660; c=relaxed/simple;
	bh=6t46VKG7KFnxFCNrUZLTQ1Fo6crd2P6NO2NQsVE2PgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJv6SekJ+PF5PTgvNWWOUI2Qk3yzIl1eiObwz4S8feZ01k4ed1hTPCwP2g9dHj/mIvGsj8fb0iUTraKCQvZdS1LE4BMsDvtVvlyxg9k/3h9AkqbGnvMBKffsQVIiUBz8gAIaF1B2QCep+u7/jIKVHT1+BeGJgtcPc1nrQetXfDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjG9L5kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjG9L5kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251481F00893;
	Tue,  9 Jun 2026 04:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780978659;
	bh=4/Ifnzy+i2GJg0cvs6T4Vau8bHcoPyc7f0xcmVw8DhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjG9L5kIoMIxAs+d4+r0Rr3uPbfTciXU4Ls0+SI6JF3tAJudlSpLAopxQHkjE0ebe
	 YAxBDaUPs492cLN3lFx9sL+8+LWKPoe2VbO8zq8v+RthKELA0CFUqBBwy0usR7mFfg
	 OstadHjKQQ6VIDpeoqXg5Ps4i3Y4lXVrHra7sO7QdKKXo1NfPt/OzPADXQFJEpthsK
	 gtaWg9Gf78U4XLRFCztpDPnP1ZwEAuA1sTWotC0aMcNmB5BSXxkg9bSUvGHm+OMwaq
	 BhKoFqf/rlyb/BSoF/NlKVQjwAEBdBML68q25jard/X4ZfOBia5CCzbz1Oh/OU6tvs
	 s7QaPVz/NOL0A==
Date: Mon, 8 Jun 2026 21:17:37 -0700
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
Subject: Re: [PATCH 00/12] Add TH1520 USB support
Message-ID: <aieT4WmWK9416M9E@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>

On Thu, May 07, 2026 at 04:16:58PM +0800, Icenowy Zheng wrote:
> This patchset adds support for T-Head TH1520's USB functionality, and
> enabled it on the Lichee Pi 4A board.
> 
> The first 3 patches add support for the MISC subsystem clock
> contrtoller, which contains some USB clocks.
> 
> The next 2 patches add support for the USB PHY of T-Head TH1520, which
> is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
> the controller itself is a properly configured DWC3 controller with sane
> default register values set.
> 
> Then one patch adds the USB PHY and controller nodes to the TH1520 DTSI
> file.
> 
> The remaining half of this patchset dedicates to enablement of USB on
> TH1520, because of the onboard hub of that board -- its USB2 signals are
> behind a switch that needs to be toggled on, and Vbus supplies for both
> the hub itself and downstream ports are managed via I2C-expanded GPIOs
> (because the SoC does not have enough GPIO pins).

Hi, thanks for working on USB. I tried to apply it to next-20260601 and
several of the dts patches no longer apply cleanly. Could you rebase?

In the meantime, I'll apply to 7.1-rc7 for testing.

Thanks,
Drew
