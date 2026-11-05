Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900035;
	b=HkC2IhinvRW5Yj84INfelLUQyAVrjD5OTGvKKyjkfUxseLacy/HOyqd6/6ldqCNM7l9J
	 AAg13G9iDyZc0yP00YleTq/TTc3hIVDDi8JY67kC+JPU6Lv50II2AikF+CVqnqOFZtzxt
	 2YWewt4FE0qLgLIZfNyQyqBZq68xeuDiy+y4ZmeOvyv92s5wdTjf2bnxwsy4669m0QxIh
	 dcY9lToPBWJXKBz1oI5RF/WVZ/PGCx8Mhc4ERsJBV3biql2M/trZoMqzsdjP11QS2uITS
	 kQKq2/AEP7ygsFNcVFHG3WB1d42FeXQt35tGhduTETPoxyP/HdRIc2tk0YJVyUJXZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900035;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=txE0NqAVE4GnjCwwk4oto1phoERpL/8EZaIMIn89g98=;
	b=0fItoWLSD3lC/C/xCM3Kj4eB0zOU/41B4gd4ABf9rcMbQS7eogIZiy3yuqZihlp1E6g7
	 +Xi/GMai/R+B597vu96nKeGbvCW+40pXkQNTt7fJJTweUYCGq3oeKY54iLlXkEcGlgMdH
	 elFtP0elbk1+GHbSneikfC12jTAt9OOPrnZupR+vGudhCxb+MUi/KlDGou7gR98jGl7lE
	 EnNwmqgRKMtUd6Kn9eVuxhixwylQUltUaks40wOTfu6WbJnauigMPejepjDaNDNmq/F8h
	 wIvmcfqyKtA1JMxf1LmVqD+Ly+t4pBvnKdFqQTVpBtkIcy3w2SYUwShle5bA3QvFQNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSqi1VF+;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1784E606A31B;
	Thu,  5 Nov 2026 17:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1784E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSqi1VF+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793900035; x=1825436035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DJhn81Zphg4t0gNU/PzOflNMenC2xx9cmWC8YHMmS4k=;
  b=CSqi1VF+naMtWBNHxz0GvJX0XWk7B9Bwj94j5Y3FjJOi1+XZnf6PbsxX
   w9q15dAUbrsyRb/aPE5v4/h8Gp8SMQFSUgY3BTM5fOWdm3QBLAhz6jN0P
   0BhYsQqPY3YjeyRR7dofrBz5W+oIqVpaFaJBcQBbWa71GsVaJl11SQR8j
   dwTr1cO+tZvoIJ/joTweI5E+R2xcyl8tgSxnw3lrvhvbocWU6kZot9NC2
   I3M8wHMaBsqk5N/h1EhiBEbRU95koNvkuPIxV2lhdtXbYdkq4EdoTr6oN
   9vIsiRx230Ttxn1+0vP0NlbF44QUSQ7vtxMOj1p3cjDLJ7juOgbaeoI2g
   w==;
X-CSE-ConnectionGUID: ovVBMrj8TH62esNxh1BA6g==
X-CSE-MsgGUID: mY/qSzkvSJGYKUBLrYyliQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2725643"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2725643"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:33:54 -0800
X-CSE-ConnectionGUID: ubKcXfV2T7ynYh0a64Nkkg==
X-CSE-MsgGUID: 034hYj82R92RRvNl4nU7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7061547"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:33:48 -0800
Date: Thu, 5 Nov 2026 19:33:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Junjie Cao <junjie.cao@linux.dev>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Peter Tyser <ptyser@xes-inc.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 0/5] gpio: Move most of the Intel GPIO to the
 dedicated folder
Message-ID: <auy9-ToSFN9BQDsf@ashevche-desk.local>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
 <CAHp75Vdocfk5b7GkL21z4nKv4mNcGMF4Y_aZP_sPPeL16FrsdA@mail.gmail.com>
 <auyUFrrAYLobE_cy@ashevche-desk.local>
 <y5aamdx67etg7dgzwbjorb65qikacw2zsnjomkkklty63dya7f@iapehkxib3gs>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <y5aamdx67etg7dgzwbjorb65qikacw2zsnjomkkklty63dya7f@iapehkxib3gs>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 03:45:13PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 05, 2026 at 04:35:02PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 02, 2026 at 10:48:42PM +0200, Andy Shevchenko wrote:
> > > On Mon, Nov 2, 2026 at 5:33 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > > On Fri, Sep 25, 2026 at 05:57:02PM +0200, Andy Shevchenko wrote:
> > > > > For the easier maintenance and future development move most of Intel GPIO
> > > > > drivers to the dedicated 'intel' folder. For now it only covers the drivers
> > > > > I maintain (as per record in the MAINTAINERS).
> > > >
> > > > I wanted to apply this in order to see how the menuconfig looks like
> > > > with it but it doesn't apply neither to next/master nor v7.4-rc1.
> > > 
> > > I will check this as soon as I can (currently I have something else to
> > > address which is more urgent and it's not related to Linux at all).
> > 
> > Actually I can't do it right now as it will be a race with the incoming
> > patches (for example, I see gpio-sodaville change in the mailing list).
> > Can you tell me when it will be the time that
> > 
> > 1) your for-current is present in for-next (so no merging conflicts)
> > 2) your for-next is closed for new patches for a few days?
> > 
> > Only with that I can achieve some good result, otherwise you will always
> > tell me to rebase/resend and while I do this, there will be a chance of
> > a new contribution that continues the loop.
> > 
> > TL;DR: I truly believe that the best timing for such a series is just
> > after the -rc1 as a first batch against for-current *and* for-next
> > (same piece assumed to go to -rc2). But of course, we may resolve
> > the potential conflicts.
> >
> 
> Can we do it during the next merge window? After I send my initial PR,
> you rebase, resend, I queue it and send it to Linus in a subsequent PR?

Sure.

> Do you have a public branch in the meantime that I could play with?

Not at the moment, but I can resurrect my public GitLab repo.
I will provide details later on.

-- 
With Best Regards,
Andy Shevchenko


