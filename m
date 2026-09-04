Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9D2FF675
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527072; cv=none; b=tBcZWMkD5RQxxWWrAPcaJbAvEC025zkA2JwUPb0jLkvtqSEhg/uD9nnnbCET1Sm6NeDkLnzZ6PwnPi3ZO2brsJDzNJypJV6Q7p3fHWh6/EO6m6QpljJ/2e1CEaoKsAJiqA8Fs2r7Wdb545BtpO3hha0rceptvOy/uQR0778+VeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527072; c=relaxed/simple;
	bh=9mJVt4xvBv9yC09DSm77QIgsToCU4Uam8KTiXBNT49E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOUoHHVHocGm0h85X9thZVBuviqP0R/TO7GP54K0wkfXcG8ehW6dQFI5zExpwmqrymrrUxOev1AWNO/3JNJjsaQAfVHGJEHcGndvfEAN22vYAT76p0DJsoDY8oML4XWkCQHZiXs2iBxUk8VdWHpS0Tp69KbLwRCyo5cQUqtQClI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9808f46d89eso435108241.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527069; x=1789131869;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xbgZlApvTu/xPQjUHtGMt43abYTF4MBtnYGRCX+MfE0=;
        b=hZL7ST9aWC1MsU6hZDHmHlnW1t0PwgwVl5+Re0EFTtIPhf4k2YJuQT/KEntiICEdNe
         2W2zS31KDkc4PjqGz6nt1UQD0EXX/SdpG2l2QvzlTk4BNhBaR8IiANcyX5P8i4hdGRNa
         pIm44TYlEUZPig6fwyuTCR7M0nsxe0Y5/UtEZfwsQHEwa/nH++iC81E2TlzOp2LoPhOZ
         y/UMoACGpSRZkPXfNnRW6yIML/t1L6D1dNkZI9PeBHLppmE4CcqcdzFxLPSTGzHFDqUb
         rY13KPIVCPwrrTOBYu1oeAyIK7Sw12ShISsFjKmuPL9HdRQhDKYnN9BN9Ug2WEeKWUY4
         l31A==
X-Forwarded-Encrypted: i=1; AKwUvBzZczOwJesI4oh5GUS1N3+1NsOaK66ZmANuBJ93DyJEmUVlgmUhObaUCU4/MijUnHJtxIYpvyOE0Y6e@vger.kernel.org
X-Gm-Message-State: AFuF++m3B+HCf/xkvjzB2IN3+vF3tmFrtLt2PVIY/8N9/uhYU5tjSDuf
	fRRj8Ad5tdDnQaou8YsVGmBrjBUXNyR3z9IT29mH6zant+3cGHd7FhFEeC3jTwdhw9Q=
X-Gm-Gg: AYBFou1AGzrtRd2KFVoDaUTbFHO5Fpfv4v4VCA3/mGWiZyWSucddMyIMxJUoeLD5pHu
	Uxd55Nrg1i7fUdKjiLPCc7SsBc8ckNXfLr1gOHG47LF4sk7YTO50aawMCzI6hpfyqegz3qyEUbL
	OySnweI/YwRO/0n5bBGCd8fQIga1k3RYYO8fCzNsDQYISVtcXIHo2q953jhh4GD8KD/PScCPaxM
	6rzHtUGWdzyFejwhe7vYxX6KVt65S4ToBL1IP3/pSIs9SZ1fHogKqLdeltlV7XE7h3fvh8KKPAf
	55pIzSLjT0eIjyRb2ejwgWDEAEQcGcfxZUqF86iXvoNXPwCYECVQeWUBVxx2BLhP2CLvKQxRkaU
	/F3/WHxmPgokeJds/aVxpOA27vDI6z1s7rUgObORHz0TcBB7kcAd8bTqZGWxXQ5Pwn42L+Jwu1x
	8ln5kGsD22KMs7Pp9jalHYjOqO+0DGr7EtVyxHkTPY2BW1BazytAB1bEwLHqfmyLkuubqTuvioF
	Tr5okM1c0tHC7xMb8Aj6EpUIp2CjAN0RmGvUyPp
X-Received: by 2002:a05:6102:3f02:b0:785:10ea:be93 with SMTP id ada2fe7eead31-78a4a95e4eamr2152753137.4.1788527069308;
        Fri, 04 Sep 2026 06:04:29 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478bb21esm1717708137.1.2026.09.04.06.04.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:28 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so993817e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:04:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcoeIkiQJrSBoAVyyxfuaqICPqAY+rdscQKCTBV9DeEeb916xM/OjAbcTUbDjL5V+fQgRrCZ57ToXh@vger.kernel.org
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id
 71dfb90a1353d-5c7ed80403dmr2539951e0c.6.1788527068555; Fri, 04 Sep 2026
 06:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
X-Gm-Features: AcwNN1UNaplc4sWg2bdo_z4KydBn92WTMZ--tFNfKKtuA-7QPoR1X6zMCgLV3PY
Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
