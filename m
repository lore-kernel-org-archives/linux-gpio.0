Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF84A23
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859959; cv=none; b=gyfIMk0n48HSsqKrmv5n4PUNEhj01mMz1djkhDbbEsTRT8n/JHXexZfUtdaDIMY7FKc3vW9RQll9nWwv0XDOev9MJAySWWpeKoZ2dwifN9ZDQRg+LYqXAMqBDcG1LtT07V+H+7iyP9fXK3Dp/xcrgjKMe32exwvBEOOdvUWNh70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859959; c=relaxed/simple;
	bh=+cd7Wb+c/DY6qqIEwHbkqt47rbEMh9g1QmhO3O6IsJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qevycEa5Q4tqq4VVTBnQWKEmM7MvOi2jxuX6v1wGWwJIPmq0dnw7Mcar+0gh7y8L6ScOatuzbeWiQMBug2h8vGjW8hXrvfUgNzmiFZSBpWXBxShuPUZ5Y0m+/+nTQyoTI5GUSHiS1EL41E72eMAyTcdOtk6xkRp7T88HRmnd0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-953b0a7ee18so1183682241.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859957; x=1777464757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psCgEnuCREmVs+Euo3XSmQiyScd22lKrY9eBfSqyFx0=;
        b=g3rmA1NxcZSBUZ1LCpzl/wmGDRfPu1TsxXEsrTEWvEe5QctLYCTlbFc3ZHx3Kh2MdV
         iuZNShtzRXMmh5IkQeBL3RAkeTASp5GBFhRRC41nX5+9SqnANMsMYyx12ErcX9SVS2PP
         jn542AhEhRObt6zhiYV1jq68ApMMpBM/+Pe/73X+djSwLe+fEmD6wSj/9Dv/MHbt904g
         ChZSM1prK4mF5PA5NG33WcQoFy8Y/X2FMfBEVllwdgwsJ8HxnVgBficYiis5n5CgFNjG
         9/8rmJcncuThX3C3bASgM36M9l5OiEGV7Wns4ezA8xmDWd0ED6xHF5H/xyu3SLr9SR5I
         1pMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZrSGE0hNOaIJt13WRF1WloD9GiOaFS/HbiipLL4C3d3o9y1WJAcIvcb32NikoSgIWisE33QR7TMdy@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDoEiueW2PPnAP0ErAxYFR1lj/w2h4+mUxHkAKM8vWFUJ1Zop
	XbZbEvpOsYLf6mSgjvpUV+GH8i5Rmt4+kUeZgNr7PiyIWAIJ3cFJOgTYr0opGolmZZo=
X-Gm-Gg: AeBDiev36XLB1XJzMH0aF8BykPjG7qj0e8/LIyD2ZUYP8ECrQ5W7d44NAItKsYMHJfh
	3SgsstdZyLVjV0MR6lXIzzQh7R1cyXirudlm18DkCLoNIWKdmv1S1Ew6IIN5calc2KSeNNl9tS0
	j+Fhhs0/Lxe537Z72/6qAincJqNNXnuHrcX7kvFdELjgPO8K7EbBm7VQS0z1ngqFHOhdu1MM5pN
	6s6b/fac+kwUmJsCES+bSLBMk/g4RocZzFgaw6QUQsDxfx+P5EzcfXE6fj8tQxmR+dsCzS8UD2I
	qmUk3RBwnSMHknnhB6CwAwqkOXUvUdXAQtfwJaPy1jVKOtwIF1E0GDnaKk4cuTShlwcGwO+v8jy
	bjY1i24geaJxV8eqECQ0tpNukn9sou+VbrwuVcun9end7fVFCzHUpD4k2qqMwlHILTJG1/SapD6
	8ViO+mn8gO3mhkrFFeyXQt9BwFxDY66Sw2Kffq2rSkOy9YHYzHF3/Fj8wb1C7mW61R6C/04yu+U
	sQ=
X-Received: by 2002:a05:6102:6444:b0:610:5b9:dde6 with SMTP id ada2fe7eead31-616f474206fmr10544888137.6.1776859957334;
        Wed, 22 Apr 2026 05:12:37 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6174272f752sm7973033137.0.2026.04.22.05.12.35
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:12:36 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f65f62b4cso1793643e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:12:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9oihcRt2TXOTKPK3xNkuPJJTSCufuH4qxFby6aTLWIt4hcRQvX17LxN1GFUyDMhUgqwVpkNF0fk7lD@vger.kernel.org
X-Received: by 2002:a05:6122:2087:b0:56f:2aaa:450c with SMTP id
 71dfb90a1353d-56fa57a56e7mr10839676e0c.1.1776859955553; Wed, 22 Apr 2026
 05:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:12:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMkSsGb9Q9CaL20eWpZz0PM_TRWi0JWDWfUt8=qWY0oQ@mail.gmail.com>
X-Gm-Features: AQROBzC06dhbox3-XpxeCkjK1m9Ewa091HtabksZINdNUk6YJQcf86V-GFrLgIc
Message-ID: <CAMuHMdVMkSsGb9Q9CaL20eWpZz0PM_TRWi0JWDWfUt8=qWY0oQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] pinctrl: renesas: rzg2l: Handle PUPD for RZ/V2H(P)
 dedicated pins in PM
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On RZ/V2H(P), dedicated pins support pull-up/pull-down configuration
> via PIN_CFG_PUPD. Add PUPD handling for dedicated pins in the PM
> save/restore path.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
