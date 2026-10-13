Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED381310779;
	Tue, 13 Oct 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875831; cv=none; b=BW4P7XdJGg7KKU+AXOEfBoOwz204OFpooAdglSa9MRFppYv8mPH8MzQQT9e6Ufs/SYH0Qpu8/KCGUuqGEROHqzHvuZ/P7PsTXH7dnpH5GRD02JHxJ+C/1xyZyd7Xk98bjIXapbakaxKTZ+ineoZzYUj/Yq2JgqMFS7xu+aeoidc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875831; c=relaxed/simple;
	bh=0vkrL/1hodeZwPoJVglGufgHkUiIIXcVT1wpQSz8cwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtwyoq9jgqLcggQYQxk5hdJYcAQ3/2emQhdAst7FloZxlhxh+a8d02SOYnwnL7fkazZEmXV4oT/qp7dhaYKU8HerW76tmfFmLYAdm69Zqu8QwH2gJ5ath0iVZGCk3GZ5wFyRqy8CiXR/k4mKFT/h5jhrYKznAi47qh6mZBzBABI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUz0SbmP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUz0SbmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791875830; x=1823411830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vkrL/1hodeZwPoJVglGufgHkUiIIXcVT1wpQSz8cwM=;
  b=KUz0SbmPiC9kgd/a2fQt8nobI0HOHBBJJWFYZ5sPbxN2JKJurNqpjqGd
   toNnRWsUQPHrSjj4VgcNmxWY7GpVV34v5tV8LxwQDHEvw3x/gV0GDBM/1
   hwXwFrGOBtpZM8DRb4bG2rB3FjC9IF8ASeD+3SahuUClMBBFr331z+ZEK
   13UBO83ZnblIH5hLgdKDc5NAi6NP4nnKpSs62FHRmpLkCBfxj0IYdDtnU
   Lnwjds0yqs9kCYbBsm+s34BMU9sr8vsmoZwFz3I7JSBDgQJZY2N7V3uxf
   0gdRNs+500jes9ai9ZoTuR5IFBHNLGMV8E7OWOj2YZIi+nLPLYvSfweZE
   Q==;
X-CSE-ConnectionGUID: Di91+rPXRbClVKu7o9Ks3Q==
X-CSE-MsgGUID: nWQCDW8LTcO7cUi0Qlbv6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="478296"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="478296"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:17:08 -0700
X-CSE-ConnectionGUID: GdnATPY8TAuo1jz6gqmAeQ==
X-CSE-MsgGUID: HOh7xbxPQ2aoeqKyANHw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1143052"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:17:04 -0700
Date: Tue, 13 Oct 2026 10:17:01 +0300
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
Subject: Re: [PATCH 7/7] gpio: pl061: add Ambarella register-layout variant
Message-ID: <as3a7UTe9YEyBAY3@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-7-5836bd438423@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-cv75-gpio-v1-7-5836bd438423@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 09, 2026 at 06:58:00PM +0800, Long Zhao via B4 Relay wrote:

> Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
> MASK and ENABLE. Probe unmasks the bank and enables the controller.
> IRQ type changes also clear the pending bit. This derivative does not
> need write-after-direction or system suspend save/restore.
> 
> Cache DAT (REGCACHE_FLAT_S, not volatile) so gpio_set() updates one
> bit from the output shadow instead of read-modify-writing the pin
> level across the bank.
> 
> Match the part with designer AMBA_VENDOR_AMBARELLA (JEP106 identity
> 0x68, bit 7 set) and part number 0x061.

Ick?! I thought I gave a tag for this. What's going on?

-- 
With Best Regards,
Andy Shevchenko


