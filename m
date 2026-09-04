Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2A48382E
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524554; cv=none; b=cop07Gd/L9S+6FRqJA2ziSX6TGgomOAkOgAgaAEt2aJ6tLsiCpaM5GhhxOYmOL6iLHfWLF7Zq/1HehcqrzdsxGO8qxXogLVcjkZMgndr6PPntPt4YGkKYfppBnu4/WroVejUdRvb785WRaqIZm7GMRcND3p2FoNSHCUyzeRsnMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524554; c=relaxed/simple;
	bh=vjaQgjeSeDSWekFLIKX6/r8ecgd8zwyE1GwfTXL4Nb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/IPL/N+x+V8xR/vS3u5tgZt2eTY0Im0bY+sqVvvd7abcIb2/IG+agIL9GZCNDRyvLVyhcTUTb5PA6o+BRna6I11Z43o4Xj9PHW0xV0VxFNgkVtuvvIbj8t9Ra85fYv9RGM+DPl3p6QkoA6Fpi6/2yEQIcUFF+SBP7u7XNxdsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c7afda4515so574108e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 05:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524552; x=1789129352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mDtuYgjcDY/xg58xIH9H2reGhfYioaWqgEAldYn7pM=;
        b=auOtTdKh8ipTvY7N4zr2dZVvfTU+snQ1WliXXXM6LtthQRYkBSpURL1g+NVUUo5Rl9
         wuqTbe4sKMGeu8sHcW5dJL0zbmMiseTyeNt7lf90PfKR+RY9ZES+Mj86I81n6HgMAzHd
         kL6K6Gwe0fE6RGu1xRc/DmqUmopSNdPbHQTviRzhoDjtr8XB0+wSG1Re2hHpsTlFQi7l
         fJFSG/1JMd/39kSuQvowLcyYoIIug1Q8ELDNldkJuMedj/Z0ZaZUP7in7jupQKBCinjC
         9xFugMUhZf7R3d74qZwHfQjw6qUWrERKi42vXAHdCRZSxkdONvOf7LqJ8EMEUAADbN9A
         9KCg==
X-Forwarded-Encrypted: i=1; AKwUvBxRL2fUj3yW2Il3WSzRlw+N65a9DYfZrFfs0X9+sGMA832c3zrL5b8G3lxqwFtmEXhIbwTB++rFpgxs@vger.kernel.org
X-Gm-Message-State: AFuF++kEbwgJgpTTw/Qy31nUpGfENE0FDn4rOWhy5lwBmRF4aoryICm6
	Lmz9N7u6fYKkcZhHHPFigSAjvs4omIVU1BqkKA03a/++D8LTkx7T7lvri9fWwNU1om8=
X-Gm-Gg: AYBFou1YyfSVWoV/1EkwQegPkAGJlkUcG4RG4pqPDTh766sklL1XSpG1Kn7CIRFUugY
	ZOFfuSUKhdqC2+rDbCZznNFV92tR8Pc6Ah93R6HNtOP7YH7o5Wvg96BL5Z+E9Xz+UYaEcqiWtvZ
	0loxuq+WFIVxmzjTOH+IG4NlsSTe82ElhRei8+t7/TZiOxAg+hzZeF0bRDU/5bYorHTIMvZAiZ7
	enGGSx0xGHj2yM+vLFXDUVQR3CChgu1ZD6LzBPnbAs9sjWB4HnPSXN6RnzmZhlV/OZ8PhkEVKSw
	Y+rnKeSPc0uvvRzQlbrreiUitaUvtzni3ibQlAmJeGVgp7o98a1IhhkOJwj0TABUuLKV3GPfT54
	VXKO3hPmGg/T1E4Iuy39Rih2ndZLeK7a+obh6BFhcP9Haxst69J5gdlehacbbzo2wJeW6hLPH+1
	+dl9R8TTt3BBln6dULOygctgEmDJyOXMvObLJGtswJ+9ysf2xjaMZmDYNEsN9mhEqQTnPQmZjjr
	BqeJDSUyM1kt7lzG5xwfXMtLw==
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c7ed285aefmr2353114e0c.2.1788524551835;
        Fri, 04 Sep 2026 05:22:31 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef771sm1906179e0c.3.2026.09.04.05.22.29
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:22:30 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-783906bdb20so310704137.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 05:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAnP+AUSFWljlxW8O1nffzcMMp0GAuZTi3m7mxOz3osM86ZNw0TgR8mSzWAfhY9gcPg1XN2wau5EcC@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr1483195137.9.1788524549478; Fri, 04 Sep 2026
 05:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:22:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
X-Gm-Features: AcwNN1VOyxrsSm03PmZn55Uovue1s6XEkpvSES0-J6cXzlUAe5_K8yXLbqCQsDU
Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> The list of allowed pinconf properties already includes input-enable and
> output-enable, but omits their -disable counterparts.
>
> Each pair controls the same bit. Where enable (set) is supported so is
> disable (clear).
>
> Add input-disable and output-disable to the list.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
