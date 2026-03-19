Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7351F2FF643;
	Thu, 19 Mar 2026 07:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773904196; cv=none; b=oD3A9QD+NqyzBePfHqcri5pg2aSFx2OsRyC3ohqtAMnN/rJ2l5BO1axA/GK5wyVmZqux9qTeohVWd86otO8HNOe48aAhs8ukSq8HQACHyCo4CphXtbqANiu+XtWVewcNoGd712UL5MbMMeXD14BrFE+uMfVyjGMejFn0Zj7H15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773904196; c=relaxed/simple;
	bh=+uTUKjKxXmHva7e0PJ8+VpMDJ+oqhUgZGm0L/Ce6/fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AF+VWMcRT7YCslOSiZtRwN0df+RV0kg1qYZDIt64Khq1lzNRbnTYlxJUMI03ynvqvgTHwkCMpt7JtiPsfxmXWOuTAJ/G74sYdE37JOMoIo54LxXtg81ExLVWK2B5ZYXV3nV28ckmD0GXoQ/vQnF8LqDyB6MmxNCZokBW0uMVi8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfWCZLyt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfWCZLyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773904195; x=1805440195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+uTUKjKxXmHva7e0PJ8+VpMDJ+oqhUgZGm0L/Ce6/fM=;
  b=MfWCZLyt/OImQMGyCVqyBWD9S+nG5JZNyNCVOMDKxT6obtuO490YmP67
   QtVv/P5xnCl0d0tvvy+hX7DALCnEXRQodsQhINLlpW9LmmxUSbASmKTfW
   itGocjrvTwnuUSpnPhBTUxFB6d6vDjdXJz+a13gu/q1cHJS2sz/C8pCco
   c7pngx1OWD81fpvURCVZr0hBu4k8wzjL17gzLxItjal5T5/MsddSU9jgW
   PdaK7bpf2J4OR8Fp+887sw9sIZM8+jEzqm/z5S0Eub1Wh4PA6lKEZXudy
   ZvDM32I0TQ5y709Izv7MeZGqDe6QpI9i2K7wgRtdOvLwZSQnNFgwsyl3P
   Q==;
X-CSE-ConnectionGUID: J/29SY9iQSiMXjyH+gYBVw==
X-CSE-MsgGUID: WBjuy8AWROiI8wUdhM7ycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="97581025"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="97581025"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:09:28 -0700
X-CSE-ConnectionGUID: 6auqz05oRiqbJq6+Fmrw/A==
X-CSE-MsgGUID: O86xsRtcSOOrmgwor5E0uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227354834"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2026 00:09:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5EF3F95; Thu, 19 Mar 2026 08:09:25 +0100 (CET)
Date: Thu, 19 Mar 2026 08:09:25 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 5/5] pinctrl: intel: define iterator variables inside
 for-loop
Message-ID: <20260319070925.GS2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-6-andriy.shevchenko@linux.intel.com>
 <20260319060221.GP2275908@black.igk.intel.com>
 <abuedvr8_FauBMJW@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abuedvr8_FauBMJW@ashevche-desk.local>

On Thu, Mar 19, 2026 at 08:57:58AM +0200, Andy Shevchenko wrote:
> On Thu, Mar 19, 2026 at 07:02:21AM +0100, Mika Westerberg wrote:
> > On Wed, Mar 18, 2026 at 04:10:19PM +0100, Andy Shevchenko wrote:
> > > Reduce the scope of the iterator variables by defining them inside
> > > the respective for-loops. This makes code more robust against reuse
> > > of the same variable in the future, which might lead to some mistakes.
> 
> ...
> 
> > > -	int i;
> > 
> > If there are multiple loops, I prefer to declare the variable outside of
> > them.
> 
> Why?! It's exactly where it make even more sense to hide.

I disagree.

> 
> > If it is just a single loop then for (int i = 0, ..) is fine.
> 
> ...
> 
> > > -	for (i = 0; i < grp->grp.npins; i++) {
> > > +	for (unsigned int i = 0; i < grp->grp.npins; i++) {
> > 
> > also why you use "unsigned int". int i is fine here.
> 
> Because grp.npins is unsigned. This is the common sense to use the same
> variable type that's used for the (upper) limit.

No, just use "int i" there. Compiler is fine and this is more idiomatic C
anyways.
