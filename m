Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0FC374A0B;
	Thu, 16 Jul 2026 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222747; cv=none; b=huoi5eBQi9RCXdUS6UC/0UvEqLWI/Emznf2GqJuNcXWXUVEU7iQ0ntqfLA6hPCacqdCpzeoWeQLT2NMh4PxH/aDChlPZwOAzURrQfrn7fC0MfQ698kH34xkY6UJkLUH+7P3V15OP3VaeZ7zOV7GNusSPnpSUsAKKuIy8nsZPTFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222747; c=relaxed/simple;
	bh=tXHYeE8gOnqLLtMy9XenuyZxOTDmLya35pKYLAqdffo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIpQjASRSodJoO6Xp087eAisnWIUBpT6pQaxGkjbq9FIj8dt+SHyL5lGAD1J3Io2lMysEKHFHmY8WbU22EAYjwSInxV4Kj11IqQz5BotvxjnOpeNu8ika3bJqc/IbyZCb06N8n9Dq6l3oAgaovKUF/RevKcxa7uwP+t39zS19Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVk39KB6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVk39KB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784222745; x=1815758745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXHYeE8gOnqLLtMy9XenuyZxOTDmLya35pKYLAqdffo=;
  b=hVk39KB6AyQxn8GEUdtjtfy5lyU1nSG5rWt/eHiSjXGpXuGin3Tl3tMN
   M1Bv6maY/1i0aJ5F59Tb7mNYLAeiYW425D0xfDof8qZemeWGZ8Wvb1zU2
   CAVqKrkf5xPntsmwAxs7picUxUBNQirlRfye0sCCWPWW1bY729qOSDxv2
   Edi0AN84Fz+sGuNbfarvN0B2em01TSlf2ZgyKU4CoVO0uIM2eKDX5Jhqw
   5l0O4ZfuUSrqD5bYJFPx5+ahI8WQHAh1vYJv/nCwRSjXvjKaX65xqOBQo
   NiDwChOPesZhvfVwmROhs1LjbPEuCUzy2QNsW30i4n45oUUb02xBdM+9S
   A==;
X-CSE-ConnectionGUID: J9+c1/IIS8eYoT++iJbHYQ==
X-CSE-MsgGUID: 0nCFJJKRQ7Oay8DxM20kgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84931346"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84931346"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:25:44 -0700
X-CSE-ConnectionGUID: 373qAzLXQTOJKPSUMWkumg==
X-CSE-MsgGUID: BP+blqVQRwCKN71SpnQO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="281005204"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:25:43 -0700
Date: Thu, 16 Jul 2026 20:25:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpio: pcf857x: Use le16_to_cpu() and
 cpu_to_le16() in IO accessors
Message-ID: <alkUFLhqBfT9py62@ashevche-desk.local>
References: <20260715163944.1300616-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdzOrvg5bF0oy8s3nk+zarW44je=9RYtzwWknqgD8RrkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdzOrvg5bF0oy8s3nk+zarW44je=9RYtzwWknqgD8RrkA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 07:13:39AM -0700, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 18:39:44 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > 16-bit expander data is an __le16, use le16_to_cpu() to read it.
> > In the similar way use cpu_to_le16() to write __le16 value.

> Fixes: and Cc: stable?

It just changes the open coded approach with the provided APIs, no fix of
anything other than source code.

-- 
With Best Regards,
Andy Shevchenko


