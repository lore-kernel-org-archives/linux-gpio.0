Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799984;
	b=Amn9NERiXumKz7pWEn2ptbbPrydLTfv3TDH2nZHIk922zgrKyDEs0z2DNDu7z2BAqa7n
	 5thU/1EYMV164SQZjPVPLc7A54R9VeY+0h4BamaNk4CLHqaZcR/kbBvEW3e/axAK/KWQG
	 Ms9h1b9Uq5IVDmLNdUFwHHZkFGlnaM/8AKHlGqO5V53WH07l0c5Sg28aH1318iJFDO3SG
	 PuzJCSTiznALZXpWG2Oxt3N56tIhbBEKRb4XGCvbYdoKJRMF9pn+nfJRMgwKorswHaQQJ
	 WVhsV37XPTuTiF2mOhDGcEcg4F+MKwssvsAdOY6ekFb//0/qGsCgK9kRFSxq79QCpTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799984;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=xM+++gh9lEX42BhN1B3t2ZJ0fmEd/nt0wFnMQxSaQZs=;
	b=1SxFiVGTAeSu2BN8o4nJegJ76XE5HOBpj8CMABitxHTz3UXqs/+hgiQbaT6sfof1ZRQE
	 wtd2ipwtezxXHfEzW90BkBAHJgSgFcyQ377S6MbF1iOtj7wEE0VNOdHHSOnhSJ80dIHMc
	 ROgKReGSl2LYVRQPmlNcVDLFDxb3S19SDI2I8vBj/d37bYo6xsdnQXrN9R8RaJRrXGEVv
	 suyzHWePYoaPpGIvj2ZjNq5hzUBEBtmTyQUiZbNQkT65CYROehydsmAgr65bijyRzGQKd
	 nv9QfLljk9ox8BsenKf/XAS7tPrJOZe86EFJvJktDyiOUmmpS1Zfkq9LGFNGGm4bHFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REgtil3Y;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE50606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 17:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REgtil3Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795799983; x=1827335983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bHhhJa33EMSuLHof5NWbr5J4Gnw3fnFnAMrrEdH8PE0=;
  b=REgtil3YujOidQtwRfDeWMm3XNKOVIsGw06aUfIQ0eggzh9JAOp7jD34
   NqTG1E4C8IkwSBXARNqM9ahB7HAnwJ2fe9NC0kjtofAfH0F+pnWp6AXNf
   sD11bZdUypNTcNcf23m8c0WTOy7U7KJbO4QjsbeGPGEEauqTWKkZP2Ukh
   iAw4rTgUB1H75LGeMl7tnedv0FlXOEXrpRQWe1diFbpqHmeYwW6hYmRPg
   9JARxxI2sgvi0+Bsa+ypciPpkbcrb/fizDxFwVBy2FeNhWGA/H5xYzckP
   0Xyi9b0sIKv5fbF9WfCjviBJgAmMrtxDOJXDQkdMtdXkL+Awu6A7K6B9S
   Q==;
X-CSE-ConnectionGUID: NMEIg18SQFyrKpPvN/rg3w==
X-CSE-MsgGUID: ATLndY6tTHeMwHzrYhunGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4625880"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4625880"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:19:42 -0800
X-CSE-ConnectionGUID: O6Ce+IGDSk6VlDcgLtmblw==
X-CSE-MsgGUID: v0hwtTnbTfiQPFaBEUrbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12571123"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:19:38 -0800
Date: Fri, 27 Nov 2026 19:19:36 +0200
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
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [RFT PATCH v2 01/14] gpio: regmap: use the correct number for
 .ngpio_per_reg
Message-ID: <awm7qL5J02ivp_XC@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-2-mwalle@kernel.org>
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
In-Reply-To: <20261127145232.814492-2-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 03:52:18PM +0100, Michael Walle wrote:
> Setting .ngpio_per_reg to 0 means that gpio-regmap assumes there is only
> one register. If the number of GPIOs comes from gpiochip_get_ngpios()
> config->ngpio is still 0 and it's taking over the wrong number.
> 
> Fix it by using chip->ngpio, which uses either config->ngpio or
> gpiochip_get_ngpios().

...

> Fixes: db305161880a ("gpio: regmap: Allow ngpio to be read from the property")

Not sure, before that commit the assumed configuration never worked.
But not objecting it, up to Bart.

...

>  	/* if not set, assume there is only one register */

^^^ Seems like the comment lacks of an adjustment.

>  	gpio->ngpio_per_reg = config->ngpio_per_reg;
>  	if (!gpio->ngpio_per_reg)
> -		gpio->ngpio_per_reg = config->ngpio;
> +		gpio->ngpio_per_reg = chip->ngpio;


-- 
With Best Regards,
Andy Shevchenko


