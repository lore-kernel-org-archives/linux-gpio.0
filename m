Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895E332909
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123133; cv=none; b=ufIV5CnFr4mFXByOEsh/Ya4XcKo/qUuRX4dhgW7UIw8iQLxWvXwMitnaq47rBSqxGPrdIMRtQS3rKvkyuKEAuGoN+SEQ+pQOJfxL88QkW6PgPjkWbmfXINCDkKG4ZtBSdpFjzvBE1N9o2YEIqG7lYTlt9fCMyNQmJNJ1rcb2XHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123133; c=relaxed/simple;
	bh=0S11xU1IpT8SFc/cXmISfCOc70osQynlAxsHynpDX4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wdn54O2yr9nKfQca1fb/leIkf4i32iT3kJcsU3dLo+4Jl5+wgn5/FjpJJGzTCkufOMIYDDKu3daiRFiFVtXnzSXdCsKg+IGxhGOuZtv6VheDl9ThCSbQXq+EdR6dyZnjZXWVlebEXumie0PL1wWmwUW15+SJdwMUe7bnu3PiHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Re75d8ZZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re75d8ZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775123122; x=1806659122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0S11xU1IpT8SFc/cXmISfCOc70osQynlAxsHynpDX4s=;
  b=Re75d8ZZI682cfCZ6T7a/64Pe9eh8fkkVgJBw984cKDBJxhsyHKJWH0J
   thkWg4DPm88/g5CrtP4tLzAEhVs12JCOxYlMymPPejlsDJnd/BuTek35l
   uZifo0BRytens+jRHZiU59+JDKutmEnTUKZUpp3bkD05Jx4dwqWexuN7+
   FbZSyUmvGC4y6ctwJo+NlZRu+j97PP41wgByiQrZewQZoDX66Y87/4k9j
   t2SyVdoZ8QNESDgBaNmarN4DaKaTvxI3/ZtSuC0fE4ycvSrTBI6tw41s3
   jPuElGQq8872wSpcDFnXTJvC0zn3ov+GHeA4OQeph2zmbSQF4OY+h+P+6
   Q==;
X-CSE-ConnectionGUID: q+dC628ITSujOIaT5VX1OA==
X-CSE-MsgGUID: EyvGY9eVS0u4iadmfeJLVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76066105"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76066105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 02:45:21 -0700
X-CSE-ConnectionGUID: hTOGSMcFSKSY8u88MicQcQ==
X-CSE-MsgGUID: e9QA+H21TU2TqWTs1zvRow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231342278"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2026 02:45:20 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DCBDE95; Thu, 02 Apr 2026 11:45:18 +0200 (CEST)
Date: Thu, 2 Apr 2026 11:45:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org,
	andriy.shevchenko@intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] gpio: Add Intel Nova Lake ACPI GPIO events driver
Message-ID: <20260402094518.GT3552@black.igk.intel.com>
References: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>

On Wed, Apr 01, 2026 at 07:45:26PM +0200, Alan Borzeszkowski wrote:
> This driver provides support for new way of handling platform events,
> through the use of GPIO-signaled ACPI events. This mechanism is used on
> Intel client platforms released in 2026 and later, starting with Intel
> Nova Lake.
> 
> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
