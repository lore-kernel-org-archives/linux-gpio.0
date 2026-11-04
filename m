Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794045;
	b=2t/87nYo5kUTFr/LvdjLMEP+ZqwCgZca2wEG9olMQR2CeuOC/FwgfTnDOd//NSnDX7sC
	 G4u1GdeQXLAS33el2DGBRFXNWsx/hJrsEUHIYn5mCP9Oca/DIruQKF7uXHe1TmxLmlKRY
	 4chH/mU+Tj3aRe2HVQdmOK4tmM/dBYvNAxSgQR4Sfa+vbVbST7VtIUxQz7jznSYRsvNMn
	 UnNKawwcMsMeNfttk/RbPLaJDkWywXzzs6TCAbtka3rtXLjWCjEbbNlJv2CbbrmVVPPee
	 a2JxzeZDOm0KI/W1WO7ZDgdHL3DJFRrBnEAm8fSB2Dn0GID019l0O8ZO4Mou/TF2NqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794045;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=8+W0mSMm7N8RjDXvVbUUQnnEK8LSP7BZWWdgDt4N+BI=;
	b=xHvOJU4wW2EvHJch+ZE4Thf6M8oTCXja5E8N/XMSukptUvO1QmQkyM+W8VJ1hX5BVHrb
	 fUOop+YA3RdikKj8TQSc2KcBG1GX0kYEsamNJSTS6R3Op5+Iy7biv2MkaPKh47yMOnE12
	 HBGO9EHZfrjMv4QYkGN8YxYmQbn41WF8QqLawxkkgu0Sl6HfalbOdEGcH+8Vfy0zj8VEg
	 gc/6ZLAoo9Yh+Y02igxATIsabwIXmipDJfi1jxu4+Kuf/Nxd68lcKXaiOIS4rDHKDI3ct
	 ZIWYpUuFEbgozcT8tmuq+FNv3L7/7i+y2mMmaxm1q2Hwj/glsEVq+vXGcg6GguVScHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ip7AW2cG;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28840606A31B;
	Wed,  4 Nov 2026 12:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28840606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ip7AW2cG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794044; x=1825330044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1IqsFAjVSNcz2M1zl3RMPs7mGuQtKqGY99mHg4reN1c=;
  b=Ip7AW2cGbbYdk0Z5k4IneG7AYKW/SwOuzDBbfP7JTP7nqHEZ1csJE3o8
   vV7yRQ+D9U9CgdEvjlrRvaRtlIzM4QY/iurMC9CMi/DcNd+nU5rFRWMfv
   519wawUJC8RC2kk+6S9EzgpRWP2pOEHvlEnJAPbkps1/081DOQbpqjWFB
   w/SCkotWBYp2HiXNDZlEdgo97zAah1eN5zzjDFbOnCiEqb7UObk2nU8zq
   gbf1wH9n89emDyPR//dza1vU+v60IfoZCPgIZERXtdDzqzIvwumWzpyZl
   m6O9su3w30sKA4g5i6ebz1lKVduBIPw07O3UITBtrNx4nw+ju0Lr4fig1
   Q==;
X-CSE-ConnectionGUID: 0lxy8M9rQdCo4u82+twumA==
X-CSE-MsgGUID: EQRsotq3TIaFS2wI2xp9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2423774"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2423774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:07:24 -0800
X-CSE-ConnectionGUID: sGoH/EGZQaOyEyZWcgAm1g==
X-CSE-MsgGUID: +9k1wlIGQ1Gq8Il7SswsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6529338"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:07:22 -0800
Date: Wed, 4 Nov 2026 14:07:19 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] gpiolib: of: return -ENOENT from of_gpio_count()
 stub
Message-ID: <ausf98EcpdfUCPG7@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-3-ea46767c9cf8@gmail.com>
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
In-Reply-To: <20261103-b4-gpiolib-free-v2-3-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:31PM -0800, Dmitry Torokhov wrote:
> gpiod_count() and its firmware backends are expected to return either a
> positive number of GPIOs or a negative error code (-ENOENT) when no
> GPIOs are assigned. However, the !CONFIG_OF_GPIO stub for
> of_gpio_count() returns 0 instead of -ENOENT. This causes gpiod_count()
> to skip the platform_gpio_count() fallback (which triggers when
> count < 0) and erroneously return 0 to callers.
> 
> Change the stub to return -ENOENT to match the real of_gpio_count()
> implementation and the other error-returning stubs in gpiolib-of.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


