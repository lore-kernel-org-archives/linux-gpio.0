Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC847F3C8
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545661; cv=none; b=jlsdo40dQOdjQ/Nv88uIKKlWGs5t3X+g9/cJD/KOsXA2Bq5lax3A4tBUgtTVqBgqVAI7SPwcRp2zXTXeNi+Ka6hQ4EVmvO/VdwpXPtJMTI6pL9iJfrPAzuhAZTdr0r/i00R2ksiUfErrJQkAUftE4fBboX28did4xQkSaoRt5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545661; c=relaxed/simple;
	bh=ntlS7kg8pTVSShdY/huFbx84HcFeEv9RS7ZtejbCS3E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=h+Z+DXfrtzN5cD94FL+tOutOIOpWH1ZtyCTZKGhH1rYaJIfF2SC/mMOFZfNJwjqtaYdknijAWmUP4m9n+R5uFRdjuvs/3fIeM9IIM6dQ5y8amfsyfiO7k4jm8XntKGbnTICq9eYRsRC6CkcO3r/fjZuOVbNUjRT2jiFNGLWAhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCAdv2GU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCAdv2GU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123191F000FF;
	Fri,  9 Oct 2026 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791545651;
	bh=yc5TEEA+9hHq55nqaHuX5pB7nP/XjbUGMAok+ps0qfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kCAdv2GUVUqPRGCpVuC32lbz5IKPp72RPK+s0Au4vJe0RGntniTQzMhJySH6aSGbl
	 ygZRF0d/tzTpNdrQDlfXIae+p/538NlMnvGf91GrGdgEpdIV132/IaAgVw1qYUYaA8
	 QX709Lv7W01ovckikqI5KXqSqD19eEj3mtpm+3UDdKmUAy/k+vkLUGHIuukFQyPN+T
	 GDplmAMY+aplyCNiG29nJWbai3peqqVMKCVjq14/gaG8uhHfmpF9/KiauNqbwRRsTY
	 kKzAzIAKes3XfnAH0GD/0wzU8lWYtsFNN9lVko/beVgEl224xYdXtGu0DjhcUgBNcH
	 ontV/rL/WR/Jw==
Message-ID: <sashiko-outbox-165390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261009112634.33436-1-phucduc.bui@gmail.com>
References: <20261009112634.33436-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:34:10 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: uninitialized variable ret used in dev_err_probe() on err=
or path
--

commit 102caea02ef327a69988ba143522defe7312fabf
Author: bui duc phuc <phucduc.bui@gmail.com>

pinctrl: mcp23s08: Propagate reset GPIO errors

This commit updates mcp23s08_probe_one() to catch and propagate errors
encountered when requesting the reset GPIO. It adds an error check to avoid
silently ignoring issues like deferred probing.

> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index cc668f84bf8bc..fab6d19a559e3 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -613,6 +613,8 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct d=
evice *dev,
>  	mcp->chip.owner =3D THIS_MODULE;
> =20
>  	mcp->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW=
);
> +	if (IS_ERR(mcp->reset_gpio))
> +		return dev_err_probe(dev, ret, "failed to get reset GPIO\n");

[Severity: High]
Is ret uninitialized when used here? Looking at mcp23s08_probe_one() in
drivers/pinctrl/pinctrl-mcp23s08.c, ret is declared at the top of the
function but does not appear to be assigned a value before this point.

If devm_gpiod_get_optional() fails, will this return a garbage value
from the stack instead of the actual error code? Would passing
PTR_ERR(mcp->reset_gpio) to dev_err_probe() instead of ret correctly
propagate the error?

> =20
>  	/* verify MCP_IOCON.SEQOP =3D 0, so sequential reads work,
>  	 * and MCP_IOCON.HAEN =3D 1, so we work with all chips.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009112634.3343=
6-1-phucduc.bui@gmail.com?part=3D1
