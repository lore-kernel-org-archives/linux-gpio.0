Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD43B8BBB
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293597; cv=none; b=eJnrkECcW7WnUPhb4lHpBNoTpOdfTTCzxcwOXrcA4aXM0SjzHTlYRrV3n8K3C6oP7mbI4JzHf8G5PvsTUuEiAVPI8p3Kd9zb+pUymyNtIkh0XMjQ8jYrChu87JrZBRMeXT8RhsDHvnV5P087VqcztXusAL4WD3quRgX2jx02k4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293597; c=relaxed/simple;
	bh=JDIWJkl/LgBTnPaChq7M+tWmJ9t9TgrLrxcBQAaM568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVrZAKx6g9e+c007qJ/3FmnHvH4B8+tEAq69nY3tTui7x9Rh7WfoU+V0p2MiL5kwWhuLjxcH9BDHBfNAx+9v/hBhjXjMC939UlJmFS/M/ZhpyFsVGY/+YRP59kCyaRSF8IDV7ddqxnF4eSQR64yMmNakEbpFDei84h2UAIZ+bac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so9629327e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 05:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293595; x=1777898395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I4ulITfm7RcRo2LSwevKoJMqLeV3TvjRz6ydPI4T5c=;
        b=agCvvDnwyzA/7+Y1IliJTkckZgRKrW1JxEwGlIHuYtcUk3wSSjChR4WF27SP5juxt1
         88lDXil3KQRbW6gdD+/Qvw5WzRJKSvrlz7HEhuYSFtlk01y3Dcl8IT0BQ8INRJ/C6Jam
         5vsx3hAyJSE1G8OX7nVyOPN1lLRIO6dE0L1FIBZbuHaA/8zHR/GyPIIas6UvZU0Qs3Dm
         7Kd/Ri8R+O94kSJofWJH5Oy+js1soKTtKNXgLqqaIy7KRE1TMPkA9nEEFIfr6NK2du3T
         7vjIHC+rMxJGbeMn7Y5H4zmZuul9B8Tjxg4pG5n/f8Y1P5Y2UbVynuKgZEbnF+Uynz02
         dWqw==
X-Forwarded-Encrypted: i=1; AFNElJ858Gs/9XG7iIUn5xd6w2+AD1u9OvCU4T+8xn7c8Ujh77ni6AVj43rxWIAYzDwR2XkvBdphIA2LFlLT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhqm78LFKbDhtxamzbIQcXmu3/4P7p4xJxJy3X2Hcz1/XVh2YV
	tlF/GAD4JaP8XwLRQubbtoVbHI2sZcpyPIA5G09BfiQbi7aILADFOQcUUjxPks1Mqik=
X-Gm-Gg: AeBDieuu6KItsV38AZpXEfn/clZOGAaP2+W1vM+Zq2UvcHQvbxJs8eAnlgvmP6BS17C
	GtgZLYHgGxmrd6UFh3Cm/ccTavvqdA/o7PDMx4U1Zu1YM0XPUbOQyIoS5PlUDYDR0aRfWMQT8Bw
	fPTmdDSEkqvESGuk2RQQLenqytX4rcDKzG/cSK6LdClMiLx9yG/0hXQMA1sk1FGsILrxqADuh3D
	1tlw/Z8ylCtS8jPuEIvkQFoazMMwAqIyFOECFBg9ti1tasjRdq880ZnGAtAXDsB4b89xvgCUUsj
	iyDxWbV50WJ29HzrbE57N74YB/Z1lPFmJnaRlfqBPh1zsTZ2bm3B9+gqN5MQGlDCPpD63W1Whcd
	CRrbQ7+iaxsfV3uBnLKSDYxpX0fX7o81c8F6y0HlQ4qP8mB2DGcCuio9rfqh6Z/BCcHt9SGhb8A
	i3bzMXDXCdjkB26DDZejth+OiD1A8eN+CJ2cE01hSBqlMgFApM0rJrFgDf9kz5YCPR01aEUjrHi
	YUJUSYtAWBfZQ==
X-Received: by 2002:a05:6102:d87:b0:5ff:ecd0:1d1f with SMTP id ada2fe7eead31-616fe359c61mr16839446137.19.1777293594927;
        Mon, 27 Apr 2026 05:39:54 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890c0a526sm15076530241.11.2026.04.27.05.39.54
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:39:54 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so9629310e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 05:39:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LnD6Mhgf8nMcE1Jx6Ogy2WyqCnwQLggxjD2DufQ5ZB3Xaq7EuzvZHTvjrlzPk4ObF7zg1SHenOLDk@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:60f:f686:3de2 with SMTP id
 ada2fe7eead31-616fd91c77bmr15161873137.10.1777293593886; Mon, 27 Apr 2026
 05:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 14:39:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8TOLtTXiEDmze745n1PUDuXB=ngrZpmQ82u1wzM9-jw@mail.gmail.com>
X-Gm-Features: AVHnY4KkIQs5InenbyGUiwPx39HZwsYBx-UWGIr1zOzvwEycJZUsx_PjwWzdJxs
Message-ID: <CAMuHMdU8TOLtTXiEDmze745n1PUDuXB=ngrZpmQ82u1wzM9-jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: pinctrl: renesas: Document reset-names
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> All SoCs has multiple resets. Document reset-names property.

have ... the reset-names property

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
