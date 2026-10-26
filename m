Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042341;
	b=cfPy8Mm7AVY9v6gFFO6YZ/YRrlUmeJ0C+IkG+HIntF/PhgiQNgNaOLdKDJutyeJjw3DM
	 49LmVF/hxEO93B90xJHC0gsAnJpWhP8iVZbQRWsnHnnL1hNqy+hEf7XjYMm3vILjajrE3
	 +guQDBHHJHIqPWjgHGCv8vteNnwfjmmIixzhUtlCE0cIDbHGGxa61EEynv9XCCZFBgcJ/
	 M3f8/To7MKDsDB7ZXoIQ4VDj5HAdKr2heGpCDo3/7+RbfuL7RLr4DNV0qPUnYZT37oQ8y
	 MEOSnJtxsn1g4zT0H/LrdJO/A+FV2v1CWB5qbQn5vGUQfQbjaZJ7jNddVSDL1XeGfOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042341;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=tZvfI3wzfnYx/bXkTP/Q8P9KO9tci6mG+Gu1KKw4J6M=;
	b=mH4QYiU8GnuLHmSR5+8qyeleti8rEkHdiXwYv1DhPg8Gd16ur7pZZG2L1ZiMol3ThJIk
	 K41pPvSpt7Vlbi2tI8LdqvJVxHDjmBoevZP9bkTcSvde9wOw0EBqquxhydb85CpHVs4QG
	 3aXLlJzp71C7hdXxKXtlTzHwE8piuN3c25xpUiXPYzfH51Fkn5krSGAz9zAFD+vfooxo5
	 bjvkXBHoG591JnBOruXnb4qSBRy7wTJtq55xbS6rl5a02sKLSHhbBhh4L2XuSQVJtkNjV
	 0AfF0fRehgO/IFzAI7uKwr/mL3opl3QqvgJ7+ydJ3XXhYD0GJEs0ygU4X62e8dfyqVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=er2AVjq1;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DEB606A31D;
	Mon, 26 Oct 2026 19:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=er2AVjq1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793042340; x=1824578340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XVT3BxzTOBSFPzcS2ZkxgzCA5ztZ8ujHlOCaBWMDfFY=;
  b=er2AVjq1m+FxWWiU83Tl5tpKTagAGt/7LKCmFKRFLc9wgT17TW8cg3BL
   1QtFm7bt8XgYlTomnNBhXiem7Mo4d6s2ZT3zRGmU+VzrgrQTPTd2lO4nJ
   HG8lS5sx7T0gwidOfhPqHn2TK9ruVawJCiYwQ6fojhae50p8dL0KBQLjK
   ZK3GAo2NNxQ4pyQto6t+ntXYXpzZzg6vtKfWcks117VLMOXljeS0IbuMI
   eYwG7lBtk8uZwK8B1kJaCBuRYaD0vlN0eP0xmkIN2OspuziXACjhBmwpK
   c+qPu3oUrUJC3e1BnDwbdOVijvkwkCrIcThod3WVOJvDR+fX55RoYMQ/A
   A==;
X-CSE-ConnectionGUID: Bn1jCudlR+yhxHxm8EIYMg==
X-CSE-MsgGUID: v5D6tLMYThuPXT053jL86A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1601219"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1601219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 12:18:59 -0700
X-CSE-ConnectionGUID: Ihw29R31QaS6vQl3kmds2w==
X-CSE-MsgGUID: ohxDCuAlSUSWgsB5HXu6Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4427521"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 12:18:57 -0700
Date: Mon, 26 Oct 2026 21:18:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/22] gpio: sodaville: Add missing PCI module
 annotations
Message-ID: <at-nnxOqJpKQH8Gz@ashevche-desk.local>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <5c0a0be0cc9af836f43e6ec97d9bd0616e0f1cd1.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c0a0be0cc9af836f43e6ec97d9bd0616e0f1cd1.1793030820.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 05:28:19PM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> A driver module matching devices using a PCI device id table is
> supposed to declare that in the module's metadata. Add this information
> to the sodaville driver.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


