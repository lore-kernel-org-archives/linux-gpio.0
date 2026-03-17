Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C23E5ED6;
	Tue, 17 Mar 2026 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761926; cv=none; b=LWdG0AzaCOVXFVGOuyVsMYnBEgtGzp2vtqbJeFApNcRU04yPzlp4LA7Xrx3spbvxKIlJzanL+j6jmjmVDcFT5/Db4axFwxurEvQWYtotJlY+invj8E01dStokJoijASHIt1hLEtON5COURchgWJNz4FECFFgo3wfRU/Yut8OPZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761926; c=relaxed/simple;
	bh=x1gSLvzKsw5RxCMGtUcdm7YX+5lOyd2zRpU8JHZgXO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMA7hwcPohFYrqX/q+6u6Gum8HVULKcfFuFMmvXybZt/t4CS3FOrlYUHGuW7wkvwrr5U0/p0Y/C6UtPbvIyWB5Zq6/lVP6Pxd1ssVyjBE6u6JhlFm7du/miOaTIl5j+kq9Fd+Yp0Z1ZHluhZeEnTMelxvSar7rP1d875SaYooGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZfnN39h; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZfnN39h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773761924; x=1805297924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x1gSLvzKsw5RxCMGtUcdm7YX+5lOyd2zRpU8JHZgXO4=;
  b=fZfnN39hQe6zJ8+qMNytu+eydVDhs/OlP+G1etI7bfIMi2vUlH9gtVTL
   uOrMfKxb/OCuhi7VQpSX4Mh4ChY+dWpEvuUnXYiPOxUREjf450EHl2N1I
   oPDaOPNwSVbSCmCzXWKYmUriUJfW+EQp9rng1Pj1aYU9LyxI0LYaiTAHj
   wnnxz4fUzW74aq6399qR58WFtz6bNK/dvWk32nU59vDQIh+4udJVvsXeC
   f6MtTBPCATRpD4cZj4pLecMxk9IQy9lUc3WMc+8PB1zG0PwOwiriB9KoK
   bGIpp24IGOEhscMnOwuw9EQ9DuFBdUkvxjNbK+wHUx/UKg9h98hg7pdE4
   Q==;
X-CSE-ConnectionGUID: hnUf30r7Qoq2rQJDLAcRxQ==
X-CSE-MsgGUID: XCzrHIv4TRSSRNjwXig7tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78651507"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78651507"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:38:44 -0700
X-CSE-ConnectionGUID: +Eu8r4TETdWrWgU4PeUEew==
X-CSE-MsgGUID: tDIkp/UlRNmQmrlTxCG9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226989411"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:38:40 -0700
Date: Tue, 17 Mar 2026 17:38:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <abl1fPQEDE38KZQN@ashevche-desk.local>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 17, 2026 at 05:40:27PM +0300, Dan Carpenter wrote:
> The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> reading or writing to the pin.  In SCMI, the parameter is represented by
> two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
> 
> Add a function to translate it to either INPUT or OUTPUT depending on
> whether it is called from a _get or _set() operation.

In three consecutive patches against the same file you have three (!) different
prefixes. Please, align with what is being used most in the driver and/or subsystem
(the driver seems has no consensus with itself, so subsystem then, something like
 "pinctrl: scmi: ").

-- 
With Best Regards,
Andy Shevchenko


