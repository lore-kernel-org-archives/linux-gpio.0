Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586358;
	b=UfmFAJV/IsQQvjPL6LjQsxYKmvj72kzOKCWwwHTA+sJmId9O1RZcYeUnpSndhwOl3c8n
	 wgNQRT3HGJ4A0cj0xpu4Z0uELzr7hD2CTKziK9HcrZl/gi4vkLoyzxcz6AhftZV8fhBDP
	 0WK9iWafNrxth/tNlcNeeDsr+64hHScs4QQHAc7tq55h0f+meEQk0tp8uHpjfLXtGjKZs
	 wUMwfsWyRuWc4VkbhGreyzm7JPOK8gPiW1scgIn4oUvcl5PFaXCNAPVARr121UyHADWKL
	 Vub3D2f/qn5q8ZzyjOoTSE4PYU5mH4d+Gqk7X90K9NZjDHXMv3dnWCfUMVKjwBBq1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586358;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=7LywcFqB+/5xRyU6GGTMYkhvgXlEandMOB0iFjHFry4=;
	b=ab6XA1sSBggysxVzsmTIhWlNSGJeBhPrqUPADvo/AKzlFIPRIbsiHTG0+n18xRItjbuI
	 imybJHlRRjvX11ZJdBTmYFVlnGADtDMJCjwFqUdHEJtnwtNdT7xRapWi2wOtaC+FJGppY
	 XGuPXtfuNsrSrikRZM9MFfsG8B91gLJzEBMxfDDbeacxwNopHPDLcQhjZ38ITZQZXlbhZ
	 x3KHaoDJPUkIaRWvoV12wglWG5AVb2wVGgq17hdYz/1x/vBk8TnynTNj6oa0zVDwNgBN2
	 NzSUmz1h+EB1nxxJw5FNZdcd9kpwR4XYbD8vkGiGPXOZWe8gjcwPdM1lD6TKV/9swhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WP8Wip5v;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3jNj9R0h;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B22606A320;
	Wed, 21 Oct 2026 12:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B22606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WP8Wip5v;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3jNj9R0h
Date: Wed, 21 Oct 2026 14:39:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792586356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LywcFqB+/5xRyU6GGTMYkhvgXlEandMOB0iFjHFry4=;
	b=WP8Wip5vPrsuh2OlJgttUQ71UzDDfzW+s8xgUeOB/M6KRGwx2+O0Cr/g7AVk7tu3dUGR8u
	LWxPVc18jPWBfwr6db0bj9P2e3dl410kKNwTixbWEfUW6dGPtK8W6kE2OVvGuQFS07LwrV
	pdcFglJgStoSu1S7oC8j40kxBn2v8rSY4I7/DU+plfAExWiD/PHQzk0lnLx8sj+HhEaWNQ
	9xE6FXOgPoGqof60spk33MTkBcnwkkTubyaLO7f4/92R9Lrxlwg5+2LhfEXHZy1+3Tnrz7
	Xrjk31xaKGcL8AJ2GyvS3VRjHdzccQpDPe/2cS8XSXvOgE2ruITOAH2Qg0l6yQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792586356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LywcFqB+/5xRyU6GGTMYkhvgXlEandMOB0iFjHFry4=;
	b=3jNj9R0hQi60PadC0Q8npV3E5R+nfxTN0J1Wcj1xXvRpma9ZNat9HWx4CrpPbohWskI1hJ
	AktAQtUYXxGljrAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
Message-ID: <20261021143836-afd6d95e-03a5-420f-b680-6ac3e90e21cb@linutronix.de>
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 02:31:41PM +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-aggregator const
> and use the new st_attrs_const field of struct config_item_type.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/gpio/gpio-aggregator.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

(...)
