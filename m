Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6AD1DF25C;
	Tue,  9 Jun 2026 03:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780975567; cv=none; b=IZqHvYuRovWewQ1qKGZ2vhjbdn9qsiDYXWBWcsynDLo7GL3I6vNP6f9ksfKNEhnm1ShPvIx12igUExKYkfqyY47jxxDIL7sloq7CLflsj4bxgK8TE5+3pmWdJ2XCA4ilrJwWZnlTENYh+IP1eg5wJfXQ+vOvAU+EOX1p2t8xBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780975567; c=relaxed/simple;
	bh=ttVqp3RcfN2X0ogQApPD1BVoMIAm1VF9QckaMahgyPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHMrVX36XWfN7/8g0jEkbuVXl5EAZIbmSEnwKeuRfcphVopwePcUFa3hTSIWluhNoe5mnD/sM6MNCmzWFaS3tKgfB3drDZkwBUO55N5fQuSP0nFPNIT5RasmveI2zlJTa74v3OZU9U9J6PXc+qg7AYK0wzyM4IcNsTrhteloW0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFmxC3Rk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFmxC3Rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B731F00893;
	Tue,  9 Jun 2026 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780975566;
	bh=DTwyV+49fLCBDx2v0KMlJ6TqGe0qDGgv9OAfvSH0tYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFmxC3RkKrUAh3QAMl5gVzb8HdROjdH5oT0UbWEJI/omLbuPjezupcvYRxHysTALW
	 PwBym09KYsmIImspBm9kvoe39DehTn/5wtF7q1Io3gED0Cnmmlvjb8E2ctQSAEz04x
	 S1jJSWnl+tOFBaMa4X8sI12BBltgG1aA1kjT9IIN/BxI4czNurrj8HWr6lzvroPith
	 u4asF+F3VomimsF7xgZzwEF0OOZ30gNyvRVyJwKN8Gk5Zh/sAgDNGWVNEACoAeXGnQ
	 ydNvQXYNvRuEnUaMI6AyrlDvqlBmnbAsReI7IN5Gap0o4bCQSzO/kz+3QF/vogd6Is
	 M56LbLVzROnmQ==
Date: Mon, 8 Jun 2026 20:26:04 -0700
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
Subject: Re: [PATCH 01/12] dt-bindings: clock: thead: add TH1520 MISC subsys
 clock controller
Message-ID: <aieHzC76oys5ejWT@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>

On Thu, May 07, 2026 at 04:16:59PM +0800, Icenowy Zheng wrote:
> TH1520 has a subsystem clock controller called MISC_SUBSYS in its
> manual, mainly controlling clocks for USB and MMC/SD in non-TEE
> environment.
> 
> Add device tree binding for it.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../devicetree/bindings/clock/thead,th1520-clk-ap.yaml |  5 +++--
>  include/dt-bindings/clock/thead,th1520-clk-ap.h        | 10 ++++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)

Thanks for working on USB and sorry for the delay in reviewing this series.

Reviewed-by: Drew Fustini <fustini@kernel.org>

