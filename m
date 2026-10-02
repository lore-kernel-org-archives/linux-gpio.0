Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BAC469846
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935354; cv=none; b=eaxz3DGFxSvM4X67kUnnyqLbIbDdYLUnMJl6Fmvznt2PBIGQeGHhwv24dWIcaSkDx3UFsyjA5X5iSIgKmrh+1ma/TsqZfHEawdRisZcIR6SjV0yPFGyUiBdjBwwkBCHHYFSKxgYcCDG9dvQre0GecTWhtcy89dAULRiRCZYxXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935354; c=relaxed/simple;
	bh=GzAnx2xBXfEPO5tzd00AnUoKCvkCiQ5XrGLMnwGIK18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chcBB48BVNbqMev3sBZN7AadEPzMCUJj/duCRslhUbSzKIoObObEouVuhQw6+ZeG1ZZux7bWFSXfotbzDoT32h72fhzR5SZbSfglRvdxkKJ/sRFXkHmq9+jZ0eFpHOqA2pNWDlFXhv/AMV5y2pO3ubQIjCqd5a8Xh6EwvUnV8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49e0ff50821so670147fac.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 03:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935352; x=1791540152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z0fxwGjBjqcCfabEbDLAIlWYoRpsrY3klbqZYJ/Lvy0=;
        b=L8HlyhLaJGo9hcfCJnEIaITQJtbaQ8yzW0dwVtgrtH5PR9ycgyxuzld5N73Y8WzMQl
         5uIgjedu7VXGz69MH9k2PbiLdWyBfyme+i+MNW4NHBBnHZL4wjPIeUDy4/kEmmlqc7pe
         PgbW986PNLor9nfiiZSijxIObKBynjz/thG/xw8At4mqytUEiZ4c27GyQmlEmgZDTJA7
         Aio31/T70pv2dHPbtLD2IJ2YdOKFF5NN21cTV3z6DOkRPIqoSYQm3fXbkYILcVEq93HU
         5ZmV1GWsOD/K1UNnUuEO8RHODYR0p3b5aQ+WA/XqhE6BsgHRDoOiCwr1ldtaHy7IDmSq
         VSvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdRgsbIEaOSzaQW6FFMf8VJPH7+0rKcLA98Oik86SihjprPBZSSwMlN0/C54d2JjCo1cz+AS1u3iWH@vger.kernel.org
X-Gm-Message-State: AFuF++lRKONmOMHTlQiuRDZlaO0BVyuxuPPhfcMJruKZJenisXrfA8Ej
	5+pAxWdJOu3DpKswPoRC3lwuxRj3NTj8XlCCAKQlNcYm54SX8OoEgejYXYGXGk1d
X-Gm-Gg: AYBFou3g+J8PvQIC5/ff73vLzbI9sI9yJw0ezCrkqSZAEOJttB4uJmMS/ePQru7E2UA
	CMhKgvBTI1qnAZT0iW8zGsi3Hqyh/zCkOCPl48FmsswIYhq+CRXlh1nAaaCkxLoqjEKnlxkHfs9
	47hMZbDJsR5sYyW5/2GBbAgLqsAtHeydnKNx2r5TS43JBvpZ/FWD3fw1nsq7MgZTj6guHxNONOj
	QKEJxAPNBM+Wf0oRF6oE1WLFS3YFa3ZKBKE7zUoxtn+1XAfuGdNNRgCuJbG0aYak7L1W01zIRCo
	kvImZVZ5UDWnXmAQfPpz8ieSNAREv7LxS9fDMw9M/bjdXVZMLeTFSL4ByqiNJ591wu6+ubtoDog
	nSZISXJlxfYElwY9TnuWYlSCM84DZHWmeQvGPh1FMksp3F+ekX5NDd96Oyl+i1z2NDvnbsZKqlK
	fB9hBswSZv5MzUeetT3BiYG31Js88VDSKxWhd024S/jUbPlouyfk8kaN5WZAk+h7DPh6eBhfblY
	yagonCFIi/ACg+q5FxKD4N91Xs1B44AV3XVIoNkGLvZNn/W
X-Received: by 2002:a05:6870:de07:b0:465:8554:94b7 with SMTP id 586e51a60fabf-49e15c3e941mr2097659fac.12.1790935351920;
        Fri, 02 Oct 2026 03:02:31 -0700 (PDT)
Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com. [74.125.231.204])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16e3caafsm1912781fac.9.2026.10.02.03.02.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:02:29 -0700 (PDT)
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b5c61966d0so3999003b6e.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 03:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycRn1lY0vEIRqRtANzoTzN3iJIFt+vsqZwW+dt7zEd6ByIF6wwvMR0RzlIlkbixdb35vCvtewhmDMH@vger.kernel.org
X-Received: by 2002:a05:6102:162c:b0:7b5:6bb2:53a3 with SMTP id
 ada2fe7eead31-7c0f498afacmr661636137.10.1790934890369; Fri, 02 Oct 2026
 02:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 11:54:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
X-Gm-Features: AclHuK95-pOI_InJ83kxtHngxLL78Cpy4C0cuDPVuyEs-ntx9z4X1Kg0cbn21cw
Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
Subject: Re: [PATCH v10 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi

> +       sdhi0_4bit_pins: sdhi0-4bit {
> +               sd0_ctrl_dat03 {

> +               sd0_dat47 {

Node names should not use underscores.  I  will replace them by
dashes.

> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
