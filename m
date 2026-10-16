Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DFB457E4C
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141060; cv=none; b=YzIA3Wkh/Nf9d+wwvmN2RE1QeIlu5zUd0oLQZ5Zh0yy8yTlW7g9WAs/DLZknCCp+0m8Bb2h40AL45oYcqqJm05IrbFsClJ2eLSWY7mSPUVaDskcSF/JkaqUBtQaP6OPw6YZdEAdAWa32cT3Y8fsHOiFjWqdueAWfpQgfviZgvEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141060; c=relaxed/simple;
	bh=ao6tzx9DS7W2FUUwvv3kmF6xuI2T1FSkTBjMrI/XNFk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twegOHY3Bf2heA3m1p3SvI5znjMihNt9LnZ6MpBm1L28JonYwNeFEIHR49VViXByDDSG7QsICHlNHpcRq6l4uJqILWnJxHpgYedqlgGQ+EZGlKQzp6oMntd4ZWPpxtRnaj+4kKYIlBwFmGw87a5MNuJlSj7zP7ovcd5a7ajrpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6p6ymIG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6p6ymIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88881F000C4
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141058;
	bh=IGpmvWwr55KO+66VOZ0WW05nSM9be+4wcu7q75d/0oA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=m6p6ymIGFWn5SPrII5rJMKHVEo+E/DeReZSVzlf2ZTYah2Z8Um6kc97hDEBsRm0ED
	 38uJlTMYxfvBCVmCyCfxG2qeoYqL0cRoMtFs7APjJu35A/iNOc6quyxNRVcbZqVRkF
	 qfF+xIjwxMF2OiXQAggJ+AWFcyAQxUXavJLBZbORCPpdRlfMLpXCQmZkTC6Pbw3/vj
	 82RwaIhgGUwi1aCgBdSQrGj9HHCWSeZ376djP2dsEW4AXa8qUZxakGPfifeyZ7nzNW
	 fsv9+jvQdf4Rq750TZyQ3RgFJO2bGE4HGm1qvVmf4shgAsmm3xr+mj5unttAuYxM5H
	 M6uRoq2pgsypw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so4955514e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 01:57:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTe+Yp4923ed0w7wFcpdntT+x5JU/MQ6ABNt6jDjUL9LICEm83eNvGGv/bgYkX0D/nhW+KAQDAofdC@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2T6Wy+ByUemw1YhP5baGfuTLhCuNwFl+rYwNpVU4UD85PbOLM
	3uL4FzrVlA4hWIfWQRe/JLxSeFeoIzHUS9difObcLp+nJNZBJbwJG7kt7OD+TAk/GXujMJ3PlZn
	XWqQ5iBCl7FpUFSMgBKsF8SifBj+sgOppBwfC3xQE9g==
X-Received: by 2002:a05:6512:3088:b0:5be:42c0:6cdb with SMTP id
 2adb3069b0e04-5be42c06ea6mr1322490e87.1.1792141057612; Fri, 16 Oct 2026
 01:57:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 04:57:35 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 04:57:35 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261016083709.GA56522@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org> <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
 <20261015153714.GA105746@rigel> <20261016074704.1860749-9-aambrozewicz@nvidia.com>
 <20261016083709.GA56522@rigel>
Date: Fri, 16 Oct 2026 04:57:35 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeLTvq+-ZuduanfcP2p=qFUVyN1pnjzp3XDkx0avgRk+g@mail.gmail.com>
X-Gm-Features: AclHuK9PlGrc0WYtRnUDBI-g5w1foHEv31WfYzW4NRzH6G_8OGXWc3203hemnfc
Message-ID: <CAMRc=MeLTvq+-ZuduanfcP2p=qFUVyN1pnjzp3XDkx0avgRk+g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver refused
To: Kent Gibson <warthog618@gmail.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 10:37:09 +0200, Kent Gibson <warthog618@gmail.com> said:
>
>> gpiod_free_commit() does the same read-modify-write: it reads the
>> flags, calls ->free(), which may sleep, and writes the word back.
>> Patch 8 of chip-removal v2 (for the debounce race Sashiko found on the
>> event clock fix) relies on that write: it resets debounce_period_us
>> first and makes the write a release store, pairing with the
>> test_and_set_bit() in gpiod_request_commit(), so that a new owner sees
>> the reset. With atomic bitops there, clearing GPIOD_FLAG_REQUESTED last
>> with clear_bit_unlock() would give the same ordering. v2 keeps the
>> release store, as that matches the code today.
>>
>> v2 of this patch only drops the GPIOD_FLAG_IS_OUT lines from
>> gpio_v2_line_config_flags_to_desc_flags(), which b7adfb6076ff also
>> touches, so a revert and this patch only need rebasing over each other.
>>
>> > > >> Doesn't this bypass the bitmap_free() calls at the end of the function and
>> > > >> leak mask and bits?
>> > > >
>> > > > This also looks like a valid concern in existing code.  Unlikely, but valid.
>> > > >
>> > > > It is also not something we can readily test.
>>
>> It is: both the -EPERM return and the one after a failed
>> gpiochip_set_multiple() skip the bitmap_free() calls when the bitmaps
>> were allocated. The -EPERM path shows up with gpio-sim as it is: on a
>> chip with more lines than CONFIG_GPIOLIB_FASTPATH_LIMIT (512 by
>> default; I used 600), GPIO_V2_LINE_SET_VALUES_IOCTL on a line requested
>> as input leaves the two bitmaps to kmemleak.
>
> I was thinking specifically of the gpiochip_set_multiple() error path.
> How do you elicit a gpiochip_set_multiple() failure from gpio-sim -
> it always returns 0?
>
>> Unless Bart would rather take it
>> himself, I'll send the fix as patch 7 of chip-removal v2:
>>
>
> Oh nuts, I overlooked the EPERM case.
> Bart has already merged a patch for the gpiod_set_multiple() failure leak[1]
> - you were Cced.
> I would keep patches in your removal series focused on that and keep
> patches for existing problems separate so we can get that series merged as
> soon as possible.
>
> I'll send out a patch for the EPERM path shortly.
>

I already sent out my final fixes PR for v7.3 but no worries, I'll keep
applying fixes next week and send another fixes PR during the merge window.

Bart
