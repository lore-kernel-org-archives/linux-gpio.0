Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F6367B72;
	Sat, 26 Sep 2026 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401351; cv=none; b=fcNwgUnay0jgsyH6nPPA61rrmzloFD1iJhyjGJvgD1vNCgCQTEw2pQzU1jT5pgZgReZWVznP3vFk4aki1Ksn4kv1+bektQF2k7KJA/r5nx5kzGXbFT+8W7Z5EC5xQGPwxVjTBFfQGUtSTVmf/6c3fsnUu8tNWY34bsNYBouUTJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401351; c=relaxed/simple;
	bh=dZ3lNZ98ohXvLya75m4DQmZEbMsVqt7sY1iKQ2ppqL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pm9+rLNx07AGgcBSVV4R+Q2ADwKCM86yhbtSux3383PK4oHyg0HKPHBEn6aQ3UYkT0CNLldrzZq4iKPkcQJ+aqUi7eZM91QaofmVA1RXPPP5Lh5uj8m+TFHGkpqGbM1AmsTqVIpQ/Vup8FhSklUuJnh/bfieCrzPnRVHU9s3umM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNAgiwHN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNAgiwHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790401348; x=1821937348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dZ3lNZ98ohXvLya75m4DQmZEbMsVqt7sY1iKQ2ppqL8=;
  b=nNAgiwHNCAD90Q2FmiwtVhPjIM401p+vOr42tkqHJKWMsOdAi+T2Jwo+
   cVl20yDTz3krsIdLts/SfBo8eQ0KX5+v3gFG71BkYCcID+/nmW29YmNhj
   RwLakE6aFtxlJFkTb59OUEVrWJNlFRCWghB7phPoe/n8O11At9mmpTpJ8
   3rJs4un92YxBurHLnIjj9XSA3BI0tqIVP8/4VjEmaWrAqMiRJ6n/D6l3p
   veNmmIOeiumvNBZM74EfhQTcNcC6JfyofFNga68dFSyU7fBwOrva1v5T+
   nrVgy4da6rZ4oxyhTWdjM46HL2dCrzDwZWqeP6RJoJNlAnV2vfcR81YAu
   w==;
X-CSE-ConnectionGUID: aMTdCMtaTledLSHqnPKy6A==
X-CSE-MsgGUID: OlhMSD1pTdqc69kJC3hZGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="112968247"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="112968247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 22:42:28 -0700
X-CSE-ConnectionGUID: Jfx69RieSL66IMT+9d8hpA==
X-CSE-MsgGUID: D06XQDR8SfiEYtC0O+iY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273719570"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 22:42:24 -0700
Date: Sat, 26 Sep 2026 07:42:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Junjie Cao <junjie.cao@linux.dev>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 1/5] gpio: Move Intel GPIO drivers to the dedicated
 subfolder
Message-ID: <ardbPbkc5IyZWsZo@black.igk.intel.com>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <20260925160913.1648565-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925160913.1648565-2-andriy.shevchenko@linux.intel.com>

On Fri, Sep 25, 2026 at 05:57:03PM +0200, Andy Shevchenko wrote:
> For better maintenance and development experience, move Intel GPIO
> drivers to the dedicated subfolder. This starts with Intel MID
> and Elkhart Lake ones that share the same core part.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> ---
>  MAINTAINERS                                 |  9 ++---
>  drivers/gpio/Kconfig                        | 31 ++---------------
>  drivers/gpio/Makefile                       |  5 ++-
>  drivers/gpio/intel/Kconfig                  | 37 +++++++++++++++++++++
>  drivers/gpio/intel/Makefile                 |  6 ++++
>  drivers/gpio/{ => intel}/gpio-elkhartlake.c |  0
>  drivers/gpio/{ => intel}/gpio-merrifield.c  |  0
>  drivers/gpio/{ => intel}/gpio-tangier.c     |  0
>  drivers/gpio/{ => intel}/gpio-tangier.h     |  0
>  9 files changed, 50 insertions(+), 38 deletions(-)
>  create mode 100644 drivers/gpio/intel/Kconfig
>  create mode 100644 drivers/gpio/intel/Makefile
>  rename drivers/gpio/{ => intel}/gpio-elkhartlake.c (100%)
>  rename drivers/gpio/{ => intel}/gpio-merrifield.c (100%)
>  rename drivers/gpio/{ => intel}/gpio-tangier.c (100%)
>  rename drivers/gpio/{ => intel}/gpio-tangier.h (100%)

These are already in good hands but I'd like to be atleast informed
about these. Although I'm not sure if it's worth a dedicated entry,
so I'll leave it upto you.

Raag
