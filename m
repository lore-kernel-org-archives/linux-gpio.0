Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439534;
	b=xoZ9FJ5lnIgQL5xyghnvTIFBfXGimDEkwgZdaA4cZXEQ0VGhH3hF3i/weTLcFmbNWSfU
	 4rsm9l3tvElQLiMQd/6/s1VIZJrwEYZLwcroR6zL9M3urrK9AhZtMDCt0xK0UToYGdoIN
	 HMhm6PqPvNB3NcY5LEer0Zf8fdlx54+ikqNRKBMjOIvV7uo3B8vNRV/3RiEXgqJAbAv5I
	 wixR1D9rLKEIeiVtvF1knpt6JaWkY4MMKt7ehIHVy0xFN8EsT3M1iFYFDABmGnZoJ67eP
	 fZi5ylI8TU/vxfv4dqPsC7/DhIx6mexY3QYl0z8WOtYHCXHGXMu5eCKkOOAFd6SnDAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439534;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E7U8G6i0xepos/3PMIsIuLoAJuXWxBLJeRFOqwOSlKU=;
	b=ydZN7Yp0cGmxSlOI0/MZirVUkLX0ulmPiFUc+K7z64Rb4pvhyCc/WTztmkla49DnmEoq
	 jXTkvPKyxPeC+SBz5ZX4idud7mIvNEEkDKEap0J7xsrbGOQw5v9+Ga41ywfaohWYomT/n
	 Oj693QdnUE4teaVnNj/K9MlBNAgwQMZjjPhJgSTvyAVqf19aG927473i8VC+KsgxCUeKi
	 OQh8Fv2PBYnNWW+jWybUsPhwCYny8n4Hi6I1Nthyd9GvSuPrwlwlHYlTYy2wn26d6z0If
	 JH7rcAaC7xBSkdu6xDfMw+9ag3kBjulxDmkGhBrRfe5N5NgGni5mGNeXLdHp9HtI6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CWYvHpqr;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B4606A321
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CWYvHpqr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E7U8
	G6i0xepos/3PMIsIuLoAJuXWxBLJeRFOqwOSlKU=; b=CWYvHpqrl43SKEugm+dV
	aLXrR2GBZhEOAtLQrcw6GDEUIDrHYXIbpMIfIhc/pv5ovxu1bQRT4yLIsT3n9qa1
	iHbn/WVVOh8gcGeLn1xYqN32ibOL8Oir2MaospU6thdpawDqgAyqyibSctBADWNm
	idkuaavZcbtDnZpnOD5/48NIOPKAOvKM/kKNvSzjDEOIcltuY/nwmEjvw5T6ezM4
	fO4XaJK6AqnsD45S4+zjhAlKCb0s5dsF8YfqrTndEc/pW0JdFzUft9DMB/2MoZn1
	oEX0aoiTarZHo/5WxL/txHVjlbI7E6n/xcR30fzIttIn9Gt8Z7CjvGX6CffHIZic
	Aw==
Received: (qmail 2737992 invoked from network); 23 Nov 2026 14:12:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 14:12:10 +0100
X-UD-Smtp-Session: l3s3148p1@3kNmV/FgBoUujnsu
Date: Mon, 23 Nov 2026 14:12:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Message-ID: <awQ7qa5FGG9RETtS@ninjato>
References: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>
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
In-Reply-To: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>


> >  static void rzn1_pinctrl_remove(struct platform_device *pdev)
> >  {
> > -	struct rzn1_pinctrl *ipctl = platform_get_drvdata(pdev);
> > -
> > -	clk_disable_unprepare(ipctl->clk);
> >  }
> 
> [Severity: Low]
> Can rzn1_pinctrl_remove() and its .remove assignment in
> rzn1_pinctrl_driver be dropped now that the function is empty?
> 
> With rzn1_pinctrl_remove() gone, ipctl->clk is no longer read outside
> rzn1_pinctrl_probe() and platform_get_drvdata() has no remaining callers,
> so struct rzn1_pinctrl.clk and the platform_set_drvdata() call in
> rzn1_pinctrl_probe() can also be removed.

Ack. Please update.

