Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510778;
	b=4SC/bf99LeLtrr7LMe0vtq4xxEPht+YFeCVyMoLC/UEflTdUzVRSeLeqvJClH9UDy7H5
	 lautChJhhLucJteyAmkoOCebWrAwbz+3UAWKPtczh09nMxPWLD6BGN/ISIhwVFOS9+S5j
	 8qxDM0R5b9M4DntaUUhKveK1CHxVEVsxqvTKT7j38gBAs8n67TKhZknYrGri+oxY/ybGG
	 HM/gCQ1Iic1OGq+mDgWflzgbQCh9CRxQUlCizLRDSf7G+1srZsiIPnd6eA3qcSWO+cfFp
	 4Mq+N06TZzi8TOV88WgXRoB6j7sAh3F1wgzLxeVobqwz+Rl/lTNTKaP9YAdxvs6yr4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510778;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=uOdggBIS0MQjP7rBXZTasAv93vWRuNQG4pH4+meS/uA=;
	b=ZBIqDWvelwnbfSNGxVzSZglrZRG82nU58BRnVJtcTYgCoYHmKirU0lpslOwcZa9K6w52
	 f7Ob2lA+U35f1LZZrYg5C92JgxnhI/X0gVzV5huaJuFEWpbLd501vMFrru3oRbiU9P4PH
	 ih8UgOtm1CBHPG+4A+quniBKkVjC1dVWtBEAWdaEVSMaiCsjX4i7GX1cbpkn400DegbGv
	 BXjEIah+F1x5nEP+nGYANTm+FBptZtC2mgAVXbCnKFKg2HubciIaUo2Jn1AXbveMKqn5G
	 I/b0Y/oxs4ZXPDaEFC5HW4K2/vvAtxcOuc2JGXsgSpdyn8zexiSQTNtg5yIydUymwUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0A606A31B
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 15:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c450ab1483cso253328766b.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 08:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510776; x=1793115576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOdggBIS0MQjP7rBXZTasAv93vWRuNQG4pH4+meS/uA=;
        b=rdL1OiK9Dpm517AHKVY/jS8F5RIkMZZEUiAd7YHnIPJcytD4eE2aeaoSxE+TRKKtuv
         X4VwiwMmXKj5K7sAlRmip8ewQPPZFmKG1mkykwOn5MLlWPFhZF8rHoKr/Y2B0iSWWuyC
         COtsMZqDOeKRW2nD6c655ReZwhYrxb82FFkCyx8Vekqi70cElqEaCrEDI/ruZD0RGsfu
         uhnum2ZUrPIiDx0ji69ixn5WiEvv8Vyp7EE86ASgtAlozGkPmvOSveePpYlP/7aJmPva
         BHlaHh8Jk9z9P00fl1PvN9DlsiVToQrwwcXWGWwUV5bLQM2ggXXDW2NEWbcjot8wLsAg
         tIyw==
X-Forwarded-Encrypted: i=1; AKwUvBxzWAHF1Qk07zo/wSFDnYl1PJ7ywnjD040iO/0MZP7eg5PG6ruCu1lNcEUYr0VeSmRQ9uoqoSwbnJtd@vger.kernel.org
X-Gm-Message-State: AFq9FYI8N877DGLF7urJKm76cpEskSX+UfnomfhhAfstaKccXvi28fPJ
	hRWQmfbp1Sj/Payzm81VqdAiSmtKcJFfCr6i1LosI/BfslVAHL7mS9ViHFvgnlAYWec=
X-Gm-Gg: AYBFou11/4yap6L8n9ND2Vemp8ds8R6LL+zjQe8H5G33FoFB4B12DlWpYBA8goGXjSD
	LyGDrcT20G0M1zF0dDXCH4JO1xUycmmnx+3azdxtuzVNONn1hthAepGrkXw4wCHWBtTOGpQbcYx
	s+U+nBu7C7aWxWx9/JlC8tM3ONTVzkWpKu3sP1y5wPKXOg1qv9ywhCKJqKKmHfGercDUWC12ZcR
	m70jSUXuBEg9hHAVMLN6MePDLbFcpuyZSfXvj3ctzLQtbYQh/wbUh3l41s9baVJuLBA4j4Oiwum
	tUAxWi6qKyoVdvACDwScNvgIzPLU4TbtjAju/dd1IMLIEMP6HcS4Fkmp59fSy0hHhjkGdsJJaHZ
	krEzXGIJzCSgrNaoTG3bTTR2W5PvBoJGQDsUsIvzFxPWVA3gKEK2kqMT76DIfTfPmn2XknhMcab
	Pxw7gBjnXZxXaaI1g1KdGhz4tddFUywj7TUSL612dOFQz4SoTDV5Ca9eBQiv9WLjEZmcd6bKoEC
	TewQ2dzyEkgDVZvcGMgmQV3YSCQmlfi3n/hVHOdSIXRurs=
X-Received: by 2002:a17:907:c819:b0:c40:bbd2:62f6 with SMTP id a640c23a62f3a-c419dd3942bmr740269666b.19.1792510775533;
        Tue, 20 Oct 2026 08:39:35 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0f2asm499862166b.62.2026.10.20.08.39.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:39:34 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso506399366b.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 08:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxu9U2i6iuxlCXeCxcQuzThz7H2AaJV9/dzQHL43GLr0jBP9+Ef0ObaLhFi3xSezoFG82t6bGefMyVu@vger.kernel.org
X-Received: by 2002:a17:907:c819:b0:c40:bbd2:62f6 with SMTP id
 a640c23a62f3a-c419dd3942bmr740265666b.19.1792510774520; Tue, 20 Oct 2026
 08:39:34 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <889ae6695b19ce57ca4b17526c69b48c9414f5ae.1792508601.git.geert+renesas@glider.be>
 <sashiko-outbox-179228@kernel.org>
In-Reply-To: <sashiko-outbox-179228@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 17:39:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6hm1aGOKMLZfvS2oU7SBa7p5Eup3+iYqw3LaD_pv9uw@mail.gmail.com>
X-Gm-Features: AclHuK-Vu3hkTIFpilSQsdE4giSc01tkJXVlYbgJEZ6QBjeQmSjSTzB8n2GcoFo
Message-ID: <CAMuHMdW6hm1aGOKMLZfvS2oU7SBa7p5Eup3+iYqw3LaD_pv9uw@mail.gmail.com>
Subject: Re: [PATCH] PCI/pwrctrl/gpio: Correct GPIO_TC9563 /
 PCI_PWRCTRL_TC9563 dependency
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

Thanks for your report!

On Tue, 20 Oct 2026 at 17:11, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] PCI/pwrctrl: missing select AUXILIARY_BUS in PCI_PWRCTRL_TC9563
> --
>
> commit a7730129e4c039c8e8c890c4f31a553b4c62308d
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> PCI/pwrctrl/gpio: Correct GPIO_TC9563 / PCI_PWRCTRL_TC9563 dependency
>
> This commit reverses the Kconfig dependency between GPIO_TC9563 and
> PCI_PWRCTRL_TC9563 so that GPIO_TC9563 depends on PCI_PWRCTRL_TC9563 ||
> COMPILE_TEST instead of PCI_PWRCTRL_TC9563 depending on GPIO_TC9563.
>
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > index 38aab596aa04b..1952ab4f29b69 100644
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -29,7 +29,6 @@ config PCI_PWRCTRL_TC9563
> >       select PCI_PWRCTRL
> >       default m if ARCH_QCOM
> >       depends on I2C
> > -     depends on GPIO_TC9563
> >       select REGMAP_I2C
> >       help
> >         Say Y here to enable the PCI Power Control driver of TC9563 PCIe
>
> [Severity: Low]
> Does PCI_PWRCTRL_TC9563 also need to select AUXILIARY_BUS when dropping the
> dependency on GPIO_TC9563?
>
> Previously, depending on GPIO_TC9563 transitively selected AUXILIARY_BUS.
> Without that dependency, if PCI_PWRCTRL_TC9563 is enabled with GPIO_TC9563=n
> and nothing else selects AUXILIARY_BUS, drivers/base/auxiliary.o is not
> built:
>
> drivers/base/Makefile:
>     obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
>
> Meanwhile, tc9563_pwrctrl_adev_add() in
> drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c unconditionally calls
> auxiliary_device_init() and auxiliary_device_add():
>
> drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c:tc9563_pwrctrl_adev_add() {
>     ...
>         ret = auxiliary_device_init(adev);
>         if (ret) {
>                 ida_free(&tc9563_pwrctrl_ida, id);
>                 of_node_put(adev->dev.of_node);
>                 kfree(adev);
>                 return ret;
>         }
>
>         ret = auxiliary_device_add(adev);
>     ...
> }
>
> Can this cause undefined reference link errors for auxiliary_device_init and
> __auxiliary_device_add when CONFIG_AUXILIARY_BUS is not enabled?

Indeed, both GPIO_TC9563 and PCI_PWRCTRL_TC9563 need to select
AUXILIARY_BUS.  I will fix this in v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
