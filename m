Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698B3A2570;
	Wed, 25 Mar 2026 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441576; cv=none; b=H2owf7XtQKEm1Mmb1DFqjgdlCBTkc7zNo11AjlWKV3h4Y3j4i173St/y1J5nkcEzRb3uOXZFz69Ku7LmhwIemtzeyxmDVzPFgb+59Nxd7LPlQHkdKu7ZkqDeqJPX4HsxuxwPBn9QIUo8uW0JSTx0g2n8s921epIvxCMHWt1cx+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441576; c=relaxed/simple;
	bh=RpEWiiE12rucC0CNHShHHd3yv+pJPdJM0e102etHC9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTaD0q7/J87fqXfSCZuHjxvFRlLOfcdpaFT8+seY17UWj4K3+YkxsrZO+pxOkN7v7PinxLGysCOD14NTX04A77fi7hOqEdAOpWx/oPBqAnT7NxPXoGckdCEh2524md4KGjPgslUQiAbjTYamQUmpeDmpePTlaxVqPRuv+7Ww0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhfrYlmT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhfrYlmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441575; x=1805977575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RpEWiiE12rucC0CNHShHHd3yv+pJPdJM0e102etHC9w=;
  b=mhfrYlmTuzh7hh/uhfFhw8JElb2T+Is+MennEnhF+tTHTdDZ6wKifRLH
   TsK5AfwXTpj4wbdQSATvmJgAffoItPFQ+9eQrte+eh/jtKIQmqt/lv3C4
   YcSMTwWcRZ4Mgp76nzXTYwDsa2Wj7yXToJ+LvgWkzNbsecTDEayt6Cs4t
   zT9AFv9Dy11YW7TcOi+F1sZGW97KLzSq+jPB0p2psmI7bJrTORogfEo9+
   X2EDIrLUkZlVHDnNsByCUIGxGxnWxeuWkBVMvom0StsKx2AE2svdBzWkP
   mtTFb0JJta3NgXD17JPWfGC02NY8oQ6sld7MUMI2fRQdjKASGUYQVSevh
   Q==;
X-CSE-ConnectionGUID: XNaedTiHQgmfTL3VMWW5ag==
X-CSE-MsgGUID: CMoqL/aKQ9SQ3by/dGltXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75357540"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75357540"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:26:15 -0700
X-CSE-ConnectionGUID: cgsopyOgRbqAbD/nhOz9iw==
X-CSE-MsgGUID: ms7fFVb3TyKgtZJtTxtkpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220261673"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.32])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:26:12 -0700
Date: Wed, 25 Mar 2026 14:26:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpiolib: fix hogs with multiple lines
Message-ID: <acPUYlO4VUDNctBX@ashevche-desk.local>
References: <20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 25, 2026 at 11:18:32AM +0100, Bartosz Golaszewski wrote:
> After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
> supporting devicetree hog definitions with multiple lines like so:
> 
> 	hog {
> 		gpio-hog;
> 		gpios = <3 0>, <4 GPIO_ACTIVE_LOW>;
> 		output-high;
> 		line-name = "foo";
> 	};
> 
> Restore this functionality to fix reported regressions.

...

> +	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
> +	if ((ret && is_of_node(fwnode)) || (!ret && (argc % cells)))
>  		return -EINVAL;

Hmm... Shouldn't we return the proper error code in the first case?

	if (ret && is_of_node(fwnode))
		return ret;
	if (!ret && (argc % cells))
		return -EINVAL;

...

> +	u32 *gpios __free(kfree) = kcalloc(argc, sizeof(u32), GFP_KERNEL);

sizeof(*gpios)

> +	if (!gpios)
> +		return -ENOMEM;

-- 
With Best Regards,
Andy Shevchenko


