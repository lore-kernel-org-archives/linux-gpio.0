Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E238E44C4EC
	for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661615; cv=none; b=tk6TqQWpFJpTDteCj8vf5Tc8s06xeNWV6xD3TYLrkjbmS1morKV106E3hmJrOrSWU/1qaxR9o0ND/Rf8dEHkpM2gEzXZBhBMbMaOhqbCeYYNkdA3SxMftn5P5SN4NMOfakTCNyUKabq3ZB+d4c0uQP/lm84ANu+NHu1YOsHFAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661615; c=relaxed/simple;
	bh=QCWu+1nCsFU3Ed99yMQ8CrBj5gAQSQzojcYoisfIgnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMu/pasQHh1LBIuh7qFWPkCTHsZaFFS6k4SGWDDXRdEKUuD1T4OKmDAXVGg/FBBK1M9FQW2LlOBhI40UvB+t3dSfCK4n8SvQzhloJErdoPrGkmKgAwPeOzaKpMl7focWM/s+JLJ2YqROvUMSNDmNuN07PL8vuBfPCvM5WwUhVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-73b909fbb6bso2888137137.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 05:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661602; x=1788266402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lItA1IXA9IE0IEBaaAVaQ9GLMnrPHs08yepsXMWLXUM=;
        b=nXCaZlSjr0k9qFyU7Ej6f0ue+h828wexwfwSbqqyp3MerU8/gpvHNQwNfcvHstOUvB
         oCuqG1b6haRbkg30kRksdfVtlMhxv52UkHGDWnuiXVhOabnJ8nIF6QzEzC/1Wu8j0Z5T
         ju7O26c58DjQVtU4Q4j2tl/VQofntJCl7EYeye5vQIILymDj4dG07BiiEBVAHlq9NcXu
         a776PueDvasMzBPZZFuvC4Gttp4H8huqAQR6bVsIP/cfl/CAO12sgW+CA8piHyVM5nkW
         Ws/SGnEKu0zbPSmDbulIYD59PEC85r74mQQJdIIaB+R7dAfta3WqqGcuwWMVVhhCaJZ8
         2Jrg==
X-Forwarded-Encrypted: i=1; AHgh+RqgnUsqWwj4zcyjXEs2G859Ov5xAvkIQmCJ5caoj5I8W6Y6pOLImIxG5hLB0kZSCg0VX8jQQTZTE+EN@vger.kernel.org
X-Gm-Message-State: AFuF++mwgvVFU452BDW0x8Nsu11amp/ZKvayykSrZV5VqeXVi+uG2PHD
	kOqo4raprX0KpnW2zrqlombyxeBByMFppX1eQhVHoSBomOJN3TcN3NZu/C69sjgB6j4=
X-Gm-Gg: AR+sD10ySFA4GCPh5p7lKth1I6Lza855XXUa/j0OpUOCxghijAYalTImmLGY0doXL6N
	J5XbY/9dNjyVAvKmbpER+7yxg3aYAtHx1RKriU5+S25+gfZr4FUF0+7vCpD3VR9qOYeerVRWcMe
	3eV2ER67UcVwS3x04Sj5Ftfu0SC9VUkhqrQbBFODNZCPQAW1hwg8zoP58bezFVebD6Vsc2vNBBK
	eDREz/nF1xlxJJASsFAf0wQPKd3cHcUj0PCsE2dKE8iWja9JkNUxi9vtKHsuDEOxVSvzeufRffJ
	EuHPEQMi1nEBYz6z36sATmbNA3vh11TJR8APNgT9xa8WJ0EvVC2jw1OhS1OIBNSAuH9LCqyZNdf
	QWu1c9hzaP7ZVCVsig+VHvPIhfqSV4l5Z/+7HJPFMKh3lbKtK5f/Y1nRGmwCWdb++dWDhKovzSf
	JS5SS/TtzELVYCMNzyGr8kIuMPBYePlrQs4tOA5EG+BC90WEZEIXlQsnF1RmqwKTLZkljn/RuqC
	lL38K0ff+ttEdXsctYYkLyFxD1oQJ5XoQhcYLXUFJvaqiIZ
X-Received: by 2002:a05:6102:512b:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-77a64358362mr12675279137.11.1787661602248;
        Tue, 25 Aug 2026 05:40:02 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c8345f53esm10444111241.1.2026.08.25.05.40.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:40:01 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-73b909fbb6bso2888121137.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 05:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr652vgnI86WvKaSFmAJf1t/Sq282PsnetqbMXYITFX7e8/5TX+HBbetjEODLRS43UMwoMfJ1lrQ1iO@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:77d:e064:2dc1 with SMTP id
 ada2fe7eead31-77de064341fmr5703801137.0.1787661600596; Tue, 25 Aug 2026
 05:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:39:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqsO4Y9g+mLdeq4LZ2sosR7r7hXP0swKtRFap4qU3zfw@mail.gmail.com>
X-Gm-Features: AcwNN1W430KgO2INmLr-jl8Vwq7Neq8fxPjRN54TH1O2lbbWeDTKDcjU2n1-28M
Message-ID: <CAMuHMdXqsO4Y9g+mLdeq4LZ2sosR7r7hXP0swKtRFap4qU3zfw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Aug 2026 at 16:36, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - in function rzg2l_ps_to_pwr_reg_val() return power source register
>   value or negative error; due to this, in rzg2l_set_power_source()
>   dropped the val local variable and use ret instead; due to this,
>   to be able to use ret on register setup, moved the rzg2l_ps_to_pwr_reg_val()
>   call after rzg2l_caps_to_pwr_reg()
> - dropped the tags

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This does not apply to renesas-pinctrl-for-v7.4, so please rebase.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
