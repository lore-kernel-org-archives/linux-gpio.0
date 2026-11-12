Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485542;
	b=oCrv5qf4g38x/q86IV0d9OB8FdT3lJSt/MMKwaO6N6H6OanyL1gV6EGCet+qE//yj07H
	 P5d+Tg0QBMraAafYOxrnkVrnciK72L7WPx1/JU9m291dRCmwdw2HHhWILD3TzLe4lVB45
	 92KWLnVSslt+Y9lg/Ao4FV5jikDVbZ2i8Z2RZ5jm7N8W9F4/j0AhdMgKUNDUK41fjiG0j
	 2k0//vQT+d2R93n3PRryPCBHqQBAEjX4nmvNZ/KJC3lvAFztfZ0im3NriMBCpUZao2MaC
	 tykXiVCKsHASxn2iz5t1cRtG9jNgZl4v9tCTX/McTseMhwGueCGrHMs44Bkyb9C7qeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
	b=kJF+HNvOixs7B7dyco6aaUFsiMwXRhrKkCPyJotwUdX56XVTXbqjFR8H4JjeIphwKGmO
	 sZWH8TdiEPRiPbxZgDKtwUY3uApEc3R5ZKEv4zNCQbgJRiisqhMoWOmm13DoynvSIxhFB
	 k/Yfzk+atePXhcIYZ07Bsm+xqxlIOW3G9KN3XOSNodaL6nPy/10JB5s3JwPd0DrZ0m0u0
	 k20PLIqPiKwKwgxw7uIB0Mlr2+hSFjFrg//rslojTl98MZNAqlVhB0lq7cLaMKXpN4Wv7
	 2kth9akqrQRWBdkY49E787ITjxgRuCrIm4fta/tuZw0ttPh4WYYVuYKY2K8kLq6Ip7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BvmnVXRh;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC4606A323
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 12:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AC4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BvmnVXRh
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490f38e9688so688187f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485540; x=1795090340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
        b=BvmnVXRh37jlQj5w+r+F+RhSfdu+OISPOeDGoNpq6xWDkIAMFJ1jNyoFPCELfxfZMW
         STQOokc+wrDCKo3qAa6Z6pKMOX978XaLqPJwLIzI/E0S7fIscdDTz2ebkRmp9Q/DY0eq
         ha02vVjulkCaMD7jjZAnXaXGxJzvsr0ChW5u4ugNgD98Y4PfSKLiQo1dJ/WdK1qPy6X6
         qWL2W7gzXfqrAL6QIxPxDFwWcIJhYGFqXKhifxWRDbWM3iNCfNQ2+yWCmqX0amdWYWAl
         L7MLUJyjSUWU6aeWGMLKAVLTj+UWg0KBBYpB9Y5jBgM7sJI7Q1I5JlaG94GNfR+Y2Xev
         Cy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485540; x=1795090340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
        b=Ge8sR6PNwpNUfZ2lH1315gV0Xv9PoolHZ9C5l6sgynRnNoBZXNqifHrrWJKpObl1hM
         f49SeegWG74zS4vE6UVakACRtxaVpXbJRa0fAgwdrBAZ9KR5oOKaXsj3YsefbpEs4Bpa
         rjlC7eMpETJNwzlfx843XzeI1bsz3wMDmwUazf/BNa9asChKr+NZp32hRAyYJtqAGAUN
         Rtja39hTdQkQ3JtakJZrX+Q7ojRSvtmYIcboks/rP1GlSIomScRg56Qc0WeSa7sR/1SA
         4tEfaLl1FRW6MOxYj88BAvAXJ6xr9U/7/niC9QdxxpvUdVBl20qEAVXeKdmPGnhtnMPS
         lSYg==
X-Forwarded-Encrypted: i=1; AL+hErGRM1ak8/ORCvsFp9EWbuDfp5O/nl9eETp6anYVThvuuxNxxs/pVzbCipaMkjb12OhwrkaVIZpAi+gG@vger.kernel.org
X-Gm-Message-State: APuU4Z+pWeVoxi1CtAZ70EmHwMlo0W2BzvBjk5mFIG2brQMXFT/cnfn3
	UP6gDzzRVfedz+Om1qBQqdfX6p47g3q/eHLhzK45TD1ws0gyDi3YxXKUR7OU1FhKlB8=
X-Gm-Gg: AYBFou2C4nHbrZB//+2NARvUtxIps1UDHW6E/sVQaUisPHSN0w4H11Sky5jAJFk9B6H
	Ej6/s8uxDr1Qxz/5oHQdBXydkWLjS7PnziStoGVGd+3sCxqbrfrGDbUzNIAiF/X8aF+txyRyVNm
	yrc8CV5rPg1ipfulFZniCZLSMx1VsFbzXOfdXhQYQqI9b8FOzwlnfRYdfRWFedzX+omAhDqsRIk
	bvvsUdMgb6hfU8Rmw7BGtoZZx7pHEdCIzBsFB4BARnemRu/rD9fIfWE605cZzVKqzvaNqbbGP9c
	3wMcsIhIUZjgEO0JtYjIe2f7VoyE53+oDDAGiSTcxwN+/pljWhVqzh1FuC4S7NCFroOqXt3JsaT
	bO0pkRn62cRvh/kcTluAd0R6zyc7r/G3C/yYgiGUWdl+Hsp5e8gupQsykyFrqrwTg99Rv/1nEP+
	Oh4vf48feuw05TGsI8HGcUQuQH1Ydrqmkd1OTFLFwtB6OIri3vZQfyFEbsvVG+MXUayRAUH2s6w
	ndix1x7HZvVUt3SFGU9k2OF0BRIAzclyDBcc5QqK5Brch1MGlvN7mPnyzg6/g20lH6KISXex92D
	r86XOdMq+z68p+7+4oTBPnTLDfp7
X-Received: by 2002:a05:6000:491c:b0:491:e477:6820 with SMTP id ffacd0b85a97d-49aff96ab56mr4685821f8f.20.1794485540040;
        Thu, 12 Nov 2026 04:12:20 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm15040172f8f.6.2026.11.12.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:12:19 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:16:16 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds
 access in fsel_get()
Message-ID: <avWuED_RGlEdGH-9@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-2-wangxiaolei01@kaihong.com>

Hi Wang,

On 07:06 Fri 06 Nov     , Wang Xiaolei wrote:
> brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
> register and uses it directly as an index into
> pc->pin_funcs[pin].funcs[]:
> 
>         fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
>         func = pc->pin_funcs[pin].funcs[fsel];
> 
> That is not how the register field is encoded. The setter,
> brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
> funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
> always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based function
> number, while funcs[] is a 0-based array of eight entries.
> 
> Every readback is consequently shifted by one slot, and a field value of
> 8 -- which the setter accepts, being the eighth and last alternate
> function -- indexes funcs[8], one element past the end of the array.
> 
> This is reachable from userspace without supplying any invalid input:
> 
>         # echo "gpio45 alt8" > .../pinmux-select
>         # cat .../pins
> 
> The write is an ordinary mux request that fsel_set() accepts; the read
> that follows goes through pinctrl_pins_show() ->
> brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
> Raspberry Pi 5:
> 
>         BUG: KASAN: global-out-of-bounds in brcmstb_pctl_pin_dbg_show
>         Read of size 1 at addr ffffa07c577ab2e8 by task cat/839
>         The buggy address belongs to the variable:
>          __compound_literal.62+0x8/0x40
> 
> A field value of 0 has the same root cause in a milder form: it is
> reported as funcs[0] instead of GPIO. The mux itself is programmed
> correctly in both cases, so this affects the debugfs readback and KASAN
> rather than the hardware configuration.
> 
> Handle 0 and out-of-range values explicitly, and index funcs[] with
> fsel - 1, so that the getter uses the same numbering as the setter and
> the index can no longer go past funcs[n_funcs - 1]. The existing
> fallback for func__ placeholder entries is kept:
> 
>         if (!fsel)
>                 return pc->func_gpio;
> 
>         if (fsel > pc->pin_funcs[pin].n_funcs) {
>                 dev_warn(pc->dev,
> 			 "invalid fsel %d for pin %u\n", fsel, pin);
>                 return pc->func_gpio;
>         }
> 
>         func = pc->pin_funcs[pin].funcs[fsel - 1];

Non-blocking nit-pick: I think that pasting the code in the comment is
too verbose, especially when the same code consists in the entire patch
body here below. A succint explanation by words would be more than enough.

> 
> Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
> "gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
> the splat above. After the fix the same sequence reports
> "function spi_m" with no warning and no splat, and a register field
> value of 0 reports "gpio". The register is restored to 0 afterwards.

Since you're at it, would you mind fixing the SGPIO AON related OOB access too?
Please take a look at bcm2712_[cd]0_aon_gpio_pin_regs struct: they both have
a bunch of AON_SGPIO_REGS macro describing pins at the end of the struct. That
macro puts them at [(n) + 32] in the struct so there's a hole between 'normal'
gpios and SGPIO ones.
Accessing bcm2712_[cd]0_aon_gpio_pin_funcs struct via this +32 offset as the
'pin' index in pc->pin_funcs[pin].funcs[] will result in OOB access. KASAN should
report that if you 'cat pins' in aon pin controller.

One way would be to refactor the code in order to avoid this hole, but I
won't pretend this.
The other way is just add the missing SGPIO entries in bcm2712_[cd]0_aon_gpio_pin_funcs
(mind the +32 offset, a new macro is probably needed).
You can find the functions for SGPIO pins declared in downstream driver, see file
drivers/pinctrl/bcm/pinctrl-bcm2712.c from rpi-6.12.y branch (later branches
already have the upstream driver which is missing the SGPIO functions entirely).
I've posted here the relevant data copied from downstream for your convenience,
please rearrange accordingly:

static const struct bcm2712_pin_funcs bcm2712_c0_aon_sgpio_pin_funcs[] = {
        PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
        PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, _, _, _, _),
        PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi_5v, _, _, _, _),
        PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _, _, _),
};

static const struct bcm2712_pin_funcs bcm2712_d0_aon_sgpio_pin_funcs[] = {
        PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, ctl_hdmi_5v, _, _, _),
        PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, _, _, _, _),
        PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi_5v, _, _, _, _),
        PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _, _, _),
};

In case you don't want to fix this, you will still have a Reviewed-by from me,
and I'll take care of uploading the fix in a subsequent patch.

Many thanks,
Andrea

> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
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
