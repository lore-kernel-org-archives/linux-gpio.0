Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E64415F1D
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273039; cv=pass; b=rAMFF5OeHXgUEI9ELp4uGs7W6P1HNVfQjsFN46aUAOhgJ/ja6HXQTOhcK5iBi4BqBZRyYCXnYruPqZ2nwTaGUymXMJo5yvXyu2BfOhUtHmZWGURX+k7B2hrLpJgM7QyZrPWcypnT0UYUpTSVDyNmN16dppJnVRxEvZyUTN7F9Jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273039; c=relaxed/simple;
	bh=be7ui7RFb4TvlxRvgKCPBiOHLIe8vlOIGLT6VBBiuVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8QZP+LHGXs+YRDgFnGVTWllzs4SrwVxw74FwtP1qYgMSiIEQ3BlL6gF230GV4WLmF+X9Z7HWHWKe0+rGm4eV60yop6Hcq6aDvLznttmFGqitdZu0igqAwjqdlv89dOJYj4MlESzT1eGa8iB7Z9it7iNaTcYo9emvqTJzPLsgZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=WZIaYYIU; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="WZIaYYIU"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672f5240195so159972d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 11:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273037; cv=none;
        d=google.com; s=arc-20260327;
        b=UelpB2yDJ9b30khZ4Bq43zKEd77ahJVGUQzB55DEjxCEhpOW2RT6URFaqNAtSxyR/E
         4T7oSr/s8cMGGB58EiqfqvWUKLW4gFxBKw3wBehzMLP8iUmVlgP0ozDhA2HcQiEVXtgM
         fOlZa9X8SsCyyFO256qHlkLhnvX7jn2Dl960adRSib+DcgLDfLcB8FTLVd52vYc9ww85
         sxUr+FVEzzdTscbMisgm3Y97PsNEGGQCk9QdPv5KglUS/ssi/v3ciw9GlqP4HTVm7dbj
         VB3vFv3d72MxJYyrJk0yxKGmvQxBVaZLdr4QEYEMrdnOKkiz/XNEOBC08UOmylUqX6pu
         AsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GbI6rbvHDi76XEhVIPPpSzJuZ9OLSAAQszp6JpdmYTs=;
        fh=8X7Pe70oDgSShsKbHCX5BWBg1SbksJ0waLsmuBr7Pss=;
        b=V1mqp7ReMxirJZV12Y/SG2h15qGyifxpPEo2RD6FQ8FPKlVGsXJWCidpzIMNX6aXoj
         w4Cjt2mNMK9g4Z5cIRXLiTYQ9RXGN9SMSpRhmLdnkRlhcBmi/CFWmIXUwKK4s/KT9Psj
         9KPv7zk5ZxZM5jUCZIJ2NMT/HpkYaknvKsMdY9cV1Q85KZLkB7H4Td5AnaUjd9/pl3uC
         JJpLXiYe/T8ENLP6Xxiy/4EjnDJeqCuFFUu45wc155u0cfg8T7LbkV/mZ/SH53JuAh1k
         TiKQBCId8kGFHyBXZtK6pRJXCEu/BMvfaqaXS+cBYYPWIdVy2t6OknKlJMgyMEvWjCXD
         x+pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1790273037; x=1790877837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GbI6rbvHDi76XEhVIPPpSzJuZ9OLSAAQszp6JpdmYTs=;
        b=WZIaYYIUrhggBj14kbMNE2jUvKrQx2cHcMiohtn2FCsaxpFxg9UIJ+dUThGKS5jhPt
         /Wv8zBVj9jFG5+S6bLh9c8B8qwX1c+5gfNEBRQ3cBVq3tl0gm6AmI8vI7kBpRX9vs8MX
         agOX/5WAdMW8991YygMO3I+s0lR3S26qhBfMXSEE4UX5Rv5E9bBfK0bSwvK1WJpifCgo
         xorSvrRgOSiK+kiZHBGVssfXaa7kceWRIApzDTjuDF9Gp7BNX53LsQgaj/xdaVhshw7q
         8n4AFHZJC+bQhwPXycW4mZ/eyD7VocSoN5RYFSKLg5YYEjoYtFIF3tKBH9ZhsEJvij0h
         2CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273037; x=1790877837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GbI6rbvHDi76XEhVIPPpSzJuZ9OLSAAQszp6JpdmYTs=;
        b=sRuTz47LKopn7vB715sOD5uU1MTl0UBNdlG+W10gr7ZOEtMK3mhOeplC6VHmHfZJ3c
         qh9pX07mQo8GH6iuRVyxdMefgMf3azhlDbjm7nAFY8uNaCH07P01/N3HaZOSbsxv573l
         pAlwoYqK+0wl2jL79GMC/NhxwiWTidFhNZ7SJpAgyGNFWg3OlYY0DjS4OXI2XlcS9hDF
         hSvdThN2mfzCZwx7juiGCWXhvm3ySZ7/UCyPpJowSEaRmqxAdJXWBx+sNOt5obMZzf6H
         ffRcJ5Rbc5rKDV/zdvC5LeJzyal34N4AZIzk8weadbz6OWN5Ki7qU0hN/4n3Y59dExbC
         XJbQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8IZhGLVBO/lc29o2oC2By6HBVu9ssVG9OvgJUrvs2y3pxhPTsKP3DZC/Wo2qKxPrxGuBb8PIAnjcp@vger.kernel.org
X-Gm-Message-State: AFuF++lhyi7mV2QaZjkfHfBjgE0dn2Q5Fr9BCm0DswAVv20fEvCD3v+9
	8GmWuWEiqCe3zyae0NnqP4PQhsQCYSwAbb/MdDw3kqrmglPaPGgt7aMUngkNdCxHv4fEc64aasB
	ZwnhVvcCc96JUkCUgLCgeJmZq/M6/2lw/H78ZGO70
X-Gm-Gg: AYBFou0KZZB185/6cHmtyOXE1hJafZQZj2p0qokkYBtJrnm2QW3svrKrXDsH6ZrjWKV
	myslMZ+ritaqWetwjip+A7GHsG5jRxSuuDimS6OYDpBeO4KMDBX6bddZ0TNbkLTWeYX7B9WhdzY
	3nLbeTq82UivuF5oiJNrcotqty1zi/qIOn57Y1R+o5QJYlPmkVkm7T4B3IjydwKf66SECVF8C+4
	bhIqvVWsJUs0VZSW3EFiYyFQkxBJ8FBABrvKFeJcGAU191gWtXR2zEXKqKkOg2ebtJN32wvQiCk
	lg2kKPoj9bXpRf9Gmqc9VzQJlUDESsd5dj5iQ0qJc6lX+rMKj0aYXCDJ2Vm3CX3o
X-Received: by 2002:a05:690e:4893:20b0:673:1df3:a6f8 with SMTP id
 956f58d0204a3-6731df4bb08mr827628d50.27.1790273034957; Thu, 24 Sep 2026
 11:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919171100.90430-1-kmehltretter@gmail.com>
 <20260919171100.90430-4-kmehltretter@gmail.com> <CAHp75VfOwZG0htxs7LJ5X4cdTMApESRpDaGCQqJpD3RSap+-6w@mail.gmail.com>
In-Reply-To: <CAHp75VfOwZG0htxs7LJ5X4cdTMApESRpDaGCQqJpD3RSap+-6w@mail.gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 24 Sep 2026 14:03:43 -0400
X-Gm-Features: AclHuK9W-13IkypRQ3w-qHAtFYIaLjYWqfxyZOrezr6nxGY3oYYuRteiyYlIevs
Message-ID: <CADL8D3aLAViH=5gVVRz7==M0T6rVuksNSgcoZCCTAJjroUnuxw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: tps65219: Fix TPS65214 GPIO direction programming
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jerome Neanne <jneanne@baylibre.com>, 
	Shree Ramamoorthy <s-ramamoorthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:47=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Sep 19, 2026 at 8:11=E2=80=AFPM Karl Mehltretter <kmehltretter@gm=
ail.com> wrote:
> >
> > GPIO_LINE_DIRECTION_OUT and GPIO_LINE_DIRECTION_IN have the values 0
> > and 1, respectively, while the TPS65214 GPIO_CONFIG field is BIT(1).
> > regmap_update_bits() masks the supplied value, so passing either
> > direction value clears the field and selects input mode.
> >
> > Translate the GPIO direction to the register encoding used by
> > tps65214_gpio_get_direction(), setting GPIO_CONFIG for output and
> > clearing it for input.
>
> ...
>
> > +       val =3D direction =3D=3D GPIO_LINE_DIRECTION_OUT ?
> > +               TPS65214_GPIO0_DIR_MASK : 0;
> >         ret =3D regmap_update_bits(gpio->tps->regmap, TPS65219_REG_GENE=
RAL_CONFIG,
> > -                                TPS65214_GPIO0_DIR_MASK, direction);
> > +                                TPS65214_GPIO0_DIR_MASK, val);
>
> regmap_assign_bits()
That would make sense, it would simplify the diff.  I think something
like this, right.

-        ret =3D regmap_update_bits(gpio->tps->regmap,
TPS65219_REG_GENERAL_CONFIG,
 -                                TPS65214_GPIO0_DIR_MASK, direction);
+        ret =3D regmap_assign_bits(gpio->tps->regmap,
TPS65219_REG_GENERAL_CONFIG,
 +                                TPS65214_GPIO0_DIR_MASK, direction
=3D=3D GPIO_LINE_DIRECTION_OUT);


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
