Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695833EC826
	for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342535; cv=none; b=VNr71X6w/ygpF+ou37Hi+zPQBS5tlJ69TBpdV8blZTybLJDLIHO2hU1YiXOKGTlxd56KHOEqgnMwhK3I9baQq66A4XdrMV0Zemq53tEGyP9YVBht1md0v8ozzu6ppwzmS+aSMiGwjJ3/fms1mE8rNJLmVC3baSz/QWYGUTJvxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342535; c=relaxed/simple;
	bh=qMyv1xAaSFji5ceZiOBbDLHtoFNh+nnw41Vh1pd0B5Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d525rNY8A1RSdX9yfX+TDCL1nHsVP6EjIDrm1ybMHpI6DvouczOPloJxBUvPHXVPrIj0NS1VH8FUuJXGC9Zq/XYUH/y3IDqi6+QKVfNPOibhoRe52cp2TxpTZd3/Kf2proln11/U80PZSsJrx7kgIxDqYjWSszITlgxDuLFyXOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qb6nsnLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qb6nsnLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E876E1F000C4;
	Sun, 18 Oct 2026 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792342534;
	bh=pWjmRBEx95ektcNMkpqDqJ5RsijLPDakgkt5WZcVY6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qb6nsnLGox8grOwqopCYzoyQc2SKN2zU/W1UkgMBIE8S+zM8mTmfIfI7deCJQ9hbN
	 kFUF98MCQw8d5zD5MJe7ys/rREiXdotttTWPNI1p6PZCJZmr2QIPkdpDZsYoogKAb+
	 7xX3oeMwi3bAhnnYf0s4QMJtrm/ajQkdfauJW4MOUONzl9BkRM0y6gOl75VxzPVg92
	 /+F+ip+zplkDeu9hVENOYPwhO5eiT41DHcYgj/nEfv5M0IVkIoolQ+FGsnV+4NzT5z
	 tQnT8JBX3cksQsjSOhl69H6CavTIruUE7P/9YbZ34rg2Hzk+zrOxduTVT4x+FswXDy
	 U0WSWaaIqrWKw==
Message-ID: <sashiko-outbox-176299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: pca953x: Handle direction register read errors in
 IRQ paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sahaj Chaudhari" <sahaj123.sc@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
References: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:55:33 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpio: pca953x: mixing guard() and goto in pca953x_irq_bus_sync_unlo=
ck()
--

commit f8c41495cf791bc6655e128fd9192a150f30aa3c
Author: Sahaj Chaudhari <sahaj123.sc@gmail.com>

gpio: pca953x: Handle direction register read errors in IRQ paths

This commit adds error checking for direction register reads in
pca953x_irq_bus_sync_unlock(), pca953x_irq_pending(), and
pca953x_irq_setup() to avoid using uninitialized stack bitmaps when
pca953x_read_regs() fails.

> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index aac9ea7520b60..b6f0849d3bdf9 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -862,6 +862,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_da=
ta *d)
>  	DECLARE_BITMAP(irq_mask, MAX_LINE);
>  	DECLARE_BITMAP(reg_direction, MAX_LINE);
>  	int level;
> +	int ret;
> =20
>  	guard(mutex)(&chip->i2c_lock);
> =20
> @@ -880,7 +881,9 @@ static void pca953x_irq_bus_sync_unlock(struct irq_da=
ta *d)
>  	}
> =20
>  	/* Switch direction to input if needed */
> -	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
> +	ret =3D pca953x_read_regs(chip, chip->regs->direction, reg_direction);
> +	if (ret)
> +		goto out;
> =20
>  	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpi=
o);
>  	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
> @@ -890,6 +893,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_da=
ta *d)
>  	for_each_andnot_bit(level, irq_mask, reg_direction, gc->ngpio)
>  		pca953x_gpio_direction_input_unlocked(&chip->gpio_chip, level);
> =20
> +out:
>  	mutex_unlock(&chip->irq_lock);
>  }

[Severity: Low]
In drivers/gpio/gpio-pca953x.c, pca953x_irq_bus_sync_unlock() uses
guard(mutex)(&chip->i2c_lock) at function scope. When pca953x_read_regs()
returns an error, this change jumps to the new out label to unlock
chip->irq_lock.

Per include/linux/cleanup.h:

    * Lastly, given that the benefit of cleanup helpers is removal of
    * "goto", and that the "goto" statement can jump between scopes, the
    * expectation is that usage of "goto" and cleanup helpers is never
    * mixed in the same function. I.e. for a given routine, convert all
    * resources that need a "goto" cleanup to scope-based cleanup, or
    * convert none of them.

Could pca953x_irq_bus_sync_unlock() avoid mixing guard() and goto by wrappi=
ng
the direction update in an if (!ret) block (or using scoped_guard(mutex,
&chip->i2c_lock) around the I2C accesses before unlocking chip->irq_lock)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018165003.3372=
368-1-sahaj123.sc@gmail.com?part=3D1
