Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948938A722;
	Mon, 18 May 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087769; cv=none; b=odGXS8O2u6dngNg0Kog9wKG4re69D0dl3q3KVxERkDVnoDK+TQemMqxJM08UXnHUAATOEnDXfqDP6qcwMjVsDWl74Y9VWQ/YopxcBZ6RRHqcDo1lwUdf4qetoe8kkzcvfcn4hnCRfNtIP9vZq/2SlgtxLmDBe5xI64mOjQxRcqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087769; c=relaxed/simple;
	bh=1g4fsvqLIGUVtq3UiIXJV5GaFrPnGsQ+QWiFv+dK57U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/azFrq+ak3R/hH/qGNjkE7KugjAb3ag+TF/Hm5XiEn5mjx66jZ6GEQmtAvhz3t2KDkE63xCv2y8Reb+08er6ObzxWRnwzaIumjXYZuTQQkPZWFq5e7AZbSwFRdPhWn8+tuL8GUitedcwilRILyHTG2dCKrB5tQyBzuxPI2RVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wi2HQ5oR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wi2HQ5oR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779087768; x=1810623768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1g4fsvqLIGUVtq3UiIXJV5GaFrPnGsQ+QWiFv+dK57U=;
  b=Wi2HQ5oR5IZHjfsSNXymO+AGyc9YEue6u4VTB7syw0q4tpopyVerxogg
   b2faK9YVPkbHZhXDVPT8Al6atXA6Ghu4aSmimx3VYGIkzgscoSA7Z0YE1
   M0gtmxCY0XvqiQoOBNCg4/naKID1mlaPb6mV9t2ZL9gJW51hjfC39HytU
   Br1SyJDBD1+bIFLS7khogFMMhB613mW70+G8qUhqgKmOfVB02bSvkfOBk
   wU4ydNm9bqMJ0acO3wPWJ0ign8FfBk8ZMuGZO3BbOEtW+FOAgpftutTGl
   6EVZmbYfDtrtWIRgdYgbj1g7WXOqYMKSB3u0XzR4S00JO0dw00X547C9v
   w==;
X-CSE-ConnectionGUID: DWowSdJBTN+BREz/HLivxA==
X-CSE-MsgGUID: uhUbi1OvSoCcfcG+SCmUNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79964710"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79964710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:02:47 -0700
X-CSE-ConnectionGUID: 7BtGSIfKSoiK2YrYyuOZ2Q==
X-CSE-MsgGUID: x+h7X87ZS5eTZga6SvvquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239595413"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:02:46 -0700
Date: Mon, 18 May 2026 10:02:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: andy@kernel.org, mika.westerberg@linux.intel.com, linusw@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: intel: move PWM base computation past
 feature check
Message-ID: <agq5k58CHGrbPJBn@ashevche-desk.local>
References: <20260517161530.1037-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517161530.1037-1-sozdayvek@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 17, 2026 at 09:15:30PM +0500, Stepan Ionichev wrote:
> Compute base inside intel_pinctrl_probe_pwm() only after the
> PINCTRL_FEATURE_PWM and CONFIG_PWM_LPSS checks have passed. Tidy
> up; no functional change.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


