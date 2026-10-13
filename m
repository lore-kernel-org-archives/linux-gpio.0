Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099712DF6E9;
	Tue, 13 Oct 2026 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897039; cv=none; b=OmFm47/KmumcQ3WuFrLWMThkRhm+2k1iElsIy7TQ1VVg1IrG4ne6+ZSEtR3vDk621afOnWXhIhZGKAZ+wZ5rnXlZ8vVDo9iz0575y9MCc8SH93G2XK1btvgquRFUmHFxjZ/5dGN8sxaX6ckhLknRDt63WWSps5CdXIasJiLco+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897039; c=relaxed/simple;
	bh=60zYTUoV8B3oGIExYebQM8JC+ndZibirMqEzKZI6lSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8rKkXoup21FKpcrZ1r015dEbn686zy+9o1OscQSjqteVnS7/Xxu22T22ioWZOiN679jQuV6O4S9A2WQiFsd/LlcxaVVvcbPDLlPVglianO9y89q4uqJKU1b91bKhCzVjKB18LcYNt5TbLD0TcspyIDpOTQOm1fsbqot5uRQd9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khkQuIIb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khkQuIIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791897039; x=1823433039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=60zYTUoV8B3oGIExYebQM8JC+ndZibirMqEzKZI6lSc=;
  b=khkQuIIbqln2p1hfkXjm/20EgGJqcTBTnS8g/I0+e10r/vhOr2oWHbv/
   DAmsNisCbb7SzLmoPtGJyHBxShyGY9L7NylWWDxXSUzYWB8vi0VnOAJzC
   aOT9b3DnMFOEJUJpUXB0KjTbOWn3nmWyX1ClGdC2vZ+KUPon/43iKCxjg
   cGq032kaR5PW6Tuq3MwVuYERJpSd6Gq0XHyraaPcjB2TGECVyHqciuEyg
   uzDuJjEyNCOjEzrk+wmC0GJ1sMmcZWgUcuUSa7MfePmlF9xFtPuQXHZbr
   vPMMNnhv2g7DHXGcEE/TlAbU9/aZRIk01T3zFuzgfM4Sf0nVISWPbOTil
   g==;
X-CSE-ConnectionGUID: K4AE4r6fRhi8DWYfXdyGSA==
X-CSE-MsgGUID: xXRWZu56TAOl9OeYLgXYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="630316"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="630316"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:10:38 -0700
X-CSE-ConnectionGUID: 6FHVWf9ORVSR7iiFQnvaJw==
X-CSE-MsgGUID: DAt8C0HxTbSMXmS+OwIFog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1084964"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:10:34 -0700
Date: Tue, 13 Oct 2026 16:10:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Message-ID: <as4twfDzv23p25yU@ashevche-desk.local>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
 <178418869936.4524.15759697748852640442.b4-ty@oss.qualcomm.com>
 <aliWiN1EaGziNZ7f@ashevche-desk.local>
 <CAMRc=Meen-m7FohCe-uU89R60SNU=gJFXkwpBjpTZMw+3+1b6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Meen-m7FohCe-uU89R60SNU=gJFXkwpBjpTZMw+3+1b6A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 01:35:18AM -0700, Bartosz Golaszewski wrote:
> On Thu, 16 Jul 2026 10:30:00 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Thu, Jul 16, 2026 at 09:58:42AM +0200, Bartosz Golaszewski wrote:
> >>
> >> On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
> >> > No more users.
> >>
> >> Yes please! Thank you!
> >
> >> [1/1] gpio: legacy: Kill gpio_set_value_cansleep()
> >>       https://git.kernel.org/brgl/c/aa4bc3b7d36d52caf7c3d3214ae4ce96d609e8c5
> >
> > Not sure, I put in the comment that this should be part of MFD, otherwise
> > the one driver will fail (the conversion change in MFD tree only).
> 
> Ah dang it, should have read what's below the commit message. Backed out now.

Now it can be applied, can't it?

-- 
With Best Regards,
Andy Shevchenko


