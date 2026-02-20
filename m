Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E745315793;
	Fri, 20 Feb 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572464; cv=none; b=ZOyEHg3fF+xvA5u5mJypwjdvmNCW7fzxt0Hmlz/c7WUYUh1Ce1RDe4JHOWpiR2j2f6Nh5c5eelB1ljLl+vrtjuP7PipU3x54/Y2vaVVNqrp79fZttRK8mFGQIEz6TQqJd2QOHOoCffOcEY5/OG+/UarT6UQGXKhyE1p+kcyUo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572464; c=relaxed/simple;
	bh=F6diqkqvRQUF5aCphfdCgVc/gEY+1RjmepA7FFYGg7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gV3OkFX7Lh8K0Gj8GhUwUeaFTRIZxSgq1lKbYbOIO42y1L/9tEOfkpEz+477+kholm1ZoxC4uW5V4ZaPDEjD9VCAxaSXQiWzgKMj3CtTJ9Eqvrsps+gQmz7hVG/+wYRYNzhUu6I9MpJCGdlwp3T4q7jzQlRXKjQrSG2LsxAXOEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kV9UL7Mu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kV9UL7Mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771572463; x=1803108463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F6diqkqvRQUF5aCphfdCgVc/gEY+1RjmepA7FFYGg7Q=;
  b=kV9UL7MucLHjlvwq1iafQjaXIVSa+Rj2KEbsCyjrVwFtlLbCnVppJEJd
   YChorNKTdcdQ2B+H8lYWVqeOBq+86BnsKjNH07pvFlYsS84FJLRtqo29i
   C8QWFbv0/IQvonuV3WAMl4PxwWZ3LgTMvLoWB7MNF8emWMop4Yjj95Htu
   MkbgkAeF/cGQIEGMyHU2jSilfpMjssiC3pDOaKfDvK4cMeWkpmQkAJhKI
   bfq+iNlo7QL7lYMfzgQyc0XDSfoCHCThAG7Qmll4SPqpMyaG0s0lQgHXf
   PVS/KulJGhqQmBg6QmPpTFyPzkwjf9dJEgoDY5JXssNmzHAkzVQF0D0mm
   Q==;
X-CSE-ConnectionGUID: lngecJKHQ/W1ZXEDhfMjHQ==
X-CSE-MsgGUID: XYfp8mgYTsCDdjj+CXAzng==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76502917"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76502917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:27:43 -0800
X-CSE-ConnectionGUID: B9/FGEQFTou31++ImBN50w==
X-CSE-MsgGUID: A/iwGRTKS5u+W/F9c66spg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="218915969"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:27:40 -0800
Date: Fri, 20 Feb 2026 09:27:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZgM6ZaBrwM6H1_i@smile.fi.intel.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <aZc_P9PcXdlJHqrK@google.com>
 <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>
 <aZeu11bBxxgXNMyd@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZeu11bBxxgXNMyd@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 19, 2026 at 04:47:59PM -0800, Dmitry Torokhov wrote:
> On Thu, Feb 19, 2026 at 03:15:53PM -0600, Bartosz Golaszewski wrote:
> > On Thu, 19 Feb 2026 17:54:24 +0100, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> said:
> > > On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:

...

> > > I think it really needs a good explanation given how it goes through
> > > secondaries on one side but not on the other (but maybe it should? Why
> > > one would not want to match secondary?)
> > >
> > 
> > I don't think it should. You have one, concrete fwnode and you want to match
> > it against a struct device: in this variant both its primary and secondary
> > nodes. I don't think we should do a four-way matching.
> 
> I wonder why you consider these 2 distinct fwnodes instead of a single
> object that has multiple components? After all in device we have a
> pointer to fwnode, and not list of fwnodes....

For the matter of fact the struct fwnode_handle is a single-linked list with
a limitation to have up to two entries. And the second one is a problematic
design as these years showed.

-- 
With Best Regards,
Andy Shevchenko


