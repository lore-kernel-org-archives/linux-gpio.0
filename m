Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8DD2D877C;
	Mon, 16 Mar 2026 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673851; cv=none; b=lyKoxyNyaAezujU82dnu+L9Tf7GacNEOA4loDbZMz31/xDszi5S6NZP4iYYBl9knDfF42lQGGzboVqedEFZPq6U4Fom0DOQ7/zlEVXt1/P7VzpUpLV7o5noB/8iOVnurjQN4wYMkrpRC2BQ61xVmpJrgcRR1JG85jwsy8RvPJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673851; c=relaxed/simple;
	bh=+5C2U8ogHMsJxymPfjSPbPVaR9UYjL1KjiU0pAuzqBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovGYA60yowLv1bchAYbSidHzRphlxZ+TuOn+WLaaPROtvcULXqtnR3qVfnwxlNcVn1f6kIq8hZsale0eSNXSjzEZuUxqFXdoyZzhpe13x6/rYRGHoEjiYmea42lR8hnzLxLuHJlieHHoLharAuCJqm0MuFLk3j3zY8Q7/C5maso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XximhUMB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XximhUMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773673850; x=1805209850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+5C2U8ogHMsJxymPfjSPbPVaR9UYjL1KjiU0pAuzqBQ=;
  b=XximhUMB28A47qBg+6cL1F9A8wwMtt+e1LN5QjFDwGAOWmDIumE8P6uh
   GXUC0z2U6/nTcdi2AE2lHe0aECbNFBS7w/VVYfgDdq1bnEwboCqS36KTD
   dru1xPEtbUE9blkUHkqVIAmjbXmifzDZbIesgVqC+ee7QQbTDwIERvUzv
   E71UGWNtdFmeLPJqadsu5M+P3UBQORgoDHVc4znlhkOVp72O9gutaA5v5
   6IilN1D+CTW7nkLeK9enq8cczfET0Po6WTl4Y1Ecex9z2P9SFwe6/PPi2
   4Q2tvtC69CWYJD1cq9MRfi19u8SzYBTuDaD8nyOefflA4fegwZX4snU1j
   g==;
X-CSE-ConnectionGUID: KikPh7fVQP+qebbqnUVgwQ==
X-CSE-MsgGUID: l6LgdWO4TZ+njaRUaBhmCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85773432"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85773432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 08:10:49 -0700
X-CSE-ConnectionGUID: X/yjLJWgTSCxpd6Agnq38Q==
X-CSE-MsgGUID: bIlqfHEVTYe9eASF700d9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="220984183"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 08:10:47 -0700
Date: Mon, 16 Mar 2026 17:10:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/3] gpio: timberdale: remove platform data header
Message-ID: <abgddYpl8yfcFVVI@ashevche-desk.local>
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 16, 2026 at 10:30:47AM +0100, Bartosz Golaszewski wrote:
> There are several GPIO driver header scattered directly under
> include/linux/. I'd like to either remove them or move then under
> include/linux/gpio/. In case of gpio-timberdale, the platform data
> struct can be replaced with generic device properties. This series does
> that. It can go either though the MFD tree or GPIO with an Ack from Lee.

I understand that fixes for the 'irq' handling mess is not your patch scope,
but still consider it, please.

Anyways, this series is good on its own,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


