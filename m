Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E6A2D1F44
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527051; cv=none; b=VmY+fCzh8LzQjThwvrUxmVfImer2Dgiji+pz9OZqOYgHZ5V5ol7lc0G4wQ1TA8c1qf6/7hUeLA1rTHMfSlFo2fgy/tiSFj+P44VNzYISGTPvB+1btNSzgGZK0TDtDE+H+4YgNHsf2UC85/Svmuvdsn7EEVX/0duDAg8uwPqlKhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527051; c=relaxed/simple;
	bh=vJr1h7hsBUyy3vHTeoyngtmQwphQ3WIBheDjPnoTJn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIu/F650oQEZzbhxEyvfz4v8AcXLfvcxBd0NOy9SNSbdGZux8ND+2yPk/ha6AOHHzEuHcC86oQl8/cAqGqtF88itWg6kyJYBfDe1Sdki3dWsH5wOmGinE+yHH/zoC7/LMdpag5cT20p9Ybb0w+PeexdoCdCF/4hzdtbcnNtas3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98076bb236eso525745241.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527048; x=1789131848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1FFew0xvwxDBPdHzvarflCtGZCHXcWoG7HxiLXHltg=;
        b=G+bvw/LygJgy8618HndswI4ZDVwr8IKX5kampmPW8CvaHtYvyZ67LWK+kyVsO0cK0X
         YnH07HElarl/2/rQcFs3e0+nbV8Y/UH9C8zP6GJlSgE7ClAiv4ADTXKB1J3ejsMuRdkU
         AxszWzcEMEIg1AJsW+Sg26vuPU/2wfwriRwntkkFzzcs8VKt/A2kO9hnw91IC3sTG2kq
         K0Xe8kNIc7dH2wJLGZNggJC2De8gdDube9v8CMkypN35RMEdHUhbNHbEgnUg98QCFahL
         NqBUSiIWdh0Prs5nVlXfNP+IpAeN/ApZUHPdRs0QqtsPA18vZfDIYuedGLf8xagkU6Y9
         xLlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlbxXnVWBbp+ASx51Lsw3uTCp5tD0xDwP2wursMOO/q5DmezsBobYKSSPD+c2bd11BQg5SvOscNg2w@vger.kernel.org
X-Gm-Message-State: AFuF++miClLe2pnVM3ASTxwADp5t4EE0BMgrG4S4hdBKlnZB3uuGzvfp
	5Epwuol01FJAb8gC7G2gbTx1dxkGU1uO/FTEJGER5OoYlm8Ui/j0L4E5WipUAUohmCI=
X-Gm-Gg: AYBFou1go9P45m2hK1ubWqX9155m73mqPZlvq3T8erTYspYvGcZuLYggwrLAfHp5nKS
	1nYIM6Lq8IgHStbxOQ7P5mVYhxMcvMlYT4HtxWu50+VF5qXEHB7sKzhGchUQ8vLTog+/1bZvlYN
	rLj/Wx3BbMExeScwiJXEfOfWkYBdWAaZHFaGIE7J+K6hm+z4KmHuqC3M66+fOgj0AWPFhBxfpcC
	IxEiC7Tm2ox8VDiLwLd/QWZP4pW/IiG3/lLNouchYC4HGOte1tTiEN+j8q2Mtd0H4vdJ7GhHLt6
	rEL97OGsD8CDeBUK6W0qjb8DK+X7eZ7o+3TEJzIBriHcdVf7rIL/vAph/D07BA5E2xP5N99ar/A
	vEiknYYow398MiDLYR2RrxhJ3eWd74nYVvCwm9e69tzH/s/ewIellLQk9UalCJtJK9E816DQXdl
	oyViPcUIlPoGVQTE5VoRnpOA+M24AdagXR5n8c6oND+3pYZixICadyYa6rCF05VYVOlmnmITj6g
	BrvRddITjuzyZ79h2A0eIvPnQ==
X-Received: by 2002:a05:6102:8023:b0:789:5fc6:3693 with SMTP id ada2fe7eead31-78a4a6f8278mr1935648137.6.1788527047918;
        Fri, 04 Sep 2026 06:04:07 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm574183241.10.2026.09.04.06.04.06
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7866d924eaaso745975137.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmf4vdv4rcy3T9OH0dBp9WmK0O/sSHTYbQUGiTw7yIjq4M6TznxJ0PXtM+3Td6xBw/EWssGZG39gYf@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a4a91b269mr2076023137.9.1788527046144; Fri, 04 Sep 2026
 06:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:03:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
X-Gm-Features: AcwNN1WMbKpO1qteekuyL9lk6vgBhGsq_Kk0QAeK938uUXzN8wBaXb1U6d7AMAM
Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
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
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
