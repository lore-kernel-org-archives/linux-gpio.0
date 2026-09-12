Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C89478E36
	for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2026 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217557; cv=pass; b=mbp43AEeSKnjxouex4yTqv0H1TKR4nmYQXW0ORlWrJgetq/xdSBL0JN2pkVLYQJ71SHRse52u1RN3UmUVQ6jq0BHoLOQLxxxUshhZeMxdv2/lTg4iauf4lXm0xbLXjR4r5077BZgxqEgK/jOZh2S7ODWRec1rvulBQyQ0eX6agA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217557; c=relaxed/simple;
	bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWiyvxBT76QFYYDQmbTqZ06TipW9Kb46k3bDTnRaInK7ReD+ZZovr0BqxdZbgfuuAEWtMPbgL1Q8wkkKeaFR+mvzEp6w8GHJcI973MBVlpS5F7/gIckl693xobstSSnEt0hqKI8h1hUfJB6LoCJ8TLF2Ftq12KQnmXUYpBf8Zrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiogLxkA; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiogLxkA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c294183384fso301188166b.1
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2026 05:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789217554; cv=none;
        d=google.com; s=arc-20260327;
        b=fiFJH76QSwjcJnO8k9SiGvKO4asO5SnX8yfUnkkoeKK2bKUtVTj7gQU5zlFb/WqxA8
         htAHFUPAK990Fiu0o2ZeKmRfpPdYgqJ+px8jkspOvG5ML1I/0yAgZUndxArKd6lQ+tBa
         Elegs09UTMaZtQE0PkeufY5lYHefXc1gy9wwE8Xgk/e0Th6+OvvsiuBm7eycRwBr80e8
         gjgHDzRIfAj99w6TQtcybQjvGiCzxDd3vRgF6BRmmK+KSzKGYfV+YWcBrOl/ydVKUNBz
         +mtScmTn6txzAogwfljwmfMcUTq6U6pj4aSkqRynwHftadQzIvmRWdSo34241E44Y5mB
         OKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
        fh=wCcBjLwwMEbZVEYg4IgrkwLQ6GWLc8kf3yQOHSKjuW0=;
        b=KgcHOwN0w4ikKbYnuzilm0Iy6MJa0znNCtzasKVeDppghdtT/Xx+vmHg0CIQeDTK7R
         nH4o8m2urOu7REIAOV97NupD5lfJde2U/U/G+C+IXtUtcyfnkZQrsQICFqvpWLfvu3PO
         uB2tc0Ta7hMQjLweaVqZoW5fqvQs8wFppXjq9GiXA7Op1aif64bLEJ65vbs/jpzxUXlj
         83V1lLKFU1c4/9y6jT76jsQz3jfQ0ztiW71ybNfQEfrnMafLJZR685eIEXuPt5pTsEd4
         04nrrEd9pCV2hrvazIG872OV+0KHcWOaAhhl91c5wG7gRj0PBBQeeLteHBKQroguerkC
         +hLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217554; x=1789822354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
        b=YiogLxkACUpu37sIPery8UXnPMKXs8CgkenAUNfVsaLuNG7Okgf8c3on7mxOah8crn
         fu9dbHDKpnxy6nzjz2KQ2I++MPRJc9UdvDo+HbnloC6RZpyiyV4tYm5qKotTx8QC32Aa
         OrhgJaxrp1G6BWbROLhd6u/Kbh9JLHem+/roJhf0TDLIg2/+2MVjcbKloVp7cYU99M4P
         73lcTVpg6+vorQzD9uE72F5+UmGffDJVIYAupgCgkiKgn52uAF2eHG67cOcI8INpwstq
         fVNk6d+BtjOjRVNPDY2S5r2+Y9SbSjkruBlYbEiDIO4DBS7U3dfSLT4xcpiqRRDjIR9B
         T9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217554; x=1789822354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
        b=kPk7HENgI477cibj7ks7d/ktIJ7K7rVeuWbrkhkuMPC1EylBXJdX/6kfU6hhUclZan
         E6kszfhPH3iQf/hwce/RQksmrYHG+znaGdrT1XGkeeALkR6vkIwQVoYD1cjaqiECDhLu
         kto8Mpcq7z2hVuQp1itJ15W8vlssKFexdo7GwV9zAyU9leqNbOTPxJ+sGwhTRNy2FSQk
         v59MZbm2xrXyYAO172wXhW81GLJHqpgZvniwjjAHFfMrGGsOKypB825+ePf5zpGxIRzn
         uxCHD4SZi3C2K1SL7rhb+ZaAallsVCWryDTe1h/+E6nvCGfAXVZH7dRi02VNil6ZqjUh
         NPIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdNx6mNIKgOxktK2eVvSljGMyA7UiuA2tZ043spFThGpbmRt8CvoCRx6TsFLpR+t6JDBqp7Np/Tt1N@vger.kernel.org
X-Gm-Message-State: AFuF++mW21nCb+IwNAWX9BBoW76WeIEmkYCwbuvi0EeOBuaxyetIDuHa
	kI2nPUzZ9nMwTe4UZPNbUYGb+cfqlFwbGCw+ZFAlGyrU1kFI9ePVV0O/IGmpD/FYrHCj5WvGtq5
	WZoncNGRX4HokEE06ef60cjRBKKtrAYo=
X-Gm-Gg: AYBFou2CDxKmIBTS7verPmLTfl5yv52thEWiIGzxl3pIm7NBpiPnmNRmQnUXdX9vIhY
	mDMByBiggUvZpmz4NVLrcEZ2Ylgp0trzNKs9s56LT5VHZU4xnse9CVu1yQGU5HQfOciikpjsqtW
	Fdsrgjg6WZd5ZtHIMEJPgPnw+c+Q7fJzxhPJBpe1h4TVTMqovOrN5DkAJZ4XkkzP4BKAnmgnrkD
	q4HswvUCJLcqhLWUU0xMV5nn73E3g9wgqkbcGht3Fj6f8E3/t4DMcBT4sRG1ukya9MIzvIOuo+q
	UHxhKngFtvdYiFNC4WTfZ9Uq1ZqnCM5qAQDjcgBqxjXeez9n/yiFHcbQzqHykgWvl/bQ9UBGlMM
	qfEYKkvV+Q0ixE7ZUzvx8y8w70lbpIRZmN+6lNw4DZ556+Nyll2lSyJ4z58Ny5Lsqqh+QcUP3xU
	t22QWUuApooM8Pwwnh0kcABKw+gB2/r7h3/v0NsgFF
X-Received: by 2002:a17:907:1c03:b0:c29:53eb:9913 with SMTP id
 a640c23a62f3a-c296676d060mr456030866b.38.1789217554379; Sat, 12 Sep 2026
 05:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911224010.10393-1-kmehltretter@gmail.com>
In-Reply-To: <20260911224010.10393-1-kmehltretter@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 15:51:57 +0300
X-Gm-Features: AcwNN1W3DwqWQd9pEielZqqFLKmY8dVxArEYlj28Uls0VE038UU_dXGO7z6BIxE
Message-ID: <CAHp75VdcVVjotUs84Q1fO162AOQ3W5UOJaY9HxWz7FBbcJ=G4Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: uapi: Fix gpio_v2_line_info_changed reference in kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:41=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> The gpio_v2_line_changed_type comment names the containing struct as
> gpio_v2_line_changed. This was a typo in the original GPIO uAPI v2
> documentation; the struct containing event_type is named
> gpio_v2_line_info_changed.

These two sentences almost override each other. Please, rephrase.

> Use the correct struct name.

Code wise looks good to me.

--=20
With Best Regards,
Andy Shevchenko
