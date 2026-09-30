Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B0345EA2;
	Wed, 30 Sep 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762119; cv=none; b=B+h+HDA68fFrZqKewoIcgmjhv4SugKxC5iUSeL3M/p8Pc2Wxct/UFkTSGBlF3mlyeDxkpgjiy93aCxWsqwZAqW6FRoGx4enTMjg316guBVIWSfhkIxQ9phLs+vNs2ea6mN6eQYSpjq5Mb4H8k3L16B+WULShB8rAFLezUv7sDiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762119; c=relaxed/simple;
	bh=e9dwwle1xBAGCtdw2f7HOoEg+HRqdHzLnV9H8CivWgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ionq3RYORcnH90UCKHqgkYMsQnh6NExAwRAv8qgJ5NGXvAui6wVsQ0ugLpdxnHoGqxXWZmYbXVo5Yex11H9ol3pYmuqOz2xWgf88REkrpyNF6nkRmakb/unyO/AM5PbdHk5nWC3hmpBx5bA/2Fej7cu2iitYlkKjv96ewD6iT+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=layBL/Z7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="layBL/Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790762118; x=1822298118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e9dwwle1xBAGCtdw2f7HOoEg+HRqdHzLnV9H8CivWgQ=;
  b=layBL/Z72Y/lz8U1AOTFrgqubAuQJhCsH+Z9Wsk9oxBaN8LM9HuUVOsy
   tsZn3PXECGnV5v4DD5Z6lTCSSemfzUoFSuWnxrPBvg2QdRkLZsLyHAMPE
   ikESxvj5FDW0G7TCXcPWcI4v7ytWtJ0o/R8bOJvp2GaJUqW4CMBXnbnZ1
   brM2KrArMnCXK+/q+JE06APJrJjZL1cJVjjRFjO+WaGi6Un/V4NTIkqMh
   zBdpOTiO5/TJy0SOnOahzveKSb7CqAkLh8IKvxPF0KIo0LJVzAF0hNrzP
   GbC/jkt85IlFD1PxvLcQYcGzEcplkwxKyNCcbfLjK6TRfvkWcp8jvS/vX
   g==;
X-CSE-ConnectionGUID: tTVpR17ITnyJvPTCd2mm5A==
X-CSE-MsgGUID: LJy480wsRrOfRSLBEAybvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="100826317"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="100826317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:55:13 -0700
X-CSE-ConnectionGUID: LfWAgqObRKqkM11sMqrmow==
X-CSE-MsgGUID: 5MuTlYiHQ72G+gSj+3ZIIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="283725806"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:55:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1CABA11F925;
	Wed, 30 Sep 2026 12:55:12 +0300 (EEST)
Date: Wed, 30 Sep 2026 12:55:12 +0300
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
	Martin Hecht <mhecht73@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Cory Keitz <ckeitz@amazon.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v18 00/23] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <arzcgO9KcD_2Qc2U@kekkonen.localdomain>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>

Hi Dumitru,

On Wed, Sep 30, 2026 at 01:41:34AM +0300, Dumitru Ceclan via B4 Relay wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.

I'd merge this but we have an issue with smatch in Media CI; it continues
to flag smatch warnings from what looks (on a quick glance) like the use of
field_prep()
<URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/111466268/artifacts/file/junit/test-smatch.log.txt>.

We could pick patches from smatch devel branch on master in order to get
this merged but I won't have time to try to bisect them. Maybe whitelisting
could be a temporary solution?

Cc Ricardo and Dan.

-- 
Kind regards,

Sakari Ailus
