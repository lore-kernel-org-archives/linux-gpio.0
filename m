Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C0524B1C
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175384; cv=none; b=IlsXusvFpJn0rKDRgTgULtgs5KyOjDqthRWqSkb3EwYgjLmd3MVdjRpTtFHIv9LTI9s2Ks4eutL257oOr2DfXd7oRS+cU0YINMiDq97mDHqve34v6Qw5n74DJST9CzwlW+pBq+MsV0eVuW5aM1zYb5uhjF7/Sl9dGn9dZ66X+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175384; c=relaxed/simple;
	bh=R0Hl1uM+B2TCFyzAh2mRelpWA1TgmI+2NQ2VkDXBKN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5fQUz1YCMGiSmFFhm4BrKlO0z6SQSnrKAcyubgSRaP8bAV8rKr+llPBujblp6WI2kAGsVx8NDL0+wZrvv8c9hRYlB6Gyue8vppauipKmEpOfqGn+M/nbw1ZiQHme29zOZNP0X+4Sxoi5xjqRLFkTVb9fj7txWon40Oyt1eOTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78569cf871bso614378137.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175382; x=1790780182;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4gaNTKxdC+sW3aviG7p02o1OWtFZhqrn2Ys43SAJgs=;
        b=Z6Azit90pJbZ7plWyxu9GQxnySk+lLVERoHX60erOwmk7D4VLliVfnJ39jlmaKT5b+
         jY8pXGE2aqBhg6hGWithWsep2nXjO4YMGASt7VjYmnTMqqZ6QUN1aXyn3r/MWpNSXDw0
         3TgWc9iTAiY0kdSb1hbEGFEgJg3jKcnH8FmbDpj4AX3uItrvqW8mFK0eXY55v9emATr8
         Xs7XfQhi6ERtVrZU0lSZJt+9znfknuaX5HxdCAiYZdVxjl33KdpXylODQcfftdq1o7J/
         m3MR4MpJNG3Gdk1oJaL6O175uFLQBsAJXf/fYn1gMWuqwI82Ae42j2LYD+59ThfjsLs3
         /Sgw==
X-Forwarded-Encrypted: i=1; AKwUvBy6gyAgCAXoNsYTuCx7TtSJxRcWo1fIU1Ae/VQTijOTcoiNas5HlJPQKSwNxRqWnBceuKV11gvzdnOW@vger.kernel.org
X-Gm-Message-State: AFuF++niHKK/9zkEUKQ6KXdle+V6Xu0dqOOBLaJMywgHOjMvCtaJxZAn
	PpmLMn8xfjKLzgvGhNASTs390iSueVD+pDVEDoA0lzxNfczG3TS4WHjEUiNCT3EhGFc=
X-Gm-Gg: AYBFou0+kntAGsfbwB8JF5q/+YFmubCwA0xtXjsCtJWIQ6b2iOyuO1kBCml+q6m+QTU
	misXpWaTAX3gDYbe8fmCcvusobPoVGLhxeM57oLjSaBr4nyXqbipH80plNpFPDQ9xm98NMoLvvT
	YH4V8UPjBKc0PqZIGXD98+w7bRwKm781PzaB6YlhLbZelWg+YSZesJSeKaShw1zXg/nOKMqW1Ys
	+3JKTvHZ10V5wRT+/UrG4sijlR32XYS0FfSVyboNFYK3Jbq2vdPXCk+vBCdUwXtUtzVhF2Kq06F
	kQIlbU3yxMi/dLJmWNzKi1GMDfjzESfcQJpTcsfwheh7QRx3PrwE4O5b4TF+fzA8dMBcT99DBPw
	3fPGcefASVH4ygY1Xwu2gMdcBMs2J71jfFNCsZyQSP560/ik/CQ9DYV03tFPlRJYs91HfZSmIry
	Fv7x+q0uvefD1yMbAYYCu0jsbNzfzqxGAzuTmlk2tjJBlM/SASPU5EbEw71yevAhJ3mdbZXQQez
	s0IfMQTwlDLrTBOdNm4Cnc5tuLaHQHRBoRHSNLKzcJccgSG
X-Received: by 2002:a05:6102:b12:b0:7a7:1db6:c75f with SMTP id ada2fe7eead31-7ac1d3de69amr2830607137.17.1790175381776;
        Wed, 23 Sep 2026 07:56:21 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516acaad8sm3563306241.13.2026.09.23.07.56.20
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so538701241.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZ5cuXXKYcIc4yi0ICx88gGwziQSMz2GeMkoO9SOVloKEMO0xPgWI6B264NrK8uN2qzQPUcAv3SaQ7@vger.kernel.org
X-Received: by 2002:a05:6102:5e93:b0:7a1:f7d2:e827 with SMTP id
 ada2fe7eead31-7ac1e25c9a0mr2449263137.32.1790175380384; Wed, 23 Sep 2026
 07:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:56:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
X-Gm-Features: AclHuK_46aJgUmbOx6pmISWhWZ74QNKHCsrv6CnnvbaLCpF8u6RT7TH__uXbV0M
Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
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

On Fri, 4 Sept 2026 at 13:57, Josua Mayer <josua@solid-run.com> wrote:
> The SolidRun HummingBoard IIoT features a DSI connector supporting
> touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
> SoMs.
>
> Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.
>
> Add the addon in Makefile for all supported SoMs SoC targets.
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
