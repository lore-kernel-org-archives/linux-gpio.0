Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868047;
	b=f2GzFbF4sf2ptnpGFza2xwE3E618zqC78960PGRgbnmJs+PAJcT2+G3eyaCbJlUYzy/y
	 w6mpTXbXXS8cFHGtMPI/y+bYYy9Y1+2qMIcMGEa50hUA1uXx3HIw+bsVEJRYFY23gZSUT
	 1/3Vjm4V//HizDPOkqKDJ83YmoNOx/Bw7O+jWytAWYf2ti7YZXr8P+htaXbWjcvQBvfRZ
	 +o//A8YeaSqiIOoJd+Dk5+P1S6Ew8Mf0s3iomw5DdrCnrAY3MtLW83OaBEsF94dzVmuBr
	 lV41YVFwWHg+lzesM8PFP9boehoedAxOwght45Q8lHvjern+XXcQJZutQ8eS0fEIQ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868047;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HBTpZV+qjSb6XbBgWR6yIkg/MnR4dVdFCuL2rBP9/7w=;
	b=FqNokXA9KTuMGnqBT8NpLwBJF6g1EqcRDW4Chu1MPsq5NmLxyfMBRS4CA5ipKFARz3JZ
	 YwMI8+M1hT48+3fiEHu5krL4WcSeE0JBKIVRwFXgKXLpw3/gOsEUGULRMow+dX19+KItS
	 Uw8NaM/UOTMXo1A+VGQLbHIJfE+Fphsa7gckd7RiVYzFTn2V/4BWUt6JmJD+IgNWBcSzV
	 otCoUje3tpK1ST+eZA14gLh3b3twxx44GEfLLjI2IcmBbwlOrq/DaqhIESM2hZKgAs0Bk
	 QjkG/vSsLZzmb9LlJ2yPACI0ZE3e63SMCfb6FPVYjxCvNP+pSsVPn67floSfgq4LjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wt9nOIia;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFC606A31C;
	Sat, 28 Nov 2026 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wt9nOIia
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2631F000C1;
	Sat, 28 Nov 2026 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795868046;
	bh=HBTpZV+qjSb6XbBgWR6yIkg/MnR4dVdFCuL2rBP9/7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wt9nOIiaKhjwYZLG+0W7HSF7jUClvvctnhaEyBZJa6x0EgGL9U9l2miqA2mHOvS+S
	 9auwZJUqxN37ygshplHMbWD1jRNBNItz/Z0F0SHwDroCH1nZS4XXJ2W8Q1/wVwl0Rq
	 QfnVimhRwVrvfTD+iCv0IqHS1ASL6OvnU0qvU2C2534gi0ChKLEnVddNckiRUOmmIf
	 sjZDPOlpbiv/gJ5YhZZvCZSVdKsO2b/Y2UU0JL9Al0i0yzsuTWT0tQ5hLhJHFGYAei
	 yQBANFNVHKbTPVhVoEY1fDSXAAOml3HvMCeF48IAfSXwFey0tYUWrOJ6hPA1faNDZD
	 NlVwrmEX/Z6mg==
Date: Sat, 28 Nov 2026 04:14:04 -0800
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
Message-ID: <awrFjAIE96hw0VNV@x1>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
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
> 
> Emil Renner Berthing (1):
>   riscv: dts: thead: Add Lichee Pi 4A IO expansions
> 
> Icenowy Zheng (10):
>   dt-bindings: clock: thead: add TH1520 MISC subsys clock controller
>   clk: thead: th1520-ap: add support for MISC subsys clocks
>   riscv: dts: thead: add device tree node for MISC clock controller
>   dt-bindings: phy: add binding for T-Head TH1520 USB PHY
>   phy: add a driver for T-Head TH1520 USB PHY
>   riscv: dts: thead: add device nodes for USB
>   dt-bindings: gpio: dwapb: allow GPIO hogs
>   dt-bindings: usb: vialab,vl817: allow ports property
>   riscv: dts: thead: lpi4a: sort nodes
>   riscv: dts: thead: enable USB3 ports on Lichee Pi 4A
> 
> Thomas Bonnefille (1):
>   riscv: dts: thead: Add TH1520 I2C nodes

I have applied patches 1 and 2 to thead-clk-for-next:

  [01/12] dt-bindings: clock: thead: add TH1520 MISC subsys clock controller
          https://git.kernel.org/fustini/c/c9240a577b73
  [02/12] clk: thead: th1520-ap: add support for MISC subsys clocks
          https://git.kernel.org/fustini/c/4f38d7bdaef4

and patch 3 to thead-dt-for-next:

  [03/12] riscv: dts: thead: add device tree node for MISC clock controller
          https://git.kernel.org/fustini/c/8d80d268b429

I fixed the platform data check for usb_suspend_div_clk in patch 2 when
applying.

Thanks,
Drew
