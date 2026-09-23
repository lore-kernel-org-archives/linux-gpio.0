Received: from mail-vs2-f26.google.com (mail-vs2-f26.google.com [74.125.227.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A5B3AB284
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176258; cv=none; b=LsNWohNXB5fCI+V5OhncAeh3hBP8DN6hpYIT1c3uNvwYJ4aDkDe+zv53qua7Lh9t9JB51WDF4sdHbjqPVDChrDB/iFXNC+GxQVCu2b7GMRFBQxi6ey/9CkPUh47zic/hFZhFe6c+NmfZpVAyMfT0jLAYbMua3SQ7+w1ybMC4TTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176258; c=relaxed/simple;
	bh=4At2W+U2/moj7AT8T+hicJRX9oknEhtMUmhLAdjqwNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzY4N6qOprGVh46lNnz54MoNHB966jGvXl+cfZ4eTj3DEz+SqtnqFsekmxDnUwX5L6oZRGlt2vgLU6G2j3g6DFlO2usR2kmhienJxwI3oONj1hCrDhjXx34N3na0h2HKxyd+3NXTJ5rhN1BEYIN0XgIctqk03djGuViXIaSPTac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f26.google.com with SMTP id 71dfb90a1353d-5c67e529da9so415152e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176256; x=1790781056;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCnq/zzLYRUWzxPlHY5tjdaCgBAl1dYFcApPP+PgMMU=;
        b=KzCHqwm7SmalJe/AI9wGgrjumMi+sYAv0dJDKNOnuIRAkFY+zyHLgV7SGLDXbNu9AR
         F6HQnn7LZNN1i0shD7qdks5ZDP4H15G/StmsZAv/emM2MjCWRM85A6rBmh/FVw0i2H/u
         EKRZMBRudMCI7H9HZry2iO0zZSwzqx0xB9vNJ2t0gnip9JTHjHwa266gMychidf7+jZN
         TnMEmjveDH3oOvLK2HUaRM4hZDgWIKv6fsetFUxUmGY71QcHF/diPfAb7X1oul/FvHV8
         ulBWhK2XAtJ3anQ0AeTwspbbX8WML6aRwnSOcqvE7pZnYeHFMrPez7r95mIzdSkSgltA
         3U6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhx78KzvwBZP+qBlt9Q73NMC1w0Toawczulu5kg/vK7UnHFi5gYjtrSRBt4dJ5ttOTDcGvboeIZdo9@vger.kernel.org
X-Gm-Message-State: AFuF++ky2IOqYLsVIE7Tq5XoUMmZu37bjiQxENhzsq8/O0sntQ1wKnd1
	91x4cbESAgHDnxTz/UmMyG3kZPLXEDAnsXdHT7IQ/d8BYOxOZDVMf23F5rGyEKd2Iow=
X-Gm-Gg: AYBFou2jdU6iGZoyV7PIuYsyWnMuJvAb3KhNguRDkEU01rYCeUyze2n2v45/OECiOwg
	QEtcn6XHTmycWG2KMJHseEoI9Sc2wwgchbX+5Egh+Cn2G+/JYut7wjo0j2N2g7aSaBWM5SRxABh
	pC14Fk73Qtrpa/t+lKIFd50LyGmnNyV9V6/Y3qOz+qHJrLRgoMUPJxMm0TtYgbMNWD6uIM/kX3A
	Y9nFd7H2tFYgQyLiHKLONVq1ILPsogihcHJpPCylEITLSbwYvFGFWPjTPawyif9HaZpraBqvhA/
	JnRWC1IC/nDZZs88KIsSm3xcU4k0BFYyYM7aIy2bx51VEJ9Iv8Z8b71oH2TRKwxlsER6Kg2DNcd
	qc4qxJJbkClYVtv4zPqtowEfVA1t8VbVMnE2LV7km7WhHpKeXapALcYKWHex2G49VfJojyu736k
	EcVptjyMWcANvNYBLZu2XyRmwQ3NHZipY8eCyteGc6DnfQPcQ5tdyDyL14M/6shKFnK/2JNAQuQ
	QgQviQ/fjOuBSYyU/bFQlD4N9GK6LbIG+fah/VkRTGTDo8i
X-Received: by 2002:a05:6122:6e09:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5c9f168afb0mr3344762e0c.18.1790176255862;
        Wed, 23 Sep 2026 08:10:55 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0537ec5sm3315329e0c.12.2026.09.23.08.10.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:10:55 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso435649e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhAl7rej8TLhulstxRvxPSLpY+Ly8bmSjhg2Yb51Qb2URPIwQ5lIzsimbFnTk46AJCkYDUVhTt5rNz@vger.kernel.org
X-Received: by 2002:a05:6122:1d06:b0:5c9:a60b:e5d1 with SMTP id
 71dfb90a1353d-5c9f165640fmr3422858e0c.11.1790176255382; Wed, 23 Sep 2026
 08:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
X-Gm-Features: AclHuK-BF50Mc9e7D97YaSRELj5RHb8ahiU8YbPOF3bWrJ1zKR2oLG_CwN8d9Yc
Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2LC
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2LC SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
