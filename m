Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D593FC5A7;
	Tue, 14 Jul 2026 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017548; cv=none; b=ohoA4ae1o4E4DcQY8XQK87Jhe3TicJREwxycPIEhhAMn5q3eO0GDZ1oGSQLjtEiijri3u4nmyJp48xvx2VfoLhEbKPHoY57BwbOPdV/93V/LUT30rVggt617yd0K16exoBxGYOE2723KWegKxOYJamUya5LjKyqYMBuUM3NBuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017548; c=relaxed/simple;
	bh=bohSTv4Hd4p8Aj4YJb0k5hN+JbvNu7/TNktJf/auPCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjalIjmIqXNk5F5+fsCFG5qUJx9mVAwd4Uv1b7ZssiQPnKxBQR1y5PVl4R35XSM5Ep+slM969jwQvEJAkuNatEko+7sZsArkagRHKgZR/2rZX8+cD/onkBKWHIHfxq3tQftisuL3c24OPCYSzclqgUr3LVt4A/9EXdm0PL8+zGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZDGOI/t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZDGOI/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784017542; x=1815553542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bohSTv4Hd4p8Aj4YJb0k5hN+JbvNu7/TNktJf/auPCQ=;
  b=HZDGOI/tKGk72vBSdll37Rn/BP5PassItE6nBTQ4chFaVckyHtdHfDdV
   pUA4zTEA4gvAfjxxJxZPTL4J13nuTztw8T417rZBmWimFSyMRMrCNx60y
   0TQHbATFg9vO88h2PScBPSs7eXkYKW5C4c9voPOWMWmBLEZit8uGzF2xV
   1Zj27Skf2F2kyObg2jRlYkp9rgL+8FlKb4ev4p0+zXnn3Sj3Sw4jCy87v
   YaNz+CxDudxnP67Xe9ZmzFEqrOtx7naYe9hCeOIfKyj/n1aFf3yiDtcFS
   SI5FhTRBEdDSCEPPPmwx2m2r4RnvN9DwJlsHepNfO1pMMK3QjVJE6VwA9
   A==;
X-CSE-ConnectionGUID: adJTFaI0Sz2fcpzPo22VSg==
X-CSE-MsgGUID: 1fkBDs+VSnisiSyCejk8Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102186450"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="102186450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:25:38 -0700
X-CSE-ConnectionGUID: fwkBa+8ZQjuE/O3OhJyuEQ==
X-CSE-MsgGUID: 9RlNIxPJTOaBEAXgpFgupw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="279057034"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:25:35 -0700
Date: Tue, 14 Jul 2026 11:25:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Michael Buesch <m@bues.ch>,
	Andy Shevchenko <andy@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 19/20] gpio: Unify style of pci_device_id arrays
Message-ID: <alXyfR6BKsW6tEAo@ashevche-desk.local>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <125cf664a060ff58d11f4a21e8df182cd8f15eff.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <125cf664a060ff58d11f4a21e8df182cd8f15eff.1784013063.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 14, 2026 at 09:24:20AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Update the various of_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
> 
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>  - at most one entry per line;
> 
> Adapt the few offenders accordingly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


