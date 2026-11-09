Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235255;
	b=iBO4N3ZEAWlKMqLneYc4akaDMP1/VTIq3XkyAsaP7jl+txiDVsoKNND8a5ZTV1DCTbdD
	 RiXrcqE50FB15qEw+c5JNGWuHEVSAr94kU8bpWeW6+hxGUV16dN3lCbVuIcenEqeB1BgC
	 JasOYRApJW9hg0NohV7WCjj0NOT6m+jjUwDcNTOn9ZPQt1K5KpLmSMlsjgZD+3+gml13g
	 kKsfaSBYyYNzbvJCxEbLQbnSUoUZkTOBSD9U069nFlNZPSRQnS1CzAIJh37mun/bRxyf6
	 gh2hGEO3YK/GgfFCeABnOmBJrPEbrmsFQxkfC6r/S6xuRetk2qspvF1GTI9Z5vpO0wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235255;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cy50rfmz2U8Wenr7PayVcuqxUEa3jPtDbT+8qtBvWBI=;
	b=YPbBTDzgAnphVFTBhOu8aipGNqEu4feFgCNlXYm8FKb7wwgoodFQiuDs94Li33NgW5Dx
	 06vaMRZE8ctn1Y5ENcisx/Jt1BS1Apdp+W8m9QGR9XQYLl11IWeiNqgCIU4NO4pN/I4l+
	 3dHIlEWx8S16OtdNPbc0rh1NUHGPqj5HwccV8BigmfM95XMu4JL9ZPHknV13YrwDya9UX
	 ak3BmJGIpL5XBBXN7UyXZlbSuUIavymPJLciSul2eSYeq6B7H3l5CrVjUAkEggrlCAQwE
	 IQOrzNKJf1eAybXJCA0RgxfGXT6HJTY1UvDvXjx+2e9mRgs2nEazXJDAHb8r+6e5dRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D04606A323
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 14:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D04606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eae1276409so345542e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 06:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235253; x=1794840053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cy50rfmz2U8Wenr7PayVcuqxUEa3jPtDbT+8qtBvWBI=;
        b=VI7icMg1vWNKUQ+2v9KaAFSwcMv7vIOpmGhcZh/1I4J15oqgg1OUF975odhkodO7MN
         vjDvmYpH9NzWkBmGdmhTFno+yqk/caG1tdSZh4KOhvzWaOLThGjTY93L/UW3n8BNPI0f
         ZMf/Tn56CPxW+WcBUvZjfvmdZp8+Ro3tbI+UbP3U+lRRE2ZXnh85sgtJKpzXn9DKIlLO
         MeDtlFqvXNnMHz7l02KHJNts7LwN/PRBtQnFWS6/o9C3EQXe72LBGniNSEENUhaCkNl2
         Kaf79TXSIrywk+BiZqeixjx1+zStWo62CU94so7cYzHP5f7m4JG1rpjMdSy9FJXjzHJ2
         aQ2g==
X-Forwarded-Encrypted: i=1; AL+hErGyX+E77CEqvg8vo/IkhclZxSXiLFKTerVjilswGvPZk3GAPn1mdPSfOHRwGBfelw2Jj6YvPL4j0W87@vger.kernel.org
X-Gm-Message-State: APuU4Z9PKkgQ1rEXNZk5cD0D6qGgLucGc6RxSYvjuxuLY0/91AoL+Tyj
	YKxLLhw+DYL951mvmQJDRDDjG72VnjxPxjh+nA17wFemrZ1XcITkMxbrLPVMpi0bu34=
X-Gm-Gg: AYBFou18AVYtVqJgQ9yYhQQnWXz2jtuUaJUGGsgVMBuTTGni60Z69aRErW/40cW02VM
	CLWvC6TIwPo3dJ2aIhgf9vJR3UETwH5uPeyn9M9OM4gu1be4xbMNdaxmZbC7x08pstSxGMw/EVh
	5qVKmidlEx2Q/dsdh+nJcVlOYIDMVq7QNM062E7dstzzb/qmIVr4W/s59rsXXRHSbpJ7kvc7fyO
	x+iYCYl3wOqqvnC3NdcuolpWdz2GY9qnYHIjsNooB2AoBqbs2WXGXd022Jf3YQlukXyKsb7awyd
	/cyba3A5ytL2li8ROa++L9a5yA+pcVrPzeb20M7l8rxUvNohwcbMJy2JAeqaMVHurmaeR4hV/WB
	MYJwVxVA9HcZhkjN0yCwxFewXEWIfN5xO4vvslOqiXQ91f9MdDWlq4iLXj/uDooaGUXFfZQcQIG
	ohyYzp7b3ZY0b8hIi/fp0/gKgZk+hb2k07JFac4XQs+ALg2+9SdU9rrqqz0HCqEtc3XtcxshRlf
	GYo2f1rgOlzuBnPRPcWEk5+rYxUIX1sCEdZIbfPugl+U13XXj1pRV7xrH5MuM3BrRaGL1ibwYpe
	hDWhD6XVX4evlJX5GEVCFVBA7ua5C/5Pi8+AhWPvjQ5QceaU2K+/+5TaiuIAnq3ppA==
X-Received: by 2002:a05:6122:e448:b0:5ec:d5e1:ee2b with SMTP id 71dfb90a1353d-5ece7377c59mr1225459e0c.23.1794235253411;
        Mon, 09 Nov 2026 06:40:53 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece606d02esm4504277e0c.4.2026.11.09.06.40.50
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:40:50 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-745497ac8fcso290329137.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 06:40:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEPvWnnpVreNOJJCGAj7nEWsCEyf/HzeBTk6YFuYqiLGiDTtTZMyUmXjvCOEfOoSOIGcBftg0T/TCXg@vger.kernel.org
X-Received: by 2002:a05:6102:5693:b0:7c1:8aa5:36d6 with SMTP id
 ada2fe7eead31-7d2db05a3b9mr1026612137.11.1794235249748; Mon, 09 Nov 2026
 06:40:49 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn> <20261107161252647FthWsffiqzpLz7zrKd2ux@zte.com.cn>
In-Reply-To: <20261107161252647FthWsffiqzpLz7zrKd2ux@zte.com.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2026 15:40:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHSU3QLanoVyAr3a5akukwDbCHWYoGiLT8HfuCGvHmog@mail.gmail.com>
X-Gm-Features: AclHuK8ggxFfIk6ZpEhrNh6YRrumZjRHb3TbORQZdwxVU1wvicBkSXZ49z_E2iM
Message-ID: <CAMuHMdXHSU3QLanoVyAr3a5akukwDbCHWYoGiLT8HfuCGvHmog@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: rcar: don't clobber INTMSK when disabling a
 single line
To: shao.mingyin@zte.com.cn
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrew@codeconstruct.com.au, wbg@kernel.org, 
	opendmb@gmail.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Shao,

On Sat, 7 Nov 2026 at 09:13, <shao.mingyin@zte.com.cn> wrote:
> gpio_rcar_irq_disable() writes ~BIT(hwirq) to the whole INTMSK register,
> which clears the bit of the line being disabled but sets every other bit
> in the bank to 1.  Since a set bit in INTMSK means "interrupt enabled"
> (gpio_rcar_irq_handler() only handles lines whose INTMSK bit is set),
> this disables one GPIO interrupt while collateral-enabling all the
> other GPIO interrupts of the bank, which can cause a storm of spurious
> cascaded interrupts on level-triggered lines.
>
> Do a read-modify-write to clear only the line being disabled.
>
> Fixes: 119f5e448d32 ("gpio: Renesas R-Car GPIO driver V3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Thanks for your patch!

The GPIO interrupt masking operation procedure is indeed a bit uncommon:
  - Interrupts are disabled (masked) by writing 0 to bits in INTMSK,
  - Interrupts are enabled (unmasked) by writing 1 to bits in INTMSKCLR.

Section 10.2.7 ("Interrupt Mask Register n (INTMSK0 to INTMSKn)")
in the main PDF file in [1] states:

    "Only writing 0 to this register is effective."

Section 10.2.8 ("Interrupt Mask Clear Register n (MSKCLR0 to MSKCLRn)"):

    "Only writing 1 to MSKCLR is effective".

Hence setting extra bits in the INTMSK register does not enable all
other GPIO interrupts.

NAKed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -129,7 +129,7 @@
>         struct gpio_rcar_priv *p = gpiochip_get_data(gc);
>         irq_hw_number_t hwirq = irqd_to_hwirq(d);
>
> -       gpio_rcar_write(p, INTMSK, ~BIT(hwirq));
> +       gpio_rcar_write(p, INTMSK, gpio_rcar_read(p, INTMSK) & ~BIT(hwirq));
>         gpiochip_disable_irq(gc, hwirq);
>  }

[1] https://www.renesas.com/en/document/mah/rzg-series-2nd-generation-users-manual-hardware?r=1054546

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
