Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9464480354
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454921; cv=none; b=ol+v8oNLj6AVzh+s73MCgsVj+bXQpx1eIeGNmqRmtMTZECsn3EBYJGQi+sdGFfHMB2eGsdRl7WOYhGJSaKGWvcv85VI57IlDaFWgQmQ/Yh6Kmag+/jP9hj7CxEcPeWa8busa+QYAjgXTIBH6H869bHVF7arUPkNL1F2QZT+sJ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454921; c=relaxed/simple;
	bh=Tkjk901R+PuFiZQcy2sX4+RDCIr25vjSsNS4Oy8cQkk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=r+cQWd/GEXyfei9Nt2XhNzIJS5L68+GbvefHg7CD2Er630vmlyQxsWR40rYzHDClRiAy6xQpTo4SAPQU8g6mLfns3Urw1BpIZzpYkVkncUjWTZC1wjXzYCrkCszGZMR/8jXVcJ8YqnN6NzFkQBk4CUR2Z+jJ25SxXHybCOG1ePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkKRIH+c; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkKRIH+c"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a7c8c7d0f4so191004a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791454920; x=1792059720; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tkjk901R+PuFiZQcy2sX4+RDCIr25vjSsNS4Oy8cQkk=;
        b=JkKRIH+cWaFKekQ3GzgCDodx4ZMt3LFtnzsWbhd+c2gKaCs2m+6dcB4Fs6cNsCWCol
         k6pD76peSOSszEA5THXkFxTWZWVS5rkqirL6bmNuN7Av00MsH/CPNm+CAiPjaVHOetbY
         gW/5Ir692b7Eq0vYokscCCGNNW9R4YCy6iFx8Md4TByPcVbMs3RAXl4a6vB9GJVfOwAY
         KAQwlT0NWkVwcT8QCj/yfs1pq+WZ68Oi49t/+Zi0o1B3I2J93nN6Dae8aKFxvHeZziVX
         WDDaQtaMejq+vla/tRCaVp/+btUBFKkD3iz4H++LYrjrbcLHpeUEuZZkSZ0ECiJBFxzN
         4adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454920; x=1792059720;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tkjk901R+PuFiZQcy2sX4+RDCIr25vjSsNS4Oy8cQkk=;
        b=jevic+AWi6SYH29PwtwYwFJtuKgo0WwPZVx8IF6afoQbiecvvI7PtW7OTRTCwi49BR
         kpDalP2PDp4EifkaJ5d1EG6NE+CuLXZ3UB3uQTDF8+in27B/AYr8M8eshaBihO1ZCUCf
         Hd3KfiRm/RagYBVJni2BsBD2LjPSPnYi8Q/yhU2M2QgA9dW367msDQyDpcn3LvcF0W3q
         DBOueFs8wSKDxPgnf9Ue94KrMR8asCQ25uVAkBLCHDD7bA9V3tTzOvb/PW5FhSW/t50+
         Lvlw4E8R6H/1XXEa55CAjY6wN48ThCXDKWCkJ+XaxJSHZFmFmOfejO4efodSvHGxkLLd
         6V0A==
X-Forwarded-Encrypted: i=1; AKwUvBwgQJSYU3IrYxNE1Nu1Lv99uHW67f2C7U3IIfv4hBFlpa4TF083pXJuEFaaTI4Zc8SZNiUSBz/wKLaY@vger.kernel.org
X-Gm-Message-State: AFq9FYLimYkZyjr179oklgeWZACYaYqZ0pBj125mYGYqnEL4B6ywinTa
	96QcDvI5M7xJTxAFlQ4Wc9RBBSDDGDLdt7ocqJ9BwsKyYjwJCa4+U1PM
X-Gm-Gg: AYBFou3xKuod2haufEu7Ri9bD+LB4W46le6sKsA1yQTOcshzSZVyd7bUbHwTIcOsKS8
	BXyRctFcTTuPBE8pyGK7v0rhhJ/LJm7Zl3x+bMyZGEuf2ilw0/lP/Yxe7N5BuRjFQSXKZuxoGjC
	PjIW8Hw06JmA6RjaUGvwyDOsxk89KdiCx9ZBNImrPDtEB8OnvfVswD648sFplA2gqnySY4Ryx6W
	b403eLWfgoIw8qoFMbsI95Kqw4p/Ysdc3oG3CCdURoOT5SFXrAEnLodbWR2KeVs6ejbu+u3ITAA
	GY8xhe4yDdQEDz33kRF0+ggngwR48MA74JIPwsMayjI5aEKb/d+8jRb6J67CiROpDMgspQlzHrI
	J3g8mfMO4UIv8kDhd1rvYGCWuEfAFGpMvch0AiPMPXWW5kLfjUldyEVnB9SDcZ1JPZQMF11AY7j
	oWWLhezpJyOvSwKDHOiIp64nAb7ghdjXxnwW8xo0UwkHq0oJYeRk9RoLumPmC1s/yrN6KmcEMOg
	2idcbRes6ABroBlzhqFjvsd2uh7I9w=
X-Received: by 2002:a17:90a:c88b:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-3aaab2fcec8mr2892560a91.5.1791454919811;
        Thu, 08 Oct 2026 03:21:59 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a23c82sm3819221a91.1.2026.10.08.03.21.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:21:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v2 0/4] gpio: loongson-64bit: add interrupt support
 for more models
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com>
Date: Thu, 8 Oct 2026 18:21:43 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7D6EB1C6-0CCB-44F1-B698-89B0479EEDA2@gmail.com>
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
 <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B410=E6=9C=888=E6=97=A5 18:04=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, 1 Oct 2026 20:13:18 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>> This patch series aims to correctly add interrupt support for GPIO
>> controllers found on more Loongson CPUs. The GPIO controllers in such
>> models do not have a complete intgrated interrupt controller, but =
choose
>> to delegate interrupt handling to their parent interrupt controller.
>> This sounds like a heirarchical interrupt setup, but what makes it
>> more complex is that multiple GPIO lines in these controllers may =
share
>> one interrupt line on the parent interrupt controller. The details is
>> described in the third patch.
>>=20
>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>> ---
>=20
> The series looks pretty good. Who is the RFC addressed at in this =
case? I can't
> really answer the questions from patch 3/4 as I don't know this =
platform nor am
> I well versed in ACPI. Maybe Cc the GPIO ACPI maintainers for review?

Thanks for your review. The RFC contains two questions, the first is =
about
the firmware interface, including FDT and ACPI; the second is about the
way handling the delegated IRQs.

Regarding the firmware interface, it is to be decided how to declare
platform irq numbers for the GPIO controller. Such a GPIO controller
may have N gpio lines with M parent interrupt lines (M < N). The
firmware should a) list M irq numbers corresponding to the M parent
interrupt lines or b) list N irq numbers (which might be duplicated)
orresponding to the N gpio lines. Previously b) was chosen by the
kernel driver. However actual ACPI tables found in the published
firmware chose a). The discussion about it happened in [1].

Regarding to the interrupt handling delegation, since there is no
complete interrupt controller integrated with the GPIO controller,
the interrupt handling, including detecting edge triggered interrupts
and masking/unmasking, should be delegated to the parent IRQ controller.
I want to check if my implementation approach is acceptable and not
violating any implicit rules on the interrupt subsystem side.

Cheers,

Miao Wang

[1]: https://lore.kernel.org/all/allOoYUZXocOfk8F@ashevche-desk.local/


