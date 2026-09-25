Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163A3839A3;
	Fri, 25 Sep 2026 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347203; cv=none; b=e0q+95605LMXgyPfxFP3WxgEl9sMnfF3TjMdStLlbJ01MbC0BQeb5mo7WAV8PZh4rGiAeOu/cwDKowM7IvPB2uiJap+925LN/L72Q23pcpbbX6GN20y9Z7OZm+rZ4s0I1iYblN8TrGYOsKKatBkWWZQfkOa+JX7r0nmGtpuZweM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347203; c=relaxed/simple;
	bh=ZNCaqWYHkMcMJtSBAsHa3/QgjTH0lQK9PSQVOBQqUcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2yw40djSa2ge/b4OVq+w71TOBBhRXwKodpyUyE6HQPEGFiI2fKyse6R+keet0nknfVoV9WjI0sIJP1V+cAzAV9CvG7fofpwQnJYHpFhQSH1NLLKDJvLP8XFQ0Ut6SY+uQzTgth+o2kiZUPjGXhFojRGWGAcNi1q7Ar4JUCYePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxe4ZfL4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxe4ZfL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790347199; x=1821883199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZNCaqWYHkMcMJtSBAsHa3/QgjTH0lQK9PSQVOBQqUcE=;
  b=dxe4ZfL4+kaEqmaYPAPsCMVIGQRHdjlp/XyJ2D5KKW7anNSm4wXNvVSq
   /1nC34+Xq1MbIqjhuIA7Q0hUeuyG8VzXH3ydhK9vc2oHiSaPZ8sjDnpH+
   +CTURrFSpVzb5TLnW1hcr8i57ujqK+RfBY9C6TjF9WF5GqeFSCL+yT3Z6
   fIAaW+oERJ7v/i/cvu41pyTgn8XIKQLEvRaQxeMBuXJ4TeXM2iDR+Wuae
   Z0pEJW6EyqCO9enzJOrGMGC55OLnWgFxbRo4ds3FGNn1CENJ6IiJpF8P5
   BjjNstfB6oQzQAcXaeDFAG7r4tn5OfEZNzfRePA6ax6YQcHjmVh50/+qS
   Q==;
X-CSE-ConnectionGUID: RbW0gjBEQ6u8xGd6v/iebg==
X-CSE-MsgGUID: 2jcLUxjWT/yZPNBh6A+wlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93851651"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93851651"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:39:51 -0700
X-CSE-ConnectionGUID: 83/v7uwGTFuK1wXJTlt9Dg==
X-CSE-MsgGUID: Gp6MQwW1QKa6viyMVCzRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273910080"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:39:44 -0700
Date: Fri, 25 Sep 2026 17:39:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
Message-ID: <araHrdsDyBwF-26R@ashevche-desk.local>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
 <1299262d-a9f0-4f2d-8456-bb40a3078f95@kernel.org>
 <CAHp75Ve4hCd-WVrNvdmSOiCo8j0jXBbnvOvxoFh7-Rj1ctnybQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve4hCd-WVrNvdmSOiCo8j0jXBbnvOvxoFh7-Rj1ctnybQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 25, 2026 at 03:48:53PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 2:42 PM Hans de Goede <hansg@kernel.org> wrote:
> > On 25-Sep-26 12:48, Andy Shevchenko wrote:
> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:

...

> > >>  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
> > >>  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
> > >
> > > These are interesting drivers, not sure where to put them
> > >
> > >>  drivers/gpio/{ => intel}/gpio-ljca.c            |  0
> > >>  drivers/gpio/{ => intel}/gpio-usbio.c           |  0
> > >
> > > These are definitely not going to intel subfolder, they have nothing to do with
> > > Intel HW, they are against some custom external (to Intel SoC) HW.
> >
> > Hmm, those "external" SoCs are only found on Intel IPU6/IPU7 laptops
> > and come from camera designs for OEMs done by Intel's camera team.
> >
> > I don't care much either way, but for all intent and purposes these
> > really are Intel USB GPIO expander drivers.
> 
> Fair enough, I can move them in a separate patch.

After looking at the MAINTAINERS, they are not on me. I leave them for the
respective maintainers to decide what to do. The whole thingy was started from
clashes in MAINTAINERS, so far the only ones I have a dedicated tree are
affected, The USB are not among them.

-- 
With Best Regards,
Andy Shevchenko


