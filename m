Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086939;
	b=dhl8siROhXhDmY1C5jJXOU0xBNh4Wfi8uApDJUp69/LE6gpTmkGjKxarTDP59eT9l8uE
	 H+n6cxP39k6ZBXKRDptwvZoKLes74Fm8bU/VpE9UyMM/zB5aBPfywUEccsRBYsgJSA1W8
	 lcIJvF6IyNc0/ZjvIW8XUSGrKbIihR76KacqfQu7YlUcFfy0PNPW7qcAAaxI5IaOC4qvD
	 XPlMDUNfGkX990StNkto2z3FmB1LeoDunh7cE7ZJx0s66ODIYz8pUv27k7POqsydmijYc
	 6eSl3F6J6pgqrbCuL8ehXHQIF32L+/NzSkGIRkvzO0IwBZ+OUHFwb64QtWzy9WlwXfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086939;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=j2jvnq5LBuUdBxcMULF2dTy1RDa5fZBuXG3BJydri2s=;
	b=b3T+iDIJ+bCz4Gg+ASk2gfGhGM2WzOSKr0OQaagLojoVanHWHE4KlnTaUqsF/OPNRj27
	 zgF6F0XiTCe0yjvoBTvPBC2a8+OCg+465UWI8h/NNA3IlK+jGN0FetWXZWZxVq8b1Ns9Q
	 bCNQw2J6N2lEyb5pAy3xBb+qiW36A9qJH2fzvasVWxeLXRF1R5QWbWNneCBgB/Ht7x2J+
	 bI9aPE1eDZ3xWE5xj7k9AJ9UCg8wI4cBdmNx0Acif9w6JPKL9BsHpILxVU4fhx23oj+ah
	 Ir90Fjzxh6ihLMuu0v6nMKBCcvFFVE2GezKuDX/gd4vkVDI/yp2h29u0wVhwwLbp85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="G4KV7/h3";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA40606A32A;
	Tue, 27 Oct 2026 07:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA40606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G4KV7/h3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793086939; x=1824622939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pn1XPwnW5qbEYdycg//2X2b1luLlW5dMRLslulayEAA=;
  b=G4KV7/h3kMq2aAuLu6MH1ngL8Fs5ZwTV9C4YlT1a5jH5EmX5vMrGhehy
   T4SoNRc+9aF908YahibGAXQdCOE4RXqqgZja6p0elMgfmMsiIFNs2SKt5
   cNCbBcKRQYj2BVhQ75NLKktbuqYJgven6hUyIL6XvlBq0WyFpNcWLtOuq
   ZylBLT0mAJSDER9+m/ZblO68RcjPym4sha0ejb4bDBeNtR7dC06unBgea
   PqGFFSAmB0JEstASyjgiJp+/zcllVqwpKkZ9dwtBez4hZ0QoKod7X7kNF
   OHxv70gnEa/QIiYjkZVFGVIjfvXt1zA4D6scSGEXXBpu+HKX1mgaW+XzZ
   Q==;
X-CSE-ConnectionGUID: DpQfXUKYThieRUtQA4UKMg==
X-CSE-MsgGUID: U0QKeUjASVeY/p/XPGTQSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1676337"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1676337"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:42:16 -0700
X-CSE-ConnectionGUID: omhmNodsSJSg1YXWO+XiOA==
X-CSE-MsgGUID: yI5dg7QyTh+i/8rkkHOfcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6354734"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:42:13 -0700
Date: Tue, 27 Oct 2026 09:42:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 07/11] gpio: pl061: keep the parent device in a local
Message-ID: <auBV0591Hjnl5i60@ashevche-desk.local>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
 <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
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
In-Reply-To: <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:18:54PM +0800, Long Zhao via B4 Relay wrote:

> IRQ logging uses gc->parent. Keep that device in a local so the
> gpio-regmap switch can change where it comes from without rewriting
> every log line.

...

> -		dev_warn(gc->parent, "no trigger selected for line %d\n",
> +		dev_warn(parent, "no trigger selected for line %d\n",
>  			 offset);

Make it a single line now.

		dev_warn(parent, "no trigger selected for line %d\n", offset);

-- 
With Best Regards,
Andy Shevchenko


