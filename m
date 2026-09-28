Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137552DF137;
	Mon, 28 Sep 2026 21:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630418; cv=none; b=UUJ4q6CJFupcuPYmVl+/S2wfEAmvK7s/RNXSr2eS684aqNQfayOWpbJOgDMlCidHghLVfMRknYJ98zocLZfv3NFZc6WnOZbMjJqElSiihzM6eFRkg6mDI3zvZWtiRuMygvL0ntDAAs5LT/SJEWedf4K2UyIhto3sb5a5TTLbrZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630418; c=relaxed/simple;
	bh=0wSVDTCo6Cmwys7tnYEeKLwVKpVfZlfujTiInN+fmU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHmj2tKgVKLDeKCSEJghQj6l8R5fKiGrgpsaPEBseeaA35tSLf1U+PGswZz5ZdFsb262yOsHur+o5jjw2h2Kjv8bh2ZPwcNG8qvHHLHCar4+7+RjNUmsIYzWWYkzRMq2XMp+GVqt62JgfK9FyaVV+mHoRn+iC9mYxyKHh2csZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n958H5Up; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n958H5Up"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790630416; x=1822166416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0wSVDTCo6Cmwys7tnYEeKLwVKpVfZlfujTiInN+fmU0=;
  b=n958H5UpR8Az89BLZVIhnjHieXggGbuXWm3PH1TBbsvvLvauCnbzChFH
   Qw+NFOmLOegdujH6fBllP4T9qgFbQ0SzzgW+fvuvqVEosxeqvMUT9LhEJ
   yGKgAIjMB4BjdISDo6r1XxBLEG29OLg8qilPNHuQEygvP67vSUqjm4Uhc
   PG7QpU4YQYTGSAmyuFJhgBWdP5amM/B8EVICGg2xRrACy3DVsB1Im+Qf2
   xAFft6CeKLbTIHaL/X5uu8gZ/C5ODdG9rVyIun1K4J5hs2oQgamoL6PMD
   gYIIJE6bN/zX1lIK5fSlW3qkFZ2/5oMrfIuwytvlgD5O/HG/USbnyUJ5j
   w==;
X-CSE-ConnectionGUID: KUJ/8WjbS0aeI0uKboUm0A==
X-CSE-MsgGUID: f6VshuGhSlSadxay0XRVZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90241512"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90241512"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:20:15 -0700
X-CSE-ConnectionGUID: AGZ5CZMOQNOYeMPPTm7j0Q==
X-CSE-MsgGUID: VLHkZjNMQqGymVNuLkchfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274274161"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:20:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E9D8E11FBD1;
	Tue, 29 Sep 2026 00:20:12 +0300 (EEST)
Date: Tue, 29 Sep 2026 00:20:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
Message-ID: <arraDNEO5NuxgTz6@kekkonen.localdomain>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
 <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local>
 <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <50a29ae4-bae1-44be-9dbe-79a1147accf0@kernel.org>
 <CAHp75VeHupSXCBUyoUdPXY-GvBcupQ9kczhr-M3=WLkEzDKyvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeHupSXCBUyoUdPXY-GvBcupQ9kczhr-M3=WLkEzDKyvw@mail.gmail.com>

Hi Andy,

On Mon, Sep 28, 2026 at 04:10:41PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 28, 2026 at 3:35 PM Hans de Goede <hansg@kernel.org> wrote:
> > On 28-Sep-26 13:34, Andy Shevchenko wrote:
> > > On Mon, Sep 28, 2026 at 2:13 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> > >> <mika.westerberg@linux.intel.com> said:
> > >>> On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> > >>>> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> > >>>>> On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> > >>>>>> On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
> 
> ...
> 
> > >>>>>>>  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
> > >>>>>>>  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
> > >>>>>>
> > >>>>>> These are interesting drivers, not sure where to put them
> > >>>>>
> > >>>>> IMHO they should be there too. We are maintaining them both.
> > >>>>
> > >>>> Do you send PRs to Bart or you just rely on him to take the patches?
> > >>>
> > >>> I don't expect these two drives to get too much attention, and they could
> > >>> be contained nicely inside intel folder and that would help Bart to
> > >>> identify that these are Intel drivers. So your bandwidth would not suffer
> > >>> even if these two are added there. Your call.
> > >>
> > >> I'd like to avoid a situation where we have Andy's Intel drivers under
> > >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd prefer
> > >> to move all of intel GPIO drivers into drivers/gpio/intel/ and have Andy
> > >> gather changes to them if he agrees.
> > >
> > > Okay, we have two parts missing:
> > > - Nova Lake driver (I would need Adam or Mika to step in as at least a
> > > designated reviewer for that)
> > > - USB IO (I think we need to agree which tree it will go through, my
> > > bet that media tree is the best), for that we need Hans' consent
> >
> > Routing the USBIO / LCJA GPIO drivers to the media-tree, with
> > Sakari likely doing the merging for both works for me.
> 
> Sure, Sakari, would it work for you?

Yes.

That being said, the USBIO driver(s) come in three parts, this one (GPIO),
I²C and the main USB USBIO driver. Patches (or at least the set they're in)
often touch more than one and then they're routed through the USB tree in
practice. It'd be practical all would be merged via the media tree, unless
there are dependencies to other parts of the respective tree.

Perhaps we should still do this to GPIO first and then think about the
rest.

Also cc Miguel.

-- 
Kind regards,

Sakari Ailus
