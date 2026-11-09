Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247155;
	b=Qo18jaCaKmPEedzy4kjDo7bTwJxfCge4GqcRgoYGBusq0uzt6JKS+XttZFoxKUYdMWvb
	 tHeQTRHLnV2Ud1XC34eCHHlOuPsp8Rf0BEAllT+I4yfKiz6Olouuu7vHyY3Ae6RP129Lr
	 USGy7LXfCxZwdyjmeOUIOLg2kL8RHPY87tsRKcDUvR2rdiwJiBRqvH4Kq4x9RiKKQID/D
	 Hsa+zmCLuDO2i6aP/zTj3IFJo7LX0KagznbpxJigBJldF51Yw5sntsWYUv/v2HbxyIC/z
	 dSmxA7Oi5/vOJ0++eAIw8TBoFoIqz6GIBd9py1OWr8pA1+KqG93/pPe2Bmk7Sak0qQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247155;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
	b=b8zyv+XamdpVWPdhtd2N/XxqDR735aBYiJuaTj7qTkVBIb94ct3NdLFZgnrbTiw504XE
	 YEVgaSxb/aLQmj4otH4evRy+T51pqZRgQpNuwzq4rBuMpwxRlnNpalWEpiAAeAlJo/nE+
	 rCImLXfmaVhjeF/thlGcb1qnUGl0SzCFFda2DRsmW18gq5wstwYNd25aw8PX2vAjDu61C
	 qvy4d5E1RynSWMoFZHi3uN1ob2FRjbrBegBBqDbOt86ojJtQkU/W5uoqsA2z3g24keG5l
	 0wBkp4k97rFadUjIK+4zoKC6ads5BpABgZJBzdUdzTsa216QPZ6GwYdPglSF3Rqww2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NkyXxXqr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Hfuq1k0U;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D5606A325
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 17:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109D5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NkyXxXqr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Hfuq1k0U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794247154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
	b=NkyXxXqrpF+Xu/J80la0nrSXqdHWwnIonM/+vBN4R6nc+hyEj9ZQJapQQVm7mb0TWBUco5
	cJ5c0Ea5t2T/BOvYXfQ5bmgZfvYc1Ubh8JqzO8CXUlJ/Qeh79IIgu9snMIJenP0cirQzos
	Tk6Z1M/l/v94nxFz/4xL0bsDwyUitfU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-VgjxJwzeOXms5vkdOWdJeQ-1; Mon, 09 Nov 2026 12:59:12 -0500
X-MC-Unique: VgjxJwzeOXms5vkdOWdJeQ-1
X-Mimecast-MFC-AGG-ID: VgjxJwzeOXms5vkdOWdJeQ_1794247152
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea053ef90so24236766d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 09:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794247152; x=1794851952; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
        b=Hfuq1k0U5lj48vN+VVbPE+g94Um9TL7NKt28h+pN/ZNFUl6D8MgsemgnVVqm33u//p
         3pyClyCyR2WrZyljS1BdUQd1gllRbbjlmwxGkP/YFf1rN1m7zvGZAFq6E4l6Ta8jdzpn
         QPdp4/enLhhwTeTrHvYeAc8xJhoqmCB+MzuCbdVGCFG5epxMgchtIpnMQKSB6j/tDEv3
         9ZgLzv1zArLUvhnjJ4u5FkUhP4ghYc/U5BlIagwgrJX9/+zVHeZuPhPXqJVDPz/S5r7j
         k8aa+Nj0tCwsT3Kk40rjH79/VjmtuapD4F3GG+bHm2x1fICu/CN51iM0xFdMkRaVCCT+
         4jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247152; x=1794851952;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
        b=UI8CVExs9A+Qo2yYMreYV/vSqrhf7eOPgGhgBZB6eAkf6wJMjUyYBHuIw0EPqeeNqV
         p3L1tF5X3Yeccr046gCse5vXsWTTvKqs7kWawXaT+oPqqoiRc2YW+aVDB/pstUKeGd/A
         /1fqhPfpDxderIhOs4IwG2xzQLSv8Pp5sY3sNyUWzzhna/3fvkuRvhumQk3Yb1IfWLoF
         q+QzYF+Z1YyLl37XaG+v69eDuBL1bL86WedrH0bOoGDkG0AWz4DXCBac2SzsdWdh4u81
         7/2dV+5QLtRMp+bC27mAMhyKOVbgrlvAgZw1UCVGHm+XQEAI4hfXdk4K/FVZHNCAQkRy
         UMzQ==
X-Forwarded-Encrypted: i=1; AL+hErFeb/e6grYgitqYGRxF4qzRkzZUmA/IpJIgd8ZToJj4ZIWiTkGTXnWvJg2wkfZnCpyfHmHK+AgfMHHi@vger.kernel.org
X-Gm-Message-State: APuU4Z/IxFPixkB7Q4UPeLYu5pGipNkRaOGG5MnYdZdRna53QAwSTcbz
	84NlnHxIB0H9uSyuTEasoHQKRf+ggHAU58H9EiK18RWRK+UIaxSBa6IFWT1tM4YQyt9o/ciO+KZ
	tA1dYegufBpk4OhXgCJGjZwi5qNFtUrndbEK6bm/d+90+jpkCzWvHioVFkRlRN5Q=
X-Gm-Gg: AYBFou3kD+F3aSXQYKVndMATcra4ckqJZE7xLqhVeGAZzqXYBxlAGFQoiQUWRLPK1jT
	b+VBFVjGjRtrE6JH5HnRo9ks6FaW90wMf/U1XMiXsFnVQcVnBUOW4lC0DSsGnyFSiOlMZh4TvHp
	z91srxJmpZaEEXqn37F3lEOJMTevLLg38ICjJRxlcM+ldRhBtWIiDp08Ge05KYYDzZsKOarHxL4
	PRIX6WZTZePfDaPrh/9wrh84f3vUXTxUHLsxtVVO0OHtlCcfisypMM2uXsF0RJs/M/D2Go0tdht
	rLGWQxxWSgfW9n4ZP6jhLo3vfl496SLo1BW7/canxFAhNG8aQ7yWBsulH+qxhBWiwwgIJ/n0LJ3
	eivB94Y4ucJFWBrrPHPiWiYK0gxh1ZnUubIAhvnL7niHBxGBF3GfkwAy0si+RFKIkz+5JOPNiWE
	n2qqJthrw9BtG9vrlIBtfeqmka3TtWTenFQH6LMmI=
X-Received: by 2002:a05:6214:5bca:b0:91e:8a59:5fd7 with SMTP id 6a1803df08f44-91eef724dbcmr7141566d6.3.1794247151864;
        Mon, 09 Nov 2026 09:59:11 -0800 (PST)
X-Received: by 2002:a05:6214:5bca:b0:91e:8a59:5fd7 with SMTP id 6a1803df08f44-91eef724dbcmr7141026d6.3.1794247151158;
        Mon, 09 Nov 2026 09:59:11 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0540a8dsm1273966d6.41.2026.11.09.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:59:09 -0800 (PST)
Date: Mon, 9 Nov 2026 12:59:08 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to
 subsys_platform_driver_probe()
Message-ID: <avIJ7KZxtTzUkpfJ@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
 <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
 <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Andy,

On Sat, Nov 07, 2026 at 03:58:23PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 7, 2026 at 2:27 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > Reduce boilerplate code in this driver and convert it over to use the
> > macro subsys_platform_driver_probe().
> 
> Wasn't there already a set of patches from somebody for the same reason?

I just searched the linux-gpio archives and I see the effort back in
June to also add subsys_platform_driver(). I wasn't aware of that
effort, and it was never unfortunately merged into the driver core.

I got the macros added in 7.4-rc1, and I posted patches across the tree
to use the new macros.

Brian

