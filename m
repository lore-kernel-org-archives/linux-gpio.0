Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0593AE191
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670040; cv=none; b=gmw9IUTG6WyOc0Mz9Jz+CPd6QxwIPaKzSpDHcGR6njRTKm9Jv4OzboYgA3vf+1WHqGKitzgsrZIDp5m3Q3fKYLIXJxNuwF7Pegk+BC9YbB0HYEg9IKHO7svL0meyTgOdYY1aq5Ec08lrg1+lOUKIu/n0c+YQI4SqA8j1Ad+NX1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670040; c=relaxed/simple;
	bh=e8jTQ59tb4Ke+Zmo+wcDDbIer2Daet/lCXTrHvU+JBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcnK/K1QNqibrS4Jv6uLT+eDBaBtb+2Lu5QeavvbkDJUFPUNdccMzzky8ryvmLGWKCVUgUWDTQfPHKAuVeLih7Gcu9Vaq5TFNqBd0LqOHcKkZur4dNKXQ5zjmoDTEvq+sYT9H/FQubfCwqJb8/5aGEjbzic9OmEs12hxMIq74Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d73f71a49bso1210079eaf.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 01:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670037; x=1791274837;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wKTPnbd7pHw8WKn97YDxHbj3C025J4UMPNethHoNt9I=;
        b=BJpnnjfBWf8Evb/azxsGqPf4+zqbVh+TlCiNINMT6MGaZUhEEJtZvCsYQcO/NKqx43
         qdFVsY4n0cf8Q8RLhah8rEGEKb5WkHrczIxfPLdLUj0RdgIllGqT/2bQpfgNBHLwf4aY
         VSh3TPhRGcDg1Xx5ekHfRe/g0DIuD58CtD3YwHuFAZFr+OV9wZ9MzVq93JoQw7wCtfKP
         hifqawYMWGBOOrmvnjt7Gloc/qD/mW5tx2q3vRLBRKl671dVt7ZsZlXgTiAP8IUmG3BD
         Q6I4SYPaHGR67uYcq7tJRbx7FyNTFz/exdwL9wfCXI0hiXuqfWQjOjFWV1GIU5Isarm2
         UYaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyWiWjVfxVwltrUOq5zaPfZPUBBgXYE7rRnt78AekbgRX6KxcDohpgmV8picQjrGTUt6/RGGCtm81B@vger.kernel.org
X-Gm-Message-State: AFuF++lU8DxopKhjqIka3ZXWwzKhDhNVgC9dzBRi6qEr5Nl/37ChUfDZ
	WDtQNgoFCw7GGQSUsCX3H0w7U2JZ88xJXBblbsYi3vL1oIoEbqxA9ODkk4veFqGIWhE=
X-Gm-Gg: AYBFou18VL1+NJRsjW1HqN3YQJkA3AmSJyEw6h3yBE0SHAtoePSZfmlphZe3QA3LLea
	ORsmXGbkU9Ohx6hTuZ/vPlgY+O/k3fm3mtbEcVZEU+KRDUoPz97n4rdpTsqmfEkcTxPP9dJj86i
	0SJimyO+cqy4e5kpaS8igMV6ggYgAZUnsZVEj3XGKMUmsizU+gXWIrBJNs8enH7b1QyXzQkEUA2
	+SN2DYeRtuVvNPpXogMUYctWpPxbK5VWcP6cuRG8KFeKl9qfJrIiRz3jd4gfD+0/kByCJ6tkRHz
	HODzKBM/ACfwQsYJdPtatPAznPZihVCMHFYsKTzfzXVdBV5YvxaNdHo59K6Oncyk+2364ms9XLg
	uJO6yUK/xzP64i0MCrkojrMejARQ6WypJipR8ihCxD/hbU1ZsT6Pw9u0eV4l8dteXyoDIvUdAlM
	IcpIWETjbr3CzbqNcBrrUZeElwRY2WojiHUESAFtB6u6DeliNBGmbQKq6fkIDDsZlOoH9jwH1QF
	6dSZej0kmQS1oErnMvuyoiYHdbJs54AxofOtA==
X-Received: by 2002:a05:6820:618:b0:6d8:92b9:4399 with SMTP id 006d021491bc7-6d892b945fdmr5715513eaf.27.1790670037421;
        Tue, 29 Sep 2026 01:20:37 -0700 (PDT)
Received: from mail-oa2-f26.google.com (mail-oa2-f26.google.com. [74.125.231.90])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d88221983fsm7966081eaf.3.2026.09.29.01.20.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:20:37 -0700 (PDT)
Received: by mail-oa2-f26.google.com with SMTP id 586e51a60fabf-466cc88a9b9so2551712fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 01:20:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsIHYtYriSfovJcHtYaXbQ5d4oWGfgBJ6HvMGPkfl0UMskJO9Kco2jlen93KhtuqkRLS4eiArVtSDi@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a8:15b9:dd34 with SMTP id
 ada2fe7eead31-7af1c58fb71mr6318332137.2.1790669548884; Tue, 29 Sep 2026
 01:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 10:12:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
X-Gm-Features: AclHuK9FhwKj6JL-kiqTsnzPxsKOECrpai_keY8LaopHP5dfC3Vjj3Wu8JulErc
Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and both
> HummingBoard IIoT and HummingBoard Ripple Evaluation boards.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
