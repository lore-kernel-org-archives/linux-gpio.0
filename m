Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866410;
	b=LrIg4il7RGju+KKdaK82VesQkDByuvHvlsFanbm1aAVT+E3P2sWZPyqz6qqKG1LbRP1L
	 zVaL3+IoKbNj+Jo+0kBGPl7vYCjxghy+4dkOMwvSuqd/agjhw7UuHM4HUP5JWRmyRa770
	 Q6qDTDkfoBaasBa8B+z2vRLFf4aecBwAEgmY1O8WX38u4vJR0Wj36DyhdNtjngT5jkl1R
	 9mTPynJqM6Qc+YE/W/QG7wl2iFL+nTqjZVATTKQeRk+Y9p/AxycLmyTnbKGzlWyb022TM
	 NeVxgiocB08ZAy2q4qEVEqtmQVSGHIJhZYLxbar7xiZhjIjJZjWXRbKDKcjJmPk1UMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866410;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jlWCa+Ofak2MkmBMb9UdsVFuinXs/6ER7CxYuPtulJY=;
	b=SvF0srvHlle2zWe4R/zW0UclzWcMcKA4WHmCWlftvRwabvFYBy7qZfuqhswywBpCNJcJ
	 lqqgwke4Ww75XXigOj4VPu/ziLvRi2g2BYRgvft2qd/lJZyFHeWTxQ3/8Qz0HiA/WDEf5
	 h+s4bC+qzwV4m/kdNBtDmlEOmTk8yItYiKx38MO6TITxBmhfOinJVW69EAjg+M1ZhI3PJ
	 CSnccUA9Ye7th8TBvWYC9haUxyaomkmqx/dAO0Az3iiiujrTahkjhvRysIO01M5y6/nX3
	 bAO2pyClQb16nghrtkfceDmOmaWWupuz0dE4pUilW+M1uiZiw+4zxxMv6d93H1z5pqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25370606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48CE1F00A02
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866408;
	bh=jlWCa+Ofak2MkmBMb9UdsVFuinXs/6ER7CxYuPtulJY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Rn91bWU7eEk1jRt5O9Cye/gdcgByxVo4QUbrZuuv03hpN/T3v99LrhoOyk84PGAku
	 PU+gRrRpcKgclU54vnrT90xjd3CikDDaYjaW4UL/0nY4+/yEUSV6Jg502Ref4l9hj5
	 7ciZnp890RXp0WeMShEo2TGD5+wBp9vAG0R1SYfMSU+2nj4T5I/L1wddQIu3tJ32Rx
	 GVgeCxi2vTl/1KkeckMNoSYYgFFxYqOnh7MUeXsElyfwzVh0fNH65gJwFUeajhlTTQ
	 dRqNmmFAl0ybZKll3xxxVfTsmLLmWD4VWJcSNzUhDSTE6ReRyHSrnGMxoDGT5QA0XE
	 JLRYO2WDjMrOg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso1551759e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:13:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzD/880vx0esmbgj5izAiuPRU0PZsF9OqJQozkLkhOPgRP0+iXlum3ezZFMtoXJF/64WJ+Irwu8Hntx@vger.kernel.org
X-Gm-Message-State: APuU4Z/bN2HsUBAbL3YKdIdjnaFunEXXuu0sSK+xkBHz4dN1EaIhu2Wy
	ScAwhx5FNi6SQvn7DfLDmKepDj6FBdxS3x714f2WTrur7s1HmMpHwvSGy+TueLCob5hHMuGQtcG
	rmHmixuTnq85dEldFOvdynv9S3RerDxU=
X-Received: by 2002:a05:6512:3e20:b0:5bf:d206:bc26 with SMTP id
 2adb3069b0e04-5bfd94c7e0amr6889566e87.0.1793866406812; Thu, 05 Nov 2026
 00:13:26 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:13:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkS7OPcA5hA2tLhhFFkji29Lcr460a3DPV5=UeXyc5sJQ@mail.gmail.com>
X-Gm-Features: AclHuK_bhtGwCSU9thh38-UOS8a9eTleEx-MeSVkCBr9loj6IWXhGYq_ixlEevs
Message-ID: <CAD++jLkS7OPcA5hA2tLhhFFkji29Lcr460a3DPV5=UeXyc5sJQ@mail.gmail.com>
Subject: Re: [PATCH v1 RESEND 0/8] Add ADC, eMMC and VGA pinctrl for StarFive
 JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:23=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, pe=
r1,
> per2, per2pok, per3, adc0, adc1, emmc, and vga.
>
> Series [1] completed the submission of the first 9 domains; the current s=
eries
> provides pinctrl implementation support for the remaining parts.

Patches applied for kernel v7.5!

Yours,
Linus Walleij
