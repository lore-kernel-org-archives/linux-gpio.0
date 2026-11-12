Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476021;
	b=KRGemRiKFMbq/elAD/bAjqmqbIi6HCH1D0El++0/sqr7Xjdw9Qbl0lWPt1hkQjzkxzmt
	 STRrCkYMIpOSMOYlbJqwAnprYG9vwB8UuOQFcFA3n1s5twwDVJlMwJmF6unaWX+tYFG+K
	 BTApfjICQ2hTEGa4wClAM2sNZxiOj+bqExY73n7hLodsVrKSbzZu42WOgPIsKiN6xPqOu
	 n1zxv6Q2j39vmu3ulNsbrWfcgg3rTMJd0IWHQADVJfquK9f3W1ZFdYlA4KflT5Oq9ddN9
	 i+LqB+hop4J7PCFsBBFbddrceZhJfuaNGwEUZY77MdwFUsaK+WSuohNbRGSLAyA8cYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476021;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PvpQNatVTOT2KajcSrAsH8RPa9CV8xCGN1VjSKKPUwY=;
	b=2hc0qryF5h6TnpRshWlA0r5nlGueU3Lm+RjKjo0ur39ujY0fLtQTGsJ/pZakOrXFilaH
	 pgszmyxijLgH8ZJVxDks729T010/rQvMipr4Iq7S3b1Ke002eWiTX4EP19dDksvKeniAO
	 SoXvqSL/KCwQSE09ufjht+/NHIe8I7CxXvojg5Q9qRQKvd+Nuh1iSE5FXX/x+F9H5noCm
	 Lszf8+WKUJkCAu9c5Wna8Yan/lmXxzCVZwMlCrL3Ma8hI+CMjGvz3HoIM4WkiaFNRVWqr
	 VSExT6cCG3fNzcxLlRJ0kZF20L8dBOnA/7KhgJgPFVFB51gWeZMZw1hBhtoONB06viQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E6606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 09:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 144E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so2673784e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 01:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476020; x=1795080820;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PvpQNatVTOT2KajcSrAsH8RPa9CV8xCGN1VjSKKPUwY=;
        b=bUhzhQ2QqSBvfgj0jAm3RZxR4x+WL9fMKV83YmznfqBSmbeRwSqbrRMhMw8jIPB04B
         D6oy5BTYicicxfYsG4ehiXpuLpLLZ9nMbPFUdt1844d4DDj3HvcKBpIypJqsYcH1Q73Q
         Rp63ds8lDefgqhoJ8teKrnw/Ya9+l5bDoXPwnHGMbocPjC8bQmdYX9YkSbxX+ulumhep
         CcAgxsc3bbaUpQauqgrNtuj8EMLqUjqU5sKStJykF9lo4kPHOm33h2hXhTMwHoC13M+0
         yZReFS+sVdKDWv8Q9rKrP1KZNMrMR+ShLhCHG6jbp2K0RNpOkuyHaVQvagVx9L4ZEIuN
         U2bA==
X-Forwarded-Encrypted: i=1; AL+hErHuYGW4vbmp9mPiqm85SPQYUsOig37yUxgMEVeQkXL4fhlnnCo4/+aHpsXBTb4A1g8rNme5KkUeLvlz@vger.kernel.org
X-Gm-Message-State: APuU4Z/jYBuT5Xx+oNQmUOtoq0FTYBCYv7/BSCgQhCQjVkJq3D7SAU6i
	+m9EO4pvlPymkAr7n7LIeTHoXKkYXBQ/sQANfB2x76AH2hdzuCqFhO6sWPnAWx66
X-Gm-Gg: AYBFou222kzPyCPMbOUA8KYkISNE5aTBz8u6Wv2i0Eux5/HcIs6qVryYEy78qrrDLJo
	vZBbyDYqps6vm86PThAVSR54cj6UMWOUqVGW5kS5WHOmhJELb8s6IygSttn50xiSDXXBpU1r2wD
	kLyepsJpPg56yktQKjdhZwYum83W7Q1qf48tyTFX9q0FJQw1V5LHRYMgik2JhPe8LZyxyid7w3J
	ThhsZ0A4S7VcqFU4J8CBJd8E7AJVSsHnf6nFJEu5lV1IRRXaR1Cs9qcoqy4nCI+3t5vbv4dB/if
	I24r5F62Ax/ULb7l7b4B30wijHzJVyDf62MEHEzVoLus4Bxjnm0GAN6/L+DxQxoklKitEX5t6mv
	cxx9hjp5kdm0feWHgcVSUmr49cZLpkvBxqKBCq6dg1uRaidt5JDeqdj7fKs6MsiU+qHOXTTKt9F
	Z3TFs8XI75QVV1kYK7GWgYVF/xAYmuVX5EWU63B1ZVJ6LutXhi88pZCpguR1mos924/7t93YVNj
	YQrl77mE8s0RwZmKMUVuMSumu02tPlHm+AHnpDYiVMerTkRgpnVICr+hVhI6UyMqnnnjnAegRGE
	/2boyJvP0cXNbgwAA+T0ljdM81Sx9LutunFR1fLK6aZeDvCZq7dxPhB2CCLsVI33s20=
X-Received: by 2002:a05:6122:489b:b0:5ea:d2fa:c2e6 with SMTP id 71dfb90a1353d-5ee1c43c30amr2071388e0c.14.1794476020086;
        Thu, 12 Nov 2026 01:33:40 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c58e5d1sm4735598e0c.4.2026.11.12.01.33.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:33:39 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-998749fe872so1962662241.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 01:33:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF7bZRIEjmLFBZOyhUykSAdxaP3oMOem6JCyXtGCa4D3E9LoDQbx3n0qPVgHvwmxdKIGrlbRdKrbL9w@vger.kernel.org
X-Received: by 2002:a67:e7c6:0:b0:7b2:f3ff:6b34 with SMTP id
 ada2fe7eead31-7d4eed5b7damr2202052137.1.1794476019144; Thu, 12 Nov 2026
 01:33:39 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112021818.1819-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261112021818.1819-1-laixiangwu@cmss.chinamobile.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 10:33:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
X-Gm-Features: AclHuK9HKr87_qOdqG_vlcwyWmSNoZdZ0yGoPTgdymMg3LMPadA1Yy3iSiEgPYs
Message-ID: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"

Hi Xiangwu,

Thanks for your patch!

You forgot to Cc Andy (and Jacopo, for the original bug).

On Thu, 12 Nov 2026 at 03:18, Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:
>
> rza1_parse_gpiochip() parses the "gpio-ranges" property with
> fwnode_property_get_reference_args(), which takes a reference on the
> returned fwnode.  The function only consumes the argument cells and
> never uses the fwnode itself, but neither the function nor its caller
> drops the reference, so one reference is leaked for every GPIO port.
>
> Release the reference right after the property has been parsed.
>
> Fixes: 5e455dd93397 ("pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper")

I will add
Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
as the of_node_put() call was missing before the conversion to fwnode,
too.

> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -1183,6 +1183,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>                         list_name);
>                 return ret;
>         }
> +       fwnode_handle_put(args.fwnode);
>
>         /*
>          * Find out on which port this gpio-chip maps to by inspecting the
> --
> 2.50.1.windows.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
