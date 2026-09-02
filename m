Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DE47DD71
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350641; cv=none; b=Jk/TFzyXKVPZdK/sGL6KFuEwrzUkPjOu+ZzJjFPDGumAQ+Es4wIgllKUFIDTj9anPf/lucKEvwFgD1/dWT4oBVlpsJdOiJOGlwyCmPVvVNvHdedlnXpFruz46vQrvj5AQ6icS4uAYKNK/3yIj5dHO54tpG9pXux5KjbBZXmPJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350641; c=relaxed/simple;
	bh=BGVT6NiiPBGrDzAWTCenC1f6pOP4TmMvoz1BBe+v1UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzTu6KGLwcWF+qSwXpZGZgBx7lBn58gF7XquT3kDLqvbhn2zf/KVfo3T9C1GEzE+vHF+HmDXvWtbFeIAUEsxC6HMnQi+1Yd9yz69ZHEJ2TlkA/FGRYiKGVHGVgde9iEruvvT6PIgJnV2rk79fM1SvpX/oAjn55INk+a/cQbkr2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso393707e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 05:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350630; x=1788955430;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZuEv2ob4j8Zh+WhkA/MTuPTTESwfEtjHWVWham0Lxc=;
        b=asoLkOsm3+MZc8ZXtZ57k9qfmrjNgCrIe4enrxbsmXAHWzMo8vky6lpnN1PmD14xCC
         va0LI6J+U9ZBf3xzOm+jVSvdiQ7KgNpPacDbt/2aDbpu/O7jALijfd8VwSYMU/s4wS4e
         GDyt5MFvd8vvSfm1OfJfAkwFzWGKUxKS1csJn8KurNYjhpCkr1qp+VHQNysE4t/zipze
         Nz6UXJ5N1ksuT7DEbbzQfXV3GkCLXjtPIZ+t2tlBhuSqZ2nwCfVs1uM0wSOA+rWI/c7L
         X9bDvfOmo/tFaZ43MbZwRI2OKuywWOFLTrYZY02PNTi2sqKoIyolbvnPyseDxSTNzM9/
         rIYg==
X-Forwarded-Encrypted: i=1; AKwUvBwgfkZAWuBxLWWa5X5gURcO9ztCRdYZjWBEOwt1QDCTrlDEDoaUk/qJcKAvURU94ZwBtEuqTpfBJpNI@vger.kernel.org
X-Gm-Message-State: AFuF++lZunwYM/Sb5XmuLQp+N1pEooz3mF9OpLXpq8aGX8LU8IhnodZs
	IUtj9Gng8ssmE1/I6jp7WtiVaUZ1RHl7CyW2aT9fwCmYr1SCRclqS1C3vzyRGKZ3
X-Gm-Gg: AYBFou0JjTlE572j4/GsWeBmmYtLfQJiMROM+7Nm/oSKfQAvv/hz89zoaXkCGA76PG7
	vmM2hFqBuPhKCBl6rDWDsNYp0ispnt6ZjuYoF7D+M1ioRFB28l1MzxtwcK3DzPGJ9W9X4aN9Mpu
	0BiKVp8cV2y/oJQJ1npsi9LO9NZ9gZKoQoSTtqxlxHP3fZOts+g7I0lt51lRNV+WZNSvmvCde4T
	q5l48WEaS2r9KRTuwjT57JrB4qBDPjQ6pbgsww/fakgC2+zte2VaWYJJWZF2pybGN5VifVJygtO
	WPskA3TvoQeLS06jvJEduJJ7tDGdGd1BWijP5XHDLePQdPoM8wU2I4D9dbjblthfbT6uSq+a4tD
	xOKFResMfjuuAGTGGhO3Onv7THNChKxl5Vem6Y+vEAQkrZmeox07d8E3y4UtYvU/KdTCJ/ZIXSS
	XDyDUl1mn+ONYam80PUwkpmfMT11bMLNoA4SKXxTnAegtxI2hX69Ed5nllbhz9ukJMjirbPAafs
	/WdeNhpTwGIngPQ8doljgGIXpzl4w==
X-Received: by 2002:a05:6122:3d0b:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c7d288d348mr1605737e0c.8.1788350629786;
        Wed, 02 Sep 2026 05:03:49 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd73a0c1sm1800438e0c.4.2026.09.02.05.03.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:03:48 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c7afda4515so569126e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 05:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygJgaJMmc8SYzvP50YJL/R77LvpYahVUreDhuVcGwLOswDVjcyO/iab0urBOxrKFHtv99gQHoD2v3H@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:784:94dd:5389 with SMTP id
 ada2fe7eead31-78a1f3954bfmr1187932137.13.1788350628203; Wed, 02 Sep 2026
 05:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7aL6kq2Ib0xjLGz4RQRE9m6dme2IHxODeY3IaF54CXwsKAcwLlCow_cY
Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Wed, 2 Sept 2026 at 13:50, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and the
> HummingBoard IIoT Evaluation board.

Thanks for your series!

> Changes in v7:

Oops, subject says v4?
Fortunately b4 is not confused, and does The Right Thing(tm)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
