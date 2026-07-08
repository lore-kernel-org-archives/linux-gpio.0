Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481B270540;
	Wed,  8 Jul 2026 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520966; cv=none; b=pTvoLjiPLNSG4leGZTpz4jFHTnSLwCPoH4J5FPUDXlC7Qg6lvy+bluQPoFWN8vBEMBFCUpMqjbFqgcW+G7xtrYRbArgCfMaI9x24q4y4VjlybC4cPjrUuiMk51LERGOOZ/X3tJK5vZ+b5ayOz/KliS7KRFwTfFVNSCgibIrGy3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520966; c=relaxed/simple;
	bh=yvw4UDcFUv2r/PQIk+GB0UyhBsSzQWC9zNcIj3gv740=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjN4PoWWSFJEFcH+U3ZM1T14RsEbIAR0ZamH8iICjTJfbXEe8js1E+5JUnRjsFKjgveE7N8Yfv5vduJfAOLebnCvzqAg3nq+JOaEQcKbvq+BGsLi2wif4AXeXwhonIPS0Bwo//CJDH9cj+B2jDwhbI+a4Esv8M3a1YkcugsGOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnOAxZ8P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnOAxZ8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783520964; x=1815056964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvw4UDcFUv2r/PQIk+GB0UyhBsSzQWC9zNcIj3gv740=;
  b=ZnOAxZ8PUaCMWOeCxBI0U6iGcxyetF5LI0P7/WdDSHM6EPHgGT2QS0I0
   VGRv901/Ncr2MYw9dBNqLaWXRg14pWGxxdsfJIqqdQBYvEpuVeWmPboSj
   uB66HbEhrrJP8sf7ehtne+0n5VRr3sDieQJbqqwh23IxQLH3PQQJWT1SL
   npY4BOVWIT8RVrungbbtNnDLvA3LOs7fSDLju8V1uYLmYAZ0dxw2uBWUI
   Y54fUjZFbUrlzdB/sWGM/3RQyFbTE/oXyafepiSF1xKVWLbpI0c1NknAW
   +zxC+CRLOfPtefdC7jCnqrunelP4fJ8pzfLtxgAbmEMOcQF9nSwThh/kU
   A==;
X-CSE-ConnectionGUID: Ch7z1eU3Q6OgG/ptxAtfsg==
X-CSE-MsgGUID: xHrh9kTDTdSR8itAgiz5dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94536726"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94536726"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 07:29:24 -0700
X-CSE-ConnectionGUID: ngS+yST5Tbu1PwGwML5A5Q==
X-CSE-MsgGUID: iYHiqrFBSyOK0o4FptSKdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253218811"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 07:29:22 -0700
Date: Wed, 8 Jul 2026 17:29:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Gary Wang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <ak5evtAHnMrwVqvM@ashevche-desk.local>
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 06:36:33PM +0800, Gary Wang wrote:
> Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> Add support "UP Xtreme i12" board.
> 
> The pinctrl-upboard is provide additional driving power & pin mux function
> through native SOC pins->FPGA/CPLD->hat pins for flexable board level
> applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


