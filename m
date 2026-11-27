Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805288;
	b=Sq4YveM9Zgt7a6AEpvTrWHbgebSVKK2+U5CPVTM2Z7NN+P0hMcHgGf6DrWK0D3Bxdapv
	 O/5pPUHNBd/0Vr5oaec7tkE414Cfk+hzeWUbwNXSPo2GI+hALV9cEJjSra43V9Pc9U0lB
	 IDn1l7BYpP5SWhQnSWeo5P0JWz8GA4ZMF99hSxGkU/mvKoSDuXKhmMzl80OaoiPscwapd
	 jsKyDs3NR3YRHTeh8tQlxjPwvXdbetOLsYtgVTev8BXtCanb4gzr5v/dwBcItYTdEiSgs
	 cTjPjhZy9y7zcwlHLEc7ZCWIPuehIGdF2UtDSAnjswZdRY8o0brsYYYMQrZnlHxuSkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805288;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Fp1sHHE8iensX+W04GwS2LW1iq02KpUrNL8xdDO6Vq8=;
	b=OmskVieI+4pznzX4FQyet6y8g8FXbNg1Be8KNjIvBZaqVuUawlvgc0AFgyMyMhhdesiX
	 PaAe8OoidprPL3N/A80fBvpngF5QWLqkFL1QUGOj47VEzRQuaG48rRyOOTlx+cIKlmVNB
	 oQmKaSKoXVU1USNUI7i6ndoYJQf/FBV818je9FYjoKgeh4On7BZyA4MsOaqZl67fQm1uj
	 1qvqFS5TAW3gmI9X3JsZXbmY/XcM7DCZ4ohczraLKN5Ek+LPMUeVSqXRvndYPe1pQELtn
	 maFc3Ura64G/DgqzfirwmgmVF+Yt22FzT7plQA271lernebj59dyynltmhkKr+R+mvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EmOl1sTF;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4395F606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 18:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4395F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EmOl1sTF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795805289; x=1827341289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D0w9BNt9qEC8lOg2vB9ybt46qq5voBtFztIYXjCX1Ew=;
  b=EmOl1sTFbxqBBQDFfbKFj0c4tJeW2/jZnC0ivkLy2CBYGxtmYjVAh8ri
   fLexlV48YfLRgNAjkbKAX+aaOxcbWLTpL+H4VkN+cUPgqi9ToT9fJTj+7
   GWHbBk3etSlqGzA878C1FwhXf5HNykFYKb9d7F2oibCGmfBOT/stw6m5G
   ZNUrHWgvfld9bzhmNt/jECc0mCbhdIgqX80VE8Lrryk/rqvUc6BGi5nkv
   lXKKwxbeMhkZwEd0pF0TXC4DGeNjKZRDSYTL5VqycpeyOfnoqq7YSM2zt
   bUGsAiqS4GUua7Pk/KgMZsWCO8k42NHsPgvPOP3JVUbQjaA3ghoZ8Mw8/
   A==;
X-CSE-ConnectionGUID: 2fhooRkWST+v2qQ2lnLYMA==
X-CSE-MsgGUID: VDJay+iURgOqbnXsX4LYiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4733146"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4733146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:48:08 -0800
X-CSE-ConnectionGUID: KPdO2dfRSViq8TznPb/Row==
X-CSE-MsgGUID: 95pHJ8OVRcGrGGvV0AKTLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12770637"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:48:04 -0800
Date: Fri, 27 Nov 2026 20:48:02 +0200
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH v2 07/14] gpio: max7360: create the regmap-irq chip
 from the gpio-regmap callback
Message-ID: <awnQYsv3oAHWr2ht@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-8-mwalle@kernel.org>
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
In-Reply-To: <20261127145232.814492-8-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 03:52:24PM +0100, Michael Walle wrote:
> Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
> domain.

Okay, but now it makes me think why we don't call regmap_del_irq_chip()...
Missing part?

-- 
With Best Regards,
Andy Shevchenko


