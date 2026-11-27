Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773633;
	b=NFnk4WwQ1hXUf0OgqB5zT2UWUXXR1te2G5LSC+oPf0dA8ZumgG7Q/C4GkoGb9jf8Pu+1
	 CLHuJvXpPh9wf8iaqP9Gs0ES0NgmNYDqRqb8PmE4d4JYrkC0Rwg+XlyPF7E08HXVqzrln
	 pvP/2lr8rkBpydUEL5ehBu2SPK3Lk+enuTZLQvW/6VU1ZfXnJRBr5iiNn6a18yLLfwbn2
	 WnnW6/IvXOJuJL7fNju6zCgfV2FjFvjVenW90R5Epnmo/0AKFLKMdtqRy0fPcUOpuZGrg
	 JpxkAflCFIHAcZRF9zD83wC1ICkQYjsUCiqDOqgbOUJAdcE60AUC1JMz6E7P1qT9ynQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w3/cmtiisKzM85DZ9j5HhlHhToFrZKDSg3ZsF+ey+ZU=;
	b=IToeF64XzexeRkEajMh32pThceAtW5cUA1qFWU/9uZhw413ma3eetHccmrkt1Hdt9J1g
	 ecgGvY8p//atFkvRevtNFVRu4RA28JOz8sMLosXe1ij+w/CsY1fEl1X5Hes/E1OndjkBT
	 fidtuJUpkk4eNA/j3ET7alP9qsfhamsJpTXFkdXnMeu61DypJe8IkTgRwhWKX/+IxXj20
	 aXh7O26e5Rdc5ezvXvk9W/NbdpbPETIOpQcEQ3BZAMhdfhM0IFWTMuqM7VHPUK2pEfOXu
	 DXwHTxSR1S5Ax1TOl/BWj67rmqC3OClT6/K0EIn/irnulAasTy8lJ6plHb9Qrj60opw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9x4gNE8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DAB606A326
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9x4gNE8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1091F00919
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773632;
	bh=w3/cmtiisKzM85DZ9j5HhlHhToFrZKDSg3ZsF+ey+ZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R9x4gNE8yldIhcPaDxaHI6eE/JmIImL41+A5GEAET8u+Nj3J2JrTq3vfpCziODeYG
	 EKvb48Prxf551zKOEbQ/SAr2ZBcHik/oLaflW/lEhC6XEEP18feKH1aE5DOrUnmCgV
	 kkqZRVtH/jiyhRke0DjbNDydyxzWuDqHUKXcAAPCVVtxXZBp0EQ/aZJtAKqI6PwLCi
	 MJlY3Zi+shH8Sgw86uLUkE0DVYkAZ4Cl5PROEG1NcQ8nxXCG1u6mVJaQr/SvUnm7xk
	 dGra3cDCwuJE33Xq7KM5ztkrE/2f4oyChDvkVz79y5VSXZfCTwk4WKlIauL0+IAKUQ
	 lvE7cCKRcFKpg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso7124620e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 02:00:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEoaLBx1EcwpPrgu0EIdLIRz2u1qRqKQf+SRT1ozQo8wIp6uMQD5ogJtIHm/4xq2k7llY5mUf+HW3zk@vger.kernel.org
X-Gm-Message-State: APuU4Z/bMT6RNIioPmLDXFHuCIaSmL0oIFNBkXZYiM7ENTWQDFtc811m
	u6G4ZcUyFs47gsiFGqruvDstACaYyajZ6HGyp6GaoI6ziWLwvXJ3I7dG2wfUIYFU5qainBK+Ddm
	3w4lLRNAxWBFkIcxZqwL4w1fJpyf2VkM=
X-Received: by 2002:a05:6512:1192:b0:5bf:f40e:b54 with SMTP id
 2adb3069b0e04-5c1bc89c40cmr7213695e87.56.1795773631380; Fri, 27 Nov 2026
 02:00:31 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auEa46zLITsk-pAa@MON-LT-C78453.mchp-main.com> <CAD++jLn2dBDakGxRzCby5bUJpianq65=WdmHKrpeF9ZqwH0Zgg@mail.gmail.com>
 <av8sKVcE17v56Vew@MON-LT-C78453.mchp-main.com>
In-Reply-To: <av8sKVcE17v56Vew@MON-LT-C78453.mchp-main.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Nov 2026 11:00:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=TScQaESPGjjsggLfJCMkqB4J5evp3zF71mqTWUaE-Ng@mail.gmail.com>
X-Gm-Features: Aa3M54qSO4ptRZC9Ff8v4J1SaXHXZwVtctPaObijvDRT90nSM61XPu45j_TBFvc
Message-ID: <CAD++jL=TScQaESPGjjsggLfJCMkqB4J5evp3zF71mqTWUaE-Ng@mail.gmail.com>
Subject: Re: [RFC] RPMI pin control specification
To: Charles Perry <charles.perry@microchip.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, joshua.yeong@starfivetech.com, 
	anup@brainfault.org, rahul.pathak@oss.qualcomm.com, 
	leyfoon.tan@starfivetech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 6:04=E2=80=AFPM Charles Perry
<charles.perry@microchip.com> wrote:

> > Is this spec so similar to another four-letter firmware interface that
> > drivers/pinctrl/pinctrl-scmi.c can be used without changes or perhaps
> > by a simple addition of a compatible string?
>
> No, that is not the case currently. There are semantic differences in the
> protocol, the message format changes, the enums are not the same, the
> underlying transport is not the same, etc.

OK such happens.

> On the topic of SCMI, are you aware of anything that could have been
> improved or should have been done differently in the pin control protocol=
?

No actually it's a very good role model.

I first provided feedback to the (failed) ACPI pin control specification,
where the big problem was that they defined a set of pin config
properties but no mechanism to extend it the day they needed
something new, and I said this was not going to work. Also
ACPI had the ambition to manage a lot of pin control "behind
the scenes" which led to low power scenarios not working
because the firmware was doing assumptions about the use
cases that were wrong.

For SCMI I had the following requirements, and they took
the input and implemented it:

- Follow the scheme of functions and groups defined as
  strings, the firmware should expose and enumerate
  the available functions and groups for muxing.

- The most obvious path from pin config to firmware,
  just send in/out numbers corresponding configs.

If you look at the SCMI driver you see how lean and clean it
is. I don't mind another clean driver like that :)

Today I would also add:

- DISALLOW CUSTOM EXTENSIONS

Especially using RPMI as some generic transport
mechanism "on the side".

Because what happens otherwise is that people will
use that loophole to cut corners and keep doing things
the way they always did them and then the abstraction
serves no purpose whatsoever.

I.e. make absolutely sure that this does not happen:
https://lore.kernel.org/linux-gpio/20240223071557.2681316-1-peng.fan@oss.nx=
p.com/

Yours,
Linus Walleij
