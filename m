Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00FA522EF3
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176171; cv=none; b=UhoL+Jd5UZuuu2cLX30UYZOuaXUiPz+lkmw9YwCi0Pg6aauYwRwHCVX/fCxGILW2QnozNioXIywRVHSCWG/yT0sUJsgRFROK6tJ8NRIII8dpVMiSW5W6FdPSgXCp2KnWPsKLuX+mevWVnaLoa5BkzvaAx49UKR8zerfQes60F+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176171; c=relaxed/simple;
	bh=3CAD3EBkGvkw8ITbSCbAKxzYiupi8Enwarxa/dgYn1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5W7+QXLVqWOiP3KmuCcToRakTmJ6XZtzKbG3Yj4F94+IkL48JJvr1pY5EErRZYcp9knbXKLf+/Jx1TDat0Gkut9+i4+AVDjuxxOU3kNMVPTveoJ7NE0/xHPuXi0/ELsvH5wi0DSGSHLCeXBcD7PgGspCYKukI3rNTc6hKMi4y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso826345e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176168; x=1790780968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YS2k2hncr+GFNhOluY330WU9W5Yzfq4y1ZEwqZxKbc=;
        b=H+ayR53W3lqXmdC8Hrw4D4JyxtyLrp7UdyoPeKo29BIWgBGwN4fgFJmKaKmaCQ+RKs
         PBEvSFgIUbbZw/3THV771yzxrdqfMlZXQFGUqxK7+ZC1KbsT3ku6Beu77QWhdqZg7wPC
         a5gNxykEEDsFaspdHf/2MLVQLSn1k3fx940y/zi19UJ9zeMOSs1nYfFbxhkXl/+xxke9
         f1kBWKDPvt+enOVkC06sZLxUp5NJAYpR0tZq1DKGJWBxG0wYXBLF9Gtr3TcroIquPX2y
         /G+N2BXQNj/OdS2UChlbA6OuVKQxwHNLg5s8wRiJpQ+aGWFm21cHcX6q1TDONUyhiQoz
         wRtA==
X-Forwarded-Encrypted: i=1; AKwUvBw3AUW++eVs9nF2Kr8nKH8+DnpMXnvseAb/j0pVKWKSuk3ZN8GHzwuM+dHJ8ug1Fb/CpsYhc6YkJcNo@vger.kernel.org
X-Gm-Message-State: AFuF++lrZCf7iL3ERHoqEBkMN8IkfsVMsCF8UNmvnQP1n/0Lp+4iQtSK
	7OCBy5zQ5vVxX/AIrewGS8n9Er+ntSf/ELzgBDmVPWAtWEqjtShEEdVVPzK2erPp/g8=
X-Gm-Gg: AYBFou3AaWDkN79r180kU6CgqnLoO5JCR9fLmxWbcjL0S6QbkGP/vdx7rVHBIoqaM40
	9Z7WMeQqXFhhoAjHTD9E3S1NA4WXq6Ei4ADG8yftqAJAUG+1zaVqrmMY+CA6vnkRIf68T0EGMpu
	DG3y+ZyXcxombuBR0gHkVFEisFfO00D/J9+a4co1FH6mykXREmGg68SfdPrt6R6Xd2vM1+ewNaz
	axIUA+aST8xGepHYNYZLcG+BofSVShpzLlQM0uD89pdEWBAIFTHBmlC2kFCVxgmIDgvYdP/BlLF
	s3/nFII1U1djeNkkxPwynXMRYbO4FbgtWfWGLkFXxmNm/BqdIoqJRJ6AuqJ37vAdxjDgrdWOWo2
	qmAdtraQM153exd7gbqnjnD8S8aV0gIlxy9gsx/c39f+SClcCr2itO+jtQvVk5k0uepzqLlHZin
	uS5BKoIa7RpX15bl3t0x4vzVhegzc9/Bcpn9NSEev9j6v2/0yFrYKK0m3KBly9FTNSfL3ektXR/
	6og65bW6l7YQSXtCdI3GPnDM8ITtGKayDeo
X-Received: by 2002:a05:6122:30e6:b0:5c9:c60e:5cf6 with SMTP id 71dfb90a1353d-5c9f16a791amr3184719e0c.20.1790176168612;
        Wed, 23 Sep 2026 08:09:28 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cac7115b29sm302868e0c.11.2026.09.23.08.09.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:09:27 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7d9so417316137.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:09:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8vBuN6EGtMxPVtrRrG7Q5k+256T0q4hK5oATkCuPw+RL0AHRX6i50qCFYxngrDSkJp0JypPsn6RRD@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7ac1d0cb103mr2545079137.21.1790176167279; Wed, 23 Sep 2026
 08:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:09:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
X-Gm-Features: AclHuK9TWKX7_LFBBJY6lEHypNQ2_JvEQbFVziKurEpWXaJo034l1OL9z_ll5Zs
Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: add support for solidrun
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

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
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
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
