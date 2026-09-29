Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342F139E6EB;
	Tue, 29 Sep 2026 19:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711624; cv=none; b=MI6OfUSfNOXXKdQRi52gGkQSgx6dWn1FsAo0FulwvZ9+KHZ9IhtdzHWdivNiNEF57NNBQEbUsOZ8wao8Ctu+mPSsyYXp01qcp9ESjVlE4A+OydfeBgXpeLQGLV/wcY6EvzoyDXHLOoiPpJIPoVhd1ryqXuGqrKZOSJM9fPbvH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711624; c=relaxed/simple;
	bh=WqYkhrTSHm6IwJTXzEMTiIkfaLjWrfjpuN9Qik+VOBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3Xjq5yWhx/y3BEk5dhlpNVcJ+OqQwlZNChT3qJhVBNriJWYy/5JcHwnMV3Q1ZjjnUen7R6ZV5ItZEmJ/PYuF90fKQDJeN4rlbOQrFE3nJcxTthbpFQyCDubsVo0wipfHClNMglLUPXfOhQGGI5NUKH0i0JUFSopxEOL/JBL0lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XecwERL8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XecwERL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790711621; x=1822247621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WqYkhrTSHm6IwJTXzEMTiIkfaLjWrfjpuN9Qik+VOBo=;
  b=XecwERL8+Mhy3fQ9m6Y3g3DOVmGJD9TyxV98JscxqCYa26WNs3lSrqwe
   1seDfTtia+yta4ySVs8RHpAn+c891MQWVeFk7Sn3Nk2GE8wyY2h/vcaON
   jAECN5eN9JfUPMJqbzB0H7JDPh0pmbUOxVGaNlwLiihaYH+H7kcG9N+vH
   O78E7asLTeWhkah7E72gIxDHOZulmz7S2hIfJP0SxdhpudQvEEMs+PvSK
   Dg/EshZbC3s/Mb7fDaHYb3EMWexpbV1KjPmuTjWCpIQ3sX8i28Tfoou4o
   8EdXHXgUHMowKewWyo3uaTwGHyPZq1U+oD8we1MuJZCvatp4viVuNMuzg
   g==;
X-CSE-ConnectionGUID: JFAaJ20GSR2mzuY59rxboA==
X-CSE-MsgGUID: k9NLsjprQU+rL9nwYWpwtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113226510"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="113226510"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 12:53:40 -0700
X-CSE-ConnectionGUID: kkKKMTwER8e7gq9nvXBaJA==
X-CSE-MsgGUID: Vu3/B1GTQtiCcdISUptIqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="313408779"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 12:53:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A832611FB41;
	Tue, 29 Sep 2026 22:53:40 +0300 (EEST)
Date: Tue, 29 Sep 2026 22:53:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
Message-ID: <arwXRBDZI5ottKmL@kekkonen.localdomain>
References: <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <20260928123446.GH106095@black.igk.intel.com>
 <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
 <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
 <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
 <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com>
 <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
 <CAHp75VcpK-Kv2tfR+fAuTWE15b2j34M8X+_UEkBGz_V=QJPbEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcpK-Kv2tfR+fAuTWE15b2j34M8X+_UEkBGz_V=QJPbEA@mail.gmail.com>

Hi Andy, Bartosz,

On Tue, Sep 29, 2026 at 06:09:20PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 29, 2026 at 5:05 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > On Tue, Sep 29, 2026 at 3:31 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> 
> > > > > Just send it now, in any case my series is blocked as I have not seen
> > > > > a consensus on what to do. Or do we? Bart, Sakari?
> > > >
> > > > If I didn't make myself clear: I would love it if there was a single source
> > > > of intel GPIO pull-requests (most likely Andy) for *all* intel GPIO drivers
> > > > even if they have additional reviewers. I'd also love for them to live in
> > > > a single subdirectory at drivers/gpio/intel/. Otherwise, it's still chaos like
> > > > right now, just worse.
> > > >
> > > > This is in line with pinctrl vendor directories. I also don't see a reason for
> > > > moving Kconfig options into their own vendor submenus if we keep the top-level
> > > > entries sorted by driver type.
> > >
> > > So, as of now it doesn't seem like an agreement among all parties. My
> > > opinion is that it's good to have PMIC be separated from the other
> > > code, although I don't know if the camera PMIC GPIO driver that is
> > > used with IPUx is good to go under the intel/pmic subfolder. I also
> > > believe that camera related drivers are the best to be handled by the
> > > media tree (as it's done, exempli gratia, for int3472).
> > >
> > > At the end of the day you will have a single PR from me, but it won't
> > > include camera stuff unless Sakari agrees to send a PR to me (which I
> > > think won't be the case).

That'd work, sure, but there are often dependencies between all three USBIO
related drivers (main, I²C and GPIO) so they'll all go typically via usb
tree in that case. Having them all be merged via the media tree would
require more discussions.

> >
> > I thought we agreed usbio would be moved out of drivers/gpio/ and into
> > media? That leaves intel/pmic as the only subdirectory IIUC.
> 
> Hmm... I cited the int3472 MAINTAINERS record to point exactly on the
> variant where it's left under drivers/gpio. Also IIUC Hans' opinion is
> that GPIO drivers even being USB GPIO expanders for camera are still
> GPIOs.

Indeed.

-- 
Kind regards,

Sakari Ailus
