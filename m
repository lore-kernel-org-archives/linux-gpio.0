Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DAB511886
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419111; cv=none; b=bvut3uLDZ6sQ825oEI7QvCyOIUZLPyj5gD/cFD8XyYSp0YifA+WF6OUMBEYPPXuaGjxjMym/VvgG2emcSBDC+nZI3l8CvRrl5ZoWcyNiXpWQ024cE00yalk/WbO67erWFSzRxJWBbX8fiksZvFN298tvEB5hjVsJ654AN+3ne50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419111; c=relaxed/simple;
	bh=OkpEifD2KWm3GsbxAZ0xxE8P5d3Del3yRNhkAe0sUgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIgYfYeKKuqpu6zW8tKWYJXWfhlTXItsMgHBSFXXt2Kyn4CvSNlMG0ump4xIUtjHNKJDnLTlf5qxidodS1RRqnnziTUAewdjkVqaa0k57AmEA6+XJv0HNoix/HP2eSNfGSZP1eNK9jeZCk5RMNrgnEtnuIQ/SCynfbwWgktyhwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so411962241.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419108; x=1793023908;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nUNNwLjM6Li4QaQna+9UtyB3Cj/CRAMDg2QIIEt5PZg=;
        b=RcatlSMm9kmJadHUE5SPpUm+uSvWmTNEd0pH+eG4BjiNuIYwLMrTbMe5Cu9OuI5xke
         SSMp/wg+JuC1mT55MmMDbFt4IBMDTne5HLSjBtN8/PdeQ5U7969dc+a5VViMg4bksYxf
         /oeYj1GDZt/FBRzjJlZDBT4zYYdxekyWxyk+2Y2DwhK1tE+8gUdlL8lZwVktaRWr4B5Y
         4+xt3r5zq6FW2LNPtuuwXPGBi11b9Nn0P668WcOd1O/1RicmXdFm32GVlcnMdbltwMYi
         Dl+p/Hv2RkYZ8ww5Z0XD2k59nhgLeoV5BRQQjrA4KdwfGgP4+4fi+VYBsDxMtCjgJC0r
         eaBA==
X-Forwarded-Encrypted: i=1; AKwUvBwjcKh0X43lYRmCxs79Pgl2QBm5dKd1uZIHUlLV6lBxH/4DZXzAwqjsS6VcQXwC6lJ6tjPSvpfqaQ0n@vger.kernel.org
X-Gm-Message-State: AFq9FYI+3AVVbwr9ypKEIZf7KLXc0iN5b/37jxNGkQJPFFyju1xfmr2Q
	9R65Jeo3iGF62DKjQspWaLITdEumJzzdg/bxIPdKPg5M/HH6VOQacYBhBDkrwsAixqU=
X-Gm-Gg: AYBFou1EaFY/gRnEDSiT5rwuFoWpqCNS5dNdXsFn+vDdndxzXUgVA1v6Jdd7Qw1FHAw
	ZHFRGcyYQIV6/+0mKwiEJpsivlYfFzi5juZ6dCFGgwdq9EW/wt/3h56gS8+QfHsPKfLvGpcJPcG
	JeC6mxXVrPCJ4bNd8AXNrmZTWo+qmOSKECc/CDes6pzjyIdI2vdLRSG18wEm2rcuEXbPK4M/fgC
	4KpGO6s1qqeBnXBhwXuK9lRr9V5K8/E5i/ZaPwfXqvl0caCI2/dJlutQGCUKj6KuMa7cx7NHmdZ
	Pr73kY14ZCf6hD5RhGv1KP6AaQgfLnXzsQuSxBY2K3b7x5zDefoLA9AmUFqGDqX0h1Vq8nhUo1C
	pECSY1qr9aTe1+/lI40wyyeFuHwH39TL7aU4YipFL8PxqhWZfdP+f0PHucUIMjjHolPjroVlZa6
	KMuS6SiySWymX+5y+K60beAlCvV41PYwfWqAwwWXsqvN/FzPatVG6IHazECHenhOs9xGicf6FeU
	lJUSZcZ2SddEYakhZFHqwmgfZAHnrsqKm6j
X-Received: by 2002:a05:6122:8f0d:b0:5c9:c60e:f4b5 with SMTP id 71dfb90a1353d-5eaaa8a3532mr2483608e0c.19.1792419108190;
        Mon, 19 Oct 2026 07:11:48 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabf0f70ffsm4853085e0c.16.2026.10.19.07.11.46
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:11:46 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso405140241.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:11:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVqDYlieTau0t5j3deG9mqVv8jJHN81ESdpQzxteanm+z3wzuySHLx7xAcqIW7mAVWTgH1tSCijMxu@vger.kernel.org
X-Received: by 2002:a05:6102:3749:b0:7c9:624:86e1 with SMTP id
 ada2fe7eead31-7cc36b021c9mr1767854137.35.1792419105797; Mon, 19 Oct 2026
 07:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-3-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-3-yaojiale02@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:11:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpVv2=GHJK49ykUiOcgKuOrW9_0UbQ_nfx2R-MGuhV7w@mail.gmail.com>
X-Gm-Features: AclHuK-whmRf2m21YwZdvIAowJDZUbKGaSptoysY-titwCbr4PasDFMX4zXs_ms
Message-ID: <CAMuHMdXpVv2=GHJK49ykUiOcgKuOrW9_0UbQ_nfx2R-MGuhV7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Oct 2026 at 10:32, Jiale Yao <yaojiale02@163.com> wrote:
> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map on every error path.  The caller ignores the
> output parameters when the mapping callback returns an error, so they do
> not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
