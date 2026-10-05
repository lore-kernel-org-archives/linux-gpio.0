Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB8437463;
	Mon,  5 Oct 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191925; cv=none; b=oVxxnZvW4wvtydfl4sV1yCbQ9VnyMwTfa+nFmub1Dorn/pVNIJKfJ9r0A598VRfMcHxgBnSeJQIi7XkM8Y1wIB8vIAkmo9hD7WzjnwOAiugoacqIlC2z7Wkriy7wm2qoFEEJECOki7+USTekMfbJQkgrsDcVQyWNlymOOw3F78M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191925; c=relaxed/simple;
	bh=48Ca9cKyOr+NMIU4t/+ee0IZTESjP9sx/6nW8fykfiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G201O75YX/NMbQPo1jsAfg86XaCQ5U9ObPEIa8YhPbVknSXnjCh2zAr1Y2h70txwar0YzUAOFLBsgo2dIIkvjZMG/6arg4I1NFekLe5QW1U5ujFE4TQsbfBtcZyJdVVOtE9pW7eIZNu+J5AHkvJGbwAJu89W8ZtjTJiQvYbPAos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCfFaE+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCfFaE+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F271F000FF;
	Mon,  5 Oct 2026 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191923;
	bh=/VTGud22mcVnsQaOHG6mFsFdNSpTEIfyiPHRFCB3zGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JCfFaE+oiELm5ATezXA5F5pYDtNTk9rzokdq/GtmxeYpr5Eth6uCvx7SLwaoJtxSF
	 QwHn6hhTFH/j4YBCLXSO0NRXwHwASuiZm+XCYBcWlmSjlflfVuT7bhipd5j7TSUXCj
	 3SbLqzVPeRY+g2u/lVQYOid+ZBDuV7UXjo/zEfSjJI/qnupt+478NHtUp79N2fWRuw
	 PMJmM/PviLqJJTLCVj5dvhYngSHO81wTqGGEyfodgafZ1HfqLTPhYu7WQkE8FLE43H
	 ao3Ntk8BDrnZ0HNTeeIE+KQeZCLposqWTKH3aX0c7/coSQs1T8EoZrVHGdXWfZwoIS
	 2ZAM/D7ZjznaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sudeep Holla" <sudeep.holla@kernel.org>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261005-scmi_bus_fixes-v2-2-34a51338875a@kernel.org>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
 <20261005-scmi_bus_fixes-v2-2-34a51338875a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 09:18:42 +0000
Message-Id: <20261005091843.13F271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm_scmi: dead code in scmi_device_create() for standard devices
--

commit cb938ad959a8195c8129d8e6f7596ff9fd2ddff8
Author: Sudeep Holla <sudeep.holla@kernel.org>

firmware: arm_scmi: Skip requests for standard protocol devices

The SCMI core skips request tracking for standard protocol devices to avoid
issues when unregistered drivers destroy the core-created device. Keep
request tracking and rollback for nonstandard devices unchanged.

> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/=
bus.c
> index f2e2ed56bc326..230ee9f6f1aa5 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -186,12 +186,44 @@ static void scmi_protocol_device_unrequest(const st=
ruct scmi_device_id *id_table
[ ... ]
>  static int scmi_protocol_table_register(const struct scmi_device_id *id_=
table)
>  {
>  	const struct scmi_device_id *entry;
>  	int ret;
> =20
>  	for (entry =3D id_table; entry->name[0]; entry++) {
> +		/* Skip standard devices as they are created unconditionally */
> +		if (scmi_device_id_in_std_id_table(entry))
> +			continue;
> +
>  		ret =3D scmi_protocol_device_request(entry);
>  		if (ret)
>  			goto err_unrequest;

[Severity: Low]
Does this change make the check for standard devices in scmi_device_create()
obsolete?

Since standard devices are no longer passed to scmi_protocol_device_request=
(),
they aren't added to the scmi_requested_devices IDR. When scmi_device_creat=
e()
subsequently walks the requested list, phead will only contain non-standard
devices:

drivers/firmware/arm_scmi/bus.c:scmi_device_create() {
    ...
	/* Walk the list of requested devices for protocol and create them */
	list_for_each_entry(rdev, phead, node) {
		/* Standard proto matches already have their dev created above */
		if (scmi_device_id_in_std_id_table(rdev->id_table))
			continue;
    ...
}

Will this check in scmi_device_create() always evaluate to false now, making
it dead code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-scmi_bus_f=
ixes-v2-0-34a51338875a@kernel.org?part=3D2
