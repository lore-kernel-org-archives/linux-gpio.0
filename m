Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB057526062
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421472; cv=none; b=R9Iv8cYvgIC20poEGRCTUiKOPMip5HVonOwP5PyYqblpNtzJnBoANmUZO/bFjLtinyEcYz8CyIXk9ZG0l4cW8ayKZbS5qLbVgKq67QdfERNVEcGTdg5v19Rrb6rcHLDJPIuv++aQLxxZgG6tz61KfMdxAkK9IED2vhq0B6oSzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421472; c=relaxed/simple;
	bh=dXm8ORcv0qe2Q7ziAEKfZNQMkAEkyXVDTYAVb9CpYds=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FuG+ARZgg06EV2JHyUGf13WT6WlH9YEUQj+ZqAlFsweOdjMSl03ZjD/kEVrVTbGX0jdWN7H4XEXOVsKmCMJvyNDRSAdNhjO3744CyoKcbivZxo9KIrE2QPzTOEpTz0vfwTiXPwSMx/OpyQaPkPlRMO2V0gayXHWJZ78NJeILXAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbsGVg42; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbsGVg42"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897751F000C7
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792421471;
	bh=dXm8ORcv0qe2Q7ziAEKfZNQMkAEkyXVDTYAVb9CpYds=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jbsGVg42ksVJOToBJljADU+CQVE7Yrf8BC1VARQP2dbFvItE7xiqviJh3BeRcRMFa
	 YhBRX5o7OVAqkZiLhIgAUnEhMRYjCRRtNlGUbC9DztWxnvRdcZXa34w7o3yFyagNIc
	 ZnTzxMZnoukcjirbiB4BVUF35RNcMS9y5dOUxtyLe0HXshyRq8T1RJXIJlCj5WdVSH
	 8r9jTrymgQXxBURi4cRkK5oSsabICb4H7kgovbYBX+qCMDSXYvMNO8CB1X8SAvD969
	 oTN5g3tBJzLAYaXRVPsqx5mzxOq0VhsmdEv5oWgiI2I8C9o3v3RWXoa63tA9cSQGM6
	 VPKCHDe6Vc/Sw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1760302e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUpuCVhiS+UlwYvw9B0y0JwobJYtQKu5vsubDIW4KRs02rgk08mC1J/uiAXgPZf4IEnPkA+a2t/1bH@vger.kernel.org
X-Gm-Message-State: AFq9FYIc+qPQzNQpitdQpzFW7bnE4++rdQMX/UDLuXwPc8mb0rPMvNtF
	sDutUS74p3knZkTt9T2NvH8WExQpDEIuPHb3HIeBHkL6KAYkmh1FkBE3ozoVvqhxyKJz8Uge3Wk
	mD6tnoP3k96ptYDk/EeHrYymi9vBKyB0sanSaVkhaog==
X-Received: by 2002:a05:6512:32cb:b0:5be:52d8:312a with SMTP id
 2adb3069b0e04-5be52d831acmr2320888e87.34.1792421470290; Mon, 19 Oct 2026
 07:51:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 14:51:09 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 14:51:09 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261019142626.GA61014@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org> <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
 <20261015153714.GA105746@rigel> <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>
 <20261016091420.GA63617@rigel> <20261018042546.GA48005@rigel>
 <CAMRc=Mc41umcA5ujMD_YOZUZpfJEvtuE4eBwX0g9nPOAJd7GmA@mail.gmail.com> <20261019142626.GA61014@rigel>
Date: Mon, 19 Oct 2026 14:51:09 +0000
X-Gmail-Original-Message-ID: <CAMRc=MexsC+tz3VfJzwg2Qw72LZBGXSbn_L9qj0EkxbnnmXpSA@mail.gmail.com>
X-Gm-Features: AclHuK-VvIHsP-McTLUDAJGdI_kICKfAhWMhvqJru6hFmbPor3fifppUB5zs5rU
Message-ID: <CAMRc=MexsC+tz3VfJzwg2Qw72LZBGXSbn_L9qj0EkxbnnmXpSA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver refused
To: Kent Gibson <warthog618@gmail.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 16:26:26 +0200, Kent Gibson <warthog618@gmail.com> said:
> On Mon, Oct 19, 2026 at 10:11:06AM -0400, Bartosz Golaszewski wrote:
>> On Sun, 18 Oct 2026 06:25:46 +0200, Kent Gibson <warthog618@gmail.com> said:
>> > On Fri, Oct 16, 2026 at 05:14:20PM +0800, Kent Gibson wrote:
>> >> On Fri, Oct 16, 2026 at 03:23:24AM -0500, Bartosz Golaszewski wrote:
>> >> > On Thu, 15 Oct 2026 17:37:14 +0200, Kent Gibson <warthog618@gmail.com> said:
>> >
>> > Not sure how kosher this is from a kernel perspective, but that is what I was
>> > thinking.
>> >
>>
>> There are some instances of casting an int to atomic_t but given the "aligned"
>> attribute in its type definition, I'm not sure if this is fine either. There
>> are roughly 100 places where desc->flags is dereferenced under drivers/gpio/.
>> All of them would require inspection and rework.
>>
>
> I did try changing the flags to atomic_long_t, but that made all the existing
> atomic bitops complain about the type. :(.
> Could we add an alignment attribute to the desc flags to match the atcomic_t
> so the cast will be robust?
>
> Alternatively if bitops could be made to work seemlessly with atomic_t...
>

Ideally, I'd like to switch to atomic_t but I think we could temporarily add
the aligned attribute and work incrementally towards using atomic ops
exclusively and then - when done - eventually change the type.

Bart
