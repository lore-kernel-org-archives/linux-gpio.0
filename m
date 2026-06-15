Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3945305692;
	Mon, 15 Jun 2026 04:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781498141; cv=none; b=QJDKpNaZqjV3iOxPZ69/SFSpaZbzA3U+zMCUJ6iltgfPPdLdl3Q08dVu9HVmEJpf7fIXVQWCHOKqZhfOOIxJJ94rxqhneDPCI5UPNGhCnOAuINQg0Hwj3bp17D0buKnAnRuMX9zbFfkTrEcYHQwEpGDt5z26EEGt0s+YoEZb1FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781498141; c=relaxed/simple;
	bh=yfRH7RprFbObRlNDYkLQ2uHKQDVz+sEkfWGjmv6Ens4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEjkWF5VkHnTkX0589xAT3l/knFNmI3ujRsUtIIv4sQbNB9GB1sHuFATpEcB+fDe+02QJa/FNDi2KiDxnAstI2PEwqSRttUmXURtEdHN96FgScWw6yffqSPP1nztvlfSc3CZzGRkQyQ2jhQ2J0Uj8hcasYTUpkAYD2gjf3lyKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6GVPNzL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6GVPNzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781498140; x=1813034140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yfRH7RprFbObRlNDYkLQ2uHKQDVz+sEkfWGjmv6Ens4=;
  b=B6GVPNzLK41Hdu/NQjPO49iAnrP6j018Y7P6FaC4o4kQsqxbOt5HZ45G
   OT79E7Olg3ncY2NzkuxJIro7z2S9BSjZAc9KwbEuV/h6q4MSgk1l2pfY/
   ki64XL4k1if+NI5G/EbYwPr+ykp2m1ykcTmnJ4xS7DaFSGhMZrkFD7cqc
   pcGX9PJAS7CsqJ7nmeenQWs8iMlXj5OsC2MdhoOQSnqj27j4rmCzajCdU
   AMltnKxNbatcj73khCfM38kdTdq+dwrhkf1vTf6i/n5nSBlpgAro8dpiG
   9ZYVEmlPuMgUCffx/raYFP2dGFwVl0ZvAIp2IDIvBOyiuqMiEx9fOcMiM
   g==;
X-CSE-ConnectionGUID: 5UhjSNDISle6Uz999tUDkA==
X-CSE-MsgGUID: PqovoLOAT86tVa2KywLxNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82294980"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82294980"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 21:35:39 -0700
X-CSE-ConnectionGUID: uXblxUB2RIWqSYeRtaH7lg==
X-CSE-MsgGUID: naHHem3kQ36Sh29TPMRgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="242996470"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2026 21:35:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1137E95; Mon, 15 Jun 2026 06:35:36 +0200 (CEST)
Date: Mon, 15 Jun 2026 06:35:36 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <20260615043536.GZ2990@black.igk.intel.com>
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>

Hi,

On Fri, Jun 12, 2026 at 06:13:31PM +0800, GaryWang wrote:
> Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.
> 
> The pinctrl-upboard is provide additional driving power & pin mux function
>  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
>  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> 
> Signed-off-by: GaryWang <is0124@gmail.com>
> ---
> Changes in v2:
> - Add brief introduction pinctrl-upboard architecture in cover content. 
> - Add more detail explaining for pinctrl-tigerlake commit message.
> - Link to v1: https://lore.kernel.org/r/20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com
> 
> ---
> GaryWang (2):
>       pinctrl: tigerlake: add some pin groups and functions for INTC1055
>       pinctrl: upboard: add device id INTC1055 based UP boards support

Both,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
