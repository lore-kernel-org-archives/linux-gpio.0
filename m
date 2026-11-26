Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726112;
	b=tlIz6aKRED7Cccb6ja6JZnWC3q8KmPBWOliEpcnVwaJh5lXvbmo7tG+dQEfPM/ycokPU
	 lbmPSG694A+YXtCAhyB6nT1Yzc/MMfzKcVDlyU7muS8zyQ+e9JJFpkCH0PfFQlvJxxKlK
	 Oe22ANGQVUoADFFx0M2bpEYuB+F9/HIfuk8vwFoblsNTIEufEpC/6b1fVeGRuLWYTGx/z
	 jQKhVnNlCjnVE+WpdTdMhQNBmJu0jA353yQj2zgeT4hJISpMn8G9MhP3u6xxaa9zwrmyN
	 sHewPIAM6UBi9ycxWcS02jb+GiC1MMrWI1UKlUXS6ZQCI4LngHwiD2nzHqxin/KHwFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726112;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=+GwGE8LK7Ybzcfh7RYTEPQClnRJ+sIu6LYYch8s93Oc=;
	b=Ntzd+ckknaRSsTrMz/x5q0fvxG6ZmKPHhW7SXoV0ohDwRsTz0IT664s9c8y5xwyTV7FU
	 O/+i+hzEhqOvGczGB6rYute8S1KRifVKO2xNCEgNgLZ9Ydl/kX4U7qNQjoZS+j+pgW1zO
	 y7dl0SLqt+zNDt57iOLw1mBcj8Eo6fKAevCb4jQunst+haYnfFq+JzpTdzQW51HBFBxDf
	 3hRs0UZOZFk5fB7crqwrDzH3w/8QOTcne7nVOG1BLIDDyMeR+GY38SHJtYmSw1+XxttDP
	 4EbzG/x+GkOIXB8UUxEDkGL9pmE020U6CQbsjR0UjFITS53O3HHQHcy+q4j38fK5zaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kucu2KgZ;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A2606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 20:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kucu2KgZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795726112; x=1827262112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qPlel64ucsy/uHv+Mwbl10NHlgNHl28lNvtPDacI9TY=;
  b=kucu2KgZdNIx0+f3gYmSMhXft2dR3iLLG7OltdmmMTK84j/8u8cYbcNk
   7IXUuyMWs08TpewShdflV6KnSuwA64ujZfq7ATKI0Ai3ak3yleTngJh8l
   eT5Ig++egFhK449f2liYSKh8lNt6+b6MnCRrJaqNiFO3iTXXYkSmxCTt5
   BQ5KsUTDgNCWUPRICG2Bwn+j+vjpf4mxA+B3SOUNWRCqx6AWN41gTpi5K
   nrySf+FltBO732EXO4JuOwmpMOpFncCZDLAvSJ1SMfeHhSk/zKaHZb4SC
   q7RdwMTuqhq0MBc2dpRNdpC2UWgZxTMh68KLypNeXJ9KQt2BAVnCYbn6J
   Q==;
X-CSE-ConnectionGUID: AgbKwycFTMOWVNYO8yMg+g==
X-CSE-MsgGUID: 4iz330fITdOuisqiUAX5hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4529996"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4529996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:48:31 -0800
X-CSE-ConnectionGUID: 0zFVz8HERsOmgEGhf95o9w==
X-CSE-MsgGUID: UFZiKOcXRqabhe5zb1n62w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12479649"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:48:28 -0800
Date: Thu, 26 Nov 2026 22:48:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH 00/13] gpio: regmap: IRQ domain cleanups
Message-ID: <awibGgRHR0zwUCRJ@ashevche-desk.local>
References: <20261126153600.299724-1-mwalle@kernel.org>
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
In-Reply-To: <20261126153600.299724-1-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 26, 2026 at 04:35:11PM +0100, Michael Walle wrote:
> The gpio-regmap provides two different variants to attach an IRQ
> domain to the gpio-regmap instance, either via .irq_domain or via
> .regmap_irq_chip. The former even has a small window where a
> consumer requesting an interrupt leads to a NULL pointer
> dereference. This also came up during sashiko reviews [1].
> 
> It turns out, that it is impossible to create an external IRQ domain
> without a race while the gpio-regmap instance isn't created yet.
> That is because it will already use the gpio-regmap provided
> callbacks. Thus, with this patch series, gpio-regmap will now
> provide a callback for the individual drivers used to create an IRQ
> domain when all necessary fields are filled.
> 
> To move even further and cover the most common use case of having a
> regmap-irq domain, gpio-regmap now provides a helper that can be
> used in the .create_irq_domain() callback.
> 
> We need Long Zhao's patch [2] not only for ACPI but also for the
> regmap-irq handling. If the IRQ domain is removed before the
> gpio_chip, gpiochip_remove() would use the already freed domain to
> free the remaining interrupts.
> 
> All the users of regmap-irq are switched over to this new helper.
> Finally, the last patch, removes the old variants.
> 
> There is one change in behavior: because all regmap-irq domains use
> the gpio_regmap_irq_{reqres,relres}() helpers now, interrupt lines
> are now locked and cannot be switched to output. But that shouldn't
> be an issue anyway.

It's so elegant solution, my full support!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

(I had something more complicated in mind.)

> This was mostly only compile-time tested. So please test. I'll do a
> proper test on the sl28 board tomorrow, but since Long already
> asked, I wanted to have this out for comments and testing.

I'm not sure I can help with testing (all our HW seems do not use this).
Only regression test for other users might be done, but I need to check
if we have platform that has an HW with the driver that uses gpio-regmap.

> [1] https://lore.kernel.org/r/20261123040142.48880-1-joseph@telaak.dev
> [2] https://lore.kernel.org/r/20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com

-- 
With Best Regards,
Andy Shevchenko


