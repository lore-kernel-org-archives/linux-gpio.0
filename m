Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4EE4EA38E
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612068; cv=none; b=k3Ze1iGKBaKhaYrTaojd/Sgr7SJVFR6YXcftiMB99aI+eKJ8ITGjtRfNjt3BCy6cJLAh5eeYFrOJM2gLghiPs8+zItMH7BhPgT6jSu5Ad4mRKmE3RRHc3j9d1+GnA75IlxGLlXukYpTPmkENEETdr9PKBVMbHI+SoXcn0DC53TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612068; c=relaxed/simple;
	bh=LmuWqcMyTwMuJpgDZBWpwTFm9kIaObVYzEuR7y9gTcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSs4ugptpVFAamoo1MZ14fmgdAVJf4qvDXPyMrBnoM4qi3n35zVJzZc0cgbuaydojuetE2nRZ5CMCry/Fe1PWLW/ooBHWX17Ibcb1ut8wC32D7NICl2yyGGx0hIyITUkHj9/WfLUr6ByVcLIWWy4pOGR+5Tp91kGiT2Y3LJrvW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5ccb36d5a57so1672884e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 09:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612059; x=1791216859;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kDbgXPFrnW3qUuObWck9tBFMLu1xDmnvb5Ge11TXK24=;
        b=1bHTqdgBaYhS/izNwrkN/foWUB2t4uS53r13V870GrvVx8+uzh0lQ+zS51M276XrP4
         5Isb70MY3e799zuCy9MTInGJWWdhaVonsBw65SktRx1SN8Dc55U6zU+nCcpqDKrbO7k8
         dVCoENCFSIqxgQ5LTlBOsYX6afxEDYGqJuzbhuZ+y6Pft2+AU5MtmyLAEMrRvwOrkIKe
         v9xFi6+EwNVyqaoouHXZwAH6EsdbOro3ZVrOwkYLvi9zCWGx9uBKRxyfhBr1CsPMe5eT
         LRoOWzWpEsxTMijxgKH6VGlaJ3tfdiWzccFHtTTiVqNBIO4rda+Q5tFTGQSHaaA4NWsa
         eLew==
X-Forwarded-Encrypted: i=1; AKwUvBwOZkx7Iu3BzzNWuNumvWOBtp+TDxet8FIMRvC4XfOaSLqJ9b158sCZkLgj+q57xlMMDpdOwlZ0nsL0@vger.kernel.org
X-Gm-Message-State: AFq9FYK9PZ9UXCglrBMBg6gqQUF97g9fAUJILiUrXLP2k4be6ADWRoKq
	nQw6BsCAVJELh9c7Zm7Pb5LNVxrMeZR/XDD14YdXTwOgBw+qhzAVed8NL+GPYU2tAa8=
X-Gm-Gg: AYBFou0Sxbmu8qd9g0JPfqDvNlUAG08ugOG42RhMU03/XZSq4hiwmWKBmeKsfZNZtHZ
	eJVwWRDW6F8JYiIzZ7k1c3wEtrT3y/v2x/oyCMxVQX9uhc3/SZMz80cPcmzZbVgMDVgXduX//nm
	UtHgIQ5NPhxMOQSUksTl1tBVNvmUpPbE3aOkWAtHRaqXT6yZ7ZWA8bLSwu2H/vLfNRog3NFXvjc
	oc2KQ+6RK2QtviPr7xMFdrK3uIxuYTMBdhfKtqYJt3FYzF9eBgZQCcJWp002Nhgxmk/t5E3OqCx
	tOUsgt2n1F2T3mDCiamsBklDxJioAwnBliiRj8xfVYOS90MamqoNmNr8Bqs90Yw3xmqbCoyCdo0
	+vgfRIKnn7JBhuwjzyOlG+RdonYTDs6z9ewdWqFo13YY1S8qfX6dPizqrb9KcGgG2lcN1t4DkD2
	/hI+iT3OS5efnI0nkemrjERVcStdC3DDu0UZIHx1xbQyqjgAjDuUkhgqajqx3UaZYjD5OIKKud0
	WBxZqcVjGYUUaOIWNtjJUn0p0MZysKzkBxm
X-Received: by 2002:a05:6122:390f:b0:5c9:a60b:e5ce with SMTP id 71dfb90a1353d-5cb0acb537amr5473615e0c.17.1790612058761;
        Mon, 28 Sep 2026 09:14:18 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde5679b3csm9241678e0c.7.2026.09.28.09.14.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:14:16 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9b0bdf5b5so1171063e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 09:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0KuLneQDBE7uHBYrmReAEs0IVgLIWZfgffRjk05sPzgWYN6qDcL/XAIkFO53hToO2yUkaws9y+Mpe@vger.kernel.org
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id
 ada2fe7eead31-7b1602862b3mr1908825137.12.1790612054596; Mon, 28 Sep 2026
 09:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:14:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
X-Gm-Features: AclHuK_AjFWmrE4_ymPqY0VlrZBpkft59awZIm-1fGOKVExdklYpAhT9I-Cw7Wk
Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
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

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
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
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
