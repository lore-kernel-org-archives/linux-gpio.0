Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675970;
	b=3wEjmlUxx4CXKCw6e7HdAD1cbziOl26LyEjxXIDEv9NxBMHYQRwyGwiEqS3tfSbR3v/H
	 dqzMDCQkB//JRjWdkEtjDY3I0p4cWt2LVanYo4Pbxo2cPbl3byOUY56rhpYmyNP+ahgy5
	 VRwWmzJ9p5G8IFTnbufg/0xmsJK7PC0eff8VGlxwgsbUqoOzkrY/8KUGPuisspoNwYaYM
	 9ZXmo0OZ5FSBjPfRS5x60NCdiGhsbEmiaERFNIKvfNY9hZnoWsXLBqQyEjEUnBB8cS3Fl
	 1nHWEo5KZ9uNERs3tEaJJD4l/3yI0VdCQypQgGiZSIm0YMm2OGVW8y6AB4lXMyVKtCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675970;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=xU8/4U1KfYfBryPLrZTUPqKsYar+pEw0LgW6GzSCtbg=;
	b=3yxm1HbtyQTq9gZa5fdLeWFcxWRt/yL8oA2gUyZiEduid07cVMuQYSjROIe8RgrA9+2b
	 OJl4CCFbTnuxFGEPIACgrAfXl0IwKaTWVdNAtlIOK5hRz0R4K5bCJysGvFejsGZsdjZJH
	 Kfg3YvcN3uP0fFZKKP7ttNKuwL6pqmV4kTGVjcasjUUbjSTLHnGQIMhh08WL42AzqS4Qt
	 /S98H5JvGUV5btF0n4KwAGL1j4y2o9I4hpOfecAcy/2Wy2W0P4eaSu2Du238hletZmgio
	 FhkdJp7XlDa/D6xpU9+TYEUBmHxKYLxnJDnMwSLxPjPk4aZBcaCd0Tz4RJzfc0KOaJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gTHG0zIL;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A571A606A319;
	Thu, 22 Oct 2026 13:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A571A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gTHG0zIL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792675970; x=1824211970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H0OnsZOjW844kgSJh94ShwOiOdLGyvEOmFFZvtlehn8=;
  b=gTHG0zIL2mol5An3uiLD+JIEJtmWG3Jtt6td7ehFKGiXoglt7hlhkJZq
   i+iyNR/X54OS2AA46Fshp2yfb/Gq3g5rVoRjS6TBB1RMhjwujyJvjy/Ql
   UUGZ76jHyYl3c3vLUrfpepHzE6GbOSPXCqt+uu+HiqBBOnUp6GlX1Qe2+
   9d6y96NIx4D1M9ArVgrcsTFxkmpcZtgJrzsgx6tH1Cxyq38INsCe0yUwA
   Z9bTB4Q+lJ6aIdCleV7iENt9iSAJkqKRAMQ7FaTJdATGwtEJzrqX/Wd9J
   oKWyNvmFbBJzFP52u3M+f/8nnBxdbBambFWfwPZG4UBq4bssQIw6jCrBB
   Q==;
X-CSE-ConnectionGUID: 3bZ3CKRKR4KbDeMkw5nI1A==
X-CSE-MsgGUID: XYo7k892Qj+jzJH8m69zdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1324331"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1324331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 06:32:50 -0700
X-CSE-ConnectionGUID: hEN80+ymQAC+qXecrmFXPQ==
X-CSE-MsgGUID: u5O5SsG7S/eKhYsX94sVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3757742"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 06:32:47 -0700
Date: Thu, 22 Oct 2026 16:32:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Moelius <sam.moelius@trailofbits.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
Message-ID: <atoQfGQZeJDU3eMF@ashevche-desk.local>
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com>
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
In-Reply-To: <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 22, 2026 at 02:11:38AM -0700, Bartosz Golaszewski wrote:
> On Wed, 21 Oct 2026 22:44:42 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > I have noticed that a few drivers use almost the same code to dispose IRQ
> > mappings. This series to deduplicate the efforts. I only converted a couple
> > of the users (there are potentially more) in order to stay in the same
> > subsystem.
> The "few" being 2 testing drivers of which one (mockup) should ideally go away.
> Do we really want to add more code to GPIO core that will only be used in
> testing module(s)? I don't think this is useful, sorry.

I meant a few. As I pointed these were chosen explicitly for the sake of not
crossing the subsystem boundaries. I looked at Broadcom one, it is so big mess
but I think I can get an advantage on it. Also there are other drivers that
just need more work to check (and many of them are outside of drivers/gpio),
but I'm pretty sure the new API has a good potential.

-- 
With Best Regards,
Andy Shevchenko


