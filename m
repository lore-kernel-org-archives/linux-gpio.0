Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515E3905E6
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636147; cv=none; b=Y9ozthT0SLUSKxQRa328M6ujXKAwEH7SaOR8u04V9rBdAPIjXLZKMiio5I2EIhroNjyRB5X2++QJ63CMyt77LkTM70xpHiEjukB1sA/MCrmXESzEi9bT8gC1tQEKEeqXHCJnSWv25Uos1PEod8PvOaBRzYgO2oRoZkissNEC5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636147; c=relaxed/simple;
	bh=GsMvELF4opNDWlGTEpj8mpTFySqFsau7fk/PwQYpXII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig2BHzGATyo3ngZBSqf3/77LBSMOu0tkbrLCFrEGOk18LDTi1b3fyPinCTcrxa6VFChqFR5vOz2P8sGf3PpKQblu5QdH61y2+aCa5H0GLHc1SarnrM6gZOyThvfIxj0KSYwh/lZgz2kKobLiNi4r7zNUXgj+2GGU/G2Xdd90yE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1fbe461f59so9763966b.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636141; x=1787240941;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBt/Jg+qpyyE8AdxLGWQ3O9/mbvgjD10TBEWdEpAJOw=;
        b=MNuPpSLy6ciKnydQDaO5+8sc04/6R3DBS0xh/mKv0f43t/mg6cUkTh4a+7vKERDpC7
         dulbluUeT1y8RYHwMETOqYHh76X4qZbIXCcxT2/JnGJncm6KDtEIdAQKV2LnOKZYBfoT
         U34BzWKgx0f7Dtv3/n36yUqnvOdMLZkgfyvTHnGEGqhuJDOwvq0UGmS+JeYnxQOGdggX
         O1T3sHwWaSv1GIs0MOEWeNdp87BItDO5XxwmajeIeX/WPF5vxBuRczCM2kBkyeyawkk8
         hMi1D15TqldZaTdlmQm9ak5HJbMF+8hAx7cm5t+RPYQRxZfxN6iWP/zrzr3j/fWWgraL
         bxRw==
X-Forwarded-Encrypted: i=1; AHgh+RqGKRT474zzN1pvHZV9eBF1oLLXdLmjc/gqjtOQZsalGnn1vw+tFHTXV01ybm3IVyceoiD2QGCQAGBG@vger.kernel.org
X-Gm-Message-State: AOJu0YxEewcuN3yMId6rswqIHfsHc1buKoh8DsUtHM30XIqkmkuVm32J
	y0GvhdJSU4aKSPPFBaYBnYWKMSxBxX2fkdqhFwl8zLx2gNaLYFKRbakDBhWveN5GuRc=
X-Gm-Gg: AR+sD12qUp9iyKfbC3jG18uRmSHIbGIvv4aFNAYQtzWe1GByc3bo7RmpuD84CoU2N5i
	l78icOgTM8mDOmiF4BHBA9Yz04g6/VtYJvpFjahrJTU380BiLewTUtfNx5mrajTO1xQyzwlN92A
	VJhtdlF2cCN4DbaKmDdfFsm4Vx2vQ+vJ1mZVE0hv9pNaGH2McQfLQp11uGqtKpvfOzBCnPJ34sg
	TTP9Rm9+GW5QzIZ3/LYXBGWB8xvgIXJ6BcQfm/IsQJvkbxDD2B7pDdQDuTVuJyrTqNjd3zfZ7hu
	LoNz+Dn5vimyFH2l3xwpiUOi5XHAEg/32v/0ho127teWmH54VArlXiZwdaVuqSVKcR80oG2OJaB
	PBQbaDPzQrP4S6AIRjlwtU17DgeeotzautX7bxZoAzsAb3E4lWh92cJo2Fmo5omJTvBH06XZMLU
	pw1iwb0g2I8P6gc4uLzJYcNP9GlJueGLFRaT8q92mHAH5FsgxJPzBbnuVbSth9zMTPtOS0KK43b
	oVgeNfvxaJfLdmjQjv84oLVNw==
X-Received: by 2002:a17:907:960a:b0:c1c:4a7d:c501 with SMTP id a640c23a62f3a-c2108e3bd6bmr343422866b.1.1786636140971;
        Thu, 13 Aug 2026 08:49:00 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21231f1903sm11401066b.0.2026.08.13.08.48.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:48:56 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso3500628a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RriXFPTNSQvQMo6vesonjfIBnskumjYupN5j/G4BGqB/ViYGmsE0F9maZUkJZkQjMgleBLtx161w2dH@vger.kernel.org
X-Received: by 2002:a05:6402:20db:b0:6a1:2863:ad84 with SMTP id
 4fb4d7f45d1cf-6a38062323dmr2974868a12.11.1786636136389; Thu, 13 Aug 2026
 08:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:48:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWznqK2oeyX1WmtryYCz2wBH8wZ5c2H2_ShMDvrfO+C8w@mail.gmail.com>
X-Gm-Features: AUfX_mzi3GOWB6cpfoDeWmlHrS4hYhgS8E2rVsGg-6r06p1J_56QOvXSHTzn4Fc
Message-ID: <CAMuHMdWznqK2oeyX1WmtryYCz2wBH8wZ5c2H2_ShMDvrfO+C8w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:37, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
> Enable I3C.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
