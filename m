Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDEC32B112;
	Mon, 17 Aug 2026 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787010561; cv=none; b=Dghy2PdH5cRyf4Oex6PyZP9oW+oSFLzWv2JCjfh6zdIBQO1rmK/IKC1r8ylvzJ9PWHUytEVLb+GJlwcllkF/jfMbCmhXevtTwiWmPwY7MzKth9lltXAkieOCShA5TaCHcuwjmnJGc16nAfcLDf7EShnluKfiMTZRhfBeIz1hof0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787010561; c=relaxed/simple;
	bh=XVUABZf153A17QGNoeDkuHuA9QkNwJGoq4M/QwrWvVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUE0qo5osIGlYTIFf5knrIyG7njA7ZYsYFTeHTBlBgZJIKbFfm801XWiSeN9T4rUmT5tS+LSKbmHUOnJ5HEdHukSFNaIYnBTnGwB5h4T5L0YqdaWAMQdkB4KPKpODFlzF4IDzgtlP+n48P23Zk6v1EXP0PnV37/wzaQljKWAn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAYiy5D8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAYiy5D8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B33E1F000E9;
	Mon, 17 Aug 2026 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787010559;
	bh=3KmOAWkkq6vNgl04oOZllB37mH/rLBzXgbWryVTtjlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAYiy5D8oQ1o03PHJOVtpLgpVlEMXd8Kg8yAEXZPPF4UNTO9FqcnqQjvpvm+HzH2O
	 1m4dGzd+6jUpoI80MgMQc+ipMDIbbWHxOeJor9uqonsMJZjcgXyri8PjVW7+Y4iMtw
	 iPMnF69GZ9096HaZx7Wj5vAFltNj++la24IZvwKyLow2Xsd5FeYEsEv4SFpf6Fk53I
	 jlBI301SVZBSHLq8+lRIz+UaPt3jcIWNP5FoAy7gJgOJSlAeUGtUHIrWDzmDzhVUYa
	 aLrHDW28CtSg+681kz4AoNvz0VUWiHo98lQRqBb/Y2EYYJ+CGNrSxNC0YmjQcmrETk
	 vjXyBSeuvQZhw==
Date: Mon, 17 Aug 2026 16:49:18 -0700
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
Message-ID: <aoOd_i_QtCywStEz@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
 <aiehUzl-qZeZDjXP@thelio>
 <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
 <aievq4dae3GHHq0c@thelio>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aievq4dae3GHHq0c@thelio>

On Mon, Jun 08, 2026 at 11:16:11PM -0700, Drew Fustini wrote:
> On Tue, Jun 09, 2026 at 01:35:11PM +0800, Icenowy Zheng wrote:
> > 在 2026-06-08一的 22:14 -0700，Drew Fustini写道：
> > > On Thu, May 07, 2026 at 04:17:01PM +0800, Icenowy Zheng wrote:
> > > > The MISC_SUBSYS clock controller on TH1520 SoC is a clock
> > > > controller
> > > > mainly controlling USB-related clocks (which isn't utilized yet)
> > > > and
> > > > MMC/SD controllers' AHB bus clocks.
> > > > 
> > > > Add the device tree node for it along with the missing bus clock
> > > > references for MMC/SD controllers.
> > > 
> > > Is there a functional reason to modify the mmc nodes in this series?
> > 
> > When the clock isn't referenced, Linux will disable it unless
> > `clk_ignore_unused` parameter is passed.
> 
> Ah ok, thanks for explaining.
> 
> Drew

Reviewed-by: Drew Fustini <fustini@kernel.org>
