Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574120;
	b=M9w8lz2btcup3qaM7cVUu5aK8YmSVmEyDXKaT92qi/CYMlPRbm5F17456bmnA5h/lWur
	 mR1h3nSbdw0c4wFLCgT4UGLBRARhrC97SDtEYpNEz1wljCWRndAoEyrN2UGc8wSBCQ4w/
	 fV09V6SZj3QMgm843g7wRXxRbdja2wbII1AXRwgBt/nhXpN90yCVlKcA2WMO8ersB9V4k
	 dq4l5t5eMBxB+y8bDy8ek1tG0B6xZa3g2Gw1rcLL/iNsWo9IYwNIzywr0HN0+pkZ3NaJ4
	 LRUgV7OYFwvDbLMDjrZWecfjHKGvzAJQviRdMCNQne6WFaSORUve3S9gqIR7snE40lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
	b=OMUIG0yhaFRGhD+xdZaGaKaJcowfhCjOkvLzuH7q/BwbbOfu+lX18ZWU4xthXSHjrfL+
	 vW0X34oDbu40ANlWqB95+W5YvOLTm3/2T0NcN4/H698doJ+tzeiSUejPcCIFDwHoQGIt0
	 PSIBVbobEOdUTu8CjG2lCIo1rWuhwY8Sn+RNlGLFsTGMrnneJOHb+ERhTSWfFuIaGgAb/
	 Zr26Cd1APrtEX/2vvwPVxGpeayRfb3Z0OR8mSfpfzCabH4oiNvXknbIp8tUM8fFDBUEux
	 N2KWEojWYdbHds1KkxDykzD676w+PulKAHIBxDpuHyxPGdIeyWoBwhDCocI6obqCEvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aa13XPBT;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F021606A327
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 12:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F021606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aa13XPBT
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so387924f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794574117; x=1795178917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
        b=aa13XPBTnWlME6AGchQWWhj8WGEPUrnXgNH+WOydHvaXbcAUsWHkOI/GSW2/SIVUyB
         8MtI2pih7abMuH5xIRGeiapYujpgnF3zpLYi/NF4R4aj5mWgalfCJEVVItt250DMFa5D
         K1WauyvOHmvrHcBqavIlfhKvvj8/VU5wAqxUhIbg21kxq29L21DIl7hjTt4fHocn67zK
         N3Tm8StUiETdtN/vaQJZzWUKYZRjnp+DPmYGs3wmG3/342ugfreO3AD6to7ULluEpV8b
         SLiFg7T7rQ3WAoHUtEd/kUkdc8OmMKP1vDqdUoY+T1DTvSr34N/bQDHs/emCYvhMAE9Q
         u37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574117; x=1795178917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
        b=fmov1zk0sdFq1Meu8NtSEViIHNnad01gZjnHZ0w5QY+ZJ5+m2S3DB8csKornAB26vs
         ygwOgBD7xAQDnug5Fxj/Zgr3thJe4EKNrjqq3mA52LZPYbWeuL5FXRI5pYul12itHKj6
         2bEfhZWsO5xAq4zKR6rAmcNW3bX1ZqcfaVWzBgfaGap/mzoyE5J8cip/VBEgEYJT8X92
         NkHyS6ZUGIFumlcisd+ZTnh8eIb0KoeV8DQuYh8/m8f1jgRUSOqPy8bnEpMSu03Hdhyt
         Xt9ODajDSGYn1p7p1UGtiqqCuTP3LMhkvTXFb2qRpWgNp51wVlP/zhdaABhulAqS6Xna
         Jstg==
X-Forwarded-Encrypted: i=1; AL+hErE01qZNmNb296KnNZ/oSwNaC4s/dkwcHYG5Q90Y6pxykQnM8CFhut2Rwx0+5ffuSjMg0bgV8ihUslxT@vger.kernel.org
X-Gm-Message-State: APuU4Z+4O/7+26smGIqjh31tpErpnuNi3vFGaZ+IZ5cxG91bwzvvM2vK
	TgzeIQVuhtRlXgKEjbpgwxiPgwIVy3x+Jp8H/eOnmMG/E5Bf7kDah+1oqgfqc8N8qig=
X-Gm-Gg: AYBFou0w6nNDy/tRydQRyTas/9y0aNgtEELCnsLgSD9bKk/uVEyh6OMhESzscQt92ZB
	gOBJWZeWwpAOWDpfD6SUwZi0qB+Prn02VbTmqrBYjEQBEO3BPMT5Ew9fhXtddJM82O8H49yxqGI
	qDAqn1Ax8CVqF3wXkicbl3IXGL699s4a2EUVCbKWEKA1BW5P15KppxpoVSfiVb+IvLMM1ipib+h
	0vNnhAjrJYzjGG01EUR9h1AGzy0GtOeU9DB7SQ3039KgM0bp8bPQlGdQUgtDB/uZpzBtwV8QWAX
	O/tBXN3xI771gQeCJW8Alu888N2DChkMKLfKYEfQxo45iKWM/yHWwE/uzrWd8XKTsivT7i3rtPN
	QyBaiyAks6nstOwyxn73Tt1iUFmiZyD8rqjn9993HzUM6IuwW8IDsax4tP+iidAibJxMedjWpcv
	hE7cAkzYpCVtUk//rWcEMIywKFsqzhs/eFGGbCVWdRx41VNKeNVxBjhVYzFVsQgVzXTF/UtzMdz
	HndbQyVfGx6F32gZLmGxVcqitGzZiJkeC10vfUc7NwAC1qj4Y110sql2AIJwbleDCvSu7kZc9lp
	ZpRkSP67A8l9ZdZjzbujRTfTbTdh
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr4648801f8f.42.1794574117479;
        Fri, 13 Nov 2026 04:48:37 -0800 (PST)
Received: from localhost ([82.145.117.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4643230f8f.27.2026.11.13.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:48:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 13 Nov 2026 13:52:34 +0100
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pinctrl: bcm: Fix off-by-one and out-of-bounds
 access in fsel_get()
Message-ID: <avcIEnCThuTHeWVv@apocalypse>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
 <20261113053221.3131068-2-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261113053221.3131068-2-wangxiaolei01@kaihong.com>

Hi Wang,

On 05:32 Fri 13 Nov     , Xiaolei Wang wrote:
> The FSEL field is a 1-based function number: 0 means GPIO, 1..n_funcs
> map to funcs[0..n_funcs - 1], and n_funcs + 1 and above are rejected.
> brcmstb_pinctrl_fsel_get() indexes funcs[] with the raw value instead
> of subtracting one, so readbacks are shifted by one slot: value 8
> indexes funcs[8], past the array end, while 0 is reported as funcs[0]
> instead of GPIO. The setter programs the mux correctly, so only the
> debugfs readback is affected.
> 
> Map 0 and out-of-range values back to GPIO, warn on the latter, and
> index funcs[] with fsel - 1. Tested on Raspberry Pi 5 with KASAN: the
> "alt8" readback no longer splats, and field 0 reports GPIO.
> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> index f46b27155c3c..2b942ca7196b 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
>  
>  	val = readl(pc->base + BIT_TO_REG(bit));
>  	fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
> -	func = pc->pin_funcs[pin].funcs[fsel];
> +
> +	if (!fsel)
> +		return pc->func_gpio;
> +
> +	if (fsel > pc->pin_funcs[pin].n_funcs) {
> +		dev_warn(pc->dev, "invalid fsel %d for pin %u\n", fsel, pin);
> +		return pc->func_gpio;
> +	}
> +
> +	func = pc->pin_funcs[pin].funcs[fsel - 1];
>  
>  	if (func >= pc->func_count)
>  		func = fsel;
> -- 
> 2.34.1
> 
