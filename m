Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611380;
	b=nrEP6u1szHAUsI4Lt9JcnceTzKfo6NuKda3xxxnlXUOElglX0HTlUVuXdnCK8/o9TNTw
	 UHipA0wrWVzJ9nBz2pBTjD+wE87mVecyAXMomWQ8JQ4p/xjXEN8tXQM4hfkrRsFaIyumS
	 X+tWujtjib2kXGNnVjHkgvHW9mUmV2VR9v+Dfgpv46Nuq8T+hamSStgeAOXYogAMaFy2M
	 e/FxEEVqwX1Hx5D+CvCn8zKmGEUpx/Vlg0iM1GGm4r8Zy9E09h9xG3O7h9Vaet4XV7f+l
	 6UvJK4f3tW8bpLqYAAelp9pofpBo1WkdNZHIETasCK8NCnViL0ydIhvMwgdj5/E9V0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611380;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=3IGUseI40MqPdD0NpY23mwRSw6A/J82RH4n0DAnM5CQ=;
	b=0Od5JRuwIDR/UMagrGbxCeS8NA5CK1pqAUuC8oxvG1tYOb2H79EjaHTvuc/5Ab+p0xID
	 XOF/r9ytLv4zwn2n8HJvNWL7CSLbNDSyRSQRGhJ1XHWXvIEqBdrjq8CVBxTL0zQS8bykV
	 V72+UwllnyfTUeygLgScPLPyjUaffsy6YsoXVhQTRLVvbJ5oHJiwGHvss8VuIzCLi/WfX
	 eY0/BdCe7Pf8QbN+KlFeat3yGvowBj5RlYT1NGh/CEqZmQzxtz8Djgg3mcyZ6ZG35K4l4
	 Nx5/IFZWcu9AivXTA4Zcd81C5lb80TsaOcDQ7CvGGs6nTTCkVX91Urxw1KpOG3Ve3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWBWbiX4;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12A606A319;
	Wed, 21 Oct 2026 19:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E12A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWBWbiX4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792611378; x=1824147378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o6IGDHhyaKPhqeK2syHO1GGdrtN1YNiw7Ek+GHTQdQI=;
  b=PWBWbiX48OqmcMFHPz3GLdOzFbX2lyCsv1F/GBv2shNGfK1P+5acOOZ/
   T9u1eVCkqrj+whZYGGklOcp3mpbiO8y26f/jmAB+1pcy6S1dQJANE5eWn
   ELYJ+KikvYuPI2RCR0S13uAlzU3uxQGx7QWa2lB9jDMS7Tx0vh3an7dwf
   MLXAXxgz6C1qKbuzeb4tVpuYvcVU+De6CH9llp/6eMfhjvFTh/Cb0aeME
   8ObltuS8sJvL2ZUwNF4/JYI7iqjqXQLH8g/SEA5utDMeyL6aQRKhBgD75
   9eLruleCClYUjaJTR3uNBAhWIZ88+K3YTN134069XA66iONTkx8N3PJlM
   A==;
X-CSE-ConnectionGUID: cUd2VkEuQ6mmv1jh6ZwSlQ==
X-CSE-MsgGUID: HP3FfvEnTHOvEyRfF0zdlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1382932"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1382932"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:36:17 -0700
X-CSE-ConnectionGUID: i7hHaMERTrahMKsJtk7LWw==
X-CSE-MsgGUID: +cc+XFosTfuAMk05aBdRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3171131"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:36:16 -0700
Date: Wed, 21 Oct 2026 22:36:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] gpiolib: fix GPIO descriptor leak in
 gpiod_get_array()
Message-ID: <atkULU8_9xQ1c3eY@ashevche-desk.local>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
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
In-Reply-To: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 12:02:06PM -0700, Dmitry Torokhov wrote:
> In gpiod_get_array(), descs->ndescs is used as the loop induction
> variable and is only incremented at the end of each iteration. When
> krealloc() fails on the first iteration (when index is 0), descs->desc[0]
> has already been acquired via gpiod_get_index(), but descs->ndescs is
> still 0. Consequently, gpiod_put_array() frees descs without releasing
> descs->desc[0], leaking the descriptor.
> 
> Fix this by using a dedicated loop induction variable and incrementing
> descs->ndescs immediately upon storing the retrieved descriptor.
> Additionally, since the fast-path array_info setup only executes for
> the first element (index 0), simplify the bitmap_set() calls to start at
> bit 0 for count bits instead of calculating offsets from the loop index.

Can you start doing cover letters, please? The problem is if I want to give a
tag for the entire series I will need to iterate over all patches, while `b4`
has facility to do it for me. Also with --base it would be easier to see which
base you have used for the series.

-- 
With Best Regards,
Andy Shevchenko


