Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09D2F8BC3
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527511; cv=none; b=JLr7kKAqEmcS5Geseb/Qn9o/Z99gbw2DJAIaJp7qxD0BqOU1B+5x3MIG4bkBI/mOuZxQ0WdVw+lBj5akxVGFwxeN4F4aRrfRlCq7IDTs78I246ZYMhXxvV48hHUZLgBoTsBPo/0selYi0bgvUWTGEL03z/CM5iZAnuj5lgZ+ebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527511; c=relaxed/simple;
	bh=2pDxHO8wpZZL1aVsWi+EAA7ecsGJLacrfFeBli+WCFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vxgj71ajIe0ICHjJNcLa2Q1o/Cdh//HIg3nVq5y0grACxVdE+5IhOExVdvrIQM0DU+mEOgI1ImQslg8SgWRTnaMO4giUOoI4DKEFrAEmMmwmQKWJfO6eDj4FOle4XeQbvn9fc8qifWpZJ+eGicRhDw0eFOIRCLgperj5fTqh5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1022550a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527509; x=1789132309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CgqnNAj6IteboRwdvP7GVLALXi8ReI521PLZ9Y7Kkfw=;
        b=BOjKaReHXs3Qq8TTIQs+89Bq6R92f+tIEyX92ahq5WAvRr2FmfswGztaVH+LMLt7sB
         HHT6A6Ji+IM8+RngsBaQeg+YPo0Xa74jwB4AHh527V1YPrdAQbtZmgucnMXTgGjCAE15
         cuTHDFg+/r3rw3HdU8vUJH22rHUC1RQ0HHOnlWf+p5TnqZQ8jGfZmpGSFH4mPReWjNvE
         MNhEdo6C4emx8L2bycjUzgNyoSEt68JqNsVFailbeAz0U8ULVhf/3AjqQfeHB0OeVxFa
         uAgUvjLKjBvlDplGU7y/XSD86+2P4IehKFP3at3+Elm5ESo0OEdTbQ8ijW2KNemMRw/N
         ynpg==
X-Forwarded-Encrypted: i=1; AKwUvBzcTgqt8Gqp9t5+Rra6kg+g5nzlNsHigiLLpqSI3Nn4LdhK1MaybsTOrvynDb2y9LwSCHZTEOQLOEXI@vger.kernel.org
X-Gm-Message-State: AFuF++kLVlRI4ysms+rU84N7bJgI8t5vgoHfAcZwq1aurCLjXz91ylpc
	/i1WH/G/DL8PHdnFDuSzOaVg6Cmc0Rh/bDo0oApuCTWMgxNNVYqcnqHyHaYr2qHpkE4=
X-Gm-Gg: AYBFou1WkPzF32TAO3TOtADbpFSkSfYYScYxIBzLPlyrcOIGy7xUK1yWuZnGBt4N84f
	h1zQ/moiBoPotohE19DanK5LO3547xrcNUkDJ9YaSV+zd+EZPoO9Z2OeCX1hz5epmfVWG5VmTVJ
	TfRP6ryXSYGFPGpaoFagKH6Uvyse6paP/UTpp/MbPRWPm+Xp28OprZTRuTbcR+p3K88o0MQttyN
	RxS4ha6WnAz+QgW8yalDdHcCU+Gzgr5BflpDGaZkg0h3bhM/yNeuPKs6HkBXF0tS//sRk7v2ZRp
	G1+TENZEbngsiou10cqQG83++ucJf4HezL1nOxJpjDOg8beP4M76QYgA656HqNTU63OHm0rZHfv
	Y7JyEvbnmCB2MvPd2gEcGRDIo2aWW1wu3r4JC8wDTtHtj9Q9315C91Yr2vRtJJwIPOsuW7ePnc3
	s4sUCTTE7Cldw50ys3gbSWGatnKqX8KTz1qT2+2/AygU7CP/I27lO+QRAn1mOaODqqCtGbnYJI1
	2ft4qphKwr1XpHIWvLT2Nhnro+r2Q==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr4026537a91.6.1788527509296;
        Fri, 04 Sep 2026 06:11:49 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm11364739a91.16.2026.09.04.06.11.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:11:48 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8534d507f59so1115810b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBvhecU5q7KZHph7t/9jB/Ak5ZKKr4+9W/GyQQCEd+aOBnIJqs78mmbziu4DeUDwBj5ZyXBU1AEDqN@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c7ed285aefmr2496181e0c.2.1788527126515; Fri, 04 Sep 2026
 06:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
X-Gm-Features: AcwNN1WKYIgtG8pquOg-3QDCj5oIF82tVACq3CFfADEbuvkkdmux6vPLdOD-FKA
Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
