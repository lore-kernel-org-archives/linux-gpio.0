Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D22A224F3
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078867; cv=none; b=q3rrplp0MBMiDCj1wSzISEDuZkvWiVUk48ASr3B4kxe+j+6UnaqmzImKrEBkSQy9tjHD3IJFohEIJcRjdwAxT9ewYIiXtL02IJ+AgElRlaETVFEZrxqtv83UjIZckP+stgwES0R8OsMCiA+TYdnC+DdCyXIgvQffKwIbNZxflUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078867; c=relaxed/simple;
	bh=X1g2xNOw4+l2Wcjy0vjXUWHCrsoKQsB5w4m7w88tpuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5cV8fTMJx1SVUS/HK8sSsgVVcG3fSaqXTXPmRGMSWIBCuscBRM424/yapIh2fnGCsH4Hubo+w03Ggx3AZW23gnJ4ZNBxS/ytRVCDbRKkDu5ywV7aKoDcggon0e2s6OGQtmzU2kWNjZQVBD5NtJ6jveN0Jp9eThU2y4i3b6nQFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9KyoB7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9KyoB7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B1DC4AF0B
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078867;
	bh=X1g2xNOw4+l2Wcjy0vjXUWHCrsoKQsB5w4m7w88tpuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t9KyoB7aGi3Bg9Y7m7XIMWZqYRoUAc33/o9GDaWOz5fckkJ1cKt8217x79Yznbpbq
	 EzcKLw4UTEct0N37ZZFlRiKIbbGg3Z9P+SX5eo4lJuMpWoBg68pHBs7isvxuFDPOYy
	 OT4ZMg8prvQog4m130qft9YcyQVkq59pZA901lmiN++BVN+85yaJhpw6/ZBXK3E9w0
	 fT6VkKTM2uo3Hc3OxHTQHsVLviV94BX6S27CQuX5GE8YjTX2DjPvIjyKLuIumWKmoX
	 +cYOiFAIRABrawyjhPgupHs5usGBsYqvwuvZOphE+REwjiqr0P+vITV3CZ9/DVaqxT
	 uAxIAwxmeyL/g==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-649605d3664so5704034d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyzY9ntIfxEY1bPd5alOvLpuYhjFJ+N+z8B3A5P6qnKaLjbbRk3DkvxGMrmuHSeHU+bnsSSO/Xhl47@vger.kernel.org
X-Gm-Message-State: AOJu0YyXlMsW/mAiO5LGKjtPgvKM/i/qh6dlfiO1Ykr8zzkyLr04BJB+
	qcpi2citAHAdqN1NAv8nAC3Q5GbZdd1vcs9b1peM9OCAuTKdKdodMQ4pxtDuAGWnoI2KnWFysCo
	N4U/noxfltrV/jUKWgGPc0a2FP7U4XhE=
X-Received: by 2002:a05:690e:b47:b0:649:b536:d72 with SMTP id
 956f58d0204a3-649b5360f7cmr6593212d50.18.1770078866634; Mon, 02 Feb 2026
 16:34:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111053025.251983-1-akkun11.open@gmail.com>
In-Reply-To: <20260111053025.251983-1-akkun11.open@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:34:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
X-Gm-Features: AZwV_QjBhI9SswsxYmA3G0Zv5gva_FUHaiIkC2CnoLZUa8plV9-V8Hry7RO3aMA
Message-ID: <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: remove unused drv_offset field
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 6:30=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:

> The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
> since the driver's inception. Drive strength control for MediaTek
> pinctrl drivers is actually configured via 'pin_drv_grp',
> making this specific offset field redundant.
>
> Remove the unused field from the common 'mtk_pinctrl_devdata' structure
> and its corresponding initialization in the mt8365 driver to clean up
> the code and avoid confusion.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

No word from maintainers so patch applied.

Yours,
Linus Walleij
