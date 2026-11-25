Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612923;
	b=5NIXInxnqpV/1SMf1p6KtGkMefXliX765JxtHpufFAWU0+pi7NLAuc4gVRxU5C9ERcm+
	 1Sm5JPDaqQuZK86IHxuuWh+KdbnQ/epRkcHeBqkKm4utjio8Yek7gHJive0iIlfNsWU9J
	 db5fR64HjCyb6gCnM16jbHzuhgbOkFMkPMW1aR8uaPhXuGoLqREG1cGaRkTlpwzkEA66n
	 JfS33qHEK8aSzjXrjOfj0pta7rMYdl52Bmp5bIC466NvU/Q6/7TsaZtOuUp4qbtsxpJc9
	 ex5/p7YWx0VGs/o1LqaRq2i1GVT2SxdWNqAvbUvWvvOD7GiE9VyiV0BvwP1D8N9ciLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
	b=dX8uUnB1lMN6aaCmyb78cobtMnU0LDWuXjPDs44bhCgONq9cysajPveCCfOJdwFm5znF
	 lihctu7te+CBzUJVvOEUcBo7CUVBSaKHcCv4Y4W+LNzGn3IQKxwLmUAyu89s3pGRPOyyX
	 RZv2BaULR6xjdrCca7mwQdzaAl0JCFyvFcNi3ozZvott/tvYmfcAmx3gUqsBrYPuQ/Pzl
	 dF45qJ5aE9vXruSr3LQW+sMflmz5hdOdWbm9aXZGX0FP9IzZ1BIs3HuhQh9FZRmx9Biyh
	 lyxd2o0W4aadwI7tBGzydXpMIBszzjb/jQGn6RlvzemBeXmYLmBPkW44qxw1Jsoys7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opSEdQTb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61EF606A323
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61EF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opSEdQTb
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a358881793so2999812f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 05:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612921; cv=none;
        d=google.com; s=arc-20260327;
        b=rS4raOevLpRgfAxelZ+39fpAnu86JH1gAIE1nTSHNuc7SgwAB4bPDz4luYcXXStoKu
         8HGDlGpEbxrr9dDTRTCeEo2UwhKmeq4VX0RoupK35AIKGYzai2o6QbNfKrzTkCE7gv0l
         75RjK+9cgf7TQUUI2EVzTiFtkyGARGPzuW/BbtCWCtGyhWjXcqv6FirE1wSvlspcUQFb
         Pqzn9CrJKg+MCWaQHwOcag5QM/N9FkCth8QI0zL0s4wvNT4P4JwFSOfNDP9rQtzDJeVR
         CWdJGBjAqnpc6ZH7lVdKkIpO4uF8YwqXdEnq8855SN27lf93EH8QdBFSdtYheeUz5btm
         P9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
        fh=AaOE9j8LZ3ojm7CmrUTKilZRLXuoPkyhT+wH0FNfO7o=;
        b=CMyjwXzGDpXnMp2C3edhupvCrwTwQM2u+L7OKiIykSMxQcXYocRlj1Izs3iscxISoL
         XVHjKH757vkC/B344RHQicA9+CFQpY7AzGV9XtYCCw7h55101X5G8CC9F15Zf7GHz9/y
         26qUOCAMMsuNirH0cjt6yLPQGeuHz8ktCUoe58XeLNZwyED/NtfdaEKf0MgvRYLtzfSW
         BHOvMYwTwT+qHR3imHkzdyJIGr2kWR8SJWZfrG39m2ylUQ3YqOtvWcvpfWryd3Pk2y7m
         gQaY3ihCCixUg8/CzqWPD+9s9LwnhrGPOy2aMJQSqesuzPRy33FZXZde6ba+Ctk5dzG2
         K7Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612921; x=1796217721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
        b=opSEdQTbB7rgsyjJ9BhIF9Grz8b8sB9R9IGgbDOXEPXF6u8P9tys2nt82Xr1hix9Lb
         8r1U84bKZE3IfywQtRNjB6DXi365U3bKGvDwwm6VW3FzLWLZUURNvYxRxaOrBsSaAF3b
         kmNDGoTQEXpo/V/DeQYIVVeUTpl3WNO658iG8xcNyiddyqdPNjTz39B9yYIzXeV9jOM1
         eBgDDjK+4rWvtPTrY/fZ34EkLwKoOeNSLrjB4uf8ZmRWmAtbyI2zBNE4I2XxCCfPgGWW
         M+VtL2OnG2s5Qyj9fFaREcdfCGYPh0zITb0diJNUfQQN76e9tViR2JTBDY23vcp7hYjZ
         BOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612921; x=1796217721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
        b=izIQHUqnuiSWVLoGJhS2bykMp4nfVaNh/ZsNbOqMWQhikgqj4WD/g6YPai+EPqeZ4Z
         E5WUZD8qmBXyrs4ACRnV09z8xu+IhrrSLKx3sV6uFWmamFD7oSPvqEw85d7EDBKy1wp1
         6NFEN5/g8q1w66b92sJ9L3tW33fIgSVnwwLV9w1TAwtK8IY3VVfFFL7CuamBwqjY/hZa
         T8vA7gkpg6dE7jSDVWwZr0eHHm3RLZElPUP+eBu/Ae7oPVt730RPuln+HO221jNI9w5B
         vICXsjk7I1r25P1+G7o87a11+AqUgnplNBlxS6yct1oDGmNCo2k9zf8HU7U/qFzVSfHM
         CO9g==
X-Forwarded-Encrypted: i=1; AL+hErHJuC98iCM6J2SidgScQRfbUcbCPO9iB9AeNUjPPZ3ixeRXFafoRaXsCnCn7qi7FAS0BO0VF5cb1HYb@vger.kernel.org
X-Gm-Message-State: APuU4Z8joPfFgGmkh0lqVDeRcenqZwi42muinmxPYj+nilipgC+ws9Wl
	ZI93UdhMUl6s48xqyXpmO4ZSFLM9WlmAAQYypLCQd8/2A++22x3SaUqFgMG58zcAnhZ1T2QNmLi
	XB3F59y1NfYD5Sl2OqX8y5rVxhdErePA=
X-Gm-Gg: AZFdTZeCCtGVinPT0XlZjnyAUQ8NNVHAqOas/TMmZje0kIAyZO038OrDWGYxHL8bkQA
	fB5NxsooLO/dcqXl8wYTfe9O6UAmP4jmIp54WDurqACdVAg/gTIuIG5xw1VHQCoymnbI/EkMeqk
	0VlOgYOs1zjhLc1Qm+48NHTs3Zuc8Vc1/aqRcEob+zD6nylkvyFmmlw6Er6JZfaRtcDHf/eoWWe
	FNO5x8TymdZTu/eW4AlbcOyKIvmzNDPKperQxBR9NvLvUig5M/HU83VU3An+ahruyRziEe2RYWS
	z0IDedtXKiE0upWGhnOe2NwlsrpXbl9DSWCeudeG5jU4CYzh0B+Ni0tMMGnJdLkfukNANts5TlP
	Uukdn2AMwbZxQzT1IxWL0p/KZO940eV1qE6BIXI7u9mHz9QeoCa3lz9niGXNA
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id
 ffacd0b85a97d-4abb47b242fmr34560131f8f.22.1795612920985; Wed, 25 Nov 2026
 05:22:00 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
 <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-4-c8079f8f569f@gmail.com>
 <awXJ3Ki8i9b-Kokp@ashevche-desk.local>
In-Reply-To: <awXJ3Ki8i9b-Kokp@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 21:21:49 +0800
X-Gm-Features: Aa3M54p0xO3lEZyqglSCQSV8T77pe3-rwZ_B8_WgOtklEC3zCzvHR5oUtvb-Z6A
Message-ID: <CANYHO6pSi9G9N38+mh5610XcHATV0otOr+6rJfiW=kNEyy5sVQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, BillyChou <BillyChou@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:31=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 25, 2026 at 01:10:38AM +0800, Gary Wang wrote:
> > The CPLD I2C pin mode setting through pinmux-select is not correct.
> > Should be set UPBOARD_PIN_MODE_FUNCTION on AANT0F04 devices.
>
> > CC: stable@vger.kernel.org
>
> I already mentioned that it's better to use 'Cc: ...'.
Noticed!
>
> > Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP b=
oards")
> >
>
> No blank lines in the tag block.
OK.
>
> > Signed-off-by: Gary Wang <is0124@gmail.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
