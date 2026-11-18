Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795015026;
	b=1HmB4oo2AyC+zY13tB8/iDiXlfrhPWdWSklMlWWN38Fl+JJRdraHOxEmBEp4TZEsO8/p
	 CIw1SoZ4+AcJUn3+YZ7n+Ig3ycSxg6xarci6CrfOGx1/aIXCeLrqI7isFrMt366Y+HBwz
	 I1FgR4cd/qGyS8r03M4fQplodepFkD0yPtwzbYnr3LnDGQ0ZpquN3598Px9G55s4OsLMO
	 PksSGWf+I3lpWTFfr/hCf+FdXDQc3GINEVySdVVY2BONVOQW4JE4r/bTE/DfGEg6rvu3u
	 PdwEv7HSuo5Z0SCvB/6e659/wwDm4noeW1lbEaSs3CFl28IckHmsqbJChv0phpiTIBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3MFvRoeUhk5ljF8/s9Hi3fvnC9D2Uw1E3rkDzz+bJPg=;
	b=sNCp4BUTrX5vNfQ2yp8fnKRpL4ql7yNZC8hZw3lcLLL8KlNW6hrkVKyIa9b+inS3v8D6
	 3o8jdlTrbwLbFxWcGSC5jvNtmMbPn8+OGXK4xAeRECvGj0XbcNgSlbHleSVmzdDWqfpt4
	 RhT1pF0uyEltLHOrTGveraNyCMJWonaqqn3nxxOzrlBaDXNXepVlZ0dbndpHqzSODyOnM
	 fVIHJ2v3FJODbfneCi5hA5RPNCw69KJO/vBlx+XU6cIQ2Z+CTUMtNPk71hhU9N1/I9+yC
	 9mh3oBBt/U0ilxNYMV5EpwfCLg7Ab1KTv3LLIUYEwYC4gCsHWVz3sjTspqSXcdWfdyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4jjehw6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDA606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 15:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67EDA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4jjehw6
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-55e0090c580so424541b6e.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795015025; cv=none;
        d=google.com; s=arc-20260327;
        b=YcxCTqOPrZLyS2dH/D/ozr5N5QLw+bshjMQgnBEo/C7dt498sPDQVG0qVa003hObUs
         vhxSB01MVHIyG0SuAa8FDLtMWNhnVCXI6DMbPOUyotPCxvMuOZpZgc0aIBICxVNGEJmj
         Kl9sIThvitO900IywZFU9foLLaJKcQfLrzQPDOx0d1BrQZghQAk9crFHEHMf3b1JfJI9
         xSVHPy4RjbHDxAPNsMyU7QuqphCP4iloqBz+ww97LXIvGP8uhVxvw3E2xrNggrsApuiK
         uFDLYRDCM4CJunpTrPZ8g4Oi1tnRR4jKUM7ZX78xrobrm26BGey8dtlF4NaMRPi0Ubt7
         ZOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MFvRoeUhk5ljF8/s9Hi3fvnC9D2Uw1E3rkDzz+bJPg=;
        fh=yWycgT9OpVjm7uRcyD9qQWiysbYC3Vj4NzM6DanmRc8=;
        b=fPMgza1mtMro1TnZjQyaGpqIhroGK4sCfVZLjX8wInBthqxAshA8hukbrVT+u/9fCC
         +42uekyryc0DAI4riDfy3Ywf2nRHrfLDOiAEHfQyMDBfHMxAoHrvgYUJXIKKQIO0Uo2e
         qXk+Y8nFmizZBqm2j+fFT5IPo6NrmKrG1u1ENxlZ+MX7UA6M7Jfsk/maTxbgdRwD8IxB
         xfjrwQqeGCsdSJm461VxgOo1bJSLXDW+CSZ4gPDMq9xUSspNHGNE97HjnLBBQtg/8287
         txd0/fXRGIVbJiZcq2whfE1Q7BIIMptALyl3xLabquz3SygF0EQLbkxAfe/VevCrAouM
         9lxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015025; x=1795619825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3MFvRoeUhk5ljF8/s9Hi3fvnC9D2Uw1E3rkDzz+bJPg=;
        b=I4jjehw6tERyWrKAZjBgbtnSEuA9SiBvgtMziz4p4yEuD30qZOlxfvR5FCD4meUdeI
         vN0SvEItcVLgTVHKbQh5dZgyNrFS869RQJ/ITNcZQjNqFEa0sJJ2TgcUhgWVSx2NgTB7
         uhIBgFzN4z9oVXvCiv1W9LdUvF8f/Ibje4nMThhLmsFmvYhSerXFI6zNmjBSXWJkDA17
         Q/FBmX8KwuqviL8WyfxvOb4W7EPfm3dSXz1127f/1NHK6I5a8EoJLHfKntDiwryDGWbL
         OwJEuchrGoHp2UeMh0nhUFf24BqYEmFNF73RaK+cdXCh+ztvGX86+0hvDEfviRN0v8cD
         J2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015025; x=1795619825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MFvRoeUhk5ljF8/s9Hi3fvnC9D2Uw1E3rkDzz+bJPg=;
        b=usG7w9OuL0WzLMZ3+MOVAf04g/P0DG413x1dDbnZgaYqDPT1OJbyYaNQ9OLwkv6urf
         1Z3UHOprE8TG73LWhT60n6Q87UCVUhJKq1lvQSOf0yvf84gImx9LEHm6aTAvLf8Ddx5W
         IH2R6wnRsK0Auto/nUN9F94ePtKfM/wcvLGdL93+uHwl5CxG+efLy6cR3nIplTx0zlb2
         6W5B9Alrd0y4AqDg8LQwMK66QfxkzYmqiawbEw89u2yjZQhbrGQBRPe1D8hTuG18oC0y
         dohwCe9R1UWCaNDdkU33b3ywx+BmtB/2F0laxUT3VSHpVgGEnShwPAxq912eQiZRE0L9
         v+9A==
X-Forwarded-Encrypted: i=1; AL+hErGwF/QLbJ/27qMv3lSuSOgo2spNFRR8BYsKanAK1MAo7UDyyT2o3zoXMHsBlYlbkfUx+OvfXws+ubPM@vger.kernel.org
X-Gm-Message-State: APuU4Z9oqj5gsqiX5vE8LR8EWQnlfIwkXUHfBzW924RFDXICjdZUR+Vs
	wgEoQdXguQ0pG+S0g4sUrbGRncGKGliwFHZlHYlpfXM9B4B2ASI/HO2dJLqBmCPVEOlOSdK5JdS
	/LnCp3Luq4rB4Jf1m+9k1fFrBAHq42Xo7DpPObXM=
X-Gm-Gg: AYBFou3SIBdwhrrn0Xc6l8hM12x1QWeoqpppyB6lQuQzhbwiMcCbLTVTo+vrAzVRIfD
	INJzO5jaWnSyoVPcUBqldjoQhWU/PIQolw/jiSnEU5/0VV73lbh3IE175Vk+aEcpDZLBdU2+qJT
	y4ThjWTIVPwllz8CJk1XZM/2k47s6xNtRDcLPt6CwER4cfY7GB1xVUnFVql59LNhwSqv29aNfbE
	9BfRKDtxyztFkXtkx0gzNGm1uQGjZvXeEK0ZCY4YLLdyVK92NAlbFGz8aJ657VsSXbMJCk6Xx4m
	/0tWfqQBDCMTQE+VseCfVaFiVQ40CRydHOib8/T19qnbdyinNXyPjC2Lm59IfqacEL6ippmydJa
	DXfU8Z03Odb+xepyYwwSEpoAoG5QNGOWEGO1k/w==
X-Received: by 2002:a05:6808:3086:b0:4c3:d087:4446 with SMTP id
 5614622812f47-5773d02801fmr3999882b6e.42.1795015025183; Wed, 18 Nov 2026
 07:17:05 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0935c08b-828e-4a8f-95fc-04b82ab30fe7@bytesatwork.ch>
 <knel65hfjbq3j4trrtrkdwg5brf4mu6md4fzudtkrf2mznqrnp@6nitoipqu7k5> <CAFOBSkR9eHu_2UZkyu-v8saQ2YrKNcQxbLbyKNkFWtZw3XvMMQ@mail.gmail.com>
In-Reply-To: <CAFOBSkR9eHu_2UZkyu-v8saQ2YrKNcQxbLbyKNkFWtZw3XvMMQ@mail.gmail.com>
From: =?UTF-8?B?TWFyw61hIEdhcmPDrWEgRmVybsOhbmRleg==?= <mariagarcia7293@gmail.com>
Date: Wed, 18 Nov 2026 16:16:54 +0100
X-Gm-Features: AclHuK98Ml_a4Ayf78y3QDSRvcofwv8XUL55T-_DP-nZSxgEKS0Jj8sKMI2yVgI
Message-ID: <CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com>
Subject: Re: gpio: pca953x: TCA6418 support and driver design
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Guy Morand <guy.morand@bytesatwork.ch>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resending in plain text mode, sorry)

Hi Bartosz, Guy,

Very sorry about these bugs you encountered. The testing I did back
then did not reveal any of these problems, and the teams that use this
chip in one of the products at the company where I work have never
complained about the chip not working properly. I will raise it ASAP
and have a look. We can try to work together on this and define more
specific testing scenarios other than the few tests I did by hand
myself. I do think at this point we may be better off moving the
TCA6418 to its own driver if the differences are so many.

Thank you.

Kind regards,

Mar=C3=ADa Garc=C3=ADa.


El mi=C3=A9, 18 nov 2026 a las 16:04, Mar=C3=ADa Garc=C3=ADa Fern=C3=A1ndez
(<mariagarcia7293@gmail.com>) escribi=C3=B3:
>
> Hi Bartosz, Guy,
>
> Very sorry about these bugs you encountered. The testing I did back then =
did not reveal any of these problems, and the teams that use this chip in o=
ne of the products at the company where I work have never complained about =
the chip not working properly. I will raise it ASAP and have a look. We can=
 try to work together on this and define more specific testing scenarios ot=
her than the few tests I did by hand myself. I do think at this point we ma=
y be better off moving the TCA6418 to its own driver if the differences are=
 so many.
>
> Thank you.
>
> Kind regards,
>
> Mar=C3=ADa Garc=C3=ADa.
>
> El mi=C3=A9, 18 nov 2026 a las 15:48, Bartosz Golaszewski (<brgl@kernel.o=
rg>) escribi=C3=B3:
>>
>> On Wed, Nov 18, 2026 at 01:25:35PM +0100, Guy Morand wrote:
>> > Hi Linus, Bartosz, Maria,
>> >
>> > We have been testing the TCA6418 support added to gpio-pca953x by the
>> > following patch:
>> > https://lore.kernel.org/all/20250703205740.45385-3-mariagarcia7293@gma=
il.com/
>> >
>> > On our board, using a 6.18-based NXP linux-imx kernel, the following c=
ommand
>> > does not toggle the requested GPIO as expected:
>> > gpioset -c /dev/gpiochip4 -t 10ms,10ms,0 0=3D0
>> >
>> > While investigating, we found several issues in the TCA6418 support:
>> > * The driver uses the PCA-style i2c auto-increment which is not docume=
nted
>> > in the TCA6418 datasheet, leading to corrupted registers.
>> > * Input-status registers are not marked volatile, so reads can return =
stale
>> > cached values.
>> > * The bulk get/set paths do not reverse the bit order of the first GPI=
O
>> > bank, so they can read or update the wrong line.
>> > * Interrupt handling is incomplete: the generic IRQ path does not conf=
igure
>> > the TCA6418=E2=80=99s interrupt-enable and edge-selection registers or=
 handle its
>> > status and acknowledgement registers.
>> >
>> > I have spent some time trying to fix the integration, but the TCA6418 =
seems
>> > to require several chip-specific operations.
>> > Before this support was added, we used an out-of-tree TCA6418 driver t=
hat
>> > worked well for our use case.
>> >
>> > I think the current support needs to be fixed, but I=E2=80=99m unsure =
whether it
>> > would be preferable to add the necessary chip-specific operations to
>> > gpio-pca953x or replace its TCA6418 support with a dedicated driver ba=
sed on
>> > our existing one.
>> >
>> > I=E2=80=99m not familiar with the subsystem=E2=80=99s design preferenc=
es. Which approach
>> > would you prefer?
>> >
>>
>> It really depends on how much model-specific operations there are. If
>> every callback needs a completely different implementation for TCA6418
>> then clearly, a separate driver is the way to go. Just make sure it
>> doesn't break the ABI for OF systems.
>>
>> Bart
