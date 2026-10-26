Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035068;
	b=rwBjBIYiDXpuQqFIq+fb2oKLVyg1X4R0qpJh2dBUHfAtJK1rU4SbiFrpYrxHioSbL4xt
	 Cm3TjDIYDauzFiluDzakVpABY1ERyvWColwqiqOe4TEXSS1dBa2dZwK4kAu2DYL+FaBCB
	 ILfWpnlF4yST6bBt8s0Vg3viB9j4i/NqOEH5ycowB5sIhTnqkeHKxXlwkPseC4yMhKtJ5
	 HKzo1Lo9w4/fBSf/bi5tpxl8s6SBAR2vmC8SQAvB4nbZhbQGEGyk5SNOK3vFjn21liF5O
	 gBXC214B55sBZTiVXqDWkPfHkXkZhtw/WMFaPCAL5mtksTyQpq/KDT9iaUo2daq79Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035068;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=0bq7zwdFnNVfHWbz2ghx2qvLSAaCbMS8abzD+0VQfek=;
	b=SMfUt2cD+GPdnxD1hSapFRUm1wLOzPr7y/hmeLCHYBSG8pcrZw39iD1Q4nlEHoR9rcDW
	 d9eia9WOLuJQsIBRR9qDhia3hEdfchCI4MKlgIpQdgUR/s+x/FbwPZJERu6jvV9NeWJoy
	 wyd4aznIc5M9sW0cclxiqaxz4Hgm1eyJRz/1Xfeh9LlLDeRZ/lMemChsLGkifyExfHBw5
	 CHm96mPRV4Q2aP8K1rFCiSpCQf7eap16gSt7YGpw5ba5JtHBBPFP/8MnvPN5W0Ej9Ctxw
	 H60mo3UyiSqsXtJCVJBIJA63XBv36iqrk5YZ+xjHfBAmQYyPEOJQtZ3q50q92sh4iDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bUZ76Gb7;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A3F606A31A;
	Mon, 26 Oct 2026 17:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A3F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bUZ76Gb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793035068; x=1824571068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vsXa/You2mtoKfAdlDzfw1QFjNQWD7u2SkH9KoHbQ0I=;
  b=bUZ76Gb7qHYaKrVoZiTZwnKyjK1bhOQ8OL+KEDQXcSoumeYW2bKbeAuT
   p1gesibDn5F5AYd4bM7ApIVKyLcyu4xL9mucWA570iED1v/vIu0nj3TzI
   5Ng5bi3cKUIKeywMplpJPZkX4TAARD7NEVP/3smNVace84kHztPYhzoZc
   fHrzLq9Dgq2/qZd5iqxH3jkUZ4ccCYYStBqA9ystAG1CgzpIb72A/ER+K
   gebpm1GvMiS3pl5rO/f240+6SCJ/3Zj8pYpK6A5p25XvaVPWsRhfuzmtS
   KSghhgzBnE5gxQSQdym3XObJoZQ+fMdjgcVfD4LcawEqM4KJLnvJTcwG7
   Q==;
X-CSE-ConnectionGUID: jjslcxdDR0mAy3MLhPeO6g==
X-CSE-MsgGUID: 4kYqgU50TASm1fiqiFxj5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1593230"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1593230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 10:17:43 -0700
X-CSE-ConnectionGUID: zYXO7+drSZKbPn9lsY3rBA==
X-CSE-MsgGUID: 6bvChTVZSPemvqdGDNAfHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4184749"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 10:17:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AFB19121CBF;
	Mon, 26 Oct 2026 19:17:43 +0200 (EET)
Date: Mon, 26 Oct 2026 19:17:43 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/22] gpio: ljca: Drop unused assignment of
 auxiliary_device_id driver data
Message-ID: <at-LNwEMyHEvpoJv@kekkonen.localdomain>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <6fe1e37942ee2f4d8ecfb4ff1a2313b9934165d8.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fe1e37942ee2f4d8ecfb4ff1a2313b9934165d8.1793030820.git.u.kleine-koenig@baylibre.com>

Hi Uwe,

On Mon, Oct 26, 2026 at 05:28:17PM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly sets the .driver_data member of struct
> auxiliary_device_id to zero without relying on that value. Drop this
> unused assignment.
> 
> This patch doesn't modify the compiled array, only its representation
> in source form benefits.
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/gpio/gpio-ljca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index f32d1d237795..ad5dc9a3a119 100644
> --- a/drivers/gpio/gpio-ljca.c
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
>  }
>  
>  static const struct auxiliary_device_id ljca_gpio_id_table[] = {
> -	{ "usb_ljca.ljca-gpio", 0 },
> +	{ "usb_ljca.ljca-gpio" },

If there's going to be v4, how about moving to named initialisers while at
it?

>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);

-- 
Regards,

Sakari Ailus
