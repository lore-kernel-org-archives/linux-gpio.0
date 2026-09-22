Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com [74.125.227.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713F442FAA
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083149; cv=none; b=LUzQFYk3vrbKp528w+WptrLWyLqFp2ng4EnQgaUf7JNlJlluo+wvWSuzeP9YwUOOz5uRClHCQrx4RkA440Err/vp6TbFSf7BY4GUtOc7TkBJWNcQT0Hck2aEcNrrPwAEvcc8J/oRDYHC8yFOw7tBrxO8xZDkNbHQD61MQYGCvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083149; c=relaxed/simple;
	bh=cL+fI7yP1z+214KskulSw5sR9ItYHUC3I/G1UL4DIWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke7q7XZus/Y4s4dcWXb3FPesyFEwxxk/cy6xGrZtNDQXc1rEigYZyvL7rctezoY0RYyCLZDu3PwSiVh9pTZVC9rA1LEeCchFgUNiW3nKVawbXEQC0grWOID4qPDaUIykiqE2sjA1eSByfuW8M190yeGFeF3PouNU6RzmIb8iDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso2602261e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 06:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083146; x=1790687946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bNH0lrL2XpOj9M8wxgD6IqfQ0UbYYfZkklr2oZ0W2I=;
        b=G8YUb7JFmRRUbyCIbLyUGsa+cvSArbL2TV1YHB8UyvrLHVfyyzSfAanBEoPb2fLYhY
         5JZsISnqKIAyNN8ye5HNHDdS49BSuNkXBQYHGE3YGR/I5VpvBxqiy5rODEoHMWmWzbdE
         3YyratNcPI42oo+GSoad3u7aaO5pvsTfkzoPksEbiyj7vdAeS/upKq8m7QA0n+mc9H1S
         rUqamQeLCni81SFUDqcn9qKTZb1MPZJR9R90AGAMX159cIMGGaudvIJ5qAMrCBc5STUF
         32Q9zhPCIVybwmFbFvUz5lZD2DVmNoYomMF+emBM3nASCb8CV3ZbEhWIoCv0rLjB7kzu
         yCag==
X-Forwarded-Encrypted: i=1; AKwUvBxRyn00YVS01OEXZWsiF0hgzWoQx7NrM4bfY3ywtNFFSTUVKJkyzvsUfa+mASoMF4kBrin8TJuSbZyl@vger.kernel.org
X-Gm-Message-State: AFuF++mLTzKIDIvOeLyRt53KUmAt890t1uttk3zFwB3uCu55pb9H4NfW
	P+LDLHMmhZFGShtt+Lmm3LzoQ1InC+HWDj0nOUf5FwYK3I/kqT0hXA5dolB2F9LK
X-Gm-Gg: AYBFou1W/EJ61+8v/4Bu8GhC1+iCtZZvp+4BLT1DfOVmpLTrL4eALm2DW/wPi/ZiPNS
	50SsgdzDSSDTeyix4kbeRZYcDZsDOWp8XX1duFKH3SpESOEsOiakvd/XFAJApD2vztIYXjZNzHs
	zZY1mh1lwsW9qSqi8v6OYS1AuqDnljSju+5hCvXDuVLEztxhi99Of6Lf2bmSOHBdo7lfqGhOkiz
	FwGU6YS+064p6FynpM11pIJutqdMXz3E1HoFhd0wdnVeseqy4pEZuO2jiLooaNjSc3doGUhUSh7
	rAiSBOe0Xc4UNc5IcG8v7eDKK1cOxNUwFdm0o4oeMdOLjtBQZTmg6d/Io0UvgRj+DghIxTaea8f
	IwnDG13sILox0CZEgzBv3yYl39Evy1azzC0vZCEKQD7VdolTt6vj7Fhm6n/66m2+qzDDOQwkU40
	H8vTuQYrJQWJoM2tFl4Z6Q8fZruJfWjoFZ5P/EFLZaoTLS3mcA6yEY6CeHgbOIxBLRI7rD2itwo
	ZeUyVidBJSTJDev3cVZBwYdmDybODU0nTPe
X-Received: by 2002:a05:6122:4909:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9b58810c0mr9718578e0c.4.1790083146000;
        Tue, 22 Sep 2026 06:19:06 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850d694f62sm1689854241.10.2026.09.22.06.19.05
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:19:05 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso2406854e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 06:19:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuhW+YhVXInqk3opUp2ddokeF6HnGtBXO26ZhDI27sZjIIvpqagrG4ZiWRlbfgO9yaHTlj6iuQSpGp@vger.kernel.org
X-Received: by 2002:a05:6122:468e:b0:5c7:9445:f468 with SMTP id
 71dfb90a1353d-5c9b58a57a9mr8626707e0c.6.1790083145505; Tue, 22 Sep 2026
 06:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921232551.3129244-1-robh@kernel.org>
In-Reply-To: <20260921232551.3129244-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 15:18:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
X-Gm-Features: AclHuK8ei4T-jqiTZlN6RJORisuwZufxDS4cn_ittDTbFNHhpoPmq30pEuWosgI
Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your patch!

On Tue, 22 Sept 2026 at 01:26, Rob Herring (Arm) <robh@kernel.org> wrote:
> RZ/V2M pin configuration nodes describe the I/O voltage with
> power-source. Add the property and allow the 1800 mV and 3300 mV
> values used by the DTS.
>
> Assisted-by: LLM

Dear LLM: please consider the actual driver source code, too.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> @@ -73,6 +73,9 @@ additionalProperties:
>          bias-disable: true
>          bias-pull-down: true
>          bias-pull-up: true
> +        power-source:
> +          description: I/O voltage in millivolts.
> +          enum: [ 1800, 3300 ]
>          drive-strength-microamp:
>            # Superset of supported values
>            enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,

drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
power-source property in the DT bindings until the driver is fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
