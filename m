Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118970;
	b=UTT4KY5j+6oIQVbhRLwsS1pOqRGMLQnDGhYBCuMTQM0UknkJqslN9+BfE+JRJV6Ug5vH
	 aRlW5J+bjeurQjWsxLaQcNyVfb5aWPVQqK8wYxjo2vzCMa1AaA8WvWCXD2+hBo9GU38Wj
	 DzZsAFRr8q1eJC7QP1uQ3ACB97xhSUKUe/GT72dhVRhM7cyd5MNxm71GWn+lAmzj1gMA+
	 h+M0UeDtEvtQ5iuyQwT06p7wQg5hNOMzyZfYhkZGkQl/sQJnJrSnVWNpHQC6RL4UqKMWh
	 8GFmrO0jGGMu88NT2uB9MlVCw+QzCTy6s3HTAhWrKUII2ko9YejPCloYDSUOGAhactA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118970;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=l+oxUfMJg5eV+CJD17FHu7pJx+SYawZ0ncZOWsVGuog=;
	b=P7Rj184flwD+6KkiomctFX7H6SgEeX18SF9vxe3mjEjVc9AzLb3h+ZjJLJRYSYZpbe2F
	 e3mILZ2mro4fkEb3QqyNbsPIJ5XUrF2pKHpbM25j3wrDaD3BEDx00FWV5/iT26zvNXb5p
	 LqTk1Z3cbW4YRyXty7DLT34qRJMQvVorPNM4A+8aEeHcr+8F2mxIODm3a8Cw1vd5G4yRc
	 9oglweHUHqlQ8T1WueWMGvjkUASiCtxukvL90jQXna0eR/IpBbYRxC2MExBC/utOw1XFy
	 sxiItlnMBpYCP7bsxy6xA2TEto3ANzrSpj+VZ6MBtO+fH81eytrSvo250a/XPiGOxjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E99MNzy8;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D586606A31E;
	Tue, 27 Oct 2026 16:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D586606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E99MNzy8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793118970; x=1824654970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0npx0Foow+/UEvoNo/yJRWIrCYEDXYV8oP9hRaaHqlQ=;
  b=E99MNzy8Sub3bjggOPOOel1xizdcvO/T1tx09KRQxqcBw9B31F+z/d2/
   rIRLJiOiUEXoY9lZR3KkMtxmyYzn69VChdebcjc1U1GRp6/R9bmAnJvpH
   1yZdqmlFwU/7KBPjepDVvuYLwQOXERgt4pY2YtZWvyYf0kmQJjtO5kUeJ
   L2lqm8DbfpiJUiabgz3l14fQgItZxNiYpgMYGzT4B0EUgNL9Jo3H0DTcP
   51hqZ7jI8qZWsKSvz+rz4+U+E6NPBDByDE8SGeWUhuG9b+k0T3zTldFXc
   7ktF+iyOJY9KKhNRm8AJB/Q31sXYsPRWsXXnCZzjeTeL+IIMQfdqhjKtV
   Q==;
X-CSE-ConnectionGUID: EAhnxudeSUaZdVd1SfRp1g==
X-CSE-MsgGUID: gezyGR83Q9abN5tvnpZjuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1701227"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1701227"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:36:09 -0700
X-CSE-ConnectionGUID: VoqCGL52RIG83ecyOWnq+g==
X-CSE-MsgGUID: WN7IMjxQSviqS3YmeY8qTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6461608"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:36:04 -0700
Date: Tue, 27 Oct 2026 18:36:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare
 'unsigned'
Message-ID: <auDS8cXSmKjW3sfJ@ashevche-desk.local>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
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
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 08:09:30PM +0800, Peng Fan (OSS) wrote:
> 
> The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
> Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


