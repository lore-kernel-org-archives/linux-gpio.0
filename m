Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B94C9567
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645948; cv=none; b=Pf2XhU7hzZuPfe2kuBTwdN7aPVVQyJ95istTAFGU47iVFw3bsKsygnzSn6t318nXLbhnA7fxHWWdFWHraQxZBHX4M2kuDk2rr47llwaxUJhtMLEzvqrwv9/h9viRoOtduROOS6OA6vlhzSI8Vk+5dCkKGi7TaB5EL241cE1lAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645948; c=relaxed/simple;
	bh=1Bg3inej69xF/ATfisr13qBYcR7cPKaQKb8o1z72B8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oO9SOmiCClgjqg0blfjmn5iZ4IOGoL5FSRztba6HyhPoXNB3u9z7z3KJPxdDV8qNiojhYTa22Q9IWlBCfcAvxP7nIL5U8hRdEld1fMApDYHlctjWlZOtULr0adsBGKKniWd6qEmzU9+BMojaAtJ1qNjjH6YWlXoiZsVhltI81So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9VBH5Dg; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9VBH5Dg"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so772718a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784645945; x=1785250745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WKmer3uqjgZGaTDqjRAjLU77woVMUtTbyfOFW4Hj+g=;
        b=W9VBH5DgBsqYIa+BZhLYKlyCQpcVh3WEyu6lfpw2hVAfSflFePwbZJVH2GJuzgFf9F
         7l+CZEXVafefpVWbjgOm4CY2UbNBsnXjgm7/VPHQTvk8nmY8jvAwpbXV3DgEQQjad2H9
         reB7AZlsTvBBNANfq1q6ue0n4gnIv1n97QIOLwnYZy6AkBsPGAfl8RgWYuITsiyyx98N
         BHbVsrqT2lfJ/HdAYD8kVE0XtwmFldDKgORsKTjIOL3590LZVtC3x7CYNMg1BSzZEgyR
         5t1uOvAWSg3srd2V9zP4i/jfNF/o950hLJpMJRCB3Nu0RtBpjzBZrJY9vPMAWQjfAkPt
         p16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645945; x=1785250745;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WKmer3uqjgZGaTDqjRAjLU77woVMUtTbyfOFW4Hj+g=;
        b=k7tJoeDwpGmTlRBntNGhGubPL8jMXCn5A1Ve6knANLwZNxZKaL+2qlwrzfZXGc+Lsm
         nWx3H3P+P8apO4TKe+N0v58/j9SQmbDnPyyRSXLZKNcbf6jRWC85EtvOBnlaqUh1luTk
         Pr1errZsrU8u07RthiKV7cu6Lm8BarpfUfSfAeHtqqVVfvVxCa35yvmRmMhVuhworwXg
         T8/FA5hQ9PaW5F20mGofZU2MxWq1/FKBREYhKZ8JGqH5TOOaakPQxcFwtJXHE2S2V9Ts
         s6HE8e6G9O64Si+Udkm1AfhTRjgfLweUMA58tkH6T9l4udqehksBOexcw0l5cjvYXulV
         OeAA==
X-Gm-Message-State: AOJu0YzobPvy07o5fe+7vxmEBoQrNUY2QZ8R5ZQvwW/7B3e/6usRKhcY
	4exRsEbDAyi6pwNgWHzuuw9wtJPGviYRAwVTYp81xqmRv4L7yUhpd41m
X-Gm-Gg: AR+sD12h6HnAq51AC6wFtbbmb5AUnudHkTL4g3fgqghWt6aPuCiddB+13RJTmU46grQ
	KHdagwweJ+B+IbFClZc5firraZSt8M8hdC0j6HZyJ5jbR7TTZHdpOqa3TVNAt3YxSR0iHMX4Tqq
	FYTYWJVMNn/65O8jooDWt5PF9fKHCN4AIhhJ6XQuF3ZISNr34echKaaMueWUN5v4QzUvKEDg3wG
	ZwcP3UwKFAPJMJ/xKHBrw1tDaqMTFThQP7LYiBhmr9DJuGmUxv7jTv1eTD2HiqfSn3T+CQSZ3PY
	zQtPiB3Jru63B5PzEBLTOnDMsiDuKWlUT8iWQU3McLoWx95EIDahRun3zwJu7lsREo302pNOMwo
	Ji7bRjYx8xsZ+fYMErR2c+VNhMcj7CkGCoBW0DbXq5ikj4VrcMiQhiHKpVq0yTzgYvQQX44K3RA
	XzPcsI2WXP
X-Received: by 2002:a05:6402:40ce:b0:69c:2fc1:d4dc with SMTP id 4fb4d7f45d1cf-69e6532a1e9mr7211815a12.39.1784645945343;
        Tue, 21 Jul 2026 07:59:05 -0700 (PDT)
Received: from [192.168.136.254] ([94.232.27.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee248asm6113634a12.1.2026.07.21.07.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:59:04 -0700 (PDT)
Message-ID: <816442c5-88fe-49b6-92a3-cf924c056ae8@gmail.com>
Date: Tue, 21 Jul 2026 19:48:04 +0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: rockchip: add support for RK3308B SoC
To: Hugo VALTIER <hugo@ahdrone.com>
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Dmitry Yashin <dmt.yashin@gmail.com>
References: <20260717075918.1869879-1-hugo@ahdrone.com>
 <20260717075918.1869879-4-hugo@ahdrone.com>
From: Dmitry Yashin <dmt.yashin@gmail.com>
Content-Language: en-US
In-Reply-To: <20260717075918.1869879-4-hugo@ahdrone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 7/17/26 12:59, Hugo VALTIER wrote:
> The RK3308B is a revision of the RK3308 including different iomux
> register layout.
> Several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2, GPIO3_B3)
> have 3-bit mux fields in new GRF registers (SOC_CON13 at 0x608 and
> SOC_CON15 at 0x610) that override the standard 2-bit fields.
> I believe the bootloader sets the sel_src_ctrl bits to activate these
> new registers, which causes the kernel's writes to the old 2-bit iomux
> registers to be silently ignored.
> 
> Without this patch, SPI1, I2C3, and other peripherals that depend on
> these pins are completely non-functional on my RK3308B boards.
> 
> Detect the SoC variant at runtime by reading the chip_id register at GRF
> offset 0x800 (0xcea = RK3308, 0x3308/0x3308c = RK3308B), as requested
> by reviewers of the earlier series.
> When RK3308B is detected, swap in the correct mux_recalced and mux_route
> tables and write the sel_src_ctrl bits to ensure the 3-bit mux registers
> are active.
> 
> This is a rework of Dmitry Yashin's series [1] which used a separate
> device tree compatible string ("rockchip,rk3308b-pinctrl") to
> distinguish the variants.
> Reviewers Luca Ceresoli and Heiko Stuebner agreed that runtime detection
> was preferable since boards are manufactured with both RK3308 and RK3308B
> using the same device tree.
> 
> Jonas Karlman implemented runtime detection based on the GRF_CHIP_ID
> register [2]. Reviewers asked for more changes (constifying some
> arrays), but the series was never resubmitted and was dropped.
> 
> I run this patch on my Rock Pi S boards, the newer ones I've got in
> 2024 use the RK3308B. And thanks to runtime detection we should still
> be compatible with older devices (but I couldn't test on RK3308 as I
> don't have any).
> 
> [1] https://lore.kernel.org/all/20240515121634.23945-1-dmt.yashin@gmail.com/
> [2] https://lore.kernel.org/all/20240604141020.21725-1-dmt.yashin@gmail.com/
> 
> Signed-off-by: Hugo VALTIER <hugo@ahdrone.com>
> ---

Hi Hugo.

Thanks for re-sending the series!
Applied patches to multiple boards and it fixes pinmux
issues for rk3308b-s based boards too (since the approach 
kept the same as in v3 series)

Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>

-- 
Dmt-Y

