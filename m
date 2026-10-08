Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896EC46D0B1
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490599; cv=none; b=WK71j2S2GS+uDdnkhhSMUBG/K1Xtrv0u9tBUCL68UzKDubpBU3XDltdsrsgIGRWmhrFBE/KIoVvpA7jGHahJMzGKjrWmBwxuyGarCo+NPu8MLUsPBaMPeKFe9bA7DUrxpb9hPkf6vmlhOaAdqPLlue9ueyZs3kmk9UIM5bX7BAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490599; c=relaxed/simple;
	bh=z35P1g4HWjXHLkbdFfF3rHMaqAEsNI109xLXXaUbEXo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OJgdGHLOEZz6X5+xuZCrUWidVQ9oMyOlDX7g5GNeyNYJAIF+Ggmqo7geS+CaIILGBf5z9KCzBg67n2AaV31WZeytWk/qlXHe/0BKH3+JNJ2gjYLEsc8JLrG2WeaisKPHLtkbH3LiwfEWglfB9+yJCm3TU9/OKtSbse9vwCPjoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmLB9qJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmLB9qJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCFF1F000FF;
	Thu,  8 Oct 2026 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791490594;
	bh=KeUMl0RZywGhBoldlY+ZMXuCWLmFYkZXEy4RiTirn6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cmLB9qJmQ4wqNFbf35hCgQhrSrMVKJjcrmK4pSXCuz/SF/rT0TLmLvFd8uoIG8ddn
	 CLn4kB9tyqkxmG/xuA5KLh3C1eYLDV7dV42PaZT+0wqR/nDlqT9kdU8TPzGEPCRijt
	 GP/tH1XAMN1T6Z9lo5a+E1lOYrRdvpWcWVJFagzANqjzDa4JlZng5/TS6VdOReM3PU
	 zaBLsOHppBnZe9yt18CcYl7Y0s/+nnh0rtNi57tNYOSeDP8x6xUTmUBXMkKO7fZcka
	 CBXTlO5vIzJN+uYrt+0iC95gBKoq0zsBuIK6vr0cgrSy9/XluxvyBVWiNPgnUdYpn0
	 YqK87cPy3KcJQ==
Message-ID: <sashiko-outbox-164567@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] mux: convert to use fwnode interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Forni" <development@redaril.me>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261008-mux_fwnode-v4-2-ba3330e44b2a@redaril.me>
References: <20261008-mux_fwnode-v4-0-ba3330e44b2a@redaril.me>
 <20261008-mux_fwnode-v4-2-ba3330e44b2a@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 20:16:33 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pinctrl: memory leak in dt_node_to_map on probe deferral
--

commit a66771846f5e6a77740838d742398ffebadf6b60
Author: Fabio Forni <development@redaril.me>

mux: convert to use fwnode interface

This commit converts the mux subsystem to use the fwnode interface
instead of device nodes, as firmware node is a more common abstraction.

> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinc=
trl-generic-mux.c
> index 202b72351efb7..6d5b6100c5ca2 100644
> --- a/drivers/pinctrl/pinctrl-generic-mux.c
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
[ ... ]
> @@ -50,7 +50,9 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	if (!group_names)
>  		return -ENOMEM;
> =20
> -	function->mux_state =3D devm_mux_state_get_from_np(pctldev->dev, NULL, =
np_config);
> +	function->mux_state =3D devm_mux_state_get_from_fwnode(pctldev->dev,
> +							     NULL,
> +							     of_fwnode_handle(np_config));

[Severity: Medium]
Will this leak memory if the consumer device defers probing?

The mux_pinmux_dt_node_to_map() function is called by the pinctrl core each
time a consumer parses its DT mappings. It allocates devm resources explici=
tly
bound to pctldev->dev (the pinctrl provider device), including the mux_state
allocated here, as well as the function and group_names allocated earlier in
the same function:

	function =3D devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
	if (!function)
		return -ENOMEM;

	group_names =3D devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KE=
RNEL);
	if (!group_names)
		return -ENOMEM;

If the consumer device's probe later returns -EPROBE_DEFER, the consumer's
pinctrl mappings are freed, but these devm allocations remain permanently b=
ound
to the provider device.=20

When the consumer reprobes, it triggers this function again, returning the
existing selector from pinmux_generic_add_function() and completely leaking
the newly allocated devm resources on the provider's devres list. Repeated
probe deferrals can cause an unbounded memory leak.

Should these allocations be tied to the consumer device instead, or explici=
tly
freed when the map is released?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mux_fwnode=
-v4-0-ba3330e44b2a@redaril.me?part=3D2
