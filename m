Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1393E39734B
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139008; cv=none; b=uTQ9YeFRVKB+xM6JwA48vnXnHxrzGdpM5zLaMDi+VF4UCT0+x21NDkVxKIwm0948Fr73u/I7af6dmOu6tn366GCxIlGXTNzE5EIT+rStnobwo6Rdr6wz4Pyb8dcSsCIe05JuGTxMK+WsY8GA4bsRTHOQJXIyAi/vn03gjAKuvhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139008; c=relaxed/simple;
	bh=sgMbCzqx+q3WPlCQNcGfmLzGxgd2dUfA7H7U97R+Bak=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krcuf8m12BzjPbbcQYpXV7twxuuNg2Bnpcnt7gqGnpoqDsUVSoGlQWB6defMlqHd5+JUGRbkDeGU1Wcgla8wk+ZTc0YQr8w6UV6w8S1Ew1qGu5iWb68G6kx5BmmgK/AsUhBJ8sfgA8mZRqO4+NEADVQ+0yjRIdBBoZJ+H3W6FUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WX+nYVnQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WX+nYVnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F081F000C7
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792139007;
	bh=sgMbCzqx+q3WPlCQNcGfmLzGxgd2dUfA7H7U97R+Bak=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WX+nYVnQfe/BDO4p86s0Km5PD91F4W5CospdcygdQuVa7Mshfw1zBggFR5ddV1u6w
	 4ptoYWkVdFi3b702rYaKB+v522ipJbHP+r/NapJhnWRuM5IjPUAz7uL2AyUxw3F7Wh
	 IWQpcGfGMivCCZzS0csCTMnssB/XvzGKIJ/URIt8k6gP2/f9hPBiNqzs5Nf20SR71A
	 2Goo7wiKaHr/mZQ7UuS/atmaz7n5JgwwchV2LXpwTjP3Pekxohrl/P2YJ4Ehbh82Y6
	 YVxt2ZRQ5RkzQ/nAu1y+JyYVtOvPKrO6p4aS11bfaIWCpHkFMhsST92iVE4WZaaHrM
	 eyO69ru3AXl1g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3aaf078704fso6597061fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 01:23:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFR3yw2e7KiRtFtFWVtLkHf6YMP1bFPMRAI7YQVRnyjTUgctG+p6cAa7oW4WwtoBwWJEv46ck+KCCm@vger.kernel.org
X-Gm-Message-State: AFq9FYLe/sGftiDQcXk0TUjZ4aApG/ARlK28XqaH96VRIbH1V69zQB4q
	5lxz7Gd4EOlNI7Le//S+JvrKHDklRBrkf3CblJbpy7dhLesYW2iXyiS1G2J+TLwO5Id/e2BdhdP
	KEY2BfJuEW9Y0IIxj9lGW69XCvMi+E9PBdIqAIrmKCg==
X-Received: by 2002:a05:651c:893:b0:3a9:a197:c0c5 with SMTP id
 38308e7fff4ca-3ab147a7077mr4939181fa.11.1792139006426; Fri, 16 Oct 2026
 01:23:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:23:24 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:23:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261015153714.GA105746@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org> <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com> <20261015153714.GA105746@rigel>
Date: Fri, 16 Oct 2026 03:23:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>
X-Gm-Features: AclHuK97nXcvzWBEni9rKVHmnmJ076c2B1DrmpeBgy4l2CpIQyEt2mpZcjruGoE
Message-ID: <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver refused
To: Kent Gibson <warthog618@gmail.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 17:37:14 +0200, Kent Gibson <warthog618@gmail.com> said:
>
>> We can't protect the flags with mutex or spinlock due to the multitude of
>> issues that forced us to use SRCU. We could maybe consider atomic_t for the
>> flags field and that would allow us to use various atomic ops and possibly it
>> would be enough to cover all the read-modify-write cases we have. I need to
>> think about it and will also ask the clanker for help.
>>
>
> I was thinking along the lines of reverting to atomic bitops directly
> on the flags, e.g. reverting b7adfb6076ff, without changing the
> underlying type to atomic_t.
> Given that most of the time we are operating on individual flags.
>

That's still two threads fighting over the flags effectively, right? Ideally
we should modify the entire set of flags at once. If that proves to be
impossible, going back to atomic bitops is probably the next best thing.

> With atomic_t you could also use xchg variants for bulk ops?
>

I'm not following, could you rephrase or give an example?

>>
>> Definitely! I don't see why I would ever be against extending the test
>> coverage. :)
>>
>
> Ok, I'll try to give it some thought.
>

Please also take a look at gpiolib-kunit.c. It may be a better fit for this
kind of testing.

Bart
