Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1952E07A
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170954; cv=none; b=ZIuCzNihGAPQv4IozyoNtj3cH6q6fZX6/FzaTQDffER7s/vBl3cpppcqyTHr6YXibWXbSyb5Sz3/YTMpbtwpPIdkHJL6IFWNOqB/JkxGST8KPZDgAPsFgicjwlkvXiIi8GMJkc2OLPKZk4102rfEBvUy6f7lwd7cSjjVTe3HMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170954; c=relaxed/simple;
	bh=zQLNcKwt8lnNKrUhZWYc0UbpzKFARTsV6kXIZiSRVZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWYCOFkwDi565oGgPs0xsUwIt8XW9TrMQBEPaloz64fdwuhTHnlc5tGFGVMZfO4vpVIrJ+yufepSKAxZMPBER/bHOSqCOBhMpZ4g6Ro3NiqiuKr7WxUMTWcgk8tjtKZK7+jGcVgq/KYJW7EWqf3U3r9U+oHVkVdfmyEn20/5BxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199baso349222137.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 06:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170951; x=1790775751;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZcaHlSLoWG/YlsEmorJF69zsl7G8OYYQpV3ToGZCjU=;
        b=b3TB0rvLRq8tm9RZDoGxtgGx6er3UayEpGNc2APd0c5MwbD90c9wkBwh0c6GE+aU6Y
         +wNfUChV0m3Nb3qvrlZMoYo0FiKj1jqniQDc/T9JY/w40Yf4/EXd719/8yzJiMy/uRr8
         8QoHioZSKyRUfKhXP//7JAVgD6KLwTXShqtlOl43+mA8ZLUssBkP6BjxTpIsQ0GKTbem
         +nO2pmDMCBWhh5xqlIwc7GTMP2qhPatfzTjf7/wZU0K0iEdlEIkYdEd+qC2B+hFU5cj0
         oKFzqf08KNyuEPOdPcoxpHtO/Xtof0cbEEfnQxxaqSDF9jTW3qpd/ksofIlfvIUzTT2A
         lfcA==
X-Forwarded-Encrypted: i=1; AKwUvBy8p7uAyeN0ivvn/NZhp/cddgT30UTGeAIL4wxGyfqlZnOcBfdDiyu7gDEMa9TEsaCN8YpZM6wrB5uN@vger.kernel.org
X-Gm-Message-State: AFuF++l7w2oTu4z3HPcBht6pnlSZgQo+lNOxxoJOEAcNLtcAZxHROP59
	UL1BZxu+juy9z8kiQYsPNsE/HN0c23K6yVMa33l4nl0dXSRmZPKIN4FsaYI/zjbwm+M=
X-Gm-Gg: AYBFou3Odst9p8yclWeS57up/L0HXn3J5eoL2PmAEaQ7fFheGKhzxWj12dRjWboj7nG
	sus9fUDvm1Zfm7Odtm5n66ZXQZ2/JZMESUm2YqQ5pZKYK1M7IuT6XOK/yEMNbiD4B+284fP4B2L
	raw6rA1Dv2IR19WX144+tfyBdNUtVu5Cb8tlED0k8FOlJbRZPvskAu40i6Hv9U1mSmEzMXOIlfV
	1Z2sjc34whA9nZB8xKWBO8pXV2FsKickNo6ijpItkAVJI15vl6c9JeuBlEAYj2dPEyPqzpYLpwU
	Pzht0e3yIB/l4uOVTDDcVYCYTktWA2WGv9MhQ5DBLTn8HMTW5gM8jHkU39a0Mo01sfQMCc6qyVE
	aQgH+Xh6drN+Sk7jUD9t5ZzFFZvR5JR3lgyeg3NEFuxr3eEWBI1keC+csmnxu4cwITfjBmwBHCq
	66R0LvRvxHFqMBoXhBa0EEEU7hzQwkkNQehvCVjrR1rp9deyorbsQzQNlw8pfuwyG/kZPkRKM71
	yhxLdNEEYD03e7VHVYtuaHyhTIZGUwE21742gOF/pScLLg=
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id ada2fe7eead31-7ac1bb45468mr2275463137.12.1790170950964;
        Wed, 23 Sep 2026 06:42:30 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516acaad8sm3326505241.13.2026.09.23.06.42.30
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:42:30 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so441007e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 06:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlIEPADIvkBh6UmKC6UMSmlGKw/YEAv2oRfLwQMAs5ET0cYjKJTgLUoNuHUGDZ8kRq2ifBanfqm2U9@vger.kernel.org
X-Received: by 2002:a05:6102:390e:b0:7a7:195a:1b26 with SMTP id
 ada2fe7eead31-7ac1de3a707mr2471914137.32.1790170950472; Wed, 23 Sep 2026
 06:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 15:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
X-Gm-Features: AclHuK-TckegHvHKUKBwHK2truVsVTBXY6gTl27m7I0mB2ihxriiWdVUDyPODHw
Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>
> - RZ/G2L SoM [1]
> - RZ/V2L SoM [2]
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM [3]
> - RZ/G2UL SoM [4]
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -508,6 +508,14 @@ properties:
>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>            - const: renesas,r9a07g043
>
> +      - description: SolidRun RZ/G2UL based boards
> +        items:
> +          - enum:
> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple

As RZ/G2UL is pin-compatible with RZ/G2LC, I guess you could have an
RZ/G2UL-based HummingBoard IIoT, too?

> +          - const: solidrun,rzg2ul-sr-som

Is there any special meaning of the "sr" in the middle of this and all
other SoM compatible values?
If it just means "SolidRun", I think it can be dropped.  However,
you already have that for various SoMs with non-Renesas SoCs.

> +          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
> +          - const: renesas,r9a07g043

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
