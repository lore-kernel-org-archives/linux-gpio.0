Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5344A23
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859942; cv=none; b=tHHOF1gW2Bbmf02pp6b+zmfjuaPBjH3L3qRB6wfY1jtaQEnvZNRSmnQUifRhOOg01u6FClrmxte1NIa8hNS+45MjglpDcbcL59B7+jq/LNZe7ND9rfvL+yjQYfcnb13XgxNEjiV3t0ZXxLIcGxJ/9YPl1KrPcnqBIUau3QM7TUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859942; c=relaxed/simple;
	bh=y7nK94MKwadyPsFq4rD1/+x38bFty730UgyeZ1vY/is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KekPeMruy59BhMqjMAamS4d1t5QbYaxL8Se9oPaCQdl/QiJ4mRKqW9G57tCn4lQIP8S6RJeXQWaxEE2nq1mAr6ecKusdIAgi1s2KlXmoByKOg8L5IoP5OqpYOYs7swIBWNqJagXcY76Tjt13QbHbY9juq1LNMzSCbWKRGfaAAoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56f65f62b4cso1793534e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859940; x=1777464740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz785d68ZXoyG99dEwRjJ5z22aX2tdId1z5IMlTUmbY=;
        b=S34GifgIddSBRkeVUZIRygtYuhuSfDQ8Ybq5HX8iF0oOr3AhOiHO4UqTPZCBIDK21x
         nNrsHudqYTVFB2OoCh5aFoW5uN8k6RQ252XUxef5cL2Uz28JozezVuJItZcmye2PrUZx
         wpkI3zfYglsxGGTQFRVcHEdl2THYp9/t1JqEpwU30tCVOmFLyttixgfuFE9hI+51vC1m
         a66uGeSkUWmNkZG8B6St3A9RUOeuQnbOmeR2IeuinQ/SuzfQbpnwR5IpyJk0JDIka/V2
         EbBAtsSUxdMqwxSFECdut022Wdtd4nwYydUjXzkPdwVASFl1xY5p7/kFx4o54EyfqjjO
         3VtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I3mHySrxTWE9HM5VlFJCXMgIchCcfYwukPqopDJVh5GU/oLkMQ1I8TPf9eI754t6v7V6B6amjjqRY@vger.kernel.org
X-Gm-Message-State: AOJu0YxDOuf4V9FTVOMkHt54VJZUmRBRJuv3GIcGlERMYVu0hQMfIEwp
	rmCaP9ZwvmtinSl7x0uu/Q23GS6Ei8zFCmOmTsDVu09oZ2eFMvxmgMVBtUMjiaA1pq4=
X-Gm-Gg: AeBDietiAcBevkclwK8su0IiswoGG8tQk7Abd8+e0ikddNEKT3CVJLOvmuUUA0GQrhP
	AHe30mB89q7OUBFJTxlJXAdEwoPwYqoDyr20hW+//gyWkVKmKFvEHJjUphmKB1wj5bz9FqY+ZGF
	NYyWVU+Mc729S8Ei7e2MtvsN3Jd1bRUDo7oJ4E+uQXtbMyHX7U8MJRwOmiEPNYfaYc9U4aPhB3l
	xS1o6JYLV4hiJMGgJ7+xXDDUh2BlT5CPhZvVaopQpAg/AamyDRvuwi9/G4jYD3lqsYKxKdVNNS3
	eccaau4pKhf6HpZYOsLz2cuwa09F9r6FlVjAjRsy7wHvlQh8UR1NV3Hh6mEyRBM8WcaOpjBrX4B
	EWFmky3QYfFSSwqHjuSzCaMB2skFHIzeOfBlzIeFA0iF+O4WqIUqG1c6mSfQUtHP+xQp9K0LI/6
	2XEWvOa9yB0KZ3AYZSkOznVhvwd3uUhEz5SpMuzmZ+IrisKKDXyAJMltDj/2B9P4TYVETGZG2Kz
	zUNP7MpS4tw0g==
X-Received: by 2002:a05:6122:2087:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-56fa57a56e7mr10838660e0c.1.1776859940475;
        Wed, 22 Apr 2026 05:12:20 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890937da7sm7416716241.1.2026.04.22.05.12.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:12:19 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56d8d479149so1819856e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/P91j1e9ElMRi7C8h4Ip7uxuH1yuTyOYdvB220XhQEV/Xl45YtbqrHcOtIZsDCp1uThScuBvpb0BY+@vger.kernel.org
X-Received: by 2002:a05:6122:2981:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56fa59fea24mr9997610e0c.14.1776859938717; Wed, 22 Apr 2026
 05:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:12:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxRmQ55ZbZSyTBqmjMw2j53sSQPf7MfXs58C8aC7v44g@mail.gmail.com>
X-Gm-Features: AQROBzCfRT7N4FieEnS-vjpMR2JGC2u2T2Z27uwPtWW_UDbm329VNcxnEY6Y8uY
Message-ID: <CAMuHMdVxRmQ55ZbZSyTBqmjMw2j53sSQPf7MfXs58C8aC7v44g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: rzg2l: Add SR register cache for
 PM suspend/resume
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
> Include the SR (Slew Rate) register in the PM suspend/resume register
> cache.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added dedicated cache for SR registers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
