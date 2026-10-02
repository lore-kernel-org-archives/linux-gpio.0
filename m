Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDDF42E43E
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 07:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927320; cv=none; b=RgIH4+AjsgTDS6jdsOY/eq8z52Hbh2/1pRO6t+ndByygMmjwwb1hInqi6BSHINSLsxn98TgDx/iYZ/vomhtYqNPE8A9naqnYQIEQdVQmfN72xaN2hnkFbv8IHXmyAm7XvJRUPfKTr41eRcFjUMnQpcLoswp65TZdOD7UWp25WDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927320; c=relaxed/simple;
	bh=M43fEIN+D69qevaQQnJbHgVo+UWrMBNbXa1S/afzT2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn44ucZcIHD4msS8uQ+tuXYG2GVCSu5i6Q5PJUiQ3KSj/vUq+PeLBkAkkoWzqksWJas6j/Df8F7TirMuhAusWfN7viz7PCbqqg7q8Q1TUKIW7/XCgjrwLv9jBnXvMr3I/2MbtzQSDAXZZmWBQbU6Bv6uxwAuapR96S9V/Xp8XxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 2 Oct 2026 16:48:33 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO BRUNHILD) (10.178.31.97)
	by 156.147.1.126 with ESMTP; 2 Oct 2026 16:48:33 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
Date: Fri, 2 Oct 2026 16:48:33 +0900
From: Chanho Min <chanho.min@lge.com>
To: Linus Walleij <linusw@kernel.org>
Cc: longzhao@ambarella.com, Wei Xu <xuwei5@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Long Zhao <zl020895@163.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
Message-ID: <ar9h0T9+EvRxj6As@BRUNHILD>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
 <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>

On Tue, Sep 22, 2026 at 09:23:21AM +0200, Linus Walleij wrote:
> On Mon, Sep 21, 2026 at 6:23 AM Long Zhao via B4 Relay
> <devnull+longzhao.ambarella.com@kernel.org> wrote:
> 
> > From: Long Zhao <longzhao@ambarella.com>
> >
> > Replace readb()/writeb() with a MMIO regmap while keeping the existing
> > gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
> > under the irq descriptor lock.
> >
> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
> 
> It would be good if some critical users of the PL061 could
> test this patch.
> 
> Wei, can you test this on HiSilicon?
> 
> Chanho, can you test on LGE hardware?

Tested the patch on LGE hardware (LG webOSTV) All 18 PL061 GPIO controllers
registered successfully.  GPIO direction and input read operations passed for
143 available GPIOs, with no failures or new kernel warnings/errors observed.
Output value/readback was also verified on available GPIOs.

Tested-by: <Chanho Min> chanho.min@lge.com

Thanks,
Chanho Min

> 
> but it looks good!
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij
