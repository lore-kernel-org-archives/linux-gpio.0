Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F194D3F1077;
	Tue, 13 Oct 2026 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896964; cv=none; b=sZ5M1qWoxAd3IFqNR5ltXlGrCaD6QVptPGH2v6N71MEP3Gxeq0rAXxgqEJzm4gtf+wR/Gc5xRhx2BrpHV0yHnzi4OFOteUsMofP7bzJ97PT65ZZ/5wq3HepycPxttZn9b94lxK3tboncxZAltZ1VWiRCR5KD90tgtLaBuEVIJlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896964; c=relaxed/simple;
	bh=UpLDrnSBhRg6iXoSIzOWUiTrJH1KftLjMwLndDqjc5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiHW8k60au/40grs4FzOpk3qtizKFBJnllmGMzF1AhQzmX9dk84CvRGbRgv1Uv+mnIxkAEsk1etoVfRi+yojYMlOsnHCV74i4lxLroR2HUzP3POARvUDh/rnN7C2nnc6Wahs9KdvKryytepUgEZ/2s83QbqIK2e27OxdNcQoh7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBBJRMHs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBBJRMHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791896964; x=1823432964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UpLDrnSBhRg6iXoSIzOWUiTrJH1KftLjMwLndDqjc5g=;
  b=CBBJRMHs0auIPkZWo6VOF7xjbLLBzq9VWv31I+VUkwRN/st70qamHeRn
   Sf5Pb1jCeozpNJAMGp5NZYOYk3YEuTjEqIB2DrGYTKDcLFXw2/WT8qlqL
   1EPlO5oQlqTCCFU5TlS05X2WGkzDPVft1slqrx8PieZ9vNcvMbJeT9zud
   RclhS7oeItwg/RNcjUy6B6jE0lx724EOX/5FDSg9XP2ohbfCfs34Qy3Rn
   hpP4zBOfI0rj9nt2j4bXpvMFqi0EG+1KXBVEjWBP4Mf/aDvXGVIjCra/3
   uOQLfArcxfDti7qN0SR8uWnxgnXBsftmKv/e49g1sor4mBKJy2IyJ1oGR
   g==;
X-CSE-ConnectionGUID: Nd8VW3g5RES3cUnYDU0AOQ==
X-CSE-MsgGUID: LC/fuKMIQeGjj+3hmxNzew==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="505934"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="505934"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:09:22 -0700
X-CSE-ConnectionGUID: oYbbfUsLQUuknHb9gH/1MQ==
X-CSE-MsgGUID: UOJ0k6MYQCCqCp2CcQRkoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1269436"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:09:18 -0700
Date: Tue, 13 Oct 2026 16:09:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <as4tep73cAI57Yk7@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> > small series we kill gpio_request_one() and leave only two legacy calls
> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> > a few users and high chances to be killed soon as well.
> >
> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> > with possible immutable branch for others. Please, ack.
> 
> The kernel is clearly a better place after these patches than before it, so:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!
Bart, anything needs to be done for this series to go in?


-- 
With Best Regards,
Andy Shevchenko


