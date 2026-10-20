Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506639;
	b=IioCD7skYkVYYsHVnkaTzQozdvxTph7RDgXZYte++Ql/Cten90Sqs9/Qw/HX28M/WVlz
	 R7PbkxWz6fKnkM5GsjLH+JjMj5BU3tv6dVJasZ89yT+lVlagXe+S1GJsS2fyvqxqxO0fS
	 Pjf+2Bz4/6PMunnKSGBr71QHnT7uC3mEnVhQR8oDNKAKY9PjuXGJauKRPxlwaj+tXcwbG
	 gyA3KgqCJNP7v/7Nl53sfjLOG8h0eQcUAiRiPDuFA/y0XIBS2t0Oz1PWrD+TZ2R2vxDEY
	 lh54RY3Bdk8/48mjyv7bEPqAb7mY5LTF9bVOqCf4XChtNNKmWwQSeuMAwirIBexN+cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506639;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=s5rk30dIBimN6FXN9o9VIA3zg1IdCjfxBBybpQK7NFY=;
	b=bp9YHQXIjQkwlb1Na+Qvwl6RugNUTeZ5+pOlakYLPMR0uee3XUPd6fUU/BWFRU4FgIV6
	 p3Pb5b1ua7p72J2ueOxJ9EgdCYZGYGiqLo8IrtA8fW3sK6CwhwUxfccwAYujugafW1a3+
	 0VSrznaQLCsK8/rZP3cXYADFTcpZmaCMegU/NvScgwXdVxgNpQLiDszA+xbQuV9IJKPn7
	 rqJ5pcZ6Ert6hOJDLlNX7/OpUQ9aKwCji9vIx7HQQ5TeOqn2tdv5eEkSoxlSqcgvNJCmO
	 ttQMhcNf7SrJubmvEDdI+B6d0H0jPQS9qOPQ7VID8gs1XwEY4oUJiNtuYejm1dOf2Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644D606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9644D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso877114137.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506637; x=1793111437;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s5rk30dIBimN6FXN9o9VIA3zg1IdCjfxBBybpQK7NFY=;
        b=HXrQrOlCoFwOntGtnBHZtsKwPjoAGyy8pPaL061XWrJnHyf41KdApPGP9DftJFMTZi
         TPVTfKmVWCpcXc+NNY6yLlTVvbydTKgCeO01JKrRBdftMnwWOJ8Q6nJZvXmAb5NRhl/+
         cSGXwgUURJanIVZxo4NYmjF5ce+9aDNtqehEUFlAb4AdUVjBB5M9xsC+EAy0yR9mKS8d
         2eqbKwsC4cK+N86z50fXQWHcGg6ev1LO5/7rY6YoA2Zgcxtwdbc1dmVLL1Yg3ZWijwJi
         XUviUF9UGi1I9ApN/FEzN62jd7VfIiQU/OVIIeDH+F2cBgXsWQgSEz/2aaxxpsMJRZZU
         c6Ow==
X-Forwarded-Encrypted: i=1; AKwUvByNM/169OQkY9H9bOthpHzgQEVvBAf8UxWwL7nxnlIT9jjx9A07Xn9GAfodmXHzuzvSSKeJSurzyUCc@vger.kernel.org
X-Gm-Message-State: AFq9FYJxRIYI+QfP1dan5+FWnkKAFhriCsHK8QN4k39OqCKVzxdklbj2
	eU8gfjQ80rnz2wIe2J9CMhVsYGDAmHGUIpSPgZmA9OKzB1g170e9YP6EC3GuiAo0QWg=
X-Gm-Gg: AYBFou3iNtQIHcB4TbeVyk7npuBr2oHPeNNTRHRWUwyS4HHnj04fElgVSfqWcWufgZb
	+9hpWyq8bgrfMwfmvJALRaobX6AfVcIlNiK2aUpL1+eXsXMS45WJG1oTu5IIY5SKaLkp2nalHK4
	6ii0C5kRt4uu7exf6U5UlxW3jJif9i4zDSKv4t1MKdvCZFB0EhPy/k5lOSahE+QnnJNQQfKHiGu
	FMstQjIACpwaZRQMvA9cKc4jxYQClFNfByy9S46Q7rzMu9d/BMlx7/g8OCgtoK0jyMqFpxcwu2E
	24MVmOmD1yBFrrq/i0uV6N7H0xtPMLMmpga0pwqVVg7LtXmJ74bNuOcUJbI19ktk00xUOiKyJrz
	yP0ibUG+EYICGVX4C1isHVZGvhL5SQC0oL7am8n/BleJMlYXvqG0RsFqCt15uDPCXFk/pP33Dt3
	HyjOuh0CqYFFgQRixGUUlKhRvNx0FfBEXjccCft3JS51kz5HkbuNs5Uv5+w9IwJPa8noeKx2Ltz
	cb1UoJ46wEOroXTaLPqEUBs02VXK/nLB8Jh
X-Received: by 2002:a05:6102:3f02:b0:7c3:9059:49c2 with SMTP id ada2fe7eead31-7cc36a0f79cmr2018199137.22.1792506637476;
        Tue, 20 Oct 2026 07:30:37 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb392504sm3009272241.11.2026.10.20.07.30.35
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:30:35 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso877103137.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlH1gxNByIr8hwudldtGIyqL22NouXR41Peoouyg2lTu0SBTXteKCCZClEuikeR5Ukag998EN4Ckt8@vger.kernel.org
X-Received: by 2002:a05:6102:3c92:b0:7b5:4700:3a58 with SMTP id
 ada2fe7eead31-7cc36a8514bmr2313996137.31.1792506635170; Tue, 20 Oct 2026
 07:30:35 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
In-Reply-To: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 16:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWPXK3eBQu+49ZURg8u01hmOSgv9e1KNYZwbYxjXFNWA@mail.gmail.com>
X-Gm-Features: AclHuK_MQ7h98POTsIQIAl-vz3Fn2A2UG4Y8IpuLxRnU5t23jE3LqaX6Kfyj4OQ
Message-ID: <CAMuHMdUWPXK3eBQu+49ZURg8u01hmOSgv9e1KNYZwbYxjXFNWA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: shared: make the voting mechanism adaptable
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Viacheslav Bocharov <v@baodeep.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 30 Jun 2026 at 16:33, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> The current voting mechanism in GPIO shared proxy assumes that "low" is
> always the default value and users can only vote for driving the GPIO
> "high" in which case it will remain high as long as there's at least one
> user voting.
>
> This makes it impossible to use the automatic sharing management for
> certain use-cases such as the write-protect GPIOs of EEPROMs which are
> requested "high" and driven "low" to enable writing. In this case, if
> the WP GPIO is shared by multiple EEPROMs, and at least one of them
> wants to enable writing, the pin must be set to "low".
>
> Modify the voting heuristic to assume the value set by the first user on
> request to be the "default" and subseqent calls to gpiod_set_value()
> will constitute votes for a change of the value to the opposite. In the
> wp-gpios case it will mean that the nvmem core requests the GPIO as
> "out-high" for all EEPROMs sharing the pin, and when one of them wants
> to write, the pin will be driven low, enabling it.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Reported-by: Marek Vasut <marex@nabladev.com>
> Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nabladev.com/
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit b30973e8c3920ddf ("gpio:
shared: make the voting mechanism adaptable") in v7.2. I only
noticed this now, thanks to commit f918e38044988082 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") in soc/for-next.
So far I haven't seen any ill behavior due to that yet.

However, shouldn't the default state depend on GPIO_ACTIVE_{HIGH,LOW}
and/or GPIO_OPEN_{DRAIN,SOURCE}?

Apparently Marek asked the same question[1], to which you replied[2]:

   "We could but that would require DT changes, you probably don't want
    this?"

Can you please elaborate why this would require DT changes?

Thanks!

[1] https://lore.kernel.org/3612f5f6-eeca-49e5-9662-72729bb48c9f@nabladev.com/
[2] https://lore.kernel.org/CAMRc=Mf_B+=adsEu+4TTBdKHdVSf2uWH+11WH9uz-h4Q0BS-VA@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
