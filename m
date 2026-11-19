Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086865;
	b=zpagA2sh96E9lN1jfP6qRBD8jvhTjllqtDfWUxQ8Ws8dDwV92rLGBIxu69bKI77wbwEZ
	 mMfchYsTas65+1S5Now75lL194y5mAN9TAyN9eok4w47Y9eoXHRdRgUVtoMgPcu4Gqf+k
	 VDWVk/O/SIyuP9H0j02LnbUJqaRBlDauQ0tVL+NxH8/xTC+YGBvfZy+OMrq4h2kQ+ATlE
	 BQfuwxAqNUaKfuj4yAH7JSAmHWK53EFgjg1E18gRq0Vtsq7PaYMa19sL67nBcghfL75LM
	 GnM1RMupJGdqaIUzA7vOgmChVb+WMnmwPT51ZoZwLIixwFQjycpxwmIUEEGGtty3YGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086865;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=jnnk/ykZ+RSuPxK2Wwi+zZ69danJVfQJwojOs3exmhQ=;
	b=XneUdS04anpIb865+OlAIECFN7OfTIJIu1Ir7kK2G1jVBGff+5350PlWvW99ZxIfVGIc
	 B+C51cm5X+TisnCwJLvVZv6pgfEncdgL+4pIQV9et3KhJcINDO/oD/fMTAg0Eqre+Ybxb
	 eFd/gMyua94eciXZ6b0zS9sdmZy2jzPW7cP2tXoHnal5azFDXjL6iDhtMBHCL84TK1Qv+
	 qaQ6oWR6ZfnP+gQIqEkJYcQLEpbMwc0u6iI64dlxKzHCNa/s32uZY6/galSQj9YKWosz6
	 fxTB07lukwrBGxEKfxLeSkWQCtQeAb4qVZPIbJH8dkIjL8N7yANaT/UCELtYm2We94g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QI0RSJ6c;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91A606A32A;
	Thu, 19 Nov 2026 11:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED91A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QI0RSJ6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795086865; x=1826622865;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=PSJ7r7wf32uEx42eoOe29mb4nFy2Cjlc4ss5UeQyRNg=;
  b=QI0RSJ6c5idWugTgj1wxFqby6MMLfI42vWc+jwVCEa5ULxE8OoZ7kEeR
   F2lgKerQt/4R2gC2ryFf7QX/HGkM7EF6TADUbBtMBODHKKLOdcRRyka09
   tYRw9zK4F65BRzzYZaOZISNeHuOEnosuJBPLM/90I2H3ub10eA0KBAwmG
   5jpN9I36aVDy0ArtWu16fu1z6CiAaXSSPQxP+bAInvfhMMm0NeZy274+2
   isrbrnGnAzkhFxNIrBLIjo9U8vf1dXTiG7BDbb82WJYgYJVx1BT9k4xYb
   /oGklcVLwM4PiU4IOJrhEYxsjqrGI3vd5+dsTHAca4TbIbwRr79qVpGvC
   w==;
X-CSE-ConnectionGUID: U8RKLzt4SxiZ+G7YZwWb+w==
X-CSE-MsgGUID: RlEmITZFTrSeRr5KMr4y5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3820734"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3820734"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:14:24 -0800
X-CSE-ConnectionGUID: 8bw1zAJSRjGSoqUD0fLnsw==
X-CSE-MsgGUID: zZns16PdSpOnEnkVq08fOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10294183"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2026 03:14:24 -0800
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 22C8594;
	Thu, 19 Nov 2026 12:14:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
In-Reply-To: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/3] pinctrl: intel: Export
 intel_gpio_add_pin_ranges() and use it
Message-Id: <179508686212.1224334.4036846643450556447.b4-ty@b4>
Date: Thu, 19 Nov 2026 12:14:22 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 17 Nov 2025 08:56:58 +0100, Andy Shevchenko wrote:
> Deduplicate more code with help of being exported intel_gpio_add_pin_ranges().
> 
> Andy Shevchenko (3):
>   pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it
>     shorter
>   pinctrl: intel: Export intel_gpio_add_pin_ranges()
>   pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()
> 
> [...]

Applied, thanks!

[1/3] pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it shorter
      commit: a618576d73adfcc66d7e5f8c295fd88df7e7072a
[2/3] pinctrl: intel: Export intel_gpio_add_pin_ranges()
      (no commit info)
[3/3] pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()
      (no commit info)

Best regards,
-- 
With Best Regards,
Andy Shevchenko




