Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B12DC357;
	Wed,  8 Jul 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516509; cv=none; b=Gxl934IaqM1xXvIHVgkNjcdsJufsRph3Hzys9YhFDlXiynO+b3NZnKx5WChd+csW3f7gR+TONTjewFJopEO1YGHtxqOM4MKpm21/CEDQQZ994cTWkFiqlaaAdLzlkswPzRQ/LEqGKLKngayTt2PyFPysUuQyg/CZyiJoLC4Lh5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516509; c=relaxed/simple;
	bh=sOuqEYYHQDCEuA2C73P3cqgemRRwUb/kvCIKRtAVH7g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CYCjxog1m7/UXFEqpHajDu0BeikdApPjtJ/3LMTjMFUYKzXPuiR2tcGyIfp1tdZ082UuepEGDszoEATFQQzzhm4+v0n2pbG8nkwNs6mIpeXykkwwggb/Hudwd8swCciAWfCMEWnsh+iFwXt/Z5cdFtiILyzRUExXjM1UUqlBJl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=na3hcZ8d; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="na3hcZ8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1783516495;
	bh=gvNr/i0jNH/uOH958Tf3Nzf7g2z9m+IQXZLfN53ggCU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=na3hcZ8dCq0bLPxytHpH0mSACiCBt6WzKKjL5QYoNZvgk3BMlKTaTjMKkIM2t5dXp
	 Ca+ZuiX0gK1c7IOgMYxESfShn6u0/gexpatlkf3M5E40C0cpaszUhRbDN5H9JjfurF
	 EvvjgZKuf1yaGBsC+HZLNWjzgXUEvuPonxlpD7j4=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 2E95765982;
	Wed,  8 Jul 2026 09:14:53 -0400 (EDT)
Message-ID: <5d6ea500e983035a2e5748e1bbf8ed6c26ac6f4b.camel@xry111.site>
Subject: Re: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Xi Ruoyao <xry111@xry111.site>
To: shankerwangmiao@gmail.com, Binbin Zhou <zhoubinbin@loongson.cn>, Chong
 Qiao	 <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Date: Wed, 08 Jul 2026 21:14:51 +0800
In-Reply-To: <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
	 <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-08 at 05:16 +0800, Miao Wang via B4 Relay wrote:
> From: Miao Wang <shankerwangmiao@gmail.com>
>=20
> The reset event of BMC is captured through GPIO. However, this driver
> bypasses the GPIO framework and directly accesses the GPIO controller
> through the fixed address. When the same GPIO controller is also
> exposed through ACPI and probed by the corresponding GPIO driver,
> there would be a conflict between the two drivers.
>=20
> This patch will try to find the GPIO through declared GPIO pin in the
> _CRS resources of the ACPI node. If no such delaration is found, the
> driver will fall back to search for the correct GPIO controller and pin
> according to the fixed address and pin number. A possible DSDT
> declaration for the GPIO pin might be as follows:
>=20
> =C2=A0=C2=A0=C2=A0 Device (BMC0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name (_ADR, ...) // Match the =
PCI address of the BMC device
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // \_SB.GPO1 is the ACPI path =
of the GPIO controller
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name (_CRS, ResourceTemplate (=
) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GpioIn=
t (Edge, ActiveLow, Exclusive, PullNone, 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\\_SB.GPO1", 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 14 // 14 is the GPIO pin number
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }

I think this is a proposal without real implementation yet?  If so...

/* snip */

> +	adev =3D to_acpi_device_node(fwnode);
> +	if (!adev)
> +		goto out;
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	ret =3D acpi_dev_get_memory_resources(adev, &resource_list);
> +	if (ret < 0)
> +		goto out;
> +	rentry =3D list_first_entry_or_null(&resource_list, struct resource_ent=
ry, node);
> +	if (!rentry)
> +		goto free_resource_list;
> +	if (rentry->res->start =3D=3D start_addr)
> +		found =3D 1;
> +
> +free_resource_list:
> +	acpi_dev_free_resource_list(&resource_list);

... consider adding a _DSD method to label (like "bmc-reset") the GPIO
for the proposed BMC0 device so you can use devm_gpiod_get to get the
GPIO, instead of using the hand-brew code to parse the ACPI node.=20
See=C2=A0https://www.kernel.org/doc/html/latest/firmware-guide/acpi/gpio-pr=
operties.html.

Combining this with Bartosz's comment, the logic would be like:

  if (missing the ACPI node)
    assign a swnode to label "gpio14" as "bmc-reset";

  gpio_desc =3D devm_gpiod_get(&dev, "bmc-reset", GPIOD_IN);

And such a proposal will need to be discussed with Loongson.  Yes I know
people may hate the "control" from the vendor, but having some
effectively dead code (i.e. supporting some non-exist firmware) in the
kernel is worse.


--=20
Xi Ruoyao <xry111@xry111.site>
