Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679958;
	b=RC6HMZdmrSfaWpcuCN7onQmAK0zcx/XWU5a4KNAQucGp+FQxoiXWCxFlX9IICc4LD6xp
	 gq0JVTiFBAIu3nHLphvmHrC4etazPKO7lIq2wu4BtICCIuK637LisPIQn9/jy9kb3cBwY
	 5VKgD3NGB9sussBUJGDvwoTL+Z0fyi+f66YA/e3MlWiDfWoqc/Yr3OjnRyCbnx6mzN5Q3
	 BNIal0BDgLMVIQQUqxFUW1fCbavQLGiUiTzln1nqFPdby8uW4pbw+29d7sLoEvXbg8HHV
	 upO5vQY8FzC4wVipck6KoX9mN+z68209J/AcsRh1OVicHNXskv3vQBzNn5XR4wHwIEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679958;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Ay2dAxYWfMnhM9xJPPfFSkhbkrQTRaOckqI85OWR7Xc=;
	b=vR748Q+g6PPRCa/tTH2JyJF+ahVitL3+q10G6zy2YW8gNG55EgX7hvmB9dj1V1deZH4+
	 KE+1vIQB/uNMGRTMxe5e3QZc0TEw879qd+KF0Ptv2xx/aNH4sau2e+TFlKH2jNthYF3Lp
	 ENova9XkKXLjIwTJf+cVBcj8lajwzantX+yyBzKhhgg4gSjW3ctz0PqIpq3v5wXDIWXxj
	 BmVOkjs/5fhl1wO7Z8cXwJBYjbrv9bEit4bY1YwPwsogAO0DjX2VNkxxtjdMkiw8h7JfE
	 /KHq/JfsvQLzquEE7k29/yQVSUPCBMQmxH0OcdMf9vXoxGm2RdUOJNpEz+IRyWQx0lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdNfDTm6;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B138606A319;
	Thu, 22 Oct 2026 14:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B138606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdNfDTm6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792679957; x=1824215957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B4+XEdsVBeguDOEIlkOZq29w4jkQR2Fe80SlxDptpgE=;
  b=IdNfDTm6OsiuytVypHtmSnY3hvU8I7ah9cr7vW/FEX/PXc771MuGgRBM
   azI5m7Q7fkFBGn3wgCOwQ9HCHbLbW9L4/HVLf4tBHOkm2aulXhcm+EMkZ
   +tAG/Bge8epRK40oz/hrrusUJE+halPMxeoUBXGvjxbv3we0C3FtPlVhg
   Sh6NjxVwDNVI4JgiJndSOns3b45vRpuwzUvWdyqFnoYhfxSj8HS8l/C1y
   yWNZ/jgwfQ9UoIONM3rGOJGlGrCmMDuftQNLuqVuZvPX5/Vofkc3IhB1R
   gTfCybGwd6F7wqjXNdNteqDdnYiOMbo0kA7MmBEp+4Ddl+SADLyNLD8BY
   w==;
X-CSE-ConnectionGUID: v9LWILIoS8OkQHBEkRXSpw==
X-CSE-MsgGUID: nWZQT+TbRkOukSZpY1bFLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1438626"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1438626"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 07:39:17 -0700
X-CSE-ConnectionGUID: pSImwiEvSl64btL9eh7LHA==
X-CSE-MsgGUID: zlK7GDk/Qey0Buv0F3czrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="5217544"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 07:39:15 -0700
Date: Thu, 22 Oct 2026 17:39:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Moelius <sam.moelius@trailofbits.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
Message-ID: <atogECYXhbdRkzT6@ashevche-desk.local>
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com>
 <atoQfGQZeJDU3eMF@ashevche-desk.local>
 <CAMRc=MfALArmtGmv6h_sPrwxQrqyjOECN9m-GVb9DKQ4kyBE1A@mail.gmail.com>
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
In-Reply-To: <CAMRc=MfALArmtGmv6h_sPrwxQrqyjOECN9m-GVb9DKQ4kyBE1A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 22, 2026 at 07:05:55AM -0700, Bartosz Golaszewski wrote:
> On Thu, 22 Oct 2026 15:32:44 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Thu, Oct 22, 2026 at 02:11:38AM -0700, Bartosz Golaszewski wrote:
> >> On Wed, 21 Oct 2026 22:44:42 +0200, Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> said:
> >> > I have noticed that a few drivers use almost the same code to dispose IRQ
> >> > mappings. This series to deduplicate the efforts. I only converted a couple
> >> > of the users (there are potentially more) in order to stay in the same
> >> > subsystem.
> >> The "few" being 2 testing drivers of which one (mockup) should ideally go away.
> >> Do we really want to add more code to GPIO core that will only be used in
> >> testing module(s)? I don't think this is useful, sorry.
> >
> > I meant a few. As I pointed these were chosen explicitly for the sake of not
> > crossing the subsystem boundaries. I looked at Broadcom one, it is so big mess
> > but I think I can get an advantage on it. Also there are other drivers that
> > just need more work to check (and many of them are outside of drivers/gpio),
> > but I'm pretty sure the new API has a good potential.
> 
> Would it be possible to provide at least one more user other than the testing
> drivers?

Sure.

-- 
With Best Regards,
Andy Shevchenko


