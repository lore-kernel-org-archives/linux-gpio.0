Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C2414422
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175184; cv=none; b=bqTGIBrTl0ZligSx1UXsHT93eORSIoZ5R7/21iK6WpWcrYggpSnKvY6bmxC/BTDweuyIlVhfl5A36CvD/s7srgvZLaG1rSprZyOXzuqgAIbMb/Op46wku30uGZILBXfv1VhQjwW2CScPMdGGZrUXcHWlsPzUHEIO1iZ4MULtqaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175184; c=relaxed/simple;
	bh=FXzg6hBNBXZZsScdwtGeM5Pmqbhre7BC03zd4cLn0Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWXTliq/f3R3HoOYsLDqTG0urIkObjg0XOLw5bfC2QSaVaJ1zWT1ovyPkcpmo7HbSwmynOPL1c9KYP33SB6AwR7sju5j96ORwLLITvQI4ZiNUTkI038Vdf0mnfJNMKYzct/V2stxfA10BOK9sqZX3qqfQlBl8yam5LqIpQjj9i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47b8afe046dso660803fac.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175182; x=1790779982;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ONYGJu27lrhOYpsTIFykGbM1Hkv2j9YTc036/0zk0Ug=;
        b=nmgyl9sB6eFsZ1h5CBrzhV2aFVulu/rQNTdZYKwYNpjUaVveMyuLtZ9Ve0dkVz+2g/
         T9s3XTJ/OQ+bxffGpQfKhT0zKOxdvAmMjoRz8d8E/YacL/ZgyqQOks9k1SPXknhG+uhu
         ntJ8YE1ftcVQX5rSxCO4OW+I6jFsV63pQL7isTTPRfQSAAyQ5mFKxDI3EtyCw2e9ha8l
         NlY5JrTrM7LKrCu7G0vRoQOJIx86zPfrjGT3lxhK7GAiEU6NHeKL5cKyjbnSxhAH578G
         DCZXq1NVspsfBkKgyW/sF0yvnUBIMWho1s9MmHkxRSnKg1QGziiMaEOLVeBGnyrzLVEi
         E8Tw==
X-Forwarded-Encrypted: i=1; AKwUvByP2/UewOYduxVHuSlAPYXUQ6S7DHReFkMo6GjmRMyUxFNAkIhav8F46LYlDroi6pSfSjsTQSK+CXrA@vger.kernel.org
X-Gm-Message-State: AFuF++n368iIOu1B9hrtsLo5RosucjcjkCK4zhKx996ekD0MaS9PESE7
	+J8dR3ko914O4/FAN7CvFKvRYMS9ET1KTAbZbXUV2KWjlZK036iWLM5/YlK6caWgp64=
X-Gm-Gg: AYBFou1vKvQ2RrCqsNyddA3wiPBb3FV8WEoyy+Dc2Njz09uLS7poTEXxo4iWA/50Con
	4lYB8eEwsSwqn/u1VJ9rTXxeWd/4fP5tv6+47w0v7mEIhOKU7Af1MaS8RkyV21UgH5R6iGvEFwz
	crwI0L2s9UgD2JechR8njwZCbCtqEVjv4LygjGCGYsbfmrJudeObuR08GDrhETYsJpOZPhpLQtX
	4/bDYU7qrvTKTcnyWaCcKxanNDVfcEsRHs/cTsmOjivV82Ojxaju4beIYZ+uCUP8O9WHmrSdcNn
	f+CklS66COaXQD79jgeAtDbRbA6PkRXY6xuDyRkWBUvE7VJvnp81paPqx1yUen/yLh09KQNA49Y
	UCh8Sp5PoMC4dUEhBABfoOuS2xk6ypgRkx3k0ZrBe5oLsHLCofi1r0mpIlsNTM8jw0+tGLdjdAF
	gSuUsDb0Ej4raMKnDzyWKmlRRjOJ0j0eFw7IM8uRaqv8aFpi0GIShZLZdlWRk9t3/LbQocvAy2x
	exq/kn1XfLCCQx6Poa8Q6c6A0dH0oqsPkYrTg==
X-Received: by 2002:a05:6820:81c2:b0:6cd:3fbd:1d6d with SMTP id 006d021491bc7-6d2d34071d5mr2812053eaf.87.1790175180911;
        Wed, 23 Sep 2026 07:53:00 -0700 (PDT)
Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com. [74.125.231.205])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce25c058sm2578238eaf.5.2026.09.23.07.53.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:53:00 -0700 (PDT)
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c6ed1de994so731526b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:53:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwA33MPaAje0JPtnoRyrWcTqbwLlt8FR9zywKTrPzwv5VeO0MeBKKtNEztUwnyAl6g07bA8hE13q4sZ@vger.kernel.org
X-Received: by 2002:a05:6102:5709:b0:7a1:f7e2:aadf with SMTP id
 ada2fe7eead31-7ac1d0cb10emr2412732137.17.1790174811407; Wed, 23 Sep 2026
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
X-Gm-Features: AclHuK_0TFDwROATeFWc5QcEb9bj6YWPyy6x8RXwybT5t7YWLi1_s9QYUiwmNRs
Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
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
> Add support for the SolidRun RZ/V2L [1] SoM on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities most code is shared, including DT overlays for
> eMMC, microSD, and RS485.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
