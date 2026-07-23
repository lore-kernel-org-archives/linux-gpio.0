Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22074457DF
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808175; cv=none; b=Ag2NS8oGo7gRrOq8hybmq/YWDk9bEH3FnTSncrp/Oop4yQXjAPsP6B79oSWc2tLVLTUKAaAkgFPcQ88QhM0AwRCh3mbfl1L9qT+DH2KXb3uDRRORrcfn7cEx2pAc2H90O8cknhGod4e237UVkUO8alZiQT1sVb5EWd5ApN2KGY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808175; c=relaxed/simple;
	bh=/yhp5ZbkLbJthZksMO1yEszY34ESiGOVA7ZCE8Rzv7c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RakD4uE4CFLBtZMx4tUi+G7nzBmeeCdLaj+AtcsYQdov6i6AJII7HFSQwEjZs5IkiV4e1NBnFnxZzBN8bu2IYqUoR+yozkVbE1B4QY5E0VxyPZ2LWU+rPzTxbOqiD0XDy9NrNRDSLril0HzSceOAJH2aw+wfC0wj0kwg8fcaK/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKitptES; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKitptES"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so64297a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784808170; x=1785412970; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NlQ8sj58KxG698DZbC9agL7PD8YxaQQR/BTtnhcQD8=;
        b=VKitptESB1c54PX62/xZRIvUH7TSJd1hml67nkHSCMnk/r6trfar+XUGM2K91YUOJv
         vk+5HMdMaJHPLs5u+xKTIDmSC0yFGB8uSPyYrgd3r/yo9jiJxq81AB6Olq1d9/uqc4R8
         m9W9GR/lNzaNMyKRSGT4EfC2Zh3oZ874Q52ZrtBsLtCk70AOKEJvcQ+I/+1OZMEhYvGV
         2KYaagzKvBicEIo5BfwOV/4OADj5/56jwgJUtKAJYTsi5Ep5Nj5H/C0adEXg2KJRXe5I
         4MMYz1VJe7hkH1oYKNzsU5I+8eDhpqnNJWxMlJpHsZQRHXQLV+KhyonlvMvJvMCDosss
         uEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808170; x=1785412970;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NlQ8sj58KxG698DZbC9agL7PD8YxaQQR/BTtnhcQD8=;
        b=tOjOGqm7MzOw6wNavHinbYW2ov4tZIs4XZuMAzQhCMrgSpAgvUpXBas/uj350FYMZb
         CNGZWwZFo/9WcmEmSPtYxA5sINXlF8Xgl2CYJ0m4eKmXKQFls2CzFOTi5QJ6GxusBllh
         aGOSYLz0rGO21fqf2j6cNV3xQcVNI48axoretjnkL3+8gcx9RjzSQVNiQAEe5bklA98r
         Aor2iBEN5vtSYK47khQsnshjX54zT39D8HndawCMxxHaqijUJ3feBJpDnxduopJCeItN
         IIqfgt+rHcoBcxD/cWXYSi6P3f95S+ZY/lx5+4Z1el9DYtokGxXP7TXQK594kcQP4TgX
         2BrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrjl0RQwVcbnDkEdWoYrmDWFtQWL7uK/z06XpQfFSnJkMincYTGppVmKRHtfakX3KJaqsfKeCN599zB@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHzEPk010sHh1w5PP9cb6NPgNx7OuH4jsY1fKPf9Pbg/ZGS03
	vwgPHarXJHSHwnSO97aCMYcSbqdbfUERnQo7nwuAuu6mGCRCyifjLeja
X-Gm-Gg: AR+sD12d6z8EYsmvLg9xtKR02V4PNMb+q4aDIjSCBIiVW5lFzdpbmvuXmwM2q+bO6ji
	Z2D9tMHwNFrHTA5E21flhRwvnnGlsDfgiP55oRc0u3+ghlW9zXVDIRMGSDbipl1waWsHSR/rN57
	BiKWkMiCkTyKLBaHKwSCSySrZtQVHyazcc4EXeBrkO5QxEagT362sk1ZB6V2ytcZ4+CbJVxDNJ0
	aTd3sRqTmLIP15ZJQF8Ey1BWffDbVTOd/Lk/lEmCNbsVAkQl8jBnGGqMYaamIDveRPAZm3GHz8B
	gHiP0JI13DfaNyT94yK+jd+QoB0WhJN8SZi/dy2rRHc+sR+1YRTpYDlFiUBXKiIF8IOu2brp6sF
	nV3oIrXLysm5uTVpL8oHKF+plc2lo8hrQzTRxAswUPESlkZirP0Hx+z8q0L7/UJt/GPPuJYdcXv
	JeZGOu4ibjtIgAsWZuf2nc25Ki
X-Received: by 2002:a17:90b:1d4f:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-38ec6466f4emr2198352a91.1.1784808169393;
        Thu, 23 Jul 2026 05:02:49 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1c3393sm2608783a12.32.2026.07.23.05.02.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:02:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <20260723112940.GC3363113@google.com>
Date: Thu, 23 Jul 2026 20:02:30 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <034E7CC0-47AA-40A3-BCB8-B9BEA2190DCA@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
 <20260723112940.GC3363113@google.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 19:29=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Why is this v3 set still RFC?  What comment are you requesting?

The reason why this is still in RFC is that I am still waiting
for response and discussion from Loongson personals on the
proposal that adding a DSDT entry for the ls2kbmc device that
describes the GPIO pin associated with the device to signal
the reset event of that BMC device. As pointed by Ruoyao,
such a proposal will need to be discussed with Loongson. I have
CC-ed the patch to the relevant maintainers from Loongson but
failed to receive any response.

Moreover, I am also in need of comments on the backup method
of searching the GPIO device and pin when such a DSDT entry
is not available.

Cheers,

Miao Wang=
