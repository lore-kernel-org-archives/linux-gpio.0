Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926175;
	b=3gEpCoTl1Aj9Jkx9/QLBdgM7TkxCqRKxqjsq39ho4OcFlEgzGCnc0d+vXuUv17Vu4qrK
	 2EPINgJIkEI2ipaP2rWN9WcPR0ki98pGuoCSbQtwreM9OEbkF9lCCw3EQr5BbFxL1eCZP
	 TREXAyHNXumHBkUumqhrNeMmEZRvOoSxsE0CrNP9CA5WKLu8ifs5/ga2X3zsuzAMtRmoX
	 HxPmilBQCGDzvgmFY1WkhYOj10l7nRIdjmEaFaL0CwwuBsw+f2n2OkYvqlZLtBud7qdXa
	 Bn82qLmOTltJ80yKeC9IWeZrZ/McX9s12IFKdZ2j2KBQP2W1FP7CjU1AjW5xD43WCNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926175;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
	b=ZXnM/MWaibd9Bd5ilnp2y1pyrUBXLr69WCK44+nlJPQyVqTFyCaGaHmUwuGOdx77kS5+
	 Y3/wJgCfDzL4+a2eQhLSF9p/XMsRsDB4oFwx+cmSklJ7LQq8SrClW2z9EZuGnD+RDhClT
	 pDflpkcgY9yOecbQTU0qejzWh7qg9QrQRnUpCf+pUKPh4Jf422n+sGa3F4gUyWjlKlxV4
	 cTFM3xXU3Iv8JtRyZcVcG3o1quXCHZcpvUq0CtjXxZA0XGcKVqSl8zFC+oco6tJnL98GF
	 Nhi5DZNa26MViSq3cYYHZtFTGpgsKa/Rvnkx8e4wFex5HYMEjXmHQZdaFPHhXsnV6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0458606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 11:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0458606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so2050411e0c.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 04:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792926174; x=1793530974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
        b=Fi1ohzVPQDx5lUeLS/+rkFuBxYPWzFnxuEAJgwN289/SxQ1XRC/o4CpeIFs3zENsDP
         xhbbPqU5HUOoR9EyZSvgb1dKnwBJ5flEMvVNu+Pcn//NzTHvZYhMh30wO5f2mB9BBny9
         lqIYvj5ms2tDc63x6AJ8oHfnB/VFMEmVcnh9s86wkX5Pco9Cm8peB6/QyOq/FUUZE+rG
         qeOeR/naAl8bjRQiK9ry28XKP/k/XsTqJ3Q5Y5Juog/026Tbg/NXqqqfC/U0Dop/xsO/
         rAgtbsNQbbCoga0JnkxyTjKLP28cpECvuirCN+Te92tpi8qBKILwct2s12FewjnZ9Oaq
         liBw==
X-Forwarded-Encrypted: i=1; AKwUvByOQgWktL6Utv/eGiBpUKb08BjQOxNM5ghcTqCMV/s6FIhTpcMhZj4RZ5uy1d+lFkS8mxdjnULIY5df@vger.kernel.org
X-Gm-Message-State: AFq9FYKE8A2Dm3zO+QjA6+NFFIPyatbRBuUw1kEG6Cub5sGjnOSUySz2
	5Cwt9FSQfDH4ftojhWRaTTFoopXYUI5v9XMh7pT5aue8TkoxdEjd8QZl8APywHgQ
X-Gm-Gg: AYBFou18y6qLjaIQROL5L3oUjhzMgpQ6dqUtHDcUo6oB383bd77Bq28raMRfH8xsgf0
	BeWORNUTvCvUZR/meOBeTVGRHHiaWQL1Tfnq+vv3P0CT8e1QZ5F679wv+8LluyQYtynJd0/nmJA
	DiTxUyI9C7KpoUUPsj9pZdX8QujibTc9A/PI9IIboRVs1ZioZcyyMSv1/tJR7v2YEaHchfVaIbT
	iIhc+i5vaHyBFRGeJI0c3Brzo82uUzU4F2WlASLX2Cm75Y/34FRz4yqboKGQpZuXK08/jpGsims
	zeNXbCrPmLhOLzTgGT0Ywcof5b2bS1B5tKClj7hJigkHdzgGd9et33Ms5ECx+b605ipZ20mtY5l
	gteI3me96wVnDKCnwUxK5iquPZgsx6yT6rKRlAHjAiLpLJ1OhxCXh2qa75uNPcddywQ+Qj2GXDQ
	oSOIdnzrdpfHp8w+snw1QJtgBsVjOvdXDTGx/AU/dY4bB+T+L5C/z7TsIZ2Yr7J9fwaesrtcFnd
	8w/3/hCgJfsJ3ZRNfKkjQgYgDB4Ni9hzlUl7jmm8CwjRZ/1kaBW/UYhhqPpk/ltJNwDP7WWmj5a
	b5trG3IKWVaHgbQv8A==
X-Received: by 2002:a05:6122:1783:b0:5ea:e197:93d9 with SMTP id 71dfb90a1353d-5ec23318f19mr1412711e0c.19.1792926173732;
        Sun, 25 Oct 2026 04:02:53 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec23067632sm5054193e0c.0.2026.10.25.04.02.21
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 04:02:47 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98febe968deso1684591241.0
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 04:02:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPASJ953OnfdlngwNo25xKi/3ka+6j6g7UQxg7dRByQdOoDU0a9iOjXh63rIaIHtZCwGY6zfaOZCxd@vger.kernel.org
X-Received: by 2002:a05:6102:4423:b0:7cc:776:6c54 with SMTP id
 ada2fe7eead31-7ce5cd246a2mr1349167137.21.1792926141152; Sun, 25 Oct 2026
 04:02:21 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
 <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
In-Reply-To: <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Oct 2026 12:02:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
X-Gm-Features: AclHuK8CaW_17mlyRa4Y7XpLgXIYuKk4YmAF6_as85fetPG-fOFZ1fPRmRtKgD8
Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 24 Oct 2026 at 07:35, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/23/26 7:50 PM, Geert Uytterhoeven wrote:
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> > the Renesas R-Car X5H (R8A78000) SoC.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes compared to Marek's original:
> >    - Use hardware clocks/power-domains/resets instead of direct SCMI
> >      references,
> >    - Drop gpio-ranges properties for now, as upstream lacks Pin Function
> >      Controller (PFC) support.
>
> Is that ^ OK ? If so, good, TIL.

Yes, it works without PFC, as long as the pins are kept at their reset
state or configured for GPIO before Linux boots, which is the case
for the pins on the PWM connector.

> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

BTW, looks like I used a wrong base for submitting, as the context does
include the pfc node, which is not present in upstream ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
