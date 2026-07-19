Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB4DF6C
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448613; cv=pass; b=eImO8PxKi/JwgIlol1yV29bDl0KXTi6XZem1ZY9cx7jgOXzvUhj0eijE8ffJVcIF7Z69IMhiI8FCD8DvOyZTg280pf5gL6YZ0F3kFsiTPQzoRr5efMKxX4ubrE5GyXRw9MTm0/HMcM/WZifEFcFUsUnUb7tOnfkLlK1iRi8fsVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448613; c=relaxed/simple;
	bh=NQlVyKKuCMEWDczCmuWWArwUKeVWKFmwao9aHBZhoPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGnpeWv7O71cQcQ7JEO9+7OuBBOwu11O9QxxBBdALFECrJ/OuTdQ72dLhw/PbYRKwsnW95lt9KerdlJnlEN/CO8HWBnF6GThZvnkkzXGI8anV1BhkCjA30+dYLrTHvcgg8rjkWuIVwpCUcbsIVrdHoZ3bitunysGrr2vpjSbXc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asr3+b4u; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asr3+b4u"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so81560361fa.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 01:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784448610; cv=none;
        d=google.com; s=arc-20260327;
        b=EtsG90UzI07y2D7htB6Nscs89XqtyJe2fcBWOwaLhTlejT6aRuPYFuvL5Kav/8oVNw
         42vOTtdhUp1Rkzym2goCnOQYJy4u2ial7kDTQqqLzQbwTLoZCCL0EKCddTZUl/+6NjNC
         jb39bH31FuvR3se3B3KaYA8SE9kegXct7+evLLTL13KPI3TA2/ft47bNor3CTExzL7q0
         2gugvem1Xtf1DtKu6ortjdtMwUGrDi/Kpw9KMd0HKi6G8R7ETwuV0zvEJrglorE9vuhN
         fJMvm/86RSd44V8wLYE8/KcCDe01fjL8eIBjuBrqAsoVBT3Ejy8qINojc7FSW45Snn36
         +BoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2yGqeoNEIqEFNeHuvCDFYuyM7eD27XEYEaaaCDQIKCE=;
        fh=vtOoZ6D2vAPe0iyjQJXtXjm5zRnrCWYfOA2M7l4cqEo=;
        b=R2AylWCkRXdh23P+BdCE+cNC0JmD4H9EygHgvdbD8HTXO28KJI5IgGI4ze+mpdCPUA
         Y6FafA5U5Qk9uNsm9+uSD10nrJbbbqYIIczThS94ZbPNJtOjYaskSfBAOQ/AapLlrWzs
         6FOfaPq2bIzeAobnY34f3MBxK2//lwB2Q0gFamuMEn5/lkd0ngczsxz/CeBy6MIIYO9s
         bwiRpwZFBSPyfm7CnGMEitKFskTb+JXqDAHbo2/zg8qJLQgcceMlVsjVkmHHES5pP1V9
         ZnOFUeIx/+vUMAeVmpnJc2m9si00bMOdpe189w5bboCalLbhTDfkdMLWQNVtN5Vssmyu
         te2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784448610; x=1785053410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2yGqeoNEIqEFNeHuvCDFYuyM7eD27XEYEaaaCDQIKCE=;
        b=asr3+b4uy2J6nodEgmh1jHFVySp5vfKXTVGaQqWM39klUdWSznaxvCvObNl/rek0MS
         HnmH+0PCgOvbxQVDJGVxIaYcQGHwKPIf/8o0TefBbSgWclEMRBZFqayCB3PnBaITWEhI
         sT2oyRFil9jtWHDAKK7P6Hu/3qkp1dYLh7Hatc1PPMrfn4VodI5Bs6kvS991GIQX9T9X
         Nc9cNEPZiTEmoBN3VlEVBNOFJzBbl4kbgiBJetZjP8gDyaF7zn4i/UhyxHdf6sTz3HE/
         QjLQvuCeCdeVGikmu+HuQeXGHVOM2JpKPcB7XVPPMK1Sl2X5sJMr84UP/SPVRukEfMgT
         fLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784448610; x=1785053410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yGqeoNEIqEFNeHuvCDFYuyM7eD27XEYEaaaCDQIKCE=;
        b=qydwvzMyqLT3nz6CsQXsnkW3uRHzR6BOzb0yh5Hr60AmxvemXFHNFQQmWZSDA1Dp0u
         NpLP+c1irw827I+IRHzLngdRGknc7X1MXDkaqScNVwJC0gJWAY5QAMvbD4QwTCxKOawH
         hJ3ydJlbxOoPan77QHiWfTH5UfVw+C+BKEmzTxUZRMyqcF3quliut8LtjUjEVO/kjT/b
         pzqpQOkqz4BNnKtnf0iRZvJBY2dgC8tJyuzEHvLOKD8ydrFJReCRyLYImmArnnGcMVSk
         C9BvEKXfFH5SsOlnqYP5h+lqTGPuBMxj2cSPYLcVoIH3wWC/LMJcNXs8L3QEIry4Gxu0
         FZgg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+AmYqK1OsR2+WqWkRoMG94Z/BfgEL45MsnmRrUbvpJ3zulAk0OinIGU2pcr/JVXu9IBQHBoDUXFpe@vger.kernel.org
X-Gm-Message-State: AOJu0YzRMTb+N0cKO8LO1LbjqZpzKxPi3/TN8NsUp6Q0xFQmyE6SOqEw
	JmANeNCDu461qwOjsqYHezyg25CXK7iKnSqkC8t2Go/A6f4zAVAECkFTKgGSEkBSoWW12oz9G5c
	ENrHpVsDmjLGcPtZC599B7q9gAdDPyao=
X-Gm-Gg: AfdE7clYjUc9sK47OwgAmpFq8IOZMuizmdcAC91fwK7t4f1guLxBhxX1skyWCsVhOrM
	wLh6i7qKBCxYZnmqC0aqigL5G8xKnSapddnk0ukHp8E+2Qxx428F8PxnMUjE2zYsZT6MIVbwYk7
	E15lROcec5Oe0OEl8LA71yH306skjWL5tFmGsC/cT2FJWIqyBo/obyosexgY2XKYOGEnxDN3lbd
	GnoJxTBZs4UTZadFJcyt4VHWYtAErggnQ32sbxAqgA+e0zpT0URLInVFWvxWlHs9a4GUoi2Gff3
	qy3hTinpkP8Ai2Se5Uf7SuBo8dxdKvHPN0zz5qg03GXmqFDpERoZLuIOD8QSS1V8ahDp7pvlaBw
	n5agCaYP45XNcLUZ1JWc4wCNdIbSE2GV25bjclaqGzwWIzkk=
X-Received: by 2002:a05:651c:2215:b0:39a:fbc9:6851 with SMTP id
 38308e7fff4ca-39eb28bca2dmr18006481fa.38.1784448609915; Sun, 19 Jul 2026
 01:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718213738.2470294-1-bennib@mailbox.org>
In-Reply-To: <20260718213738.2470294-1-bennib@mailbox.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 11:09:33 +0300
X-Gm-Features: AUfX_mxDd9uSfBrZMvhN0l_7Iq0ehwVReLq3x1hrVL1Jr61JXW6i21RsnFL2LCE
Message-ID: <CAHp75VeC4frN1TenWQY2Uh+z4qjaMjsLj8FeC9SgqWduQeZ3MQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: microchip-sgpio: add missing select REGMAP_MMIO
To: Benjamin Boortz <bennib@mailbox.org>
Cc: linusw@kernel.org, lee@kernel.org, vladimir.oltean@nxp.com, 
	colin.foster@in-advantage.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 12:38=E2=80=AFAM Benjamin Boortz <bennib@mailbox.or=
g> wrote:
>
> The driver calls ocelot_regmap_from_resource() via <linux/mfd/ocelot.h>,
> which internally uses devm_regmap_init_mmio() and requires REGMAP_MMIO.
> The Kconfig entry does not select REGMAP_MMIO, causing a build failure
> when no other driver in the config happens to pull in REGMAP_MMIO:

>   include/linux/mfd/ocelot.h:19:51: warning: 'struct regmap_config'
>     declared inside parameter list will not be visible outside of this
>     definition or declaration
>   include/linux/mfd/ocelot.h:34:24: error: implicit declaration of
>     function 'devm_regmap_init_mmio'
>   drivers/pinctrl/pinctrl-microchip-sgpio.c:910:16: error: variable
>     'regmap_config' has initializer but incomplete type
>   drivers/pinctrl/pinctrl-microchip-sgpio.c:911:18: error: 'struct
>     regmap_config' has no member named 'reg_bits'

Reduce this to one most significant line.

  include/linux/mfd/ocelot.h:34:24: error: implicit declaration of
function 'devm_regmap_init_mmio'

And make it a single line as it is in the real output.

> Found by randconfig testing on arm64; tinyconfig reproducer below.
>
> Fixes: 68c873363a78 ("pinctrl: microchip-sgpio: add ability to be used in=
 a non-mmio configuration")

Wrong. Needs to be
2afbbab45c26 ("pinctrl: microchip-sgpio: update to support regmap")

...

With these being addressed, feel free to add
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
