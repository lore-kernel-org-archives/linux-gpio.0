Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098260;
	b=FswAzJ4izP8ckAPGlAIJWIQnTCtSnz418/6OcHCtfITw45MAFpzYrpwiKuhPEEA7j/Ai
	 ptx+q5JsVSnN8x/5PieiLPMbalu6AyKGEmf3LEbbxH79QFN2aUWKTX4vbJbDCAXKmXlo5
	 JU2M7KtecurpC/1wCzCM0b5c4rMp47MKjPnEw7Qghaf5/i2O5PIK0yds82CXhIiyuUBsU
	 UiPmDNOjAOUqqIArfFbrI6WpUYTySjko3Mj3JZ7E+vRATFz557/ak6hFRclssYDb3KUqx
	 WHHhXvFIZkcf1czJ6llmlljBP3iRlQ7ELC8j/M1NVFVYlbzcZytoRKFbprvRKcofk2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098260;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=iXwCpHgCtD+mL+jAAnxmm63sYXCWuHM0daWYuNJz/gw=;
	b=k4W54EZdwV9kD9P9tbTOKp8oudsWt66nifi2TfbsNmUHgT3fo2magWw3cpQz0/3K0cOD
	 JOQXIra8Xy1LaGDZL1cjI9JzNiAjO/Dcz9UTU2Myg5w87LJWfgxR7m9gX3DZYAC9Ms8qo
	 +D1YXH/8DHm6WK51slN4eRF4/CcTUj4fCw/gQJXEt5VIINtQg/lzCNpAPmh5Ie0875oL6
	 Cb2klb0lcvjyLB1HIAsx2R3kbKHp8BAthWGuaQER1xbRyO3JtphDnVUchhrPYbThfgm3/
	 OReK1uXFvp0XRBJNUoDfcW0Iovfn2nqk1XZpEKofcFhBchEE+3krH3XBSGyF3B7EkhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lsH1KVsq;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C08606C26A;
	Tue, 27 Oct 2026 10:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C08606C26A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lsH1KVsq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793098260; x=1824634260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d3FNV/vonboNOKnOS+u1QVjkWcvOuNKNT3TAowUMjxY=;
  b=lsH1KVsq+bcERtEPXI7ByiaHZgpfIiRpkM14Qux3DOrfaXgA+1DhtdO1
   bXOc1t2APzxshK4N6C9V8gxbRaQo42Vs74BXIxmLdSDXfCnPzJnyuZvTd
   3B8LqSJi5CYxY/FTlryJgi2zBR6Q5AP5nOhsD08A1Sayheu/GNSis2nJv
   y5HtMb/pG19oYmw9LckkdliXzIHmshsMnxpTQ9nObCUqxwuayBElsKMmL
   u/d9Wru1Zjb41IBaArDfVvst6wsODqDdtPo/0tf0IlUACsYKdwNA4A+Jw
   l8WEZAi75BGMDHQUo8aZGrYaPzKpT9UmlfrAzB5y/U5HKG7Qv+pD/NmEn
   g==;
X-CSE-ConnectionGUID: fmKumOm+SteCL/1MdS7nrw==
X-CSE-MsgGUID: H+Y3lXn6QxasXw+l4qKuBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1703607"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1703607"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:50:59 -0700
X-CSE-ConnectionGUID: 1/e5ZU2wRbKZUmry3qp3oQ==
X-CSE-MsgGUID: d2sK+CFTQeaNW0FkfX64yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4919378"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:50:56 -0700
Date: Tue, 27 Oct 2026 12:50:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v12 09/11] gpio: pl061: switch data path to
 gpio-regmap
Message-ID: <auCCDWsCrmDtBdVd@ashevche-desk.local>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
 <20261027-cv75-gpio-v12-9-c22555400e18@ambarella.com>
 <auBbdz_fBiKr1tJb@ashevche-desk.local>
 <68410604.9376.1a17ceac8d5.Coremail.zl020895@163.com>
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
In-Reply-To: <68410604.9376.1a17ceac8d5.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 06:32:04PM +0800, zl020895 wrote:
> At 2026-10-27 16:06:15, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com> wrote:
> >On Tue, Oct 27, 2026 at 12:18:56PM +0800, Long Zhao via B4 Relay wrote:

...

> >> +	if (irq) {
> >> +		irq_set_chained_handler_and_data(irq, pl061_irq_handler, pl061);
> >
> >> +		pl061->irq_handler_installed = true;
> >
> >Can't we remove the chained handler unconditionally?
> >
> >> +	}

> On the chained-handler teardown: pl061_remove_irq() is registered
> before devm_gpio_regmap_register(), so on unbind it runs after
> gpiochip_remove(). gpiochip_free_remaining_irqs() therefore still
> sees the irq domain and its mappings; the action then disposes
> them. The chained handler is installed only after
> devm_gpio_regmap_register() succeeds. If that call fails, the
> action still runs although no handler was installed, which is
> why irq_handler_installed exists.
> 
> Options for v13:
> A) Keep irq_handler_installed and document this ordering.
> B) Split into two devm actions. The early one, still registered
>    before the gpiochip, only calls irq_dispose_mapping(), so
>    unbind order is unchanged. A second action, registered right
>    after irq_set_chained_handler_and_data(), clears the handler
>    unconditionally, and the flag goes away.
> 
> Do you prefer A or B?

Option B seems plausible.

-- 
With Best Regards,
Andy Shevchenko


