Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7253446C;
	Thu, 17 Sep 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652286; cv=none; b=fM4NlhreokUowdQXOAgLYAL5QGmnejdxgBRusGeZBn3ekY1S/H+7gDrDn/opoDILCTqO/q2m0PqJUS7Opd+UZv5RLrSUFB4bSG2Aj/lUcdSvOxgXeJ459trILtqDkakDOyABKmDQw6fmDkdKjFECcbczbOPdQK/7Jrz6iL6+bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652286; c=relaxed/simple;
	bh=ZFuEU36AkT47xv5vzuHoDGth6bzwJ64pL2uhWVRXX+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8OeP/JrqGPYstWo75UFOCDTeTaHWTWQ7YZGhqszM47s15Kg7z/WXhp1X7U/sB6YvDA+g4xeKuP/yn1eYif03nbfE/Cs0LeC/K/M3oUaaQlhYvs+B7HDznwmAvPsueNXiNh/sPBnxofXmk5Jd7UCwg2hViIA4mySUy3oLGEU59I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWLOoiMc; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWLOoiMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789652282; x=1821188282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFuEU36AkT47xv5vzuHoDGth6bzwJ64pL2uhWVRXX+4=;
  b=MWLOoiMc6uJQW0CrhD7zCbgjeRzLgZLUKct/QtxB94KXMv613wM8FnQe
   lgVAft2pdVN2vCosM7jOHKo6A5vNHc2kPhi7tn1xT1AtSo0kBazu0zBWW
   mclUUiZeDuuxP4ZBpg818YqiXGuT8+efR3mRGzPqvl+9eRjoH93UCmHXF
   T5hkLomONXq4git4b3/G543p8EWo5vX0pVKMHXYH0zKuJz/kXkIpGeth9
   sm7yRyztpm/dCZXVxhy4roewqxFM//3x1T1E0UFY6F2bXyDE5c8PZURwF
   dbRlYOwDEMWkrNa/wOLATLvPqAxwHZOugYfUXAO75vcfWMg4dItUxkiyk
   A==;
X-CSE-ConnectionGUID: +Vx76eIKT26t+NDacHVFjw==
X-CSE-MsgGUID: UauL1E+gRoaU1c0cvFWPkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="584530"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="584530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:37:57 -0700
X-CSE-ConnectionGUID: ngR9Vu0ZT4ia7vCSQeX2ag==
X-CSE-MsgGUID: bHVJKZMWSUGhwImD+rw4KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269519813"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:37:55 -0700
Date: Thu, 17 Sep 2026 16:37:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	frank.wunderlich@linux.dev
Subject: Re: [PATCH] gpiolib: use of_node_name if line-name is missing
Message-ID: <aqvtMDiqCzsxUDKw@ashevche-desk.local>
References: <20260917122815.88601-1-linux@fw-web.de>
 <aqvkU_1_ki5lGXS_@ashevche-desk.local>
 <85b0d147af3b63a6b2419b7daaf81332@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85b0d147af3b63a6b2419b7daaf81332@fw-web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 03:20:49PM +0200, Frank Wunderlich (linux) wrote:
> Am 2026-09-17 15:00, schrieb Andy Shevchenko:
> > On Thu, Sep 17, 2026 at 02:28:13PM +0200, Frank Wunderlich wrote:

...

> > > int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle
> > > *fwnode)
> > 
> > >  	fwnode_property_read_string(fwnode, "line-name", &name);
> > > 
> > > +	if (!name && is_of_node(fwnode))
> > > +		name = to_of_node(fwnode)->name;
> > 
> > Can we move it inside the loop? Yes, I understand that it will be
> > unnecessarily
> > called more times than required, but gpiod_hog() is called anyway in the
> > loop,
> > so I don't think it will be a big deal. With that it will allow to group
> > OF-specific code in one location.
> > 
> > >  	for (unsigned int i = 0; i < num_hogs; i++) {
> > >  		if (is_of_node(fwnode)) {
> > 
> > 		...somewhere inside this conditional...
> > 
> > >  			/*
> 
> I'm not sure what you want to achieve here (maybe only to have the
> is_of_node-condition once?, as the loop imho is only for enumerating
> multiple gpio (like "gpios = <3 0>, <4 0>;") inside one hog of_node.

The primary goal is stop spreading OF-specific code. If you have noticed the
function was also rewritten (during the move) to be fwnode agnostic, but that
was not feasible by 100%, the leftover is collected inside the mentioned loop.
That's why I really prefer to keep all OF code there.

> Here the node-name will never change (like the line-name above) and read-once
> is correct.
> But while looking at the code i also thought about these multi-gpio-hogs
> (label and output-X). Imho here something like the gpio-controllers
> "line-names" would make sense as well as something similar for the output
> (or just handling this with the GPIO_ACTIVE_HIGH/LOW param).
> 
> But if you think the part should be moved into the loop, that's no big deal.

Yes, I think that way.

-- 
With Best Regards,
Andy Shevchenko


