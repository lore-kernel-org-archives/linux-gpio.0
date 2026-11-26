Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717146;
	b=5NgYbRVlueZ/uJbe1Vop1jj3HY3M347LtMdck5rJ+jeBYA+hje5o2DncqeDiF3GXKB5m
	 wJvt2C39ACHPcR2s9MlDbdC3WubMkzq8dtHfXAD8HCnBfqWHzWBoxQJpNwwLVeN6rJJfA
	 jgcoMTzPwXsXVAWauaOdW//u4laL04+dKPjmZ6BmD7YpRTiziJtfAzkxaObmP3js7wTet
	 I8OqT+CXMsYQIhArsFxetrbD5mIdobgpAA44smLlc6IamLq7ewzDmzoPBojZo6+n7T8IV
	 YtxC8TvEXQZt+lWKD0Ybhc/x2Uxu0AJn7wNRGoHdNI9flnqtj9IPkPzHTOUOZQNJPRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717146;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AMnCTXWsqdu54RrwlBPLNepArAEMcLhs/I4CIvLT4Ec=;
	b=z1yIzymCh0pDWmN72/E7ArJoiwKA00DCZywITVaeWAjDabIH3IfOBu3i1jH9TiuxQKLO
	 Jl9+O+UgAGB3sudKC1sBHr8JyXLFB6/Aro0KuPcaaB4UIhmu4SYHctVaF9pmE61B4Wg3g
	 xLCvW6KTT/IBBDL/mog+QEFvaDmD3r0wEDRnESIYcIgCxTtjYptA/u0/urRwewzioSZJ9
	 tFGyX3Erj+zOCxTfYAkiXaPIneNJVbXJ2SYjkadjx9JdjAFft0fw5BZ9jm0V7rP8C++GM
	 vthllDhLezSnYTe/djTB0hKp5KlzFhAW5SvMa+UvqZJBg0WBWUBSgG7uOPUqYF/vfLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+mWtBY+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56532606A31C;
	Thu, 26 Nov 2026 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+mWtBY+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709551F000C0;
	Thu, 26 Nov 2026 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717145;
	bh=AMnCTXWsqdu54RrwlBPLNepArAEMcLhs/I4CIvLT4Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c+mWtBY+w8z18ZGYqoBQMUUvedB4rh+0BSdT2HWTsWLZXmlCyG8IwKqAo+Hq7e4GO
	 ck962CgYS5r7F8ZiyTINABjXzTzHm6IdABciWUhROh3radz6zflJwo5k0lfP/v0Qoz
	 Gk7mtUSS7pC59eRfOSb08xO61vwtcJY0/mf5mWU9nkuRMmbDihA8eFJs26xY638zyo
	 aq/lt4DfnfB356tmusPvtEovBt0FTKkHRA4Z8VDXvEDdqQS0F3fZs9d9wz4s79PDSi
	 t9c7mxSLnVTXzscXwpr6L7PAFp3gnneRJ+yysvgJERVQolW9zTbzqhBNuxyp82iLYD
	 8uFlq2ooxDkDA==
Message-ID: <sashiko-outbox-236012@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] gpio: fxl6408: Fix reserved register access and
 disable burst transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gianfranco Mariotti" <gianfranco.mariotti94@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126180315.98034-2-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
 <20261126180315.98034-2-gianfranco.mariotti94@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:19:05 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] gpio: fxl6408: raw read of reserved regs in
  regcache_hw_init()
- [Medium] gpio: fxl6408: skipped OUTPUT_HIGH_Z restore in
  fxl6408_resume()
--

commit 1f216d3ac023de920e5ee09cfeb09b23ea1d4d61
Author: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

gpio: fxl6408: Fix reserved register access and disable burst transfers

This commit restricts rd_range and wr_range to valid odd register addresses,
adds FXL6408_REG_OUTPUT_HIGH_Z to rd_range, and enables use_single_read and
use_single_write in regmap_config.

> diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
> index 8a7e70180efd9..9f80ea1214e03 100644
> --- a/drivers/gpio/gpio-fxl6408.c
> +++ b/drivers/gpio/gpio-fxl6408.c
> @@ -45,13 +45,16 @@
> =20
>  static const struct regmap_range rd_range[] =3D {
>  	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
> -	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
> +	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
> +	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
> +	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
>  	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
>  };

[Severity: Medium]
Can adding FXL6408_REG_OUTPUT_HIGH_Z to rd_range while relying on
num_reg_defaults_raw cause fxl6408_resume() to skip restoring
FXL6408_REG_OUTPUT_HIGH_Z?

With FXL6408_REG_OUTPUT_HIGH_Z in rd_range, regcache_hw_init() reads its
live value during devm_regmap_init_i2c() and records that as
map->reg_defaults[] before fxl6408_probe() writes 0 to disable High-Z mode.
If the register was already 0 at probe time (for example from the bootloader
or across a driver rebind or warm reboot), map->reg_defaults[] records 0
instead of the power-on reset default (0xff).  If the chip loses power duri=
ng
suspend and resets to 0xff, regcache_mark_dirty() and regcache_sync() in
fxl6408_resume() see the cached 0 matching map->reg_defaults[] and skip the
write, leaving all GPIO outputs stuck in High-Z.

>  static const struct regmap_range wr_range[] =3D {
>  	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
> -	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
> +	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
> +	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
>  	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
>  };
> =20
> @@ -78,6 +81,8 @@ static const struct regmap_access_table volatile_table =
=3D {
>  static const struct regmap_config regmap =3D {
>  	.reg_bits =3D 8,
>  	.val_bits =3D 8,
> +	.use_single_read =3D true,
> +	.use_single_write =3D true,
> =20
>  	.max_register =3D FXL6408_REG_INT_STS,
>  	.wr_table =3D &wr_table,

[Severity: Medium]
Does setting use_single_read with num_reg_defaults_raw =3D FXL6408_REG_INT_=
STS
+ 1 still read every reserved even register during regcache_hw_init()?

When reg_defaults_raw is unset, regcache_hw_init() sets map->cache_bypass =
=3D
true and calls regmap_raw_read(map, 0, tmp_buf, map->cache_size_raw) before
falling back to the loop that checks regmap_readable() and
regmap_volatile().  In regmap_raw_read(), cache_bypass and use_single_read
split that 20-byte transfer into 20 single-byte _regmap_raw_read() calls
across 0x00..0x13 without consulting rd_table or volatile_table, reading all
reserved even addresses as well as the clear-on-read status registers 0x01
and 0x13.

Providing explicit reg_defaults for the cacheable registers instead of
num_reg_defaults_raw would avoid both the raw hardware readback in
regcache_hw_init() and the stale default snapshot for
FXL6408_REG_OUTPUT_HIGH_Z.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126180315.9803=
4-1-gianfranco.mariotti94@gmail.com?part=3D1
