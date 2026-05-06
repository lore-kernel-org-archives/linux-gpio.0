Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2815221FBD
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082003; cv=none; b=i7oSbQ8WZsjIbtQ3AZRytMHQjgtqK0EnibiDurYh5PyJFpZ9w6Cz+GU0MTHMnxLu7kImgVqAK9Vg2mDN+9EgOKfh4Lh5PCSJaEweH3otG2WCUcafoxPzIAulCKMQ6qmcDpLjL5vtj/g35YxJ9Pv+m0EGroaOF3jF2FJlWyeoc8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082003; c=relaxed/simple;
	bh=jFDUbEx52SuR/UK+v6lyDx1IR/aux/fk+ZUTkvfYRnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjDY8Usb99EInBCWqjE/fo6/NmaNGO0g8uYADVHzXGytn1yuTlDuNXFIZFab1wVWySActc2elusaN/R3FuE/XAV05h+SUQmMrGTs867BNAAosIXY5d84qQ+zu44OilrHcCTEgqQP6rQCmMMrd4KsDz2RJ5VMNZZQ2eiCzu6BMtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso676429241.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082001; x=1778686801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPTG7o85JH1ALDa5WyNtpAiaild2aZc74qEel7NDRgI=;
        b=mgseHSzeiB1SdPmWLIhvJiqqnmFxKzYD0HVn6jzYUTUMVsErp4yDjseB6SCyBphCEj
         phiTqhiEqKSsFR+kSEoxKWgMYBHH1yGImra8TjAhVE8N32uuE+vwvT5jXCYA2zwsNRLM
         rxyJ1jUp1aFcSdb1yNIlYIZdw/CTs/O65djIfprQ2SHsFYLoho23cDa/wQOLedr5YYDR
         SFUTW5a59XIJvKiEf1H3ax5Ch+Au1IyW1RJ91+Xd1+334QvYc4y7k6RHBOh7FM8HFYTd
         2VfdkOZXYTXm6uxGzyexmyXTZ5hxol6vU+hnIilHirZ8/dLcmZEbXTRguwOWS22oNPfZ
         qdGA==
X-Forwarded-Encrypted: i=1; AFNElJ8VpqNBGrpGB4eiODs9dx+9Jz9vGojp1DEVSdb2V0V8v/GSGQALzd3gVGOI0R2j8zwF3r8IPtZpS4ff@vger.kernel.org
X-Gm-Message-State: AOJu0YyyRTHa723ivod+adE/A3qJGRYjWu+A020vR8dr46lcBs1OuKNA
	YMWYk+QfJTXGAFz0jfYijIOT5vqCA4yPhPqGdLUpYeTm0xFAWM3ueRDVEwM0b6TQkIM=
X-Gm-Gg: AeBDiev8WJIzdc9KgoI3Vqtl29ILx3m7tCrXtfcNtqRV0IPc3sDXx4H5+g5AZz+mvFc
	rjQsFA5FU+CRT10aS8b+DbCGEYzObEPTcz0azJzedPrwRO/isVita8/wV9jf+mXxGFAZKdydJWX
	PGvyUVWY4jgFCw+3D3fPHUG4E+ENnSMhHCCHrwrRkUKftBpPoOEYuud1bvDJG61YzavK1m4nuIJ
	zjktoRfOJj/6Y0ad6Ph43848qaWBuxOgUUqOGGNHrrkneVn85wv97tS9c7NLFvGsrn+qtOnAQFH
	n3kg4sEZb6bpST13uxnj9QvnOVm7yL73qgXsqy2uokfTdD6e32koiYfY0HG16r5wgypqOOXHU/w
	OUHpW0TLZL/DJa8ctHHKi+gZy2cQ7Yp8eX1PDxd4mfEsIsZ2cXFX45MJLWUsKF0O9s46puIm1bJ
	OgdAkqmRkrtKy/x0WSBA5jtTu6uDmLxSZOl/1B7kBRk8m/UT0BK6QaL/1n7JTBHN3rrJhkYdf92
	yUkX3hFeQ==
X-Received: by 2002:a05:6102:4b14:b0:608:276d:d65b with SMTP id ada2fe7eead31-630f7342abfmr1363070137.8.1778082000824;
        Wed, 06 May 2026 08:40:00 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62dca273b0esm7462518137.9.2026.05.06.08.40.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:40:00 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so649215241.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9GziL7S0hhkLqIaJHCYgyIgF6J5epuF2EidJw1WoKwpp/ePQ4yYXlLD8lMJYpqmsG8VRR9dC9sNzQm@vger.kernel.org
X-Received: by 2002:a05:6102:548b:b0:62e:1ae1:cd6f with SMTP id
 ada2fe7eead31-62f557d05bbmr4437820137.3.1778082000132; Wed, 06 May 2026
 08:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:39:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhMoTggXHCcAjiptVuZ5yAwb08wCDaLb+uXn0dNVH52w@mail.gmail.com>
X-Gm-Features: AVHnY4KeoJQDYgUyJQpwX_pSlp7OMUhlkgW9yfuaAsg4WDlp4KfZjuWSD_EDeHM
Message-ID: <CAMuHMdVhMoTggXHCcAjiptVuZ5yAwb08wCDaLb+uXn0dNVH52w@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pinctrl driver support for RZ/G3L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped extra white spaces in SD0_CLK and SD0_DATA0 entries.
>  * Renamed SD0_DATA* =E2=86=92 SD0_DAT* to match the pin function spreads=
heet.
>  * Renamed SCIF_{RXD,TXD} =E2=86=92 SCIF0_{RXD,TXD} to match the pin func=
tion
>    spreadsheet.
>  * .pin_to_oen_bit =3D rzg2l_pin_to_oen_bit() and dropped oen_max_port fr=
om
>    rzg3l_hwcfg.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
