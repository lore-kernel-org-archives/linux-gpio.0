Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FE3A6F04
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517054; cv=none; b=BORkvhte0Qq/agIo6rUhOa5ZpfCoFnOuzmoUzsp4vg7LJ2CDlln2wQ7aXysu9kFm6PigUOeVADOYoZd6NJe8EnjVKDQkwhz7g6hjGi8b7nRJGzDHf2q1tMAV8Nw3TY88wZj8CxKDh/OBQmrTmnLKEtygNy1uBVDR7ttBe4XNWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517054; c=relaxed/simple;
	bh=QkrSEynGau1ZbI201+0Em8TncEc13fHHUvNMrEc6cck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6bObYvkixDy9qH3YueA/QAj1IS99em7L8qUUvSwv8c3AvPlCs2PelS9UcijaDAk7Ytvx0f/9bIxZqPSuimt81QoXPmVjYn3kPhvZS6L58y1BVZehzrHvRARR0lG9Nm0eHhPjPOPgmh7oHPH0uBXY87KPZ+n0FjbLxii8t65jsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-46aef6e48fbso533379fac.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 03:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517050; x=1789121850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8ZpJN9RlZp1CfHTyya0RqETx9peOqUoR2+FiCTsKgE=;
        b=cfPga5XI6fX3DWr61XXrtzRhIjlwOJMz+M3eMgB9l02KnBpu6/s0dOiupPcZ7GJLxZ
         JUFI+6AuO9ji0k32oASr7OJ3wibdYk5gJnLVD8chYDGWZEJlOBQux2Zvz2YEblnfEdnW
         eoTo1MOksbM9wh1LTfEhtJH06uEqZFP/2z3qxZ7+HbDqzNec+OUNCAJaTL98KCer8zYN
         RtSJk40zJSv//BefLkJf1v81qUd2uB/vBJN/WY4MACCu9qMiSsyxYXCY6AIKrgDZhBLj
         X/EY0dEa/wZjOy24cECjyaV0lexK9gXmtmMWJFDhbMQIU8umZ9KqbV5sKn0K5ZIAu9sm
         X8HQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5TzoV5FhF2D7xG/ve1mYLBIM3VGxHxrVnpPR2i+gZQL8NeM+Wy8EXsSjyoWTKTCwvw8FwW5q55S2R@vger.kernel.org
X-Gm-Message-State: AFuF++mg68wpns+AR8fMiWyhkz/gxq47hk84EpBKH6nOlHCiks+q6/fJ
	G+dCWKiikuDzW8jUeSI+MvmJq4QDX1GhKX/szvq3rYnJbm3QwPxP5/OCg/Xs8prjssE=
X-Gm-Gg: AYBFou1QVLs9h9Z+GSZNYqwjSJZ5kDX7KC8juu+AUgT+V9Qim/kUjc+/lJlENscCfku
	C2CFq2nqGI4UGm/JBFl3x0mbrVmJ53HF+xyla5DnF00lnq0FkjvEeHjqQVmaUq72HgJMZcMX6db
	mNsrOQh6u2gsV6216EsMlfm6C9tnuM3l8cOse1x5yja60yCIm3/CYgOdEAshOz1Zx9F74K7kgTo
	cpf1hDQihLK8sTCVX90DJn/38UPHwUyFeDwOfKLtgYV1zwJ9B1D63ZbgQPqdL88+0Yb6ou1MVTp
	MoElqEMPM3OSCozJP3Lqw0ODDuf4xfJhy86EgwXkaSdSKDH2Qs5mtZ9aE02ri22Yteojyq+2TBs
	Ypy0My5hmlv8TIRe+0MfzyZKt02YCzpiK4F49HL/l6iwZ4UG6C+ZGMWEK82Q0Z+J3V4gTOztwuZ
	OaG8KKVU8akmTt98zfnZbBmBEpjLamY1lBVGWKc0POzCXQtYi/fcc5nxv5j1YQuIFtr6K6VWW4u
	sHs/HOMMu2oXdrMnxd1pCGTpl0zug==
X-Received: by 2002:a05:6870:1d17:b0:465:317d:1c68 with SMTP id 586e51a60fabf-4755137108dmr5843112fac.3.1788517050436;
        Fri, 04 Sep 2026 03:17:30 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475523d1dc5sm1839925fac.2.2026.09.04.03.17.29
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:17:30 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b190cdc9feso632082b6e.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 03:17:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVs0tEv/AtZfwTCAYFCbHwDlma/GX/kyY0truYYgKgO0ibm8r7MJKQOJ+rBMt00lXpv7DGl70UqzRW@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1286425137.10.1788516746128; Fri, 04 Sep 2026
 03:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
In-Reply-To: <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 12:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
X-Gm-Features: AcwNN1V1Us7DEfFHRItLM1ZA7SwiTD-ZOtpiiIkRmjTu4wyeWXgopaPPPq_n9t4
Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> > On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.com=
> wrote:
> >> The list of allowed pinconf properties already includes input-enable,
> >> but has omitted input-disable.
> >>
> >> Both refer to the same hardware property, setting and clearing input-e=
nable.
> >>
> >> Add input-disable to the list.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > (...)
> >> +        input-disable: true
> > The Subject of this patch is  "Allow input-enable pinconf".
> >
> > But what you are doing is allowing input-disable.
> >
> > With the subject fixed:
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> Thanks!
> I'll fix the subject ... !
>
> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pincon=
f")

No need to resend, I will fix this while applying
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

I will also add "output-disable", which is missing, too.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
