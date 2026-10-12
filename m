Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948E3BE627
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801741; cv=pass; b=chcKg1z1HxnpJqTCP96GEXXX6RF/QNtedlPkz0hrIaWiYCtdM669uTH+PpS542G/xiHExUo5NPnU78xxJzonb5t3rftkvk/fndOtObSDgToFPPwklUFtM8q8vKOpXK3mY6SCbepUCBEzk7Ugr3P2DCRTYdCD9eydzOrZ63iU6z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801741; c=relaxed/simple;
	bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQRuBceELwUyBG6QD/iccAFbXPfC8e82LLP3wb4yDrvLTQruMrFQvdESv7UI2D3JKZAat53it1C9ZMvqUMjIt5BLL8GHWJrkxtbX53HUoZe5H4JtxC227HDWHfrENHZaYqXwkKGaBXdp0v5Ienkp8VuVeCFuWaNXwdScFA8lIAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWkMfz7v; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWkMfz7v"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a9c92ae2baso14140681fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 03:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801738; cv=none;
        d=google.com; s=arc-20260327;
        b=d2O0JXzIv1H3WVr0RrU20GX1liQJ8Snc/TIqU4TeZ9MWciSKRSE0FZuihFn3Hm1EOt
         2hjc+8HYONiui8HLg0+N50KDv7iTdxH7Q0zXY08/2YXDfnIANEPgA5yE5j5A0kf4vXho
         F+vY3kmt4m6tFGssDwOPxdZpWdva8hRTSmw3kHO3Td7db5ekmrUV6URb0DyCBR5nYxYa
         Ewxpwyr760pF5WRFp7s+GTFtIDnSKSzvSd7mc0jzL2UW0R6sP+s+I9e8HegGGw95+n8Z
         mYPrmeLQHOWEA1zKzPZSZgO5oPjqZ4QenzHVzfLFpQW/i371kRB1UlhumihkZ0lqbsuz
         gylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        fh=qCRl/QbNvLYCyL2GOEYYT4OijTdlRDcvv7iaH9wCcRI=;
        b=UUrjzmlbAxJVOv14UFEoUpPI/ywqvtV4rzlAE/qmAukq7w1heuvQfu05WH47+lIUdm
         QhD/DtDV1IiXZqV15wZqrgb5SCHtrl1BEmIRrmw9ixB1X2orKXhti8cFGu7G1kwyyNwZ
         rH26Atfuse0NY5DF+F2/1JaZELkkCmu79R8VcI0b/ivYvBt2I0G/nn4a39rfmn45F8SB
         9d1wnpSKdUBFedtT6rrnqgeHuEUfLiDCthAcdzZIvqE+OfsZphEXXd9ZdZ/G4cQXuIkS
         8/0wvPNk/sEgZNieuSYJWmdvjbZWSXhKuZfnWnRzxMbTxxaKdchcgqnDrCn1OJlLGgcK
         a0lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801738; x=1792406538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=sWkMfz7v7Wmk6ePfO+89U8YECUtKBAx85SrCB3cfOPVGIHWpxqjB9R+ygotYoJ8zYD
         wJg3hPO9qM+A8vdqRaNdtYevsErTBNUCy/uAdNoJvewbtSgKFBMrZM7Mw+gAX7RjwKcW
         rXpRHGt3tMmp1iJ9X9jDWv0uua/o7sscntmrLh7/6HQFUUemooXCqnpbjB8h8QroiyKF
         SFhI/XrE6f3uZyTfk6tBiaPFrhoRbftCn8WNtqfV7OB+QD8rboti9BanAXVwsKvLVdqX
         22aqFLDprwuOSHylBeClZdFO36Z25fAC1qqPnFPTm0IN5EU5O7jMWoLdPBfP4gycep/+
         rKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801738; x=1792406538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=Is4qL7vT7/145WxKeGQmn6S9NQdnTuGP/LN4pyAy8cmKhBO03kre3+0wb+l5qsTWzW
         kzYEnN9DEjngGKH+a6jCYh04tK4IFCUN1MbLaADRtlizpdjro5rW5FUlBp3+RbS0A6yW
         6JcRtQRHH2yvHHRutNIMJxHotfPa6/9feBEk4Y3Y+tPCtwNNr+Ek63xTWdNxssek1UYk
         lpyXb8fETPZSP/IoWl70C14M351PKgdtSnPB7p0bfew/ETC7yh4tf+1BfoxE/BqsK9uD
         5ZR3UlyMQIiuDdLCNxAQnm6Ts/a7v05cWynuAd4FQhYMi+4Xfai3SiYmruVdQMtYi5Nb
         wM0A==
X-Forwarded-Encrypted: i=1; AKwUvBxKyJNcl2bcL4EvWzPumlaCU7/0zBxhojCizWoThwYm5294xnR4vY0lpSgOja4DwXhWqr7VSB4sytvl@vger.kernel.org
X-Gm-Message-State: AFq9FYK7JgMgYjT7rxc2Ej7eVhynsmA/AXKQlpZWtbvV+K9Brksszhpc
	f2rp51g/8XTzfFWNGdmor50Alc5jm2r7SCLo4xm0Zi3roUfL7Y70awSxsWJduUB38aB+akSS4lW
	wjBLdNo6ROMakATtN8DlF3X3fYnr0sKc=
X-Gm-Gg: AYBFou2dbbdSGxWWRcJDM/g/7UZaaug/VmhIQNRyQ2D+T8dlYeHlj9I3NpTOY9hJjag
	RPH+zFuinV9NC52pMGhsuhi3wdgP0pNfdR6wUDfbMVSucRoCt/f1ZsDVsQhqmZRLPq9KxM7K29R
	Z5stHK4Vqfl1pMQmi+PRdwB0clgNPPRdzUpA9zk3Wcou49ImQfPl2GJ25JM58HPs/EszeGFMj3b
	8zgw0Jkj7EgDwKDnQVeiieZvVSexFDtz38H5evgPj0+G0Siu/7aKE1/k7pWrVvLo7MTUUMJlGnb
	JmKKgGiIEVFqcDycyBUlXyfiBNXy3ijaqhASc1wM4qXyYab4xbyoSvGOmbiiEuX7LIkWrOPyw7z
	80k8r/c+z5sACCVB2eQGvNipOWbFfJpBQu73+hKIXxDACC4KBCdjWvlbvahPD5bTgUfdKPPO950
	57wXips63jdstI6C9ak6gCN7MbNxwSIfZbCWTgnNfrVw==
X-Received: by 2002:a05:651c:b27:b0:3a9:9b67:25f7 with SMTP id
 38308e7fff4ca-3a9c53b0b19mr23170161fa.4.1791801738046; Mon, 12 Oct 2026
 03:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com> <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
 <asyyLJ3nOUxJ8TKq@shlinux89>
In-Reply-To: <asyyLJ3nOUxJ8TKq@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:41:40 +0300
X-Gm-Features: AclHuK-RRzScLhztBzLfy8Jh6NTaM_vTOn9ggo9DZdIceERnpI8cnWgRhuFuAK0
Message-ID: <CAHp75VeRG01p06vT-8-a=VsFj5PKRFH-jUNi6jeerJrHfshHjQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:06=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:38:37PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:


...

> >> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtim=
e_put_noidle(_T))
> >
> >Please, split this to a separate patch and move it directly to pm_runtim=
e.h.
>
> Frank raised same suggestion in V5.
>
> I tend to avoid introducing cross-subsystem dependency and use a follow-u=
p
> patch to move it to pm_runtime.h

Alternatively you may not use it, just carefully put a goto:s and error lab=
els.

> But since you both vote for pm_runtime.h, let me separate it in V7.

Also think about splitting the series to three. Do not rush! It anyway
missed v7.4 (except, perhaps, the first fixes part).

--=20
With Best Regards,
Andy Shevchenko
