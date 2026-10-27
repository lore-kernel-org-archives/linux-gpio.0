Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088538;
	b=mDH69JEizg8q35XbYJqDPfLAJ0AYqwnYp2D7lat96CcQau8vlnKKXfD6HooEqPlWkzkS
	 SntdrhGRceCrpo3YDzqd75ksKBb7Z/lZti4jEUUj1s3ygcc+3e49KdtBkYp2jVPkEPYtr
	 p18VJtVHV3zoXIMAIX6c1PrY3hGJwQ23Pi3o/73p5DZfO21/lJennUCP6Pq8dqs0aPVlF
	 Q+WROi5IpGvTj8u/5pqf2trLmHmYQEYX0Wy0Z83ITHDdD/1LwZ1x7Wyt+Mm7Rx8rD0O2F
	 +/uU2SA8CToP4tUJBVp1KpgWov+sQvZliXiaeyO2THKhlS1ql0zcJhIL2bGZ0hRclOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=tEFczFf5Eq9eoLVebiF+Xy46dzvCzgJ+AjU1Q2xK364=;
	b=ewuvt75KFkv+rAUJTWSnViHxkyEMUDJRJGKjeceFnMK1l+S0PCfWtqvhtxR78AkvuOJs
	 D/Q+xp44OtT1uXh2W5aYm0zmpMaO9aUmcdaYgVpKLva3GoQpyEHn0CA5eOgYX1UQdlW94
	 lzdDMCR3jT5N/XLh3GdReOmTLaRoFA5YRCiq5qenf6g+kZ58pcF6zn3obcExExUyZs2Kd
	 GZKe96UK+0TU18rtGWJe5MZSq+rqPzs2FF2p4Dpj7rAf54w6OVq2los4cYtdDEUhATwN7
	 B0altgnpHRgRJDDuko1EuanrM/2o+km1G88bcG+ikRnsfF38Y6ep9u9+EPWGG4l1KTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoXhgzgN;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D84606A31D;
	Tue, 27 Oct 2026 08:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D84606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoXhgzgN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793088538; x=1824624538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5ahp8tDajbHjTEoIWuhcG89PAb01bbuXm2wLZ7zPiY=;
  b=WoXhgzgNJ1YlOLZ/zZgWVLDZjJOT9WVAtm+KFdAO97xYmWFucdST/JU2
   9z9dXiDFEGL0p/V1BKBFxr61t0v6BS1sXEGGIUCKqDDv9K6pnaf9X2zM0
   pJ+8cIKQ0E2DAjjjiJ5U+L1gG0vJ2STsPvHb1sdCRgpD363i39Ul+2bD+
   tdyCvz9DExcUaks54LPBRRGZgepFrWKfIrwwobKUFGl3PHlXLLj9FWZh7
   wmN3XPjGUD11z8Sz168i0K8TCOt81gBrzqR7XePX4kNzgf40kF23l9iLj
   mOX2OFieM+rWyqyAbKjBbh8j1nhWC6vgU12rFEFDAaNYLZvU1XHH/VtaW
   A==;
X-CSE-ConnectionGUID: bAX55zAkTR+a0tztdKKNRw==
X-CSE-MsgGUID: T2CHzC82RomENgyGh8yOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1771535"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1771535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:08:57 -0700
X-CSE-ConnectionGUID: gJQX6AUQT/KVkyvB5grScw==
X-CSE-MsgGUID: 9Ynxc+BWS1KCgxL2VQVLXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4832386"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:08:54 -0700
Date: Tue, 27 Oct 2026 10:08:52 +0200
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
Subject: Re: [PATCH v12 11/11] gpio: pl061: tidy up IRQ trigger logging
Message-ID: <auBcFLT1D4AR62mV@ashevche-desk.local>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
 <20261027-cv75-gpio-v12-11-c22555400e18@ambarella.com>
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
In-Reply-To: <20261027-cv75-gpio-v12-11-c22555400e18@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:18:58PM +0800, Long Zhao via B4 Relay wrote:
> 
> Join the level-and-edge dev_err() into one string literal so a grep
> for "edge detection" finds it.

This is fine change.

> Use str_high_low() for the level debug line. str_rising_falling()
> is not in linux-next, so the edge debug line keeps its own text.

This should be a separate change and it requires to have str_raising_falling()
to be added to string_choices.h for the consistency's sake.

-- 
With Best Regards,
Andy Shevchenko


