Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD333B6CC;
	Wed, 30 Sep 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755690; cv=none; b=PK/5hHy3bgKLwx8prOdt9VLhSdPJTdce2b7t7N1HnAB0s2KPBxy9IdOvg5NvRIB5nAnpeLLklFvzO82S2vEACNIeFPsi8Pa+rygKDROBNdUIGeCOW0YLMrGNYfwgfZxq9CxAUZba+dkz6oXujQO19Nj+lwAAp5IXGCaxwPQKfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755690; c=relaxed/simple;
	bh=zMTLFhhNl8tcGnAVHgj20uCYU6JP6rD5KzbE/DhQ6RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia1AHgJ9WhziYJlUi3pmopN6R6MYOp91rzdlMxC7hGsG1rI6dWXhqYFWphBTO9ypZPSqz1h4hKlD86PBlzpHuHaymyJoDw1K2V5MvUE53uFfr5UanDel5oFFIdkcEHxUMFylPdNssq6YiEtE4k0JNHiTmBNlHQTkylb/ehWwsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvI2uYCv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvI2uYCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790755689; x=1822291689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zMTLFhhNl8tcGnAVHgj20uCYU6JP6rD5KzbE/DhQ6RY=;
  b=hvI2uYCv/VOqirDgWtj5aA9p6LOLV9F/mMq/n/q/Rr4hN1Hu51pd/2zZ
   RGfEcnfiZNK7BYz/ko7N05wgHfkVSnPGns+IjDrejpHNNYSkdGOXo+i8m
   ZZ4hxix26W2tdmzMG8R3o4l08OK4d4p2g6ngHHNCQ82QIrGA8wFN3I3Zg
   n5WcQIgYleqCbW2b8FXHLzCO2jmo+D46u5jKDDLyMgDKv5tLCgslEkxYs
   D9CRZmakcXrrZ0SKGonE1RtQbN2LRhFJakIWwJUgb3AsWChdBkcdLIMO7
   rR38ST1I2faICXxlgMu9YjZrK571Z22kpa0zr2cmPQgQcIPcqqq+WFJJM
   g==;
X-CSE-ConnectionGUID: GZI0BudLQainFwyDBs7tMA==
X-CSE-MsgGUID: fEioKn9RQXKXSmy82CcTMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107873691"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="107873691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:08:08 -0700
X-CSE-ConnectionGUID: nL6c7xIUT2OF3zQp2APcCQ==
X-CSE-MsgGUID: xRPYioFETp+kRJAFDNznEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275762294"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:08:04 -0700
Date: Wed, 30 Sep 2026 11:08:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
Message-ID: <arzDYjM78QJYhbQS@ashevche-desk.local>
References: <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <20260928123446.GH106095@black.igk.intel.com>
 <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
 <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
 <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
 <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com>
 <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
 <CAHp75VcpK-Kv2tfR+fAuTWE15b2j34M8X+_UEkBGz_V=QJPbEA@mail.gmail.com>
 <arwXRBDZI5ottKmL@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arwXRBDZI5ottKmL@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 29, 2026 at 10:53:40PM +0300, Sakari Ailus wrote:
> On Tue, Sep 29, 2026 at 06:09:20PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 29, 2026 at 5:05 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > On Tue, Sep 29, 2026 at 3:31 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:

...

> > > > > > in any case my series is blocked as I have not seen
> > > > > > a consensus on what to do. Or do we? Bart, Sakari?
> > > > >
> > > > > If I didn't make myself clear: I would love it if there was a single source
> > > > > of intel GPIO pull-requests (most likely Andy) for *all* intel GPIO drivers
> > > > > even if they have additional reviewers. I'd also love for them to live in
> > > > > a single subdirectory at drivers/gpio/intel/. Otherwise, it's still chaos like
> > > > > right now, just worse.
> > > > >
> > > > > This is in line with pinctrl vendor directories. I also don't see a reason for
> > > > > moving Kconfig options into their own vendor submenus if we keep the top-level
> > > > > entries sorted by driver type.
> > > >
> > > > So, as of now it doesn't seem like an agreement among all parties. My
> > > > opinion is that it's good to have PMIC be separated from the other
> > > > code, although I don't know if the camera PMIC GPIO driver that is
> > > > used with IPUx is good to go under the intel/pmic subfolder. I also
> > > > believe that camera related drivers are the best to be handled by the
> > > > media tree (as it's done, exempli gratia, for int3472).
> > > >
> > > > At the end of the day you will have a single PR from me, but it won't
> > > > include camera stuff unless Sakari agrees to send a PR to me (which I
> > > > think won't be the case).
> 
> That'd work, sure, but there are often dependencies between all three USBIO
> related drivers (main, I²C and GPIO) so they'll all go typically via usb
> tree in that case. Having them all be merged via the media tree would
> require more discussions.
> 
> > > I thought we agreed usbio would be moved out of drivers/gpio/ and into
> > > media? That leaves intel/pmic as the only subdirectory IIUC.
> > 
> > Hmm... I cited the int3472 MAINTAINERS record to point exactly on the
> > variant where it's left under drivers/gpio. Also IIUC Hans' opinion is
> > that GPIO drivers even being USB GPIO expanders for camera are still
> > GPIOs.
> 
> Indeed.

So as I see now there is a consensus that
1) it's good to have Intel related GPIO drivers to be in 'intel' folder;
2) the USB GPIO drivers are still a GPIO and should reside under drivers/gpio/ (somewhere beneath that, subfolder or not).

We do not have a consensus on:
1) PMIC separation to the 'intel/pmic' subfolder;
2) USB GPIO route for patches (with them still be somewhere under drivers/gpio/).

Unanswered question:
1) do we need to consider gpio-tps68470 (camera PMIC on Intel HW) as part of
'intel/pmic' or even 'intel' in general? Currently the Intel HW is the only
user of it.

P.S. It seems a big deal to move the drivers from one folder to another :-)

-- 
With Best Regards,
Andy Shevchenko


