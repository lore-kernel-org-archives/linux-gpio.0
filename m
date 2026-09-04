Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E463515D5;
	Fri,  4 Sep 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511902; cv=none; b=Fc+WiC5hPbT9/SlgonZmTkrW2GRHtk2mmPvmlrhPnbMLfzaVXbk8lH2YoRNNBjgPWKREUGuB9XAFwJ96E4qlmuPVeAxMshC55cSlhml97f8ue5jIEokLgpsg+N1/yUOb17slHo9Nf/XqDWZLSJ4Bsm/LeqjGKeo64l8iELtJnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511902; c=relaxed/simple;
	bh=HFyU+wtuqVl1OhsGE2J2AqEsK6SPqW5j/NxE2M0U2LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvdXz437Ob120oRr7x05qKzY88C7s6D0+O8YlibilfgjLSFsF2adh+WUoKuyYnZ7FtR4F1p171Mrj0FKUnkiJiRhgCz5z6yBfjBUg3lLoK8OGWCOHfmNvm6LczU5PCE/wq8e7SaQnvXOIXYFy4QLcN9v+3fD8O2dHMMISL8Lo5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzawXBh2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzawXBh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788511900; x=1820047900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFyU+wtuqVl1OhsGE2J2AqEsK6SPqW5j/NxE2M0U2LM=;
  b=NzawXBh2CrY8UlOEobShutr4ieCvWHlNdIu/7ZWHSKVBuTEz2hcBX9EN
   VB4EoZpKxk7lDxexNPvqwOIw8nFv9ba8djvMJYjSSjn4Rhz7+V5DPYIsS
   CC8NTUJqRPVhze13ksX1CovSHuNWLoLHOTxiJecgZbmR4fQtF1yzUSLow
   /f4vuurrTDr2cr95ySkb18ZZnuLDHZwvJhT1cZG+OXb9JeGMygac1tqy3
   LLwZzahZIS10tgt7Jbqh46TPDqQuw1g02bBrdk/dhX2TdhXrwsnUKALSI
   dr0EvS/D0DBGG8o3xeYAlOdkpRd3mjIRsGZe8dUd2IGSmZzdXhGJ7BMaQ
   Q==;
X-CSE-ConnectionGUID: ufg05wGXRYmNCK1zCBEbOw==
X-CSE-MsgGUID: qvFRKKC3RoCsGj1wnJde3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88773618"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88773618"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:51:40 -0700
X-CSE-ConnectionGUID: aJtcyb1sQnGh0Ru4p440pg==
X-CSE-MsgGUID: cGwTKMg6QOK6ir9lLM7HcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267407910"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.250])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:51:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D65B11F894;
	Fri, 04 Sep 2026 11:51:33 +0300 (EEST)
Date: Fri, 4 Sep 2026 11:51:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <apqGlTiybdvQX3Ao@kekkonen.localdomain>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>

Hi Dumitru,

On Mon, Aug 31, 2026 at 04:21:19PM +0300, Dumitru Ceclan via B4 Relay wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
> 
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
> 
> This series depends on support for internal pads, for which a patch has
> been added.
> 
> The previous version is at:
> v15: https://lore.kernel.org/r/20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com
> 
> Since the previous series, Cosmin has left Analog Devices.
> Because included changes from previous version are trivial, his sign-off
> and tags were retained.

Can you check this
<URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
please? If there's a single patch that needs to be modified, I can squash a
patch into that, otherwise v17 it is.

-- 
Regards,

Sakari Ailus
