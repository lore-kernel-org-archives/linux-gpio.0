From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 3/3] gpio: pl061: remove confusing naming
Date: Wed, 27 Nov 2013 06:19:04 +0200
Message-ID: <20131127041904.GU32436@tarshish>
References: <1385472248-26039-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:33126 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751524Ab3K0ETF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Nov 2013 23:19:05 -0500
Content-Disposition: inline
In-Reply-To: <1385472248-26039-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Deepak Sikri <deepak.sikri@st.com>

Hi Linus,

On Tue, Nov 26, 2013 at 02:24:08PM +0100, Linus Walleij wrote:
> Drop the " gpio" suffix after the pl061 irq_chip name:
> this is only confusing: an irqchip name should be a single,
> short, simple string that looks nice in /proc/interrupts.
> 
> Drop the nameing of each individual IRQ to "pl061" - I
> think this naming function is for naming the IRQ line,
> not for boilerplating them all with the name of the
> parent controller, which is already known from the
> .name field of the irq_chip.
> 
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Deepak Sikri <deepak.sikri@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
