Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F23B71A4
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635478; cv=none; b=L3irMuhertn4+0Pha58+CcorwN+onYZVPEt9roXW1W9SNy3MQ/1qdLb5VPAQwHZLZKExriy9g3vY3Y4cGaOenVHJ8cHIpBAjlKYxrSDyka91sYOkxGU7WiFjTH9AA4AZwqyCIbEi0JZIG7/Xr160Cz0k4cqC7MYXucmCxJsHidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635478; c=relaxed/simple;
	bh=jUutJajjNc7Hw1icO/JaEhCU11F1Np3J+BomYvLKJJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHH4vHFFgABviYMAKBqDV9+KuzVh50cyCNG0tLxmJL7GS/e5BNZEnqey2NsRb9TQRING/YsM1zyqZOwnVurR5W0AfoJ/eXR6+prSh9Tx6GDzJM82pWA4NfLORI99gLuC66EnjVJReuT6U86NpC3j8uxvb+XZ2zTxF/FURvPqtJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2074710751so10123966b.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635468; x=1787240268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFyxVjuWrWrBIq8VPvjLqFOlB0PwiULnnhP6Fa2htiM=;
        b=mWLruO/KZkvPYCUz3p1/Fd92kgNV7JSE2Tj1K18p2VC05WObvAX8H2em+AGZyTjDCE
         SXZxP821vFbjL7RCnie5nbmrIYoWhEzxKI8MTeD6KWOfxQ2vRrjEXFNQFTLhKFtoiFmE
         dvS7n5s9veQwFXF4PF49OyQ8oiBcwxsp2bblVoOdWx/J/uR3R084MdQCDztcA1nLwMhI
         M18nvLeMDUgtdJ1m8lDbPGn5oP/3K/I+u3/6xbqFKciVq9H+lN5rheoyY3fRppfr7xQN
         a4EjBXUkb6DnCoC7LFkLmaksYfezWBeypRtMHVo1ySTiMzawfj5w+gTx+AkRgV8PEyFK
         QOow==
X-Forwarded-Encrypted: i=1; AHgh+RodhiBLepvtU8juUIAFjsFNZwvoCHJyOtnZDF/JHue63Fp7Vh+5XAaQuW4RS5+/pFBHLzv1lGGkc5hL@vger.kernel.org
X-Gm-Message-State: AOJu0YymN8B7BDQtF0gziDqw83OOXtI2Xe6n2+pXBVw+ET4KuZrIYqSW
	SCXonUaWSbko9odSYaFN4lCPPwJSIf028eeoeH0+Nj62TBOWbKXedzXvUvzFgsXmYtY=
X-Gm-Gg: AR+sD11WTg2e/93XpwitdoSpeEyLyUjslvU4YnpDdKqeQVCilBZ8kJgf/AzEXPBagtw
	l4v8BnBLXcz2aU23bZSXfg9PSO4D6YFImjMSSxyC1GeYYbQhZYYG+8VBcvXD01y6QUhRAxLhK/l
	5JPPRWguNwQmYx7CKAb8WofOEv2ktcyEOu/OBpb0qDfzgu7Hl7LSvbEDw59xieRGvj6ZbODbzBK
	KywtbcjD7891KWwZ7L2NbjckH9RjU10P00BhM/6VJ6WUu1z38/JRjjz8dvi4vPvCVr7ZaNbcSt9
	u21cjCp6iywf27tk9MwjRDFbt1zdMZCTFnHY/3R6sM8YOKNVkk8G9zTeCKE9H9tutR65jkFclK7
	N7tMrf7InfpniXVIEatMQlfIOliJX28owhRa/ywTnW7XiDUdomuUGB/Hd5lxv8bb3uvHsBfMJcU
	ZmAoxEbFo8v2eIwJ91Pl8jJYpsKasm7eH4/FFSswaDv0+9ceddjZND3N3UYbcOzNlfoVQzw0euJ
	eezb2gKcIetHzAGxhUubn1/Pw==
X-Received: by 2002:a17:907:1c08:b0:c20:31d1:a89f with SMTP id a640c23a62f3a-c21090d8ae3mr327373966b.24.1786635468213;
        Thu, 13 Aug 2026 08:37:48 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234ea5fesm7597966b.24.2026.08.13.08.37.43
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:37:44 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1678201a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJTRrskiN4mt8uBlSqazpLA3I8+rw/17gV9IF3yx9r8evAX48/BjOTNB6uKQ3XhS6oclFQJ2wq4rmK@vger.kernel.org
X-Received: by 2002:a05:6402:e0b:b0:698:8847:e2f8 with SMTP id
 4fb4d7f45d1cf-6a38060c289mr3514415a12.15.1786635463470; Thu, 13 Aug 2026
 08:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:37:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiC6P4e823DQ+d8AVtkF2odC4u=0yKbhzbYOAZ0so3FA@mail.gmail.com>
X-Gm-Features: AUfX_mw9Lq34HFTp79cv_PvTry14Uxpoge8iTcoUGFPvOqN3X9bgBAm5PI-yr1U
Message-ID: <CAMuHMdXiC6P4e823DQ+d8AVtkF2odC4u=0yKbhzbYOAZ0so3FA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>
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
