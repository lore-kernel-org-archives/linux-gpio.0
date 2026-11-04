Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828423;
	b=PQ+fKpInpfs0LoPTPETXU8/PRREzkMRtdvG8QnUYPD9i1VN54TEop+SlXHyOn4v3qjIR
	 q3FPD7oQC5wg1C1IymiMz58Aktm/ePtMh/uk/K0heqcLGsr8TjyVfaueYrUbFBfKDfYVm
	 FncqexvOuoHBsRNp3ckaJI5Zwly8qZOtfNFKEhVz3lyd4nzgxv12CQvuVcl7q8juGFKG/
	 hVJN96M4hDDmUhPHQTKAMnCxg+67Jwz/F1mEUKK2hPpiNwGThfF5juJfVDByucEdwEvSC
	 bGGsHug4/qXlrPLPzPdkAd6epcoKB7lJyumLkko4qXVyNrgl1NOnshZuq5z3AaWAOJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828423;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=sXiius+CTiLXJFblXuHku2UG4RA2GxPJEGoI31L/58A=;
	b=1Q8AzR4DMXcp/UrT3jonw1v/Ra9irRefyL51hAoUauJxH32eE+k+16Vm8hbxccmMjHfA
	 PNbpDwi3T2HBpJC4zin+MDPD+FY4dyqtcYsxAivcFumsYAGSi7gxHCZ6/4mwD3+03+Zfm
	 Db7EC5QWJmZBzy+72R/2Bzp4g2HYUNwPkm97S/pFgAMAOW1+j++BXHR9fbLWqeN0zbM4G
	 cdYTyBU6XlO+8kL5Ni2Tn48tg6sKfc388sCwBNFU+Ero/qjlEh1hpdNqwQuI4UbUqDEm8
	 MmVcCP2UPx2XGioU3TQJZGxYm7HoeL699NKqAreonBiLUh37n2W6qPflzDz1VTJo9iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mg0UCZrz;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E92A606D815;
	Wed,  4 Nov 2026 21:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E92A606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mg0UCZrz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793828424; x=1825364424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Di3gcL2ifCBDOwhWQg0CwRB4eDzv496mhBXFrdAFkDU=;
  b=mg0UCZrzn6TDcXoEjdPZY+57S/BuPE21ludNI6XZS5/T0LGBbdkIJgG6
   ZsvXslC0du/nydMZzX/5tdJQ+pYJ3KDJUpimd8ddr1EblWT2LQd+R6PkQ
   GFHAvXr9dId4o5YIj2w+O0BK6FnfFSEbXHfr2TOnuThJ/zl9TGLCsCgO2
   XakWhjg24ol9NPW1m2r6/EcUFDJRy++TrG35cKnzMFSH6UV5Ct0n3gqO6
   AW7/MS52KQDBRfm+w9dwzE/ohiulBVU2ZTBaWMeaMEA7gvOy6nJfp0Ofj
   KguHd20Pa6aaWnNzFyGtTqW5YnLfLXjCwMEPqhv9KNnMx2juuHoSdVT38
   A==;
X-CSE-ConnectionGUID: oEdmM4ELS7el3Rj/jTGRYA==
X-CSE-MsgGUID: /vLgrzO9R/Onbxo4T7C2PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2704160"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2704160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:40:23 -0800
X-CSE-ConnectionGUID: GdVZlN9EQmq0PB4M8ocuUQ==
X-CSE-MsgGUID: gOUcNKCcRGGU7k66KsW/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6828843"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:40:21 -0800
Date: Wed, 4 Nov 2026 23:40:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <auumQhqJwIl4XZDM@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
 <ausjJSZkaGKNfykE@ashevche-desk.local>
 <4e7b28ae9ad5de3708c549d62a4bae68@gmail.com>
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
In-Reply-To: <4e7b28ae9ad5de3708c549d62a4bae68@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 10:14:49AM -0800, Dmitry Torokhov wrote:
> On Wed, Nov 04, 2026 at 02:20:53PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 03, 2026 at 07:40:34PM -0800, Dmitry Torokhov wrote:

...

> > > +	bitmap_set(array_info->get_mask, 0, count);
> > > +	bitmap_set(array_info->set_mask, 0, count);
> >
> > You don't need these, as memory is nullified.
> > Also note that we have bitmap_clear() IIRC.
> 
> bitmap_set() sets bits 0 .. count - 1 to 1, not 0. Both get_mask and
> set_mask start with all count bits set (assuming all pins in the array
> are eligible for the fast path), and then gpio_descs_check_fastpath()
> clears individual bits for pins that do not qualify.

Ah, indeed, but we still have bitmap_fill().

...

> > >  		dev_dbg(dev,
> > >  			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
> > > -			array_info->gdev->label, array_info->size,
> > > -			*array_info->get_mask, *array_info->set_mask,
> > > -			*array_info->invert_mask);
> > > +			descs->info->gdev->label, descs->info->size,
> > > +			*descs->info->get_mask, *descs->info->set_mask,
> > > +			*descs->info->invert_mask);
> >
> > Why not using %*pb for masks?
> 
> Switching the debug format string from %lx to %*pb is orthogonal to this
> change, so it is better done as a separate patch.

Sure.

-- 
With Best Regards,
Andy Shevchenko


