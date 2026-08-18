Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672717C211
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039405; cv=none; b=DJtev3nYdhwEdTq349B55/jHiiCvRsbvHthoh+QKVOtCykaBGOqVJrfqFdBQLm5T7a/VmfkNDNlkyCytx8e/HU9vdoKS8JRZTUmXHmCn4u/yWm5DDkxulCq/K3Mx6zI4oxTBLeJW7EFIi5mblll/TW31NnvBRLLOw3/bmo/gZJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039405; c=relaxed/simple;
	bh=4hovw1LT8ngxIszfZU+LyhOFPvRvMQ+X/1N2LYm7Qa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrNG9Ob8QiSALJG2mhRbvPEPFva+5s8tkTu8uAfflYpmCHYP7rdEUnOneqsae2Sz22wdOvk0702E3pRC6udQIG35/5ZTNUJ1YKY2zaJOHIwjg2K06rQhUectWGp6K1y/cXYXo0hMtnrb0iR1y4WNvG1vpoa4/Byzyp4L7xU+VfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c2c0e261aeso1215259e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 00:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039402; x=1787644202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BMbOynpE2wjfT5FAUvd+tzk9OVKzwiZXdK5bfM4NBjQ=;
        b=hiq5RBK0eNmPhLa1FJn4DWJnI4JmuDRnRX4a/H44/ttOmZtEtEbanKPVwKgwj85cXY
         T5aYNAhhpliWCm2DdfP+yuw1opjGdM03siO4rXRl52xDRdqnpmwi6cHzo2aRvko+YCmE
         NyXkmEbUEuTBBX9vN4KAGtV7K3GsrAHgx/OEEhBHGWEFJKrEEOpvv5mKKPVeS5kzeDcB
         FnlxVikI1pJT23v5qk7icHo/9bhqtJUX2x/ZGq9HzrQk/pMk3edJrn4+ScZDXVkbKTjD
         rkm4co+MMT4PX+kukCvs4cm9QCBRhgsB73iuKPCYUvv53Rd0MvHRb4U6HsXhFkgy5lgu
         jCLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvHzeuzc2taFGdd0S11shN88KWXXRfpts0zOrewXZ8OFZ8X1d1Qmbv53QITraC64Y71FHPXY+eTNvN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9B89JSwHSgPfH9EaqeLd3dBCjtJljtt58NtfFIyd7fxDlhgNh
	HD26t+N88GwUkXOYW+/rXYevLuHzCUmitwhQlxYSEnDTWiI8HcryyIgk3uzi1lZk
X-Gm-Gg: AR+sD11eTF+V1bIHhgmXG7XNN78apcrvIHwDx6aGSXqqwgYO7Yof3vDwVBS+pyYF3TO
	eyrvYsNWRIjUaVPLsFgD7dnl3dBDDdZyJpLBOrd8nP+xitj+ODrFAquF89z31nQndPpLxW13Sc5
	bdO+qyJZYWUTpjfUFOJf/HVup12GiVYJF+zgHynfe0JmBSMYVQeGteKgwDQYRtwtkrr/vTlVwpf
	hQ9KrjqGtqfMJhnH3t9nKxtb0sxKC7O/pGrnFifzGbiAg9uSgzZfFFUJuu7NinHOU2U1jcMtXbg
	qvgg+TRdQ68k3MdOuACze9o1WnmB6AsM60snCIQn5w+4x+Lbwvf5htNszRyxatFvTRiQ4MIlo4Z
	EAHLaFjdjbQqVLdPVZS3WSzEvTK1UOaUUJgMagvRLTTBUE/PMz06X9+2+sRjdhDy70YpClcYFni
	B02npOXBOZ9SPpBYyx2LVCd6Ty5U6jD7JLtDZTnG9dot3oH4kMKUHOAHCngSel4woRnxM8kcvE+
	N5cBXLMZyfj1jaYsqPkMt2q6l0JKXGp3XB3
X-Received: by 2002:a05:6122:f89:b0:5c4:1382:c0b with SMTP id 71dfb90a1353d-5c591c3d911mr6145169e0c.2.1787039402588;
        Tue, 18 Aug 2026 00:50:02 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c78c91b0sm2814265e0c.9.2026.08.18.00.50.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:50:02 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97bf910aa70so731293241.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 00:50:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqDy0/7wZVfN2SRlU5KeRm4swUp857ERH51bAd9mrEMKy/LQfoffOry51tYl2TNK15oZgfBwwA2W9g6@vger.kernel.org
X-Received: by 2002:a05:6102:41ab:b0:760:418c:8a9f with SMTP id
 ada2fe7eead31-76f2d5816f5mr4852298137.13.1787039401836; Tue, 18 Aug 2026
 00:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813081231.8855-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260813081231.8855-1-bartosz.golaszewski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Aug 2026 09:49:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs8RmenPc_mODnZ08qVMXb_rZfA-A4hez96RbXdBjovA@mail.gmail.com>
X-Gm-Features: AcwNN1XW6gZd2XAFmTt4EHGbD6kwyLDuAbaP2tGwCP49J5FiTm3i01TIilDfEOI
Message-ID: <CAMuHMdXs8RmenPc_mODnZ08qVMXb_rZfA-A4hez96RbXdBjovA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio updates for v7.3-rc1
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Thu, 13 Aug 2026 at 10:13, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> I'm sending my pull-request earlier as I'll be mostly OoO until September.
>
> There's one new driver for the Realtek DHC RTD1625 GPIO controller. If adding
> it, reverting it and then adding it again raises your eyebrow: this was done
> becuase the initial implementation - while correct - didn't use the gpio-regmap
> abstraction that suited it nicely. The conversion was done after I had already
> merged v7.2-rc2 into my tree so instead of rebasing, I went with a revert.
>
> The merges you see - other than pulling in your upstream tags with conflicting
> fixes - are for a PR from Arnd containing his work on further isolating legacy
> GPIO APIs and the fw_devlink support for software nodes that will go upstream
> via the driver core tree.

Still, there is a remaining conflict due to

> Alex Tran (1):
>       gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper

being v3 of a fix where v2 made it in v7.2-rc6.
Note that I believe the resolution in next-20260817 is incorrect:
https://lore.kernel.org/all/anyjJ6DSHWCjuB97@sirena.org.uk/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
