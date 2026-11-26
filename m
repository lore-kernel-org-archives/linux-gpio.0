Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707422;
	b=0fz/3cwa+zbWdhOpyHBnN9W59ajvwwxQBk3J/UMZbUyR7tol98Ou9D0xKv1xAQxT5yzG
	 2voKQkpjIXOfW8suDpc0sYKKUcPKovdn+1no6hw1ABDvmVYlSixlZUYIWEZNdY+28PaqX
	 UZQwAhxcctZn4Ccfdl+3xcT6VvyWLwvzhgfc479f4EwBX6G8CCkZF4QPwvE6Q4OaobW62
	 s9oo5kKSgrjhzhH01YsPjMqMJ/ajKQ5FKGcpyGQDmZpGkREmyPwjZm4AbTtKy2os+d4hm
	 LCXn0G4DqYr8pUb6EvB1MCAC137+1wbUkJIRfSQ6GnXnyYSko137VgeFil6HwVsuMcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
	b=cWJXGk/5fD62BGTG8/y9k15RpigBEhqVRXqPqh0if2IhGEnFn2L+lS9ljkQgokNHSi/Y
	 PCnb87ScNTC52Q4vGu+sXEIOP0p7e9Dmk/BiRy9EBgaz/5tL9KpJiP39ljN6qWOcMuUiP
	 fjAAJR+q9KZjasofVwu/QQiK/pkWDwoGyL+mSQ5oYWk2l8B178XjpAO/5l5wuFAAWcBuf
	 HzA7kTRqh5DlGWfNb/PyOARJmihNt3LMeXtjtl+EeCS+a57O1kWNq1SZmqvbXwUYEbGOV
	 9oSReNCuF3wYuCnedETpLll4dbc99/UsS5tzkkdqNvDnUQ2zUd+Tq2WojFTgP/u+o+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ubgkt+Al;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861D1606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861D1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ubgkt+Al
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so6369355f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795707421; cv=none;
        d=google.com; s=arc-20260327;
        b=DGtSSfGuSlEN/dxsJcNjxzJxHt5zVlxI/CgsNM6gVnT+QblApqMpU56pDy0LZScqsc
         ineJKEHSiP3yJ5+IygcaI/5im8k3OKLkies36JNi1VolrILLs9TDKLvae3gnsIMaU3py
         H3jUZqgefZ1CLvdfuMJwMdljOikZwLIPlI+1APqgBnSxHGR1vZgRGAjAiCSAxC0DJdxq
         PbtRWjr0kIFE2zznbaHzxOLnt+/dIkwSXwe5/xsasVeAcdeY3WiAXG8APhZP9yYnt03o
         +F9JPNw1YtEDevWQoD6h5rCMF8gItWBahjcH6knyKRJBbAPnvRl0PEU9/SKhaWtQA0Jl
         pZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
        fh=vqaQcBah72nIkQ5KPtzT/ABCph7atSsPfWw7jpth2Tw=;
        b=hNg2bk3x+WETLgyHua7a96hlw/rSbc0fCZJQg6D/R4FuRGka2+nRIVTW3j96W+xEqM
         6zq00UTyFDiaLsMlmvMPmzBD0C1sLAAgy+tm3HIoukzkN2ePtYzrLH/sYaVwbQ7CmYUw
         TNCnnTVfM9F+GU03rdDozJE4CFAyUIRvFQuMkPR+xS2fd8tzF9M/r+sQvIaQxb9k1oEz
         CeZIn/i/5pFbWj+KiQM+AMqkXoBKtMTAv3mlsU2F45xYpRieGJxoMKNxAU4epD9qM3DK
         qBTLgKzz2BSrl7BQkkAVCSwZxpGuISbeb+sYckJriBvS33+aX+JA3dLsL1KRYmaqyC17
         vhMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795707421; x=1796312221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
        b=Ubgkt+AlDmmUGSGz7Mhrr9yYeiNfQH/Toe5RHPp1SlvZ3axazlugfi3JMHHPxIcCWQ
         eNpTUNNbA5M2jGAYXlTmQc8yb9zLRcYPlC4NV9SfBfLqSJvARiiam7ehWhydpkNNFJAC
         iMe4MoQ65gNjjPh9ZDjDA+vHxOZlv246QqSOrRROLnYpwtCpohMb6HQYi22inFTq2Zw3
         njil2DOBB0EIZRL5LSC3f0AX5fKn/dGIWwi9hbZ6I3DmytUXT/N2ALmvz23zSbRtYgS7
         vyMopYP/XtMVPZSIvCTfJcfHEBrQA+BBYOMVlqkdCOVF9/fBr4FUV33KCDb0rxSah0mb
         nOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707421; x=1796312221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
        b=XWs2OKsKdIoUiR76YHt/562hhQpFOqqavtB5Sc/WbGbvZtCdMm93cNvNn4KmQsqxqi
         Kag6P1555daoh3sHeAjMXGS05nGk10QWRWOkcbi3jtE5KaGHato1O+CMrvmY2nCoh0/a
         at+9VoS7ZJffHJtzT6N7oBANpVlv9k2AWXf+HqvceHz27dig/bRpzEDCeW1IEHv6VlT+
         z3lLN1NmskgsB60SLPN+oUc7k+DNAEvO0uUtjDCtltQ5rjTUuCe0ARHsvsBc6je4F7aV
         KplB9oCNuupRK2RZoJsXw51azlh151yHQmPbhe/ttsg7tLtOejxWS8gDHDU+APCCYc2A
         r10Q==
X-Forwarded-Encrypted: i=1; AL+hErHbCN8KaQjAhNN9dN2d9fcJ77wsBn4yU2BoXRSY5PK5md3UgsIWkjbVrP9upKQDFio7/iyRQM/SrIkB@vger.kernel.org
X-Gm-Message-State: APuU4Z+1cYPRsWmBSqwvIVXexdMRDlggkZZf3UJIm6RF5+2srQ91s4Ud
	7Xa/OkSZSPBuBxU2dWpmB9NxwKzauZa7dSoymXfjvDvwfE7JgqqMQ+oTWHbB2McsbpxRAMVvviM
	cDtQXo7MkjSPKDOhGIoHQp6sPSq0ja0M=
X-Gm-Gg: AZFdTZdC2q9K3wtIYFDvXWnC9jnfDMiBI5AKh6ud4d29aQ7Ypuh6ros0jbwnGkRQXS5
	D7mg/WFzDjitZwB/7CBNCY8Ra0DAkObcTPlQEkPS3099ShOiYvSVp8dJowt0XAkUK1R/hsrCKgM
	jlGLrpCwcQIme1E8RhTLIggI7RE6SQyZKJwc/Fb1BIKH/ly3LIh+pOmJkrQQRnbvooiaNtVmxex
	OeENBaHcVrl8XEz/7896xOM/X5OrkEO5J+2/UDXg0IM5z+pZ4EESWNBZMCdP2tCxo0k2xUW54OX
	AE71pms/Shgg4PEiiw0Zx1FOzvrWdwqUFoFtI86nYzLWhZiyupb5tzxyU4tTbAvVJQuQMWxuTjz
	agpJ3MuefzPSSRKez8hOb4YOoKkYAXKce2Ji+1g56
X-Received: by 2002:a05:6000:2507:b0:4b7:66fb:b092 with SMTP id
 ffacd0b85a97d-4b766fbb479mr18549308f8f.48.1795707420665; Thu, 26 Nov 2026
 07:37:00 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
 <awhPAzKefJVW2meb@ashevche-desk.local>
In-Reply-To: <awhPAzKefJVW2meb@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:36:48 +0800
X-Gm-Features: Aa3M54pk4xmmfA0tYss79tXijqcYIwfVpGXaRa6BXvaRt_qpUfc6C8WO5pnowO4
Message-ID: <CANYHO6o-eNMV1YkRfP=W7XxmefBW=U_CALRMyWSixkXzk1uBtw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Richard <thomas.richard@bootlin.com>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 26, 2026 at 11:09:43PM +0800, Gary Wang wrote:
> > Add support for "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
> > "UP Squared i12","UP 7000" and missing groups and functions data for
> > INTC1055 & INTC1057 & INTC105E.
> >
> > Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
> > on the AANT0F04.
> >
> > There are no compile-time dependencies for each file, all pin groups
> > functions data will forward to set default when pinctrl upboard probe.
> > It shows an error when run-time dependencies are not mapping to right
> > groups and functions.
> >
> > The pinctrl-upboard is provide additional driving power and pin mux
> > function through native SOC pins->FPGA/CPLD->hat pins for flexible boar=
d
> > level applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
>
> Thanks for update! Looks much better now. I'm about to apply, but I want =
to
> make one thing clear before that, id est is it indeed ISH has only a sing=
le
> UART? Or do we need to add an index there?
ISH has 2 UART ports, we can add an index to identify.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
