Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF648CD67
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635527; cv=none; b=H4T7ZhJZLo/ZjljrbhFCrUSAXfLsz8w4eZtlqxqzOfH56TW0L/NdZOH4D4FK5y0cBErVZWbIaJmfJ+HVIV6T0izU3gCB9dvxo13NDZ6OQm4vdt1nVll+uF1DE8sOhLaYgJlrFCy3zkkw0F/XCFp9qa46CRc/WHsm9uXjrliFOww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635527; c=relaxed/simple;
	bh=k6S+nF1N46l3nOYZEqyctylLIW1t/PguGUfiU/kfXJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=II6nEFWTP8wkqK8lOPXW5Pl7YCLMrV6UPEIg1nkeImHEs8j+FdI3/CyxtfG7aoMVNZIjRJIjnLxU9xsY7ACzWwB9LjnutpEbIwV2WiIajBe6vsjYVv9jY9tdT00hD/tOmsAB1o1ikmqOFiHrGr69HRqMeb6kUmOAuwRHAPwc2r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so3001866a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635508; x=1787240308;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQZB5Vbs2uVneosoReOIpi44y5pPlIBq+1BJ0pK0+A0=;
        b=chYTukH1kO+LTFm4l24vtKsfo/2P1eyBtPFpkg7sSTGeV4J/Fzao6PN1PjLRxUbOsR
         t2BGw/AFg7Kmfts00aWRNE/vpfjium2f++2dXLQnQd9/N79Dz8qXubSmmHuWDtOB8gJv
         jP29mAOtS0TfdMux3JJmYvctHKlEViTQPY+JClnp161t5vLR35/n+9euIumJsdiZR7Ik
         mqKBRw0YlsdDL2SILzP3r2GWtdtRicculYPXMatgYqmsH4w5EXWpnaiokF5eTW8vEA6Z
         5NlM+d1dyPM314zSbCq7mXoFz++UQqGeftzK7AIoMjgkyBWz2MGhRq/Ua5nRAxnwhep5
         fFmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzI3gnMO1oPYsUBBCXfNwLe6x5aVkRUfTqKNGWmB9nYFZAs+HBAP0y/sKe7vv6t/WIPZgkKCyRurgC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8m+Nzc2kVEUachUDiKgEj+n6e8HjrkZMrqLPlEL9zUoE1Zge
	ERxGOPsQpAPmTspdsemh0LMIzH+ZNNU1uRRnoBZMIrzFo9cDxbMej2M/GEuXNE/q0c8=
X-Gm-Gg: AR+sD13C2q7FU06cUQrnnTRx3MvF0nrwIL4BaMA79puVrnUjei9RJDoiRIdkK1ZWJY0
	5a58EjMqh9/2tvx/SaA6wgV6EbZeQBvEFP+XjtNr2Ah9YdBSfUasCfZE3SZ8kFDolvKV8S3ny2m
	trQuz87tPG3kQ/deYwAutIk0AafQuQWnAKLRr7wyRoB95cbHfO0F6BDvi6cE9xAdOwNQ6VMNM9r
	bGLVKtYvHfk1sUPHl6Po2QHD1t6YNd9Bi+X8Sevc5iOme+Tiv0UCOgAmhNYoTN75BQtwxFWu2P+
	0md0AuGwhLTjh9zkbQ1PPF/SS/KgWUClD6z7CGoztatMbiypY0yY766YToFPkBSKKjv8JlZh/GJ
	vE8vPQKSGRhFRHXYU4YMSp7mFG7Rh2MmCY8bBBhEecQHj+MqHMrufjVX4x8USLQRSD93Uyyo9ct
	JbQUNxtOhUsnw9tYBKt3CgzVR3qWhIIjLu2AWuutVAzB/4UOH01SLPhZOvD6Q2JdIUblp+TeWwR
	OTsAO3AHl66DOYevGRZdCskWQ==
X-Received: by 2002:a17:907:3e98:b0:c20:ef18:ddcc with SMTP id a640c23a62f3a-c2108ff4771mr380755666b.11.1786635507968;
        Thu, 13 Aug 2026 08:38:27 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c212339636fsm7685066b.2.2026.08.13.08.38.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:38:26 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso3081967a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoTbMDyn6UsEQa/LqT+gib6XZoDUEbH9aSP+ug+ZQaYjc07ASsyob6ihcIr07cI/2rwqX6hzm/k7Jvj@vger.kernel.org
X-Received: by 2002:a05:6402:a0c6:b0:6a3:6943:d64f with SMTP id
 4fb4d7f45d1cf-6a38057796amr3391764a12.2.1786635506209; Thu, 13 Aug 2026
 08:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:38:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXx=Pc1jM-u54kJ+_jBJy+-hSX9r8wj2+grLDSfrCkqOw@mail.gmail.com>
X-Gm-Features: AUfX_mwU1q7iAxt-3a5e9AYUA8dMo_UbwN4uqhVMSa3bBY4klxKTW7hgnQosl_g
Message-ID: <CAMuHMdXx=Pc1jM-u54kJ+_jBJy+-hSX9r8wj2+grLDSfrCkqOw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
