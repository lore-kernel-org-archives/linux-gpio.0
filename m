Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794241;
	b=AMpjecxlOQDKInDk4eRKkG3oVGs5jFq4Vk2O45m634Yi8gGNs+vAUFQ7CDA+RQ1kIdVI
	 vdjI8wwEu4gErWvWIqcvraMpEcC+L+CICtdtE3Yz1UqmecmgoBKnAbjyYb2HgM0Zkz/jE
	 oPHS+kNx09jUaNRTj3VdzQmJnCmb5/mmQWL6a6fzDfZpoQzKt3nD1oRg3R7fGDRqyVK38
	 8rr0bh+A886Jq50wZqeuAqcUxhCks2yLW7QQkPJ4WQbnjuZUxAULku/Wd3LTXKEqBWf7T
	 SbrZz+5eCB9GMAhi8IIWVQWamsIFyNN0snAoZqYKIS4u7B8UtDoqnhttWfgkYbwZvfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794241;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=I+hoG80dP7juUZ0U7TfLYO+Op05dGC/6R7pj+CXFi2s=;
	b=Kbw6pFz094TqnpMNANN+LPlDqfAixD9tiL8tULe5pjdFgmpw7aP00lbg9yh6EfH/NKjq
	 IQ4vaHLe05OKeBeYXOefm0voQhsCD8QyxoUb9dShZTvUKqCgT2HytoVcVEjg2vbKdgtyB
	 xcgYqVypAfAWyP28ID3XvG82Zq9iUu4hYX2NZ4MlXnxR8duqwINzYkaTA9b7HvBCcYBj8
	 jTftbUCFHaLMqdTwtjtn1CYBP48LI49+QdoJX9S0ML00IdqG6EqTuTjN/9gIwJJ9SELP+
	 H+/DhWYAmadF5pZACKmPlhQdHoNiRe6wdOKUb4fI4/zowrgyQlkImNKx03WbIjjrVQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FOtaWm7m;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A3D606A328;
	Wed,  4 Nov 2026 12:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A3D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FOtaWm7m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794240; x=1825330240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YLLolWOuj2zRSp3iYcIk6kE8lMz8IzwzaO3u/mgseyo=;
  b=FOtaWm7msnavlzszsFaBSTnVzr2/TnX24ePUpqYlEpm7YcpAJgpriMGD
   q1QJHo8cXcSzPqK/0AWOEOSDY//xId1gm+kfEVFdz0BrXhPf9NUtALh3p
   pBJh7yJEmeYFcOhL3MM1Qyqm7hCyqyFWrkUC8dXcMkFFqKh/thc4SjxA2
   k35ekEbipQiSnwylnPf2YF+DsJUM6HKDtcFFnaNKqMwch95zIILQor385
   WIYRRmKYUc9q3NtOF9EKG2Q2Vr5Eot4d1yuqJxldOIHC1YAnyOpPTHJPi
   Fl3ZgyFW+X+poDUcHo8HwxbJIV+ueosWrUssr9y69NRv4LDWTbjAluAHy
   A==;
X-CSE-ConnectionGUID: IdRJcp9AQzKTUSCBxzdqYQ==
X-CSE-MsgGUID: vW0pibCzRh++jDf6Wc051A==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2551928"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2551928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:10:40 -0800
X-CSE-ConnectionGUID: hteDh6E0Tn+AMS0yBQo1Gw==
X-CSE-MsgGUID: NdCpof97Sbmn37V6DMRMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6760034"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:10:38 -0800
Date: Wed, 4 Nov 2026 14:10:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] gpiolib: add support for scope-based management
 of GPIO descriptors
Message-ID: <ausguzNd92tWdASB@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-4-ea46767c9cf8@gmail.com>
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
In-Reply-To: <20261103-b4-gpiolib-free-v2-4-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:32PM -0800, Dmitry Torokhov wrote:
> Add DEFINE_FREE() definitions for gpiod_put and gpiod_put_array to
> allow using __free(gpiod_put) and __free(gpiod_put_array) for automatic,
> scope-based cleanup of individual GPIO descriptors and descriptor
> arrays. Place these definitions after the CONFIG_GPIOLIB check so that
> they are available regardless of whether CONFIG_GPIOLIB is enabled.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


