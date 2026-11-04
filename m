Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793981;
	b=SwEpChFWx9ciUPsX2+Wv61utRHM+DblTyLYm3boYqyLhY+i0VjkrUtsM0YFEzurT1vlp
	 jCr39XDY/U8KUhNNxxfdbdA5frZfTKjGMbx38AnOuPb7v2VUKoHlNrQUQO6C2Cn5NipGH
	 sU1CODkOfDA5W11onXbfmkKio4RekBrpaMyXd+LZ2tQQLkGt6Se+M6NY0NhOWZbPOFbEc
	 OBfgzm6+/ZNQnL5fisaLX8LvSwEx7UW4acqM4jf6fy+QANzaRgdsgSrJwYJ2C7nNNH0MF
	 iaob83cDFkNBV5hFM6pt9Wb3Mjzz4y60OK6pU0P/Vh9UjnF9o/ZxRM0PGw7K0UmwH/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793981;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=6Wg4h+26zD0H8SBSjDw8CYq4C5f5wU3THckb5NL78g8=;
	b=bOvdDoPIjj4yqgMNYGfAv/JEjthwcmYYG5Zyfw6uVqaoCkyVglvFOHsI1QMbonWCiqcu
	 OnlySR0ULSQPpmtARCJx6o1/7mzoVqaDjSK+Sx54XzbGHnGxnKXPPhtVzyrkieBiBdCET
	 84b/RC98xkzPvWFnzLUjWWDigi6Aug/RbKLpXFuQ08MW2r2ZgfkcuPeSCklRbO3cs/N/y
	 EyidnZV3wSw8sCA1v4JGWgle1h1Ig316HaTR6qy8zl5vYYbZChASyNk/XwEu3jKmCvwZc
	 GUaR9BWW2V6pF8h7XO80yYEHz+do3fVMlTkGbHATbA7aVHj+8oOOpYgRqqn/yUjwHbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kX53e90h;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0541606A326;
	Wed,  4 Nov 2026 12:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0541606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kX53e90h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793793981; x=1825329981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=48Lx4R/i6FRbzzi3byh+waVhNkw25E/trE4ShApiQkE=;
  b=kX53e90hG45Dep/7+CFCLLlk3ji25W/cHNMqrvBiR8bXm4ChMEnhOEsY
   plWG3S/oeYSnxgOm8isflWk6gL2shIlGfTGxE7VvuFCdoZhrPOfZxQMlL
   aGCppY2vL5VPF7htjXs2mYB6FKuOxum30ZTFkpkEdrAWOKmsLitX+bRgE
   bgOLD1gWSnKnBZr2931N992ggZZMlHdNJivzm2XPLenWdM8SKv/PK+rJt
   1lZO2x4IEcNWGNsg140w3ox2iFdx7uh2WpQQlXWmPVcUa111oWkPB0Kkf
   5OixtPMY9lSi/nu1maU0xJ4NcIudahCg75BM6ww8EgGYE4EwOPEeVTsQh
   Q==;
X-CSE-ConnectionGUID: XsILSY29Rg+t1COLeDylcg==
X-CSE-MsgGUID: 3gRMqXRZQCC0ojr4ZTbdNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2423582"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2423582"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:06:07 -0800
X-CSE-ConnectionGUID: JjTkiGi/TBmRJ9kmfKH6zw==
X-CSE-MsgGUID: AQYBO+4fSaqP8r7YAOE0ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6528902"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:06:04 -0800
Date: Wed, 4 Nov 2026 14:06:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] gpiolib: fix GPIO descriptor leak in
 gpiod_get_array()
Message-ID: <ausfql_F6N2tWRAl@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-1-ea46767c9cf8@gmail.com>
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
In-Reply-To: <20261103-b4-gpiolib-free-v2-1-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:29PM -0800, Dmitry Torokhov wrote:
> In gpiod_get_array(), descs->ndescs is used as the loop induction
> variable and is only incremented at the end of each iteration. When
> krealloc() fails on the first iteration (when index is 0), descs->desc[0]
> has already been acquired via gpiod_get_index(), but descs->ndescs is
> still 0. Consequently, gpiod_put_array() frees descs without releasing
> descs->desc[0], leaking the descriptor.
> 
> Fix this by using a dedicated loop induction variable and incrementing
> descs->ndescs immediately upon storing the retrieved descriptor.
> Additionally, since the fast-path array_info setup only executes for
> the first element (index 0), simplify the bitmap_set() calls to start at
> bit 0 for count bits instead of calculating offsets from the loop index.

...

> -	int count, bitmap_size;
> +	int i, count, bitmap_size;

Why not define it inside the for-loop?

...

> -	for (descs->ndescs = 0; descs->ndescs < count; descs->ndescs++) {
> -		desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
> +	for (i = 0; i < count; i++) {

	for (int i = 0; i < count; i++) {

-- 
With Best Regards,
Andy Shevchenko


