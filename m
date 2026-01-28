Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9A1352C37;
	Wed, 28 Jan 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606354; cv=none; b=JrRG+lRMdcK/95d5N6t27GmsrSY83uIX1FKa1xHSRayuj+2jB87oSF0kbDQgPp4zUatJvumLLw6+3VC6zhPYQiGEY1Fq4fIG5a7yXJYQjcnvG4W0hMUR4CMErZJlkalza4PpWTtYIJzQWRnnODrr2iq8Tul29OnNKvcruFeLZp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606354; c=relaxed/simple;
	bh=YDNRgL+sBt24j/CT0U4jzOKhxtdAi54k+E83OQheKlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in48tjy+KYFVShmeD31bkK3vEx8G417tGQ3yr5X6aNwssjCUKxUuCiB+XvH9ilTZTCm/0GMzo+co5ufJg3rN35QClRmwW8VYaFddUp0U6SR1kYhyj8c7xkbbJseEXlsb+ttw4a8kMjOi+HY6yJIFsEb3Yun2Bam0zOfE1UrOLjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pt7cJ/m3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pt7cJ/m3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606353; x=1801142353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDNRgL+sBt24j/CT0U4jzOKhxtdAi54k+E83OQheKlk=;
  b=Pt7cJ/m35C1gUOZZ+39ORyAOYhJQtLtocr/E9GRSLWJlqXrXbx/hBUyT
   fp3byBnSnAsFXvmys5aMdqHFJpmz7xtaarqZ7CYo5YxjJG0GXoL4lmZYb
   LfcdjU5ce/uwXqGLcw7Q3IVBzdpfv6CbyioRudEmawt25zY1bAczPFhfn
   uSTt0yK/2KULlZZsP5I0mHpgSRMYll3qC6FPrM8+gezCINvFKOLbSkaTG
   29SRUK6tBGj8ROVujRIF57PR6KjBPsii+Jhuh4sfUCpDAOUBF4RZlLzXb
   D/qkncLWzqrx3yBiMaqfzY0uqUnzdRqGWvxwPfSJrbiTd5xSaQXQgFBRS
   Q==;
X-CSE-ConnectionGUID: OgGW7leyRvGshYmJCMUsNw==
X-CSE-MsgGUID: mOU4+tdTSwqxbMd9CITRLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82183953"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82183953"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:19:12 -0800
X-CSE-ConnectionGUID: dFxyYBHEQDi1KAx6xVTNfg==
X-CSE-MsgGUID: Ybfs5OqiSeaxDEjNg4WD4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208280001"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 05:19:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B860398; Wed, 28 Jan 2026 14:19:09 +0100 (CET)
Date: Wed, 28 Jan 2026 14:19:09 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: lynxpoint: Remove duplicate error
 messages
Message-ID: <20260128131909.GO2275908@black.igk.intel.com>
References: <20260128124635.40980-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128124635.40980-1-andriy.shevchenko@linux.intel.com>

On Wed, Jan 28, 2026 at 01:46:35PM +0100, Andy Shevchenko wrote:
> The pin control core is covered to report any error via message.
> Since that it's not needed in the callers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
