Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263427;
	b=WxyLiMShaey92bBraPVCg9EKKat19OS0q68yJsAu6X7pfwZ/v5CjpLRXBCBP4FlZcMla
	 y0Z2gtQ3fCDYHd3u4bX4x/3xhX7D5fvG3BC6uUypicVFv1w5EZxdO9E5zxz0XN6hTY2Jr
	 9CQgVDkCT6FdgeLNbMtdcuYykqjrYBcxRs5qL0Dk2akMA5cVAACkklYsLaoqC7CpFP0wh
	 xuZt9wWJp/NX+t/IpsTrbHrXWaAcRU//HoofmnrbgPbIYtBFVDkXF2xzVWsmmB4WnTTYM
	 y456O/PBpvhbH7z0KTHBt86YQQJwYI1J54Dvh9HwzcisNQkRsLeJouA/rmcQjLyR/6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263427;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ikej2X49QtIj36ZiDznwF0O2B+EjT+ddV6bxiamU910=;
	b=OO6Au8AjBlai48CfmjG+0mPiJvhy5DfizppCJZyAmj6r5aEmzSX5P/AX9pilxL87OggE
	 sSc88FV4zTifDhh/0Bt0HlXikzyhccAq4EciqrLsXPPfvFlNqvDoMucPfkO0qKB+8U+qx
	 gLsBm/NvbgyipHS5WaUp7nxdJ3PdudRUhsvZD+hxYOSh7bfTbs8biki5zwYw1ua8ULoDU
	 Wx1DOKNlQW429EW+VqiplmRYj7GtJlW8c3YQaEFdPddSHQXSmGf0gV4Hb4mCFhQogGzRO
	 Mmix7rI+xV/sh5ZK/S9Nn2ifc8wHuOeoA/kRjInif5nySUPHAybABTnNpTyaYbCPZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PZD3dxop;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78056606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PZD3dxop
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183A81F031E2
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263427;
	bh=ikej2X49QtIj36ZiDznwF0O2B+EjT+ddV6bxiamU910=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PZD3dxopJ3zk4I1/t3QpPKr/gvtnnbsS9CLoa1m4NP5KE8sq3rq5q0Uez9uctlgFG
	 rkw8A3jmZh8pe3KE00Gt/Bpjx4Yt74GDcSrVyivQGQz1gZcb8UQJqIunWwRg17qTTT
	 wKkYjeHJjOWLv1mjNKrv+cN/G6WTuKp9copxQL7Pa69BwV4FY0+68u597ApkMb8IW+
	 +7JHCkkwg2pdL2mR/k+CakiPp6D5WeFPEAp5K27/8tfeLlv7VDjF/Ymx2gWlWQ2Zrr
	 qrRLXUaSeY2xpGXsu6rtiDI16R1w7bcK/KI1GWX2FpQxu6W27kEyI7LJR/pIqCWFOj
	 OX0gMay0MfQvA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so14493571fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 01:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBXbXFBsy2dtdEEKO9hvWfJnH5VfAopL0qoSO6DZ1eCGvw5B3Hc8r8NYz6OQcswZroYKjedMiKktcW@vger.kernel.org
X-Gm-Message-State: AFq9FYKcPjPxiE4CVvJlt1g5YjNs6SXr0gR5o+9bDdfSdOADlULJNda5
	gZF0t93NNi5MIDTmmFom5Z1zGIoQMicRMtbSdMv1ALqmDJuSnMLkTw0hfmdhhaPgWh8aPww8PZg
	Bb0t/DSJj02Hv+pkQISAvZvVDC4CH0N3cJ1IpaZq+rQ==
X-Received: by 2002:a05:651c:31c4:b0:3ac:48a0:e253 with SMTP id
 38308e7fff4ca-3ac9cf5f8e2mr12236951fa.23.1793263425814; Thu, 29 Oct 2026
 01:43:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 04:43:44 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 04:43:44 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MdWuoANzpNDa9XvJjK=ccY12y7TJaqnUsV8GRqSDh7jAA@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
 <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com> <CAMRc=MdWuoANzpNDa9XvJjK=ccY12y7TJaqnUsV8GRqSDh7jAA@mail.gmail.com>
Date: Thu, 29 Oct 2026 04:43:44 -0400
X-Gmail-Original-Message-ID: <CAMRc=MctUi9g5DUOxEa3F541gZXfeDO_dCoJO9D0tmHmcfa_9w@mail.gmail.com>
X-Gm-Features: AclHuK8jarM1InMQ9s0mWphG0Q1RQHgt7P6_poc_jWRv0zoJUeQx3q6bVqCJ2Uk
Message-ID: <CAMRc=MctUi9g5DUOxEa3F541gZXfeDO_dCoJO9D0tmHmcfa_9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 09:41:02 +0100, Bartosz Golaszewski <brgl@kernel.org> s=
aid:
> On Thu, 29 Oct 2026 08:57:15 +0100, Geert Uytterhoeven <geert@linux-m68k.=
org> said:
>> Hi Bartosz,
>>
>> Thanks for your patch!
>>
>> On Wed, 21 Oct 2026 at 14:31, Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>> In preparation for the constification of configfs attributes, make the
>>> existing instances of struct configfs_attribute in gpio-aggregator cons=
t
>>> and use the new st_attrs_const field of struct config_item_type.
>>
>> This has a hard dependency on commit f7528cd38b87fb59 ("configfs:
>> Allow the registration of const struct configfs_attribute"), which is
>> not yet in gpio/for-next, thus  breaking your build.
>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>>
>> Since you have to rebase anyway ;-)
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>
> Ah, dang it. :( I stupidly assumed it must be in mainline when Thomas
> recommended it. :(
>
> Thomas: Unless there's an immutable branch I could pull, I'll need to bac=
k all
> of them out of my branch and have them wait for the next cycle I suppose?
>
> Bart
>

Ah, seems like commit

commit d4d9eb226e4c2af8ab390bb470477fa68072fa2a
Merge: 32543b09681a1 6c1fa55e287a6
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Oct 20 16:25:43 2026 -1000

    Merge tag 'configfs-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux

    Pull configfs updates from Breno Leitao:

     - Attribute structures can now be const (Thomas Wei=C3=9Fschuh)

pulled it into Linus' branch so it's just a matter of post-poning them unti=
l
v7.4-rc1.

Bart
