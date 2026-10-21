Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586103;
	b=gZ6k8TZkYFcEZpRTX/1R/z+T8Cc545z2hdSFcOJSZttxOXWaCt/vDcvoV7qvxs/fP5xf
	 MxatYAdAXFpnwP4hcDshiNI4nsyM46pL/+RU0EhYXisxYOCJXef5w5KnUy09pbGpn0DRF
	 d/BghH8hpvp9TmY6XEnwdUnzwFw4bYAXkQIphEnWf2WUIfsW9Pe4o4DEysgR1aQsj9CPa
	 iWcwgJf2cfYVuNNT6DuNypxkfD84/Gz+dWaSZamDuC7PFMB0eTP7FaSc5Jy+3CaMMqonB
	 85bwxPqWQKrX2v/GqPAqmMHyX4179gCqWA1PMgdcU0tDAVrOmBQipZkmVXgyWfIlN+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586103;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=kgJ19pJet70DJE+zcs5f5NEgocG1iiZpBiYPZfVDxxs=;
	b=ibZ4dELDzPeDT8F0+sNpvB7mfd6w8eJ0xic7vxCKif3OxGEKACJvaYA75UmBilb65yPI
	 TFl4JUmPD1FQh/gJ1W/+vUYLQlr0MhLLwb5LFVtnGIMChvObBiEBZ8+pHaRRZlaA0vmiv
	 JlEXbjlAVJtbxJnDkN8HUDZdzw6UL81Onpj6vOeDGvK07WRKnhLLyXdj4je0l4V53Jz9f
	 RadkrQcOMJaBuB/g9W+eGbHHFXgtYFqakhIyEjphS5NV/p68wpUSA35qc6GhwKCxt0Qks
	 IqHfQVw9SuqnVN9GLwcunn5pecI5Ecw+TfahpUeYyySLeIngUzUipkCw9lgdgqEBtxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GbOkmBUR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C0E60A2611
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GbOkmBUR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EC71F000CA
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792586103;
	bh=kgJ19pJet70DJE+zcs5f5NEgocG1iiZpBiYPZfVDxxs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GbOkmBURJ1mkUMB9moKsu9fjNBx+JN54ciEKZVy8kcbnP7EnEg3g9RDQDcWC16/XC
	 HF9KyPZbthBszX2jM0ZeOYw3ehUEOvLsFJfDjqsPoh5vKCXvKkpd/6k5XDNTiNHDDG
	 t85N5fZYDJSUGAli1+drR2/cnbLsJTCgLrnInREFm2OgK81DNmQ0KUBnjWjFVC2P+q
	 YK1PQl4JMWiL921AsDdsGmso5DxM6InW9pDtq0i32t9bmbXsi5PSxD9D05tpRNWgVp
	 hDkadRe6v5X0Q+DbgHco1mREFDf4+KAg+3/piRZZmFgr9eb1MSW9SL9SAzXsQBzNSm
	 JRauP7BfgdHTQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so5690641fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 05:35:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwv7tTAxOfjHBPwLUGfWY2rxkGg7TwIjxQWnpBK+QCYJlNOLrU9FFnZ3XvBUp6e6sE6eTIIUFXdrRsd@vger.kernel.org
X-Gm-Message-State: AFq9FYJK//7gvF5UXzdbPwOevlZebvg9jaPGVUPFKLmuyIiFWYfILGxY
	81pRX2ANn0FMBStM42ugrUaNSCpa1TVDuFL371ves+o3AOxgCpMGnvutQd6LOGx41SrHERwCv/0
	Q+dKtKtlYi3qW9ShZgBFViS1W/1ALJEZlscjjBzcioQ==
X-Received: by 2002:a05:651c:a20c:10b0:3ab:f9b:974 with SMTP id
 38308e7fff4ca-3ac441cf4d7mr4584441fa.29.1792586101850; Wed, 21 Oct 2026
 05:35:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 08:35:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 08:35:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021142431-83ac35ae-17cb-461d-9661-945c1edd7bbd@linutronix.de>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
 <20261021125252-51f1f0a0-46e9-4a10-92ab-46cd099c108e@linutronix.de> <20261021142431-83ac35ae-17cb-461d-9661-945c1edd7bbd@linutronix.de>
Date: Wed, 21 Oct 2026 08:35:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfvWo2th5t5CRDUATwuH4pr=mVxRwJx_STgvs+5VRx7Tg@mail.gmail.com>
X-Gm-Features: AclHuK_mJzlXQmhF8t36qa5t0_O3ejdTLOVBk7TPQqy4YQK9ttxEBhf59zdbsDU
Message-ID: <CAMRc=MfvWo2th5t5CRDUATwuH4pr=mVxRwJx_STgvs+5VRx7Tg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: use const APIs for legacy sysfs attributes
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 14:28:56 +0200, "Thomas Wei=C3=9Fschuh"
<thomas.weissschuh@linutronix.de> said:
> On Wed, Oct 21, 2026 at 01:17:54PM +0200, Thomas Wei=C3=9Fschuh wrote:
>> On Wed, Oct 21, 2026 at 12:47:25PM +0200, Bartosz Golaszewski wrote:
>> > Replace the deprecated non-const sysfs attribute APIs with modern cons=
t
>> > variants where applicable. This leaves out the attributes embedded in
>> > struct gpiod_data as this structure contains fields that are modified =
at
>> > run-time.
>>
>> Leaving the dynamically allocated attributes with non-const signatures w=
ill
>> make it harder to remove the non-const APIs later on.
>> Would it be possible to switch those to const signatures, too and cast a=
way
>> the constness in the store handlers?
>> I see that this is a legacy interface anyways, which might be gone by th=
e
>> time we want to remove the non-const APIs. But that applies to the
>> currently proposed changes, too.
>
> If I understand correctly, the dynamically allocated attributes are only
> necessary to retreive 'struct gpiod_data' in the attribute registered on =
the
> *parent*. Those registered on the gpio device itself can just use dev_get=
_drvdata().
> Instead of registering the 'direction' and 'value' attributes on the pare=
nt,
> you could use symlinks pointing to the child attributes instead.
> This would make the code a whole lot simpler.
>
> Currently it is not possible to create symlinks to sysfs attributes, but =
I have
> simple patch for that locally. Let me know if you are interested.
>

Sure, definitely. Is this something that will eventually make it upstream
though?

Bart
