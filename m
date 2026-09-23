Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EF0531630
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176292; cv=none; b=Jr/XugH+zXIdTtwmKXNj+jRxgY9bcRWe8JgBO4rMQByd/z/ZxL5yKVbhdg4zgNZDcAgOpMbxUwMPVQ5CYQJu/ph9gzV0tQpJ9GfJpzKpBAd5QIQdjxDN7QYIiSgy8xXjkzaPb1UC2LLChc9TciMuJOjF34BK7BveXfNTyrGt9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176292; c=relaxed/simple;
	bh=pZ9PpJiZh12Hwh/7XmEn8qQxKjkEk7eQcjPzfGPj1DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9C08XSm3S8DtMpILO92myfBH7+rqLtfQ5JCucn8T0JQqLXYWAMpu71WXkZRtIscgoCxvF3cWd9JTzkfBj3pj65keF6p52e9ankXso9bukni7nNaoZ5Gd/l0m2KlQ20HzLGCDMYMWwbR/zG3Ge4awcmfV/NfA7ybMk9urfEC0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c7e8a17839so236250e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176290; x=1790781090;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+skuiLYw/IgGtWcdd1NJ+Hgm0E875s4yIqfpBxdBYoI=;
        b=XmojPtGop0e0iFTGSRWycGZRXFNNax2kGrKCkF5yDdAsthYeSwzsnHgSztW58qbEUW
         zWREK8LnLPEad71x5KcwoxJU7Ysh5vsODBKRXBfRKgBLLCAEiEs27+36qfVpHT9bBV1d
         SVsggFicccrlPwWrGzU5XalIwoZp3XBjR++mdW8FHLBMsFZmlTyNUKUGZd0+7gf72ZKw
         U08sZC05wfSWH0bSL7mRvaAOQnvKgW3scJ2HnndinBF0Q+aM7HHo+nyDvHRWE0r/yCOv
         IvTKirlHLdH6JG7GNDxDeX6vv7SrywXcUNnaaNo+DmFOVuzbJRrCSrzynrEAC49wYuht
         Ckzg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ58cT2FmLlxIA95kPA+xqvStpkMaDEFb/FY6/QpaFuYKlpch9+Uq37JI2xoywJLXlN/yhldY/qhdB@vger.kernel.org
X-Gm-Message-State: AFuF++nDQBKaQtf8Po+PMf3Xw85tDBblv2xf4bMjQ0kBJF+MkY2hg23U
	kKLw3PSJRopSkPmLrFasGbREKHzatkyl4DY04wbyxXeZZtS0O9RgHYLC7iC/qhbeWus=
X-Gm-Gg: AYBFou3ODq9yszc67dcZDU49SGPqZW2Lvi9973skMSEFo0b1Kpf9uqY4tw4GN3TX7yE
	qy+/fSxoasnnwOv7qPPnnnvkNM6ZYnXW/WPpSg6aJ6ds/uu/tb4y6ZgFSUIfH6U/OeG4qpLfSnb
	fBEzyTNsoQhhLsUBOZlwGjmKdaSjXivN6mBodQ/QBURcciHOctsflfY4r1OKWvob07v8OnPJJ6q
	MxRy3jdVgJ+UBRKJWeWLQ7CJNeN3rmt+UJ7QYOoDJFNYY7Vw2EMa0I9N6XFDw8k40p5d7DmgsVG
	7DJDAYuZFGaLm4U5Lh1pPFZomqs4OxsiCjy4A6mthwVwVGPGcNukLjrunz4wqvb2QACAYPPHnfz
	tsquCCSn5h2eyxn3H+fhiDFXNVa0ZWu6BcBPPZ/uYQymZ+7vPxc0MBQDW+2ZI47Lj9v8mah/bEP
	NRzdsOUyKLG9xIJFF92utTxsRDxRseGBOQrwjZAkm3MLfFeXwqC2KF1ZvfW1b9tQlbLDfKN44hW
	BwYGwkixUW4YbZFZesVFygl/tEZ4gQlZOf8nrLn
X-Received: by 2002:a05:6102:3746:b0:7a8:e81e:d7fb with SMTP id ada2fe7eead31-7ac0ca16ab3mr2707212137.10.1790176289623;
        Wed, 23 Sep 2026 08:11:29 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm3855974137.12.2026.09.23.08.11.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:11:28 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso1716541e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:11:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwxGqgq70/VqngNi6I2hN467x5PPip6j93iN0/aNPMZuGtnPake1VCqOwggqe1VQoXcWbwEzQoYVetK@vger.kernel.org
X-Received: by 2002:a05:6122:2804:b0:5c7:c898:9817 with SMTP id
 71dfb90a1353d-5c9e3481de1mr6395425e0c.7.1790176288382; Wed, 23 Sep 2026
 08:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:11:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
X-Gm-Features: AclHuK8E9qilobRH7fLrZ_B96xKE8A0mTA3qi9_owW1vdBVZD4FYLc3dsbXINdI
Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2UL SoM [1] on HummingBoard Ripple [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 512MB/1GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector (not usable with RZ/G2UL SoM)
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2UL SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
