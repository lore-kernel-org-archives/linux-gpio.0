Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771233D6C1;
	Tue,  9 Jun 2026 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015112; cv=none; b=J0uy/XO2KLB0zFiDAUsCTdocmIVauvVv4JRd+fwWKhw6/GjFi5ChST5qp/DvWe28SN5IPp/APBy1dteoYm/RO+mwQ5BhpdladTD4+btfciyFQ7InvIQ9Mf8zDO2hSONQhoAs7nalAcfmG6Qd69a5UEp5ZcLj36Z7NWCfD2DvGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015112; c=relaxed/simple;
	bh=vZHJjjVhkfMhSV0vi7yJg5GrjlR9OQZXMgbLR2vpUHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBnLpvow+iLn5+4qZT01PkQ0RAqe4l4LuMbidgTpJHbZ5fQKGNe+rzc/AxmfRjsJbuw3s4AIx+IacfkKn/iC5Qf5Z8A8N3yqH/sVx837Ty9OsaBQRr2ktEMWs0Hk2H3JI/J9+OfZWDhlsMysGrvHfEBDq5xkXpXbqS8x9+7883Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxEfHweL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxEfHweL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781015111; x=1812551111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vZHJjjVhkfMhSV0vi7yJg5GrjlR9OQZXMgbLR2vpUHk=;
  b=UxEfHweLetAs6HAD/Z1TnhdlW/q9xvKdn4E8mLv7mlK8It7HNEZ25RSy
   XD+qyhmysbXZUp8ER0Kf9hYdfwElZsm5lCoynBCU2bDE3c0gUlewMefsX
   4s3CU8JfAdDOmYudalrovhM5xyRUYaVJYs85og+npQ9+2uISMJvsS3DUc
   C2STJFVk47G4cXiv6OR+cKkh1qK1hjzujw8BEM03FIT+3OFCJpLHAdBTb
   eqtla4O1dZfHXWH7i0IciSPuRib9iWmQGNOZboCEexsk7Ate6Mt3TpNgH
   YiS5URwgKMO1LFeqFliKzrZIzWLyAjHKJEsvwFkwPcVXLuFs6GG+vif4O
   g==;
X-CSE-ConnectionGUID: lcGFCrydS6y843UkelpH6A==
X-CSE-MsgGUID: PG82r8oTQ2qQUY9BqWMI0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93162267"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="93162267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:25:11 -0700
X-CSE-ConnectionGUID: oGoW6R6ISdqwUR/wKYRxyw==
X-CSE-MsgGUID: 7a3ICwf+QfSnveObx5SGGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="247737030"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:25:09 -0700
Date: Tue, 9 Jun 2026 17:25:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: fix cleanup path on hog failure
Message-ID: <aigiQ-KR-YHiult_@ashevche-desk.local>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
 <20260609-gpio-hogs-fixes-v1-2-b4064f8070e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-gpio-hogs-fixes-v1-2-b4064f8070e7@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 09, 2026 at 02:17:50PM +0200, Bartosz Golaszewski wrote:
> If gpiochip_hog_lines() successfully processes some hogs but fails on
> a later one, the error handling path in gpiochip_add_data_with_key()
> jumps directly to err_remove_of_chip. This leaks resources allocated
> earlier for ACPI, interrupts and hogs that were successfully processed.
> Use the right label in error path.

This seems legit, but there is still a problem with implementation of
gpiochip_hog_lines(). Ideally it should clean up the crap it left when it
poops. With that, this one will require a brand new label just before
acpi_gpiochip_remove().

-- 
With Best Regards,
Andy Shevchenko


