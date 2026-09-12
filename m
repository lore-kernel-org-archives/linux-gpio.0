Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89662D0C75;
	Sat, 12 Sep 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212996; cv=none; b=XCV0e6KEl5kWnMUW4YGpDdzOe4B6pnL3Jdb9CWT0etSeRkyS/Lp9UNgaY+0kVa5yi+BBbKcjr4r/wDbxrd1ttrRNdIijY2Gg7MaMHOJYVScdbd5XsPE6QHgD975Lpca6J3odjFqK1lZ+/CG4kAqFZSq473r3U7HXLXFvxY7+Kos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212996; c=relaxed/simple;
	bh=3UIwecDJsfS4ql3mhWCRI+wvBFP1eDHU45TLm8V5nlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6234Nhk+G/+dnpQsIESLv7LfjaUHTfuiurl6/0DqhzDpN+dKz86t+DnkdgximqTlPyI7u6Qtnm1Hk+a6vAt+09eq5JSrW2omikHJ/z04D/pZj3Tgt36wfPEunVMcUfLc+yvuzlKrhpDDmu3+15IlOz9DWZAhEqp7bnYWhfTtC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJkK9nZx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJkK9nZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789212995; x=1820748995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3UIwecDJsfS4ql3mhWCRI+wvBFP1eDHU45TLm8V5nlk=;
  b=jJkK9nZxZZpMp3PVDKb5wmOWqIp8sQJPc64O9orC+usTW9dhWl2vX+bc
   nUO6JRYqrKt8jQHVYOBJRjvd/Y9Tk2On4ZLPHJw6fgwf3OB0JSQh/Jr3L
   H/cd3xuiad/fcTyC8wNIRx1rDthocopZG2WIBeOd0de1DnYwLS2xG6Evh
   1CjQKyA4oaesQaypbo0eDHhA8lwm4x8r7SaTv7HcbZN/MzMzOErvGVQkI
   ysAiJNfVDeohpfM3LqiNIO+5pQaogdoKNiHYjEj5ZYtpolxbaDnfDfZXY
   97cdjz0C+ZkrNvdfkTLG6uDHFFs7VzKLBonK+ojCRXkcy+S3dEKZYfaGK
   A==;
X-CSE-ConnectionGUID: gkN/CAhYS2WVmfN29b9NKQ==
X-CSE-MsgGUID: +zPjIWRXRtGV6gq762/hRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89696629"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89696629"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:36:34 -0700
X-CSE-ConnectionGUID: LanRjFjZRtO2YDIcfnFfcQ==
X-CSE-MsgGUID: 1VEMAkvyQBmHQuEtVyipDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="302061599"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.238])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:36:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EA3C9120EA9;
	Sat, 12 Sep 2026 14:36:32 +0300 (EEST)
Date: Sat, 12 Sep 2026 14:36:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ceclan Dumitru <mitrutzceclan@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
 <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>

Hi Dumitru, Dan, Ricardo,

On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > Can you check this
> > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > please? If there's a single patch that needs to be modified, I can squash a
> > patch into that, otherwise v17 it is.
> > 
> 
> These are the same warns reported by Niklas in V13. Dan fixed them in
> smatch in devel branch but fix is not in master. Testing with smatch on
> that branch yields no warnings.

Dan: any plans to merge these things to master some time soon? Or:

Ricardo: could we use devel branch of smatch for some time?

This driver has been waiting to be merged for quite some time so it'd be
nice to get it to 7.4

> 
> https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
> https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7
> 
> v17 is still needed to revert one breaking change introduced in v16 and
> fix more findings from Sashiko.

Ack.

-- 
Kind regards,

Sakari Ailus
