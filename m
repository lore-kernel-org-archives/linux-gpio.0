Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798854;
	b=blwgtj1rJ0s1ZNtkHTkKMO7ORQ0v16YEZjaG4eN0gRuDP5LcPKt3U2xOvAPCNEfM4XHc
	 RQIKrG3X85WyMFzoDAJ6K537Dmw+lVJUNqF4MENfZn0m83qb1IVVj3JXQIH5g7WgCz1Sz
	 FevdscBEX6NlwsCYxSKlBlnRnT4e6vWIdDYc2EcmbMUD8YVRaT2N4eEWdLpKEWJd9rixH
	 n76rrRSHuVxCAVBIEIm/HXCPt0A3KkcLFxWmHIsYaZN5W/mzxrMJdSdZwa86lC0rXxHiO
	 +8TNfdhqm3RE4z1ge8L1iALM0feyg5RkWDNxfxyscJm0PJJb0z6BvP2rPAXKgXmlxhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798854;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dBk58bgiaSYO++534GCoI4z1lGQjTQFVViflxC/DUZs=;
	b=2wZYhJVorxI0v+031bVMCJPecqaS/4LP1NVt2Vp0eUbzUOp5OYWx9MVwg8MY6BRR09c6
	 Z820xN+jEri1Dneo4/f58hiOTxa3QONHDBw3+LDyGVpYWo1GHkbnwR8cjMfd1ZQqAs7ni
	 8os28Isp1lXwv/YHaviDQ2BW8kqNO2NnA8v46VaOQidUIoWCiDDEOkKgBmZv8pBD1Dcb8
	 ELIg3sstArWbgbWZs6LYwDAyHdvdI8nuwzD//oAyxxooe8zHh0/59UFqKwZEaozeKCUSn
	 jezHCOVZqA0GS/ne+5hXyKCI8xN3HveAEtTsLXLU1LomCo+UDNPMvZJ3ilpwj17Cccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwugHvY4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C860606A31B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwugHvY4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD721F00A15
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798853;
	bh=dBk58bgiaSYO++534GCoI4z1lGQjTQFVViflxC/DUZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HwugHvY4AfiC0JJx+xWHiDIB65WvtCXjwr2MIvQT5ssmx5urPKMDl4qXozC5vIH3n
	 stL4SIS6eaIwCw84/gALIlL3qWkbgYmFPZGmMZZ5VfkOi5bUDP7nXu4o7A7dsagw0m
	 SIAAj/HEDof3zl0Qg/EFjynwabyOkG2gkzI2b+pIjpiRX3skvVIARz+yZKlXmxEdXb
	 Qev/BWulHqh6Eg39IPYgyj6vK/+U7R1snJhrYVnlK4r1wWKbJ//vYBIUZp90j3Ah2n
	 rm5Wnk4qDwFvSPit572nlOTlD8fqwOzG6lbNmqVinOgyassqpOKs3r//IARZgbjNIt
	 s3mrT/BsVTl+w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso537390e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:27:33 -0800 (PST)
X-Gm-Message-State: APuU4Z8chF3Lak7YGKh09y1W6YItWwoqZ/DsPEBrRuyoH24EDa+L5hgP
	Wf272L4Y6qbT3jHKNO/yD8jXCG1z14owA4au2d/TWvqnLUrkMMbyDOJne/auANwE5mMxg2bKb6t
	d2S7Xfp946ChC8oMKQhntrMht3JqopaY=
X-Received: by 2002:a05:6512:3409:b0:5be:3720:1393 with SMTP id
 2adb3069b0e04-5bfd957ba22mr5521555e87.51.1793798851974; Wed, 04 Nov 2026
 05:27:31 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023151209.58772-1-haohlliang@gmail.com> <20261023151209.58772-3-haohlliang@gmail.com>
In-Reply-To: <20261023151209.58772-3-haohlliang@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:27:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=y=89dCKmCGC11row1Mag6RdeTj5FVL1gonPhmpeyK7w@mail.gmail.com>
X-Gm-Features: AclHuK9oak2Ndwa0rlNcxXIP78HVDGk4Qnd2nfEL6l83940QRwB8MQbA06r5Mqg
Message-ID: <CAD++jL=y=89dCKmCGC11row1Mag6RdeTj5FVL1gonPhmpeyK7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: dwapb: Use gpiolib irq_set_affinity helper
To: Liang Hao <haohlliang@gmail.com>
Cc: linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:14=E2=80=AFPM Liang Hao <haohlliang@gmail.com> wr=
ote:

> Wire GPIOCHIP_IRQ_AFFINITY_HELPERS into dwapb_irq_chip.
>
> Signed-off-by: Liang Hao <haohlliang@gmail.com>

You are not describing WHY you do this in the commit message.

Yours,
Linus Walleij
