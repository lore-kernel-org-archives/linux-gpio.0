Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F7348D89B
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404795; cv=none; b=DuSfTP1XXuT6MpeTFmiQA0Q/Ahpr2wrf1exlJ8+jiwElf2XWL/P0uDAdzZ9iFlSQ836og+NGLDkxiKveNUaO9gTcOTLjyJVn7p8UBjp3WJCmKgi1xV7Ah5KMYDfmaYjozOMkQbb1LO7P8vwsxm6SODjRMEQivEUQ2lGZ+CW5Jbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404795; c=relaxed/simple;
	bh=MHRL5BbXVh3Yy4fuiiJxCc1O6s3ax5adZDowYCUDKEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXMYzBExbxM/0R/NOu/7mq/UAPLY1OqMALiiJCZ6iE0MYWm5EW3HTP6s57CEOabvDGSuXxRezPK1QDO4sYEn82p6KgHUAbTDXugPwz9LitqpQpPg11tOQhIHcZknzmo2BFK4enz32HgvCYfyMC1oS+Hq/hhmYAF7lZSs1ddnNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso566088e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404793; x=1790009593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NfxIiMuQDiqgQaAeq2yHqZdFbQc/UNrumMADff4NP9I=;
        b=o3tebvYKMIE3dA8Wj1M8f1zRreMJ29BR86D+9GwDu4KKZjgwtkuxt0QXM1QtEhDm7G
         gUwu+Bth/i4lc7GpPq/RzkjoYBxUAKXcnzHNNtEynny+wpgUwsh5xjR1ljYXvbjO4Yce
         LIqLHcI1yAKz+BEz0Ws6QUZvxEpaCO+u8+sBDruj5j9fYXMqfltS2noVKUOkSYLdnYQ2
         28ah9SYTOLZ8kptnCPHp1GfG7e2uhuTNz/OEWc9I9vLmTfBQjS6AcXjYvZBcODo673mP
         hSPxbFCYizNf4oHn9yasZJNXEf5fs8/KNrd4P2IZ0+Oq69+1GHjj6bftPWFYvMSlzm+m
         e+rw==
X-Forwarded-Encrypted: i=1; AKwUvBwXjftSVFktXBD+sgluAO1YU77Cj0BNlIDcETT/R/H8isB+fSXsbOdCH5hRX69bQ1u2V3NuUdSXOCuj@vger.kernel.org
X-Gm-Message-State: AFuF++l9bRU/GcsIm0eWLbrJIA607X19IDv4a3mydpX36FTb0dQ1Nwnh
	ecXwC/gEpnubrtg3gOHaroFkbo4UNLRos2ztZoZi18BEL9R/msNff5/9LJZyUveV
X-Gm-Gg: AYBFou3q3RuuQdR2/2UmZWNSQtOZ3omA5JiDDkUjuZAcdP1hNREcToNa7ngIflEJpgp
	AQLaaq5k1j9DqWnwbmeliYy1oF1Ihjw/LSyTFP1BnWC4Cx4w+MESDnJ+j3w4st8vAbYU96QNk7z
	CIkBdKjoz1RYpwlXzQ1EkNtjkCsfVQbK/3kau5R0M4bEEzPs6FQyiEp0sKDu0CiVz84VwWRTcJ6
	duDn5ZEFsZvde7dMe1RyhO4tSTQqOfpBuU9pNYT6ORyjCqDkfZDFPFeSXE22tQNfFrQv7IaURZn
	V1ZXYAcEFuG8FbMKgdkh9bFIPwPujZ9zwugUkBCbM+xoSik2fUz0WcGOH3jPW2mIyucM04XEcBo
	jQv7CldmYWp3PYPXq1o+BzOXWBI2Aia87VY+bACChWjL9XgG959q4wFXA6JVwyVtPFENyVHIpsW
	tsG4J4tns3IYrQ9OM2sDyaj+bhVgmNyajhvgD0bfrsocxOk7Jkaz0Zak6VujeDyOjPgY4gNRQ3y
	lJn5aE4gTi5/+1nIYsXc72pG7BRGn1/BkGIa3vE0WclNeM=
X-Received: by 2002:a05:6122:50d:b0:5bf:4522:fca7 with SMTP id 71dfb90a1353d-5c981eb1da6mr4170706e0c.4.1789404792754;
        Mon, 14 Sep 2026 09:53:12 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470f4e30sm11977378e0c.10.2026.09.14.09.53.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:53:12 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so619367e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:53:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByb3utIYf0SQeZ/WW4vjHjoRL4El1K4HL8avBolRvJ4us5v6oZX/pj0o5fmn9m0rAMVpMGW0r9k2XBc@vger.kernel.org
X-Received: by 2002:a05:6122:d21:b0:5c8:2dc9:f8d2 with SMTP id
 71dfb90a1353d-5c981898b18mr4839334e0c.0.1789404791699; Mon, 14 Sep 2026
 09:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:52:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8oHnOZtaZEhT6ARw4jv8E8TCW1oj3=-st=H5DGYP0Qg@mail.gmail.com>
X-Gm-Features: AcwNN1VTw_3ezXn2Sdyot4rz-bUBb_2ZP2fpOPg3aubUSTj19P58---m_IGsxkg
Message-ID: <CAMuHMdW8oHnOZtaZEhT6ARw4jv8E8TCW1oj3=-st=H5DGYP0Qg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] pinctrl: renesas: rzt2h: reuse helpers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The PMCm peripheral-mode test, the PINm input read, the PMm write, and
> the PMm read are open-coded in several places.
>
> Reuse the already existing helpers.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * move the PFC read helper reusal to a later patch
>
> V2:
>  * pick up Geert's Reviewed-by

Thanks, will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
