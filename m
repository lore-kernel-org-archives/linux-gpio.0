Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667639B4AE
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344828; cv=pass; b=l+waG/avQd72Hv/K3Gz9m5ztSACmADk/kP0zKtZqdfrIv4KEQMqJFbYohElCGxj1T3Zb7Pkq0am8DEbo0QKrdXhpGQRuWP6cb16hiqavMiSmll4Bl+7GrQlo9bhDn3MVKvaBBod6QNyHmHzOMbJ8J2446HIZOY2YuF5IrHEeII8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344828; c=relaxed/simple;
	bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSmWyaTR20fOYKWtA2NGF7YfQI2hXaStZIE/mOt6fs0HMe6Rb9G/6Xyh4lSOhS3EmoaCrjR5HTEEAJwePHaEb5uq+pjKwT0LBKZMDPhS1JbpOjfOww8T4mF8oRnV0E9PdbN6zwcBTqG9j13qZoQKQYVm0f3j4ya/rWyG1Q6s/hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d42LL+xi; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d42LL+xi"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39ca300db70so10029651fa.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 23:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786344824; cv=none;
        d=google.com; s=arc-20260327;
        b=IXzE5wwQTaXDcVwfJzYglONmQOzqT74A6XtZn8IyGYst1LwMhC5/utv8fbxZ3cT1zM
         /35Wongfw747JZ+4JRdhbJahva6K/NLdNPfh7jmZpy3qvAecTm9b6PCCsPI4Sada3n9p
         DlVTrLcCcE6nm5BZKOtOWVu6BxVLc3kk5kFtzJ7zy9ElXtGtXKAEfVCAJ4rmvpzni0LN
         wMQAlznVB3HJmSAsVehKjBHB5YA2zq8+jIrJdeLCTRASrcq31OVmYbTRDr/Q+NgKOHx9
         TK53KWjwlZL+Iq2d79CL4zOvgxpNJq4iYF/0tCEpDoU7uEPOjXbdEczjPsC6/uILI4/k
         Qyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=;
        fh=hSmykTbkQujK00z7IkGsC6SulJR9GxUO9y3wVlenl4o=;
        b=dowbdwHdhntgIaIHYs+hZvQ3WB7QQR43uexwnSQ/t0W7J9AnmNghP7oaKvWr22hhN8
         /ERI4VvLkNrHR/Ml8OEcit8arVgKMEKXCYgOYu4unWvZ/tWUgO+TcDNa8em0cIFegMfX
         h5lPOO5pwWdKp8pGjQmGeGCie4++9nv8INlrqSdST3JhYHg7kV+VA3USO6ROKyjn1mbP
         OsJSpNFKhHX/PVL19t7KlJl3a7L64P6azTdSG1cGy3KYwDU0Vxf45TwLQvbPtmmx4Jcv
         ArGrseQTO3EWBDsnD516kMh+Ber/2QaPJxaG9s+fpAy4z7TQ/FOZG/gGmqjqKpEOXt8u
         RKZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344824; x=1786949624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=;
        b=d42LL+xi5hDvBjRRV2z1CV/x6QW7BdpDJhG/P0gAx4tuoY74B3gLKoxTcJxE9qX7Vx
         ZFiOcl4pBYw3oJ1uBwwvI+3C5ie2iFq1JgiG0VwMJqiyZHL46ycotXaFHwd9fQAt2vI2
         svUgPqTg/Uq2qqYDvll+3TV8Ggn3xSXnuiHRXs7QI4U3Bv3k0FfR7msb3F+AtEu19KT6
         Q+/LMEvc+bGmIrOHgEUHoWOw2B21vJ8KcL/kr5Qx/nvZnfGDzzEFuV1e/J8GXmw/tYXA
         b/RMuR+Yux8IoBsLc9VviBTXsiENn/rh3GeBYhKMa7nZFZ9R4YRRYzsMX4w46x+YBmMK
         AmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344824; x=1786949624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=;
        b=fg3Lta/mT16A01ni3LFvy3AvXEuUDFan3C0BE9ZhtDe7Dvu7Si4xB/TRJJA1JCbqvh
         EnfLj+YkifkrsH6l0ibEuUg12Vb2O20DsTxmqW1XdDupuR/zkt9IzFMff9vr+7m5Huh4
         OW9at5EvUtHSvQdXZ6CvVZs93QpxtzG4iaq23Y5vzfkvTuiTgSOKvHwoGUyYlcW/Fvb+
         ildq3+TtPZcsRq8L0Unp7qCrl7rTHOH1GsxDYbq8MgXajDYboMZr/j2GEg5fLzAQrvVG
         ZcnERhxs8bmS7GiE3EzlUNWPd0ljkKNq+dIt1H5z+IGiVkqBzqaIJE7zWN7nNoOmGqiP
         5PKA==
X-Forwarded-Encrypted: i=1; AHgh+RoVDE1LyDeH20urevYoxZuhuTBssV8sxxNq62yOI0+fZ9l7L2WNZsqFpVZOxHb1rC3Zb4ZyjFg/N9VN@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCrZVR8lcNBBZ5AkAeeHFxadi04HH22ksjYG/P0PCV+r6nZE7
	mR4MZHG14ZBp/5DCk7QDrNsVps5AoGu+KwKolzN/iDYBq9ryBmM7AWSI3/sKDxMsqKC6PcU2LaQ
	1x6hDqJ5O5GAjXsUzV09uY6AUjTEFKVA=
X-Gm-Gg: AR+sD12WTc5XYnOFUTVm69/dfux8RBm5G00HGI2vuxw+Q4ltsNZw+ZiiNRHf/Fl/Hou
	jczC7ZL4ERwoR8v5FFtgeoRAXwhAc2Yhm3a7Fl0VwAuYX3ZphbqBwXJK7bqTY4ZTfW1UE3SUbEc
	S9gOaWCHQ8PYASoZDfwtRySp+UXk7/DR1PpY0qRfrtyYDa6z7K3ujts8QLPwTd/bqsiqRmpG6IG
	QLeeJHT/tjFCJaUgjARQffrJWmP78DJFmPY4MqLgQ5+OWKwfv73HmNMDEyuW5W4F8OrmYfUUkJI
	i3dSwKlWPXAfCJgrMHtMHSuC6iHCa1IvTTgeU3tocQJ5MpBfnq1niTcjI3qbPKfGOWWs3PIh4NS
	XUy+QZ0tuYYh3ePPHEhtt+Q1wBBWPigEL0/jluYZAD/80CccjuygrizLREAnHTUFLt5sYgyOzbW
	RxeuC6APz7i1b2QanLSe3I7twUp2W+77CTQ6BTpGVKgQ==
X-Received: by 2002:a05:651c:b2a:b0:39c:828a:ec28 with SMTP id
 38308e7fff4ca-39fbb2df6bdmr43123211fa.31.1786344823384; Sun, 09 Aug 2026
 23:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-2-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-2-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:53:06 +0300
X-Gm-Features: AUfX_mwCXKQ_EAfNQxh1R-sI95Ad-aIasUsrS1FV1TnKKBQz8muupu6Ky_cvV-8
Message-ID: <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

While this looks okay, have you considered actually having the
platform_get_irq_optional() to be optional in this sense?

--=20
With Best Regards,
Andy Shevchenko
