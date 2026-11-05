Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889311;
	b=ljjOmA0XRkvlJkpOY/3Jl0oJZiYE1XIyA337MIaoGRUmNjaKaaFKE5JOGaz4Ss+1QFEw
	 tqvz7IuLNUAMRH+Bz5opEWvR4nv5/le+BPrYvPWCFMjoAl9Fxd1GEQPBdYQBuhwlPrpMa
	 Yu1zF+aeKuoD0SSgZ6yOSKlmVK9/8U338ZRG/6ScgtwSFcOM7MxWd7qUbPg32jBmifyvL
	 BRSPA+p15c19GRrCj3Rs53vQbqlb0VteiO8aIGgIqiP8BkQBMK58+9hDa28NhS69od7jK
	 347xv1lPbLZrLpry/a6knir6q5rn1KNcpLd2ijp1HryajTFqKDDVNKHU1VF8zNFt1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889311;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=xZ6T3yAREIItW/bwTXHIxKkqe7d5KDdF5/q0orT3gmE=;
	b=T0PP5rCOJ6D9QgrFQab+KKiZdH5dolAU7oFORx4qzV00sTcx0MG8r2oH78ffgK/5xXkJ
	 1ZxsJeRhmjRPKMJu+s+bXIMLGeAEnV6Z/e8JGv2An8gkHMlEi+Ughz1SCuA+M/q+1TWB5
	 CNfRObKHagxDpCdBmJbGPS6odH8BNHZDGnipKMWyEtgcG/pmJ9jfra3JZMDxBfNqZc3Q3
	 mBZ1ZpE03k3qGWHO43MLfJlLPS4Kkj7AcN0KUN5QUDsUpH4RpzT0gCCAfaAxX2cMQB8VB
	 ni8LsciJk2ej8F6RKQBxkiETnvOB1uSsSzIoSJPD6TLRJiiYJ5dk70ZMJSHhA3ZZc5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BcaWpAx/";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30609606A326;
	Thu,  5 Nov 2026 14:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30609606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BcaWpAx/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793889310; x=1825425310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vHqNRWEYuZGjg6yuqfqM5YBUd51sOvP0Z86/uH+jqiM=;
  b=BcaWpAx/JYLCntm8XSNQgrrLSJszz4zVy68goEE9a+aUuR5SUOH10cyg
   T+vc9pYb9/2ezuKwBnDo+8NlLz36S0M45o5pinyaFqboCn1C6gb2Q9WII
   ozXlszwWbp++EY6zGT4QrOIoHpdjYbCGqY4hvpbJ9liAFO91Wx12sAKEi
   5hv6Al9BHvO34f1HdRGFJuxJQssBlvTa80YCa7sOObXCFzPrLavd3pJXD
   VZQNlOba1Mft2wq9Ayww3mGmhkerV41otcLXOVrfhfwODJfFFjkXWvUv1
   jkPZTuyFHX0IdeCUvnBkFHgO/M6OmiPaqHlUDs33QutUPhN2myotAFxbJ
   g==;
X-CSE-ConnectionGUID: npg7ws/lRK+dDUNkZcL64w==
X-CSE-MsgGUID: OF2Aq0zYQ6CQpmQWeO3Vow==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2567093"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2567093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:35:09 -0800
X-CSE-ConnectionGUID: YBqyl/1kTbaNqfFgCeeMvg==
X-CSE-MsgGUID: s/azyhZAQJ+hDf20Qt0zIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7365899"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:35:05 -0800
Date: Thu, 5 Nov 2026 16:35:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
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
Message-ID: <auyUFrrAYLobE_cy@ashevche-desk.local>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
 <CAHp75Vdocfk5b7GkL21z4nKv4mNcGMF4Y_aZP_sPPeL16FrsdA@mail.gmail.com>
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
In-Reply-To: <CAHp75Vdocfk5b7GkL21z4nKv4mNcGMF4Y_aZP_sPPeL16FrsdA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 02, 2026 at 10:48:42PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 2, 2026 at 5:33 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > On Fri, Sep 25, 2026 at 05:57:02PM +0200, Andy Shevchenko wrote:
> > > For the easier maintenance and future development move most of Intel GPIO
> > > drivers to the dedicated 'intel' folder. For now it only covers the drivers
> > > I maintain (as per record in the MAINTAINERS).
> >
> > I wanted to apply this in order to see how the menuconfig looks like
> > with it but it doesn't apply neither to next/master nor v7.4-rc1.
> 
> I will check this as soon as I can (currently I have something else to
> address which is more urgent and it's not related to Linux at all).

Actually I can't do it right now as it will be a race with the incoming
patches (for example, I see gpio-sodaville change in the mailing list).
Can you tell me when it will be the time that

1) your for-current is present in for-next (so no merging conflicts)
2) your for-next is closed for new patches for a few days?

Only with that I can achieve some good result, otherwise you will always
tell me to rebase/resend and while I do this, there will be a chance of
a new contribution that continues the loop.

TL;DR: I truly believe that the best timing for such a series is just
after the -rc1 as a first batch against for-current *and* for-next
(same piece assumed to go to -rc2). But of course, we may resolve
the potential conflicts.

So, what do you think?

-- 
With Best Regards,
Andy Shevchenko


