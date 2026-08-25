Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353EC449990
	for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662843; cv=none; b=ZR7tH84ko02S/QRqedWct0hH83h5ne6q0hiRc20QfFQbfWrfSWMPJcQiEX/Pb227sQ7xYPS+7b3E4rNyQyeXh/5u2vdWnI60Eo3b7YI+Y5+sUOauk3GtuPAI3IkRj76c+lwL0yCJx7nYuMtKSlwvYW4dkj1oWT3rJmHwmXICrwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662843; c=relaxed/simple;
	bh=VO1GZ4gCp/y9o2rb+D3PA8tXGec2JaV9n1iCQ0jrsiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmT0sHx+bX7Tn6j6zkg6KYiAOBegHd4BU8iuK7f1GvYUy5VVFYuHhfTgYRdR1I9jSsA2oRvL6Kdhrg9RkCIufGPlc+V0o4RlOi32si+ZjnEXv4u3I4Tju5dySmftpKdVn7DqWv5GBwL5qjt7gpk8rOJs/7/xEaPj64EnkaaR/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so7467552a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 06:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662840; x=1788267640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/VL+GrO3wM2oN8yF9pczuQ0vsJ4YOEv+mk062nltpg=;
        b=hl+u7QC4sXFWBng6HVlJdWgQseG5A5VwvaAvcPBl4YzBBPRo2lwaW51Ow6BYDBq2rc
         ts/SOFUWh2sfPgqsOU7PbZeUFM8C3EiF+7AXfMxFy/iwUetleWLQJwOtCwBcmUMRK0mo
         5qDinX6uVWbTALoGJcnvZGTQKahXRlJd8lG+hA7NRq+UJqZM//qsYO0XTXeg4ze0coiJ
         P2K++Oaqz4bAx5m0fL68FWKctlQigGzkrsk+s+8fphaPhf255cIqzRirzn3XgJCUNeA2
         6Tq/FSqOWPYCI8663I+ANjecjNgDwsJTgz4ABQONnEYVFPbRuqETOgUTnljw9VQShLJz
         cv4g==
X-Forwarded-Encrypted: i=1; AHgh+RqCNn8AH4DFfCwz/ix0uMPigyQu7iMqq4GNlRKhMDhl3cyNGszA1hm+rBajnqHY1p3hYiLJJW+wGjW+@vger.kernel.org
X-Gm-Message-State: AFuF++kpdW8qlpQk/CyoN1CCgod8nPYJMAmhnJCe0vIjBeD/nXh7FDdN
	CIf44l6d8xNsEBPp0tvjbQWqn/3c0X8m3xWMrS3uzQZ2trgMKuatSPiVp0cvaJ17it4=
X-Gm-Gg: AR+sD10e1G+ymabbmZ5pxiphEbhKS1SyvqWrpxDz5sPxeZpb0Bu5U8Gh+NanorIy001
	qvpjQRcM5eN5TaIIT1Ev9bxlXiJcw2gnMY2p5RxfAtkMEaLInHKv3WJtFzPfV4ugsaaBqJ2aAEH
	a22Fo+NHd2NLWKgZ7iNmXwHwxAI2Z+5tJgVRJBcvJxhkku8w4Ju66pHfB/VTLnOZVcFea11bUNX
	chvjSBGIA75BBcvJA+0myvdFvAhMuxktdaVzjscHVoUikMQ2ZM81BUJFQYGuEw+d+D0kgim/wMV
	+pZNJH8WADhDm3sDoPrFN8Q64ncNgby86j41y9/mXjMz6TImFRNF6fSsgtxiSrE3wkvbgAq+qXl
	zYQfkP9m9p1v2b8P4Fi6Hzo7vAIRIUZqOhzsK2dyGmFlXaY45/rrbPmBY7hWq703pRQs4nsOqH2
	tx5QupiK2LeTYoS2jMcb5SUCRyo1AjotgKzelPwhTVl1ET+okrhStFa1jpOMLaYB+qj8na/Jw64
	fs7auWKILBdroEuM1ISkd/syQ==
X-Received: by 2002:a05:6402:e93:b0:6a0:584f:454c with SMTP id 4fb4d7f45d1cf-6a42f28ebaemr39721166a12.16.1787662840242;
        Tue, 25 Aug 2026 06:00:40 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5d9824be1sm847682a12.7.2026.08.25.06.00.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:00:39 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c26d7e951so711604566b.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 06:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp2XrZ+uTUX3UhUccg9UUA0fXfyar6I3zOHiaNRbBCfU3VE4azVYUriDPaJEzrGUXHqbhmKJP/Vscnd@vger.kernel.org
X-Received: by 2002:a17:907:60cd:b0:c24:c22c:6372 with SMTP id
 a640c23a62f3a-c24c22c6490mr1589458466b.5.1787662838829; Tue, 25 Aug 2026
 06:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:00:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSDg2EUhnzVtcrLaL3kyZK-wJ8UfZzcFXmS=O1RZE3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1VEuaPMxcxWs3RbjdyN-p7dmv63o4Gq5Re74moLFekdRIJP2iC2c_m_pgo
Message-ID: <CAMuHMdVSDg2EUhnzVtcrLaL3kyZK-wJ8UfZzcFXmS=O1RZE3MQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Aug 2026 at 16:36, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - due to patch 3 from this series:
> -- dropped the definitions for PVDD_I3C_1200, PVDD_I3C_1800
> -- dropped available_i3c_ps[] array and fill everything in available_ps[]
> -- dropped the adjustments from rzg2l_pwr_reg_val_to_ps() and
>    rzg2l_ps_to_pwr_reg_val(), rzg2l_ps_is_supported() and
>    rzg2l_pinctrl_pinconf_set()
> -- dropped the tags

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only */
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only */
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only */
> +#define PIN_CFG_IO_VMC_I3C             BIT(22)

BIT(22) is already taken, please rebase to renesas-pinctrl-for-v7.4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
