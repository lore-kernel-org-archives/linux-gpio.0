Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F792D1F44
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527104; cv=none; b=POwXBGdHvTwkFCGBXhp5+sOVOPXGJJhPt8ydgeXxfkoOZ+BXneqO3lzoqcQioilKbLaO08G7AM1rI4iM9NTGaLJ8+I+Y/+AHf+FU0VRYOQzKggnTpz+fTWSG/tkyaG2WFmj8DEtmUVgh0pf3G70+eF/By0HAqBspXTQgCzkKEPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527104; c=relaxed/simple;
	bh=9xSOtnR0JMeRis+2A9+69QPm6YPp5GCesQOz8P1BqIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsSsppGxElt4zR0asg8nBB/aQSgdVBLozfptn5ocVDU4yGxYITDQ+RhUmqCaecWlb+Dclr2Gq+NVaC5m3bluMEcK6+B+VMWYj74Sn4gurIJmX7s1MytEV9HFg9t3R7uDqiCfwz8598QRIlpa1ekQpxJ1qINb5rouN9pmmxSiEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97ea7f0d417so344451241.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527101; x=1789131901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RX5/AQcrp5g9z3JYNb5ynUUaEFHGVwH0550eIwcyIWE=;
        b=bmNny44PE42sPal4YxSCDJtiu5Yq0JUV1pfu5dJEgauPs6UTMkSJcFYLB+jgmvptTq
         qaJT8oFrkSD6KeX3kB9zErKXhRs2/RLS9idPPTK/rm97t81xKq/NQlMX0oPmiGp3qoD6
         O56J66n7RWazQeFo9+qVSDmYHS/A6Jj+A/R3HXhk1VIEhZQqW8LWbgs3R7xFzsEf9T1u
         b7H/B/xaymoe9esjybNJPuWscYeglrVS0sZdgXAkGzLj9GeWHr1WZMMAzDRqdo92E2sU
         2Hwwb/qFgjWRovGRLljOiVvvotAnp3MfpfxMLh77KGZgTkrj6no2QBSZg8AKrKgnI3/8
         HO6g==
X-Forwarded-Encrypted: i=1; AKwUvBz86MI7GO5qU4rB84VP3DjQ7awdkI6RD7C92l2Z054/4PSO8Iq4t5u7RTfe4B4/2VqWGcrYqnpsQ1rp@vger.kernel.org
X-Gm-Message-State: AFuF++k3esij0aRXiTCalg0aqZTmwOTckN40tEt3z/vRb429cNF0Tq5i
	Y3jdSN7ntrik9pZ6hT3D/6FQA4mh1/s1PTiL/Xd9dg/B2ME9O+yoMUrHPSJIS4+CDa8=
X-Gm-Gg: AYBFou0vDvJ8kaViVSxWCxN6V6TSR3xYZnVZMZzyJMvnkWMokrXKdsdTfn01cXqy2RF
	enBex7UE/j9yWODsjyiFIt22F22fQY1wwSPoptInCwBJrKLPhq4LGlr9rDNLnVcBcvcsOUgC2Uk
	n8r4ZIxbU36lwdkD9glgfsygoHe1e58K48KfdwZTtVBnhyRsb7RpmjMREhJq2ysO4ukT9a55m2c
	dd7ES7pIKzzhfFV50l/26b+ZLmiy66hvzYGM5/J5HcqTB+GZrkOcQX9Kw2RBVSvGTCnrBNYcuph
	7fsV59YSYXJzfO06yxlDtk/7pGM6OBMoqhcJ1T7nv7AxpmCY0h8rLOGQfWh9Rb6rda0yyXVVccm
	Ae8o2lEF9mrhNVuBRWJ8hzIqfJON+IMNt7zIQetOEPwGD3hu8aPN008F4MkSzy/aWflFzr/JV5A
	w0FhEC+UKlFg4p9bicUAjZHwTebPYXK34DN4EH3NUCvy4OVfULwc+KjpIh1Z2iNrV4eMXE7cTVd
	l4ycQuFUGAzfXEDQfjccqFLjzED9Q==
X-Received: by 2002:a05:6102:5093:b0:785:d308:cc0c with SMTP id ada2fe7eead31-78a4a61f8f8mr1404751137.5.1788527101541;
        Fri, 04 Sep 2026 06:05:01 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm1669036137.5.2026.09.04.06.05.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfaa014978so472850e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrG2oCe69uCIteO40GX9DM0YduUDBWYGW8siGiZ4kig6uwseCzxUkEdz/Ej6L43HZP6Qb8nxX/QC4d@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1610149137.10.1788527100013; Fri, 04 Sep 2026
 06:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
X-Gm-Features: AcwNN1WoMZ_PTeRAOvmLdFtKHfL1Mzb06YSXX-uH--FGhySrvI3MRJ8Z9p2r4tY
Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v7:
> - collected tags
> - dropped 2.5V voltage domains for SDHI and QSPI

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
