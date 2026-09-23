Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2C3914EB
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176232; cv=none; b=d6qHYBnIGRwRUEzlfOw7MrboeEtc5F0OveaN6T5idZBJVAu81B9Bt0pZDcp4f0BgKB2yXsniXU9DxrP7m3fULScPDgYtRSqvOMZqesSChw/OM1rIkOKxYjvixedcWj7hiMJd1Byfa8S9VFBZdIFzhwVaufMReS2lhwsLjPfVetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176232; c=relaxed/simple;
	bh=EhjWSKImZwoAXYfqAyTmCpINsx0oSO9M/RawkNvcdAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjrghEErWR8B4GwXS/FiEvS8Qet3x1NjiKs0Qna2L0oprq1b4FE7BXNg4py+h7K9M5An40aSVuiLxGcjotk2zYWS4AcHHckHRx8PhzhJS3lc54uzx330wUOnvKfJkocLkjywiE0n7bGwuL9Tvv06uPbnOkb6sCM9Q163SSRKFo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79028ca9371so403099137.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176229; x=1790781029;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDvgyyoRqIDDfI9/dyDxtj/9kppA0KcEIyfQ/4/NmrM=;
        b=ZyL+kpnmbvgv6eSCLx+T+yxEr1lDrO+itCBDdPhFOvBBRvym6bps0oRmkyTLdWeahg
         w4IYk3RhvFimQ5tfSFoO9a4ZsXBN4Lj+B18oBAYcudzRp0ovSJ7i48Ab6NBxYhHQ05bC
         0mRqf9bCqgj+0pdi9+U8yVQLCHlmycdYsqpxvxE/2RCG8dhXN6VLDdv/mtuZOkhoLU9I
         Oi6ndCIr11QQc1mZYTHXZE8KwPvUi3Lo4iHcTqABlc7GghqGojRZ03lJsq0QdElgrUfs
         WPOahGuX0WtdSf2L1SqwUi47MxuiLbAQ4ULCDJFbzg2UCrGbW9xe4EKOQO/BsjqM3Tbs
         LZtg==
X-Forwarded-Encrypted: i=1; AKwUvBwSX7d2nEQg/DMIAcpcTJz40Z/xUKaDPkKaONx7FvORbTcTHSknjerCWmdEzoSpptySQ+jJqCfxlncO@vger.kernel.org
X-Gm-Message-State: AFuF++kvF8n4vkLm4qALjK4zvU6ZNlvK6978nwUIHLr7LqzUTld1bUTY
	09AI8xmm3sHszsEdMw+Fb5vHFoiprhbC3mOHbLQ2LLHDKlalZDGa5stiuxnAQ8rvfO8=
X-Gm-Gg: AYBFou0I37hKFC7o7iOoi/uyGXDBuGE22gnmSOhd2x6Qh+Uoaxe0dgobLy6/m4qGfqN
	O5ySHbg2KTZlbbbqEP1I5HIy+xZ8fvevKixDO5/NBOLhXFSoEe3uTX4TLCemHstozX8t1mBVd1k
	r9AgY01YAO9dMFGOySIpN/52YitKI5zJyk1H2IaAk+krYd4o9eLVh/LfXEjUPnSSXs/UfC/cEcz
	yzyvF3L+hbS2rrSEtE7gSsPM2wu1RsV0IVN3GytB83FUPg9xfG8Kbpo9YGDBfGEU+kpC+xF+KXE
	F7PzUleuEV+wVSDf4hm9FpGJW16zykjLRLtQv63OL3FtvjU50Q9gZlsH5zOQP7KhoTJjA+5keaL
	kuBo/vZ2Qrr3QcwarBorfXTo84g59Gc3NDXUY6/rvOst29GIQIX79ocPjhqGMoM3AUdiokpFtI6
	aTxwTOlZx3rhd8kcx12pwTQRxvmvEjHvh0rqLbHJi4hqoBw//14fe7NNVoaTBIfMudm5FtQzjzF
	UE29eUmWn1AlCa8IpbebQ==
X-Received: by 2002:a05:6102:91c:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7ac1acd6c58mr2343352137.7.1790176229256;
        Wed, 23 Sep 2026 08:10:29 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851691693asm3869059241.2.2026.09.23.08.10.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79028ca9371so403068137.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByqjvCfjzgGFwT9n4Ny8xsbpSh2SAoKuyvgycO9Uo2h47NNDKQpHz/N1ef3ro43JP8pzg3qg1+YPJr+@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7ac17ff1a5cmr2593444137.0.1790176226764; Wed, 23 Sep 2026
 08:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
X-Gm-Features: AclHuK9nr5QPs8sC-PMKUOwR3cdMhCa7cZVvTQqDSW5Li8NuNQleAMbNnooakSU
Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/V2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities, all descriptions except SoC are shared with
> RZ/G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
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
