Received: from mail-ua2-f39.google.com (mail-ua2-f39.google.com [74.125.226.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C70332EC5
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175132; cv=none; b=WqKKa6/AkmxYnlEjTKPYX1StQU/380y1OESw1+9VH6RvwNYz80zuBUBgC2Erv+4Oo5CW81H6vQbuPH7N6KecL7rvw7FmvTxdvfqhfbBMY7tHAYTIAavOcxWJ/v5bRLhoQveU3iNCv1SCeQruaXuCZ8/kkpBnytOU6F0MnnOWxYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175132; c=relaxed/simple;
	bh=AfFgK5O94TRbSz0v+n2agZrfGhkoCKVuFplQhBhnZO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tppANUTB/yp2pgwSjqbjkF9i6Bfh0m0wBc6m2WQlghSUmGgcDL1yFTibuD/r5JFehWFWIM5FU74ybzPOzkSqg+3/YSnIbcrA9Xvz+Gq6Qm9CQ13s9AN+6gRS6FyMcK3J+bp3qouCo0xDJlBMe0h2nP/4Ik56BxEn2CvFizjhN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f39.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso341409241.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175128; x=1790779928;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OTVINLgc5+4Z1oNwbQRG/rtTEB6pkVDW8ACRGjhrMlE=;
        b=Lu8ACpq9hp8AyAAV8JPYWUnn9RAqkfCDECc092eewMBeWCasrnezlR/Xo/7n86ebwL
         DFl12iUdu3vOk6QMymD13tkNOhOevgKaRpcXFCPALddiSgA/8QtV/Cd9j0x1xkAS+yM6
         FnayUdRYilS4lcdG+DhegxTwdChWdvR7mRSYE7nHV46SQiq4LoWeTC5vAAP5/9zEsRPC
         CFHfx/R7nYBJQ4Vjc3l64mupPFB3frtFW9XvaQt1FuicvTNZ1Txhr9VirClR5aRPgMML
         BtaLoe/pfar/+pBKfT/Sltfio/YwPPBdXXa7Zvjupun1hBNjPpfVlzEd3O+KLQtAh5Q2
         3YxA==
X-Forwarded-Encrypted: i=1; AKwUvBwctJ+A94KKgMbc5UJrsKI7q81DxJ+uGS3w6Q6f00yCBf4XuPdBBGGG23qPNi+1B8laEt4ajlnhjxDh@vger.kernel.org
X-Gm-Message-State: AFuF++mOB+Dymik8HzR73+bbRU5o8fR9aUEs0LaSaTd/oWQUMktmcGRT
	wbSfNC/eOb+Qe1LiMNf8kZRVEq0dLg4sec+5zOTkvw2Tp59JswQNP9LKYT3+EJudDWI=
X-Gm-Gg: AYBFou2mSZQrTfdEr3BDvQyoJcA+bA7KRdyN5xD3uASR1q3kMS6yddiXmdK2pYai3XO
	6mu248cNgrll7AX402Y6vtW1hMgE+wq70pjQPsLSr8XUHvGfQnkrN5I+MfVvg6NvLar3wTjm/Sv
	0iIahahOmf+9ZcEnxouQ2wOTfTJfOabywmUoDa7NcuP2wLNBmBDKlmcplZvw52ZKnrsy5XfFXKe
	fXRILCQx5wHo19hkt1JtospmxxSqbZemz09BS+mRwSHGDg0YvtMoiTGBgqcNLew8bqZeA2b4EX3
	47juY07/JjUGmmgGIZLZkWH+ipA2OT96pG0ZkhgKOGgp9Tn5g7ZxYNACUQouK/pwAOd5I4sRc0o
	bw0bzb17H6sLq4nFC/cQOw5k87Dd40uGNqMqc4GJniRPcjNcOEydRrEWEK5OgB5IwkWs0dMA3vY
	Ypb85EJA9kO89TSnMLRdsLS6FnSqZBA+CP7wiRMd0fK3oJkuL+1vZOdC0VHx+uaCZ7ayz25Z25p
	50jhmiku9/2zulsYVZg6PCHcEbt1tWGrp/U+Q8w8uQUMIE=
X-Received: by 2002:a05:6102:c12:b0:7a7:198a:c2c7 with SMTP id ada2fe7eead31-7ac1eb9760emr2234866137.37.1790175128338;
        Wed, 23 Sep 2026 07:52:08 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f579bsm3917370241.3.2026.09.23.07.52.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so409257137.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBznsBGHcckbVDEJRw1yvI+e9JpFGr2/rHwd4WYlvUu+BEvksWsNQOiThxfrvoBVzRfbzbYvwi4Zs+lV@vger.kernel.org
X-Received: by 2002:a05:6102:370a:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7ac1db33f0dmr2430482137.19.1790175126732; Wed, 23 Sep 2026
 07:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
X-Gm-Features: AclHuK-gsUhfafKUl3WYFPzbbNPmdS5PRweR7PwdMXMcSw8FWUkpxbAv7z94Jqg
Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
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

Hi Josua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2LC SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 1x 100Mbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
>
> The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
> slightly reduced feature set.
>
> Descriptions for eMMC, microSD, and RS485 are shared with G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts

> +&eth0 {
> +       phy-handle = <&phy0>;
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       /*
> +        * ravb driver does not configure mac internal delays for RZ/G2L(C),
> +        * instead delays are added by the ADIN1200 phy driver.
> +        */
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               reg = <0>;
> +               /* Level interrupts are typical for phy but not supported on rz/g2l gpios. */

Nit: "RZ/G2L" (in all patches)

> +               interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
