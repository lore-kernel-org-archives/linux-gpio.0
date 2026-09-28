Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0003D4E73DA
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611842; cv=none; b=AVSn9JMZbJKHLwehL8Bev4FS/mlezemg8IJ6g9KFpwAYPa55eac52BO7AUlj7eczqm+8bUSyCv4bynKH7OTzJxX5rwTJADa9R1jg4BIxUpFNXTcxQaA6f3XYRpA0i1ZbZEzV7u8u3NqTZVtSTnrDblsNHv/gAZvVX96HZ14v9Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611842; c=relaxed/simple;
	bh=S5jmAjj9EtbV2wtaU3tPzm8z57h4Nf5RYtIBVSwNH7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUqA6HdOOjMv11FwMZuqxCIUDX+L02yjkcjJZA9OiOB5gK9KT/fnuMzC4zsci6toacWPzCDz10gCVDr9ayYqWPm0uQ74pzg3ya3FVj+kyYMVE7FVrn2VzLADmxhUY0QHrp5iMKZEEmcJH8J/Sr/qDm2o74rlGbVCi9fpQbwamC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cd1d9d65e2so2023870e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 09:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611840; x=1791216640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Q0b6nlsGqU/6knVqqPIUET6/nAm7GVMX2LsazzutA0=;
        b=YfwncTcWdA/11JvCHa5SSSxWS6/lfgQHah+8YxQuUPTrJEmMiGzNSnGb2lTrdwBFDf
         9GH6orqU2HD2EBk35/dVfqfAQjU7nriPhHrxiKarqZ9A91r1PbBzsQw/lOROKCEOmZli
         ImoIaBAEU+mN8qBfC043hd6KPo7smDRJe/9ZmgLEdcuxJcR53TzYlW4dGc9mwm55N/SJ
         32Ev4w83Crx4xsZgzRYeUc1NC2gYwJ4Kr1k46PfOy4LhPQNbe0Usquz6FiuHhYrEj0+T
         DNmBPdrgNE6Op4HdCY8LIBq+vp2LR85Sb6TTABQiDgFZzE2tZdEHz44S2hKTjlD1lf3k
         p/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0RC6FUYkKuNxiHLclGqf0qqllmViDYhOE0SoVeSW2btzMsbt6V7o65V/x1h+wU/8ZHnAavDaPtoXt@vger.kernel.org
X-Gm-Message-State: AFq9FYIZRqHDtZ1Nx3MT2zIlZTqVXtieJ9TUp7dRCYIN5hGwsrOqW2j1
	O406nafqYTp9U9ammJJ3HUtGHg+A3S4ehCoStHHyUYV6ykwYt51/XN/S/EUnZznN8Sc=
X-Gm-Gg: AYBFou1OxkCXAx6epk79jHABm4mYimFHMIzDI+3Kns4v17C0/NbaxsqpIeiduZttFVD
	LIx/obxsz9FSfLKLMt3tzko5kKbzzPHTY8O3CN7sg37ElN7Ksfmus90QESXhzBZHMLL/3CCfa77
	QaaPCoL1Td3UhkLUJdyA7V55D93EPuoRd4vtB7MH4WaY1qqguf6AcwUKjxIFlZWuB35EZa+S37A
	zaPoGOUGRIiOUXGO7WfEA1ILXqbMuYZoEMx72BCBtQyRGIFRI2B9WM0P7mzNZXc36aKlEzhoU/1
	NqNRVQaF4Dm7GVq9gjSOrf918G/OY59NvynwE/+koy53Co+Vqyx7HHSBFUSh8I3EqkOzvxmkGDf
	jYYQOEDZmw5Jg1ji5FQqyyApKYYiTvS9C1s5QTYXGRcS+0yl4ol1ntlMklZB6iQt42Gaoot2YAB
	yFwJrdoFC3g1CNdhjKNKVTuLtXhCqPZraDUNKcdFwt7sS4IByQWT2iszEnWjx9WVZwx9wLmbRdw
	1XdWzjs1DxzdFyxZY1au97xZwpbnUt9z3dL2Q==
X-Received: by 2002:a05:6102:4b12:b0:7a7:19aa:8a84 with SMTP id ada2fe7eead31-7af1edec48amr4975952137.31.1790611839753;
        Mon, 28 Sep 2026 09:10:39 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b398ee9869sm10010042137.1.2026.09.28.09.10.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:10:35 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so2412399e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 09:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpzwXyZIe52Z+b63B+ZGvkLtgQuu1oKXoFAAWxgDPrNvRv9MPmpi0IjLsk3YQ6vCRRLp2A5MNpMJbn@vger.kernel.org
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id
 ada2fe7eead31-7af1f2fdbe0mr4785652137.36.1790611833554; Mon, 28 Sep 2026
 09:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
X-Gm-Features: AclHuK-UMUf9NZIHGIv0UWf0z0Dz2lXiorAQQxBHpxwCZfCPbVVPhasZYdlvx6s
Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
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

Hi Josua,

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
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
> While the variant being supported here is named "Ripple", shared include
> files are still named according to the full board for consistency with
> schematics, silk screen labels and other SoMs on same board.
>
> Description for microSD is shared with HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a07g044l2.dtsi"
> +#include "rzg2l-sr-som.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
already includes it:


> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

Same for patch [09/11].

Patch [10/11] is fine, as that one does not share
rzg2l-hummingboard-ripple.dtsi.

As the rest LGTM, I can fix that while applying, so no need to send
a v10.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
