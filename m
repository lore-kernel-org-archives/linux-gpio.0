Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870895;
	b=AXzrO4dOAmMEMmdU1CoU+hy1w86FauRPmLVGby+lCGBrqe1ufg+Dok6YlSCl6LrvvA84
	 HMOCSB5OsE8Ww80y0oQJHoT6DcvobTQWi+kOomxUCxXFZrs2WWp4LrZY0PG/+AcDo298V
	 UGp42C6LktcoynvN330qAZSMnHxu78Tds+4w0aGEXreF3z3Js6czsJKTMb7b8HeCeaAMb
	 sDvv6FJ/pQt369x6sEXi11vsSa2IOftFfKGWqaxFir+rvWlIWqKgKGv3gOieiWgAnIB+u
	 de2WkEZ2xDA4KaHizn1IN58Z34e6MvqLEJvu4p9h3SgFpGoKg2ggmQq/6PRgNMwgFXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870895;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=5IyfbQ5BFLW1FHQ7ZV9MM3s4H/J7fJhI3I+hcrob3aI=;
	b=FJsD3tOdWIX4pisg3rjOXSW8HB0M0aOBrwRpfRLVip0XirEOwrV0rLglRYz1k3N/zFvn
	 1Ev0dM4HILFPfmFOMIkvCD93cm8QRqtKN7CatBbf4F/dL5/KtufYTaEM8QUeEEGeMa9QD
	 mkVeipryn7gEYZZpvQyQyHAEhbN1xtqmFu5UdS4W7DMLt/j31WYzSxBt/xERx7q9pJIzo
	 oZ9tkaD+jFJBfjXcEH+phtrIjA+NTgfchBHGand70MIMR8Lhu62C2cHQJiVXyIewqCZsE
	 /TaN2kASJc48sx56F7ArVlEjYuK/On52Qkx03Eee9OeEo5yse12qSMuSwiWTC0GUlOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="WQAmF/5R";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FCE606A31B;
	Thu,  5 Nov 2026 09:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68FCE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQAmF/5R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793870895; x=1825406895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aHuJD5n+OhqH6Ee1LwSwO+D8ibBpJcwkdGQ7MDHss4c=;
  b=WQAmF/5RYYbDl2voDVlU7oAkNhVUeCzIjVHig0OKFEMMVxYFVAWqiHf4
   inWeuZUvvcukY+IZpk4/5z+8jQlgRzGw8m+Im7IdasypVk9/mjxBuED6j
   gg8iZgSUE1b1+WBKmKC/QCcyx+Czu15yDIjDS8PbctvHznSd7SZKLAXrN
   8LICSp2dMyECnI2seruoJbz+h09cTaXAvJz/k8nu1TF6dLrbBk0pqu4/b
   Wg0INDPzf1BanAkQIn15ZsFjHlaJ4YAV9sxkMOiEdPzG6oOAovVEOwgOL
   RMt0BAVLD2IMGHBoDmjTcggCMU4UCQmtJx3j8PKsjRdnoiyEeQLUHT0/G
   g==;
X-CSE-ConnectionGUID: OLzLAI+cT6+6D5d+lDF0IQ==
X-CSE-MsgGUID: AKngMQTzRjKL5DntE5A8Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2520489"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2520489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:28:14 -0800
X-CSE-ConnectionGUID: CFXn1peRTSCzVdVyfdRu+w==
X-CSE-MsgGUID: 3H0ozDPASFqwhl/rH8NOGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7128653"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:28:12 -0800
Date: Thu, 5 Nov 2026 11:28:10 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Areeb Ul Haq Mirza <auhmirza02@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH] pinctrl: keembay: make keembay_gpio_irqchip const
Message-ID: <auxMKvFI9GCjPabA@ashevche-desk.local>
References: <20261102212500.195783-1-auhmirza02@gmail.com>
 <CAD++jLne9FgabDUWoirYejnnNfm4GD5zh-E-b_vUGoiwH=CgpQ@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLne9FgabDUWoirYejnnNfm4GD5zh-E-b_vUGoiwH=CgpQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 10:14:07AM +0100, Linus Walleij wrote:
> On Tue, Nov 3, 2026 at 8:50 PM Areeb Ul Haq Mirza <auhmirza02@gmail.com> wrote:
> 
> > gpiolib warns about mutable irq_chips at probe time:
> > "not an immutable chip, please consider fixing it!"
> >
> > Make keembay_gpio_irqchip const, flag it as IRQCHIP_IMMUTABLE, add the
> > GPIOCHIP_IRQ_RESOURCE_HELPERS and register it with
> > gpio_irq_chip_set_chip().
> >
> > The chip only implements .irq_enable() and .irq_disable(), so call
> > gpiochip_enable_irq() and gpiochip_disable_irq() from those callbacks,
> > following commit 35d008679a5a ("pinctrl: plgpio: Convert to immutable
> > irq_chip") [1] and commit 2993d2dd8ff4 ("gpio: timberdale: Make irq_chip
> > immutable") [2]. gpiochip_enable_irq() is called once a free interrupt
> > source and slot have been found, so a line is only marked enabled when
> > it is actually routed. gpiochip_disable_irq() is called after the line
> > has been cleared from the interrupt configuration register.
> >
> > Link: https://lore.kernel.org/r/20230414-immutable-irqchips-2-v1-3-6b59a5186b00@linaro.org [1]
> > Link: https://lore.kernel.org/r/20250509-gpio-v1-8-639377c98288@nxp.com [2]
> > Signed-off-by: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
> 
> Driver is marked as orphan so I just applied the patch.
> 
> Cc to Andy if he wants to pick up maintenance for this one, but I doubt
> it (not x86, right?)

No, it's ARM. And IIRC (I may be mistaken) it was designed somewhere
close to mobileye, for some automotive related use cases. So, if ask,
try to ask mobileye people if they are willing to take it.

-- 
With Best Regards,
Andy Shevchenko


