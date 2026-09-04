Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F04071DE
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520620; cv=none; b=nMxr/AZ2OyQUWsgnxWq45NglWS988JS8R5A42YKXAwZofkToMCkM1pACNNlMxlACnXZXZ+w6dVK0MiCK1RY9ZrgVhH3xgFcC1zEFZO44Ornr3zetfPO2RmlKwzJaWJwvUNUSksMAIa/gFRPtssJ9zJ47vkGOyFdhSQgnmnaVaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520620; c=relaxed/simple;
	bh=V06IaIi4jTJzj1JK9gqz8ZBxdNpdoXx4g6Xhk1QdB8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hT+pxyGuTp8iTOp3iXcwfljqJnCWZnfYp1saz6mZxc8H7CUg84YEs03RwTztDHYjnkc2NTYhRr+Gw5Mr0hrIJDVC8oGvBIjUceQC6E1E7fUc9qGdZ2jeEd2RyZg0eK10b5LQpoDYw2nDN8h272tq6RGXkVaY6ouzOaz8oJEFHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-782c22fbb1cso268288137.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 04:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520618; x=1789125418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKz0EbNXKgkRmHwAjHcE4su/TyTn7raXYOe8ludN9rM=;
        b=M6r0fgI7CLU60vWgXoHNNljzoDw4XiHp1f3Lz3iH73odkmDo6DxLiVWlREpKc7sn8x
         QZ4iDb5jlO0ybUTulw7KLGmLsA/cOOAUHJND9Hy4QbSN3NQamk3DT8mBe+s2HbZhrKH5
         uxORXNS7WuS4S7mpAsgsz0KhrbuKqUvmt3kuAfhs0nkfsdw2agheBL369bMVVLAhw65b
         5stAO3walAfUtlufsm/IkZ13hqQ8bk8Qu25y7ZyueDA9arbjM7HLxzpkxy3Ek5w2a1UQ
         wdVbmnMM27O3YjGXjZL9x89dB9H+fSHAWNWtTWshOTOWG+7oUUGy/ylqLnFT/Lrwvmdg
         9cfg==
X-Forwarded-Encrypted: i=1; AKwUvBx6do2Z7tDzvMed9DMPafz8Y7XoIYfaXZC5Lu7EBgDbCGBuXKhzPGZmSkMUGttFygpkjykLCwJgXmsq@vger.kernel.org
X-Gm-Message-State: AFuF++kjrK26plyYDatFsqgQg/q5hIrjoq1sm24Wx+lf8KekRlK/FQ9B
	YrTdPG8c+jdHTBJJWND4I+F9rQWrD9VgkPnKfJNkVs3ZaGMT0b/5OFDIN01FUCCbrfs=
X-Gm-Gg: AYBFou3hVp5Y9lwrgycf2Hy9YC8I7N1OpY9Q5gcMykJkjE9nadMFIVeCB9XtX6B9DgU
	VJDAX7w6gwQsDtTaDVDAL83stEO2JBT+gd9TzxSHIFs1joiPwEuZGwc6lXb7KcoIMiinOa/JUcQ
	drC1dSx62znloHrzCeN6ClnvGkS9lBRR7zOKIBa8gZcbyLbBZLVBXpSrsgabb+i4YXt64h9hQhP
	M3Uvc/0wBfVxYXQbNHQbg1N4TWwVxNGO43VuAGnbeJuHFjjG6qtduDWzeeGPC1XMwhStuzvjPCJ
	VL092eMkXKOdElkxss/jGON3iQtq3uPxLNZ5GMbTv0P7r+kXFe8WvLaC/P5d0pCPXTfvYp6KuAS
	lwoAI8XHldBsMRwvMjPjf80FWuTmMp4Vn6SVZEIaq6KElS2soap5wrBsArCrH93HbgkXiCggbO0
	PK8kPK/EJzwhYRE8DMUwogCwq9vd5JTQHZhJhitilsrdqL1e265cf/JJq6Lrm4pP/S12+SlO9JE
	SCSLNjMbXZdtnMMSkenPkvGEvSp1w==
X-Received: by 2002:a05:6102:801c:b0:789:100e:3d1c with SMTP id ada2fe7eead31-78a4a8b0806mr1271204137.5.1788520617481;
        Fri, 04 Sep 2026 04:16:57 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1f14asm1290992241.3.2026.09.04.04.16.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:16:56 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bf9466867cso377405e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 04:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2KRMRDZMGAId7Pj7dce/rwhkfkxLtYhVNFPwK8WWtB3KOYZzNIqTUsVW8qJOXf0jl+P7nJIPnlxg8@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:77b:b14e:b670 with SMTP id
 ada2fe7eead31-78a4aa0794emr1096677137.8.1788520616710; Fri, 04 Sep 2026
 04:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com> <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
 <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
In-Reply-To: <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
X-Gm-Features: AcwNN1U-uc-LOk3gvbh_6tN7N3DFNnBp7J17BKaRTYV7o3lPeDqXkvPWiYvEkoY
Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
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

Hi Josua,

On Fri, 4 Sept 2026 at 13:14, Josua Mayer <josua@solid-run.com> wrote:
> Am 04.09.26 um 12:12 schrieb Geert Uytterhoeven:
> > On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> >> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> >>> On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.c=
om> wrote:
> >>>> The list of allowed pinconf properties already includes input-enable=
,
> >>>> but has omitted input-disable.
> >>>>
> >>>> Both refer to the same hardware property, setting and clearing input=
-enable.
> >>>>
> >>>> Add input-disable to the list.
> >>>>
> >>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >>> (...)
> >>>> +        input-disable: true
> >>> The Subject of this patch is  "Allow input-enable pinconf".
> >>>
> >>> But what you are doing is allowing input-disable.
> >>>
> >>> With the subject fixed:
> >>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Thanks!
> >> I'll fix the subject ... !
> >>
> >> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pin=
conf")
> > No need to resend, I will fix this while applying
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-pinctrl for v7.4.
> >
> > I will also add "output-disable", which is missing, too.
>
> Thanks!
>
> However I am ready to send v8. If I drop it my series will fail dtbs_chec=
k.
> Is it okay if I do resend it, and/or should I wait and cherry-pick your
> version
> so that it is easily dropped while applying without conflict?
>
> Or drop it and live with failing dtbs_check?

If you're ready, then please send v8 (and add "output-disable").
Thanks!

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
