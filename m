Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC1442373;
	Mon,  5 Oct 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192672; cv=none; b=ncV7sxy1tOb+SXoUNgfqwdZtxalJdDicVVH+nE6AjEaKCRN2FqiOFGSHx/ZHVIS6RSTlt82eeKY9MyWOrYRehFYkvDEJHRjq/SGutIwn+q4Vp+SHuwB4QrOJOdFxwbUAtaadhM4hkM68cBw0ip5SVu8QrGF3vsvde0rd2XTkvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192672; c=relaxed/simple;
	bh=oiNC2UVN9am+dSkDjz1+RMRIYImzAsNCopUZB8DjsHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICK4JwKiS/BGleLwfkvz7idY3yWymMzUGsmAL6VDt6PjmVMHd1sFwHiTBCabGtUS+J+kQDKRjdf5q0+M1xxWQSkQHc6FSLsUbLAF8IM0GXvLDdUdJYC9nesg9VV1nUsdvOJZ7I8gPNl/gAItmwcfPknyO6bKhOzydBJq+ZZvvVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COR2Cx0U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COR2Cx0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC181F00893;
	Mon,  5 Oct 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791192670;
	bh=X9bv50gllBrRNQuoS7XRwzwWb4UhCyV3bLMHqoCJJVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=COR2Cx0UhrjG86YnD6O8kFzpxqrJoSYabwIFXH+2dIbTfgWJeZQN+4e0L2Z3h9qGQ
	 hI6fQLmtuBsPUISOx/a1HBBB6IcLEpRTW0DRtJLYyuw7OM+Wn6VYl5u+ZMFoOdpiwp
	 F2LRbd1pnubR2ZVQ1aJj1kE+d+DIbck6RYA+OsLIEJPcbXlzqvuSt59wulyY/4gKMW
	 uj5yEDuLGWkBWFpXSIsHWtR2J67Q+pYLKVvGu+mdXnpV7NwhxrrmNFy4+6fldlF/6u
	 08F6ZKIuvvnFZCGUNmHKin23vW+k2c9Zz6ubCXcMrIx7Vt/1CD4KuYzSV7zInhGII+
	 3OWIW4e0GjYCQ==
Date: Mon, 5 Oct 2026 10:31:07 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Message-ID: <20261005-military-rousing-copperhead-6e10db@sudeepholla>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
 <20261005-scmi_bus_fixes-v2-2-34a51338875a@kernel.org>
 <20261005091843.13F271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005091843.13F271F000FF@smtp.kernel.org>

On Mon, Oct 05, 2026 at 09:18:42AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] arm_scmi: dead code in scmi_device_create() for standard devices
> --
> 
> commit cb938ad959a8195c8129d8e6f7596ff9fd2ddff8
> Author: Sudeep Holla <sudeep.holla@kernel.org>
> 
> firmware: arm_scmi: Skip requests for standard protocol devices
> 
> The SCMI core skips request tracking for standard protocol devices to avoid
> issues when unregistered drivers destroy the core-created device. Keep
> request tracking and rollback for nonstandard devices unchanged.
> 
> > diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > index f2e2ed56bc326..230ee9f6f1aa5 100644
> > --- a/drivers/firmware/arm_scmi/bus.c
> > +++ b/drivers/firmware/arm_scmi/bus.c
> > @@ -186,12 +186,44 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
> [ ... ]
> >  static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
> >  {
> >  	const struct scmi_device_id *entry;
> >  	int ret;
> >  
> >  	for (entry = id_table; entry->name[0]; entry++) {
> > +		/* Skip standard devices as they are created unconditionally */
> > +		if (scmi_device_id_in_std_id_table(entry))
> > +			continue;
> > +
> >  		ret = scmi_protocol_device_request(entry);
> >  		if (ret)
> >  			goto err_unrequest;
> 
> [Severity: Low]
> Does this change make the check for standard devices in scmi_device_create()
> obsolete?
> 
> Since standard devices are no longer passed to scmi_protocol_device_request(),
> they aren't added to the scmi_requested_devices IDR. When scmi_device_create()
> subsequently walks the requested list, phead will only contain non-standard
> devices:
> 
> drivers/firmware/arm_scmi/bus.c:scmi_device_create() {
>     ...
> 	/* Walk the list of requested devices for protocol and create them */
> 	list_for_each_entry(rdev, phead, node) {
> 		/* Standard proto matches already have their dev created above */
> 		if (scmi_device_id_in_std_id_table(rdev->id_table))
> 			continue;
>     ...
> }
> 
> Will this check in scmi_device_create() always evaluate to false now, making
> it dead code?
> 

Agreed! It can be removed.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org?part=2

-- 
Regards,
Sudeep
