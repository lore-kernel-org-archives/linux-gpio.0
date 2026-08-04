Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D843231B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836435; cv=none; b=bR6CkTAKwau2LattqCa2phzuh83lloeO4ZYJy4ZtZYYT8Kh/1qVZhjG2l4YgYId1Uw+nijWxiwYvwMvlQR5vGMSECtkVmvMsBuMwvSSp5OS5WwA/YEfG/Bwcrw1oYoUnIvW77LKN1iBWg/DshG5tmw4K9zlWx4zIVk2teT8nKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836435; c=relaxed/simple;
	bh=+tg4HihkjVnqg6IV94Lm31GvSa3PaWyc5O/YQHA4Dcg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bxVUZstOrngPAxlo3b/hx4rk62Mc8oZrtiZ6Rxs8tAvy1hPtiwIwgsdfhdDPo6a5tOkTde195fwi94RukvkCrVSEveYpy8UwR1170kuP8UNNAgQ6KEblGLvr/lO0fFWVwfsyT6mWhqYXZLbHdKkSmKpgMz/7ducPXdCd0IVJr6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcLjbGyE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcLjbGyE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so5137375ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785836432; x=1786441232; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0KP7c64Yl9kvVeMhN4Vu6FcmRJHPM+FSMkVOBoxsZtQ=;
        b=RcLjbGyECiBQri73C974Hecga5QwZJhR7cvmbyLTEPJfk6rht4jM9k1fSgN/5xIhhO
         EqbAuXnq9nXMnYDvkWrL3yy88Zf46dGSugySYDBrI/9o12vi+E6hpSuMD8X9YCEc27NJ
         JOT1egGrn8Qz7D+MKRMky0u6+iDt4kxQjuT/C/VABJtKyNksRn4s2FhhnV4qTT/Fw254
         Q9KqDkPfOupRKGmnlosqAvgJAWKycgMPRlYp8cogasSwMW5R1idIPNCOMAfm0fL2Gzjs
         YlD+rx2WxE3UDM6jvuoIQxW9qbhvAr7To6noO0yPqrc/q2eByf+Y2iiTLntpoG4/5Ex5
         Eyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785836432; x=1786441232;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KP7c64Yl9kvVeMhN4Vu6FcmRJHPM+FSMkVOBoxsZtQ=;
        b=bG8+RYwbTeVWz1jMw+IVpGPA/19phezU4O3embUZgCr7CiMoGRrZRFqimXKvIKLxym
         ciKwVqWkJ4Qgfma0AemSRUvDyZv9X6HszX5K60Rbja99b6lfZu5h01enDEOVmRdJF9iW
         9D/AYALqMvDyl4aaqfReyBSqvKDho/pC7SbVGbItQ6h8KsrlbyKzNCJpDmMVJGhSYymX
         bloW050rJyEIumpfewq1YX8oA2OjfXk64+VheBT7O1wiG0SR0WOKsP7ePW8NRuWjxxzc
         8PMqu8Y+elWzBLgukd8zk9r9UeukvTtlG0helmrGicjC1bIsjIICq00ITm30XWNH9KPH
         DFBg==
X-Forwarded-Encrypted: i=1; AHgh+RoEIRW3AWcTl9ViMT36PoEIRTxkQGKfi9yl0Ofhto+Suiacz7Pf/wi/BIHaGXVy4qQhw0YEaIKSP11j@vger.kernel.org
X-Gm-Message-State: AOJu0YwyeOpDUVsgJ8gjc7aKKWlcY4wgIPqXjkn+KgaC43D3g6pRtjsm
	0mEznBrSQE/xPQ1lXR/TlNcOb4N3QI+KzjTg6xR91xMONdNhocETpVZP
X-Gm-Gg: AR+sD13Kmuo6TnspIrBWNbRNw0LF71OCFfWU8Nv0i/orXLKOvWn7sM3r/d+BQ+M164T
	LTeKukpObtwi/t7Mko9FwDdwI73/njicFqqX++Dlru31aunpuxfwI9eZESFq3iTUI5COMvKQyrj
	Gy17LzuBVZSDYBLysj1REeYkSFVAk9B5zTTtPK1LaAONqYuM5jo/F6tn2GyS7jnKi/8uEctaF2+
	+Cp/C1nFu9WylVyvWLms8brwlwczrHT5D8KiSvigLjAAY4LGj+v3Kf0xyAIWuATADWLoCQJO4yZ
	Y4AP6T8+Wg3iwXN2S5dCvGF4HjkpoTEqxzzA3tOor7Dmk7MkTSreo5WCFEgiGtXkmaKzhphII84
	cuVQi7O9hZ6J+ym3ffCLr/b/KkileODvidwrv5SHQjUn8wAGM8F3Y/nCZVTQBDk/Vb2lbYSp6L0
	Qx5pM9lCBRSwk31axPWil9JLaoUqYjBad1ij6h7bX4lLKGZH6m3s50DjjruJB6Q/TVPHgpTNH3U
	TS+/mmJ8KQ=
X-Received: by 2002:a17:902:c952:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d0521bca53mr200300075ad.1.1785836432230;
        Tue, 04 Aug 2026 02:40:32 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa013da4sm3898605ad.34.2026.08.04.02.40.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 02:40:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v5 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <anD-LJYB-afdVAXN@mail.minyard.net>
Date: Tue, 4 Aug 2026 17:40:14 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
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
Message-Id: <2E268CDE-1D85-4611-BFF7-F74DD36132AB@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
 <anD-LJYB-afdVAXN@mail.minyard.net>
To: corey@minyard.net
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=884=E6=97=A5 04:46=EF=BC=8CCorey Minyard =
<corey@minyard.net> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Aug 04, 2026 at 12:55:53AM +0800, Miao Wang via B4 Relay =
wrote:
>> From: Miao Wang <shankerwangmiao@gmail.com>
>>=20
>> There is no strong dependency between the IPMI driver and its mfd
>> driver. Although the IPMI driver will not work without the mfd =
driver,
>> it is not a hard dependency. The IPMI driver can actually be compiled
>> without the mfd driver, and it will just fail to probe. When the mfd
>> driver is loaded, the IPMI driver will probe successfully. Therefore,
>> the dependency of the IPMI driver on its mfd driver should be relaxed
>> to "imply" from "select". This will allow the mfd driver to be =
compiled
>> as a module and the IPMI driver to be compiled as a part of the =
ipmi_si
>> module. The adjustment to Kconfig for the mfd driver will be =
introduced
>> in the later patch in this series.
>=20
> I don't think that's what "imply" is for.  Imply seems to be for if
> there is another subsystem that can use this subsystem, but doesn't
> require it to exist.
>=20
> For instance:
>=20
> config SENSORS_NPCM7XX
>        tristate "Nuvoton NPCM750 and compatible PWM and Fan =
controllers"
>        imply THERMAL
>=20
> The fan controller will work fine without the thermal subsystem; you
> can control the fan speed without it.  But the thermal subsystem is =
the
> logical user of this.  I looked at many of these things like this.
>=20
> In the IPMI case, the IPMI driver is useless without the mfd part.  So
> there's no point in compiling the IPMI part of this if the mfd part is
> not there.
>=20
> I could be wrong, but I can't see why you would want to do this.

The mfd part and the IPMI part loosely depend on each other. Without the
IPMI part, the mfd part can still work to handle the display part.
Without the mfd part, the IPMI part is indeed useless, but it will not
generate compiling errors or other runtime errors. In the runtime,
the IPMI part can be actually loaded earlier than the mfd part. As a
result, their dependency is not that strong.

The reason why I want to change this is that "select" here requires the
mfd part should also be compiled as built-in (i.e. =3D y), since the
type of the configure entry IPMI_LS2K is bool. However, I cannot see
there is no other reason preventing the mfd driver from compiling as
a module. This patch series will introduce a minor fix, after which
the mfd driver will be capable to be compiled as a module.

When the type of MFD_LS2K_BMC_CORE is changed to tristate, the "select"
here will prevent selecting =3Dm for MFD_LS2K_BMC_CORE. I thus believe
that "select" here should be also changed.

Any suggestions on declaring the dependency of the both parts?

Cheers,

Miao Wang=
