Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597892;
	b=EzpWFQCL0nCaipCp9Mijl8DiA2JYPb/XdtYCk8SD5MyuZSOa/jvg5ijG9oF5CnCTFUb6
	 4QbidMHAJ2ZBorNwcq+1t4MqvEzBQTe1Pv0ta933ZEfjVcq2i2WZl1EvakA9sS3uw1qV8
	 fWYXl8pIV2QVeWjh3TsMPjQxavaEOB97oDsY9pOeNSSZaZvPQvTuPGFABWdIx5IjhmSzk
	 JJ5dUcHT0UvSkLoNIZHzK8q9jAV1nKxXoBVUxUxvfIMO2w9cQcBO7ymEaWSSR6o+FP0HJ
	 J0OU7sGLDxis4HUxVB0cjSv5MsWh2vvMICAxnnDcNRNZ4nPCd5waFUR/OBAMh05vmcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597892;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DjqouD12oMJVEHvsBqSI7VELKEbVOGoM88zpp+O836I=;
	b=GZtSDiQqdjrdBuL80aeASRk2mxuv35+c92nHx8dBrBgKFL/yl4LV6coLs/C1xrmYjAWE
	 X+yESnmYilj/RAhavqKqoYbw883orlIdTBbpG6V0xCbmpNHJzyK2pp2cecFBzaPu3iXgw
	 UzLuFqyDjZScj0gkybKzRKkLTyRPaMPfsuRIPUy/erOm6K40qEZpsoC56+xhuUafM1hJC
	 2+PN1T6fmSRSxycfqLCzSZkBwVrYksCpghJ9w8bkP0v9Lx9ZtIq2l2t9s6AhTtDYz2x1J
	 VjYW/M0+2EDyOuGVcjAxe96hnZfCJgcebzIDXf8/5ttZ/wvkMoL900ywcAM3uyPZoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ega6AftY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 5DA3E606A31E;
	Wed, 25 Nov 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ega6AftY
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 49E151F000CF;
	Wed, 25 Nov 2026 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597892;
	bh=DjqouD12oMJVEHvsBqSI7VELKEbVOGoM88zpp+O836I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ega6AftY6Ib101Fy+mzrANvpORWtYbqTuEe0+TKqaitz1Q/GXJjvo4JZeMj0/68BK
	 5VsJR/aiKYajXQOhK/efIAmfKRPs8Q26IhWv24BfaSMGquFHaPygaERw71GXD5FY4L
	 4B7r94cIcd7hDLVtONMMHetZE2IOHFkqA2ceLZ674MsT4i9mIT6JVTugiGT8kFysbj
	 RO8oz0OdOmKEyd7VES2gG0V6ahCheWmgG5vf+1hSl+scebmPUEynINQOfxra2brUJ8
	 beVFh5CvWA4tIM+u08TnA5dRQeuY1WT60orFA3Kz8Z/jxT0oBwyzwi41l7k5xY6hqb
	 CJJ1BGAWEa1Bw==
Date: Wed, 25 Nov 2026 10:11:28 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: longzhao@ambarella.com, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, devicetree@vger.kernel.org, 
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 02/14] gpio: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Message-ID: <jmreaj23o77g7fsewjiuud3dydl2jxqexjfhemxjcsatd52gyh@mrrpkak6e2jm>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-2-e3c563673fe1@ambarella.com>
 <rjxlen54cxvhlbiq6uh5ytts6kyoz3v4hczh7bhjoxfsode2se@hesqdhe2vczl>
 <DN453WE8YY5K.3STDH1FZM2FFO@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DN453WE8YY5K.3STDH1FZM2FFO@kernel.org>

On Wed, Nov 25, 2026 at 09:14:05AM +0100, Michael Walle wrote:
> On Tue Nov 24, 2026 at 2:14 PM CET, Bartosz Golaszewski wrote:
> > On Wed, Nov 18, 2026 at 03:42:19PM +0800, Long Zhao via B4 Relay wrote:
> >> From: Long Zhao <longzhao@ambarella.com>
> >> 
> >> Some controllers ignore output writes while a line is still an
> >> input. Add a behaviour flag so the output value is written after
> >> the direction change. This is a legacy quirk. New hardware must not
> >> use it.
> >> 
> >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> Reviewed-by: Michael Walle <mwalle@kernel.org>
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> >> ---
> >
> > Hi! Sashiko's comment on the return value of gpio_regmap_set() is valid.
> > You never know what the underlying regmap actually is, it may not be an
> > mmio regmap.
> 
> Agreed, but it should be a separate patch because it was missing
> since day one. Not something this patch introduced. I tried to find
> out why I did it that way, but couldn't find anyting. Probably
> because back then gpiolib did it the same, not sure.
> 
> Btw. is it on purpose that sashiko is only answering the patch
> author and the list? FWIW I'm usually not subscribed to the lists
> and thus I didn't get the feedback.
>

Ah, yes it noted a bug in my sashiko maintainer bug list. Nevermind my
comment then. I thought this was introduced by this series.

Bart
