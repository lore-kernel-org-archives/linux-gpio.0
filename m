Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D33C1D4B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891784; cv=none; b=EH+/J0ynrfME77crB2RId1kA3r6ZUyQiqxc83T7KVvJvaB14uaMbBCtuCqNeQ+TI/ggBJc/86npbH2lACqX91Ma3YhhdbknaURLhSX5wXpOMWAfxwA9ht1r9GEKlIVKfaGzifgOKnUijNXZ0Om45VI8x173FgW12vEl7GzcqsoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891784; c=relaxed/simple;
	bh=+6CMPxCNfgJArOVqz3AByWMolaEbwiFKYsgSct0ITlo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgncGzUpUsL7Aa9PDawcWbjMdwn/uyalGffFAre2qskmg4fnT57eS0qAZ2/VZPmu4j6Cq5JMmV4SU4HogQGl8yFtPScDOJMxOxC2S3FjKt4nHakke8juzGCQEiXJw/zIoWbgXSnRvGpWpgOioEZ3NXfkEX5OWK4HMn6DpgNXbdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+a1nyrl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+a1nyrl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EC91F000FF
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891783;
	bh=1b5lmP5bgZdbyJCJmclYiq8hiiZPCqTVEesDwMQlI0U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g+a1nyrl+yb/XUNoyQiRaJRAr6abbBYn4imk4yx9HhvVFA7BGuVdYeOwICEVDE0OH
	 /pv4B+If06J6Owut7NcSK3DIdNv6T5Vkj45QJV7mGbD6lbTYmr4xArzqEP3yYYzQ02
	 3NGfKyW9Z4YnXZM/LCpXHrC0cSSWi9MWlYVeoPbUT6NSxzJ0uJwCch2h7kyleX+XPf
	 4/1qPrzVZA+cMR8f3TLJ5dOkcMUZ/McvN5N6XGfqPWRM3jw7mq/yCCcOMtsR1LDJEm
	 gPk/iSIDkY6F1/JrZrmDADDZM3azOA87/VdYEbetQ9f4uTN1xagiacDl3VS8NjEGbh
	 JShfVQpyXzi3g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bccecba199so2041569e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 04:43:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPWVXNTaKmWeyVgW6I4HjYr7FaZ/JZb1uEf/qRcBArPNl4TjkA+xtd6qsj/Nt/Saui+0we8m7kORKi@vger.kernel.org
X-Gm-Message-State: AFq9FYIvk325AjHtLH2JTiQ9xhBx+05T3oXONkWSPuYnC2QKfHtScgKe
	hTkOzCY1SCMe+JQA1AUqbPhtSWvOGeg4fw2sCtsHxMgLHjOUz6pRxwno+TA8MacbEnFESmyqQ9O
	kencRQG3rjrmv+dXFMlQqlNTERiX5eHZGp0z6dFcfQQ==
X-Received: by 2002:a05:6512:2389:b0:5bc:f51e:e083 with SMTP id
 2adb3069b0e04-5bcf51ee1bamr2267919e87.41.1791891781869; Tue, 13 Oct 2026
 04:43:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:43:00 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:42:59 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <d5508a2a-518e-46ee-a821-b6209ef35bfb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013094412.945609-1-andriy.shevchenko@linux.intel.com> <d5508a2a-518e-46ee-a821-b6209ef35bfb@kernel.org>
Date: Tue, 13 Oct 2026 14:42:59 +0300
X-Gmail-Original-Message-ID: <CAMRc=McSCMS0PB69k0tnKMvBRkB1t-4HOhsvGr82yse4FuNtCw@mail.gmail.com>
X-Gm-Features: AclHuK_eWKWLpzr925FcKSzXQ_aUgEzPtSFQb2mGE-CVnlYuXLR-Pw-OS39mAZY
Message-ID: <CAMRc=McSCMS0PB69k0tnKMvBRkB1t-4HOhsvGr82yse4FuNtCw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: shared: Don't define variable in the
 middle of the code
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 12:04:41 +0200, Jiri Slaby <jirislaby@kernel.org> said:
> On 13. 10. 26, 11:44, Andy Shevchenko wrote:
>> While the C11 allows us to define variables in the code, we do not
>> do this style (see more at [1]). Move the declaration to the top of
>> the function.
>>
>> Link: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/ [1]
>
>  From the link, I have just learnt two things:
> 1) I am not alone preferring declarations in the middle of blocks (it
> has more pros than cons IMO). But again, I spend a lot of time in the
> c++ universe.

I actually do prefer declaring variables at the top of the function. This is
a leftover from when this variable was managed with __free().

> 2) the kernel defines "auto" even for < c23. Therefore:
>

Excuse me, what?! :O

That's the first time I'm learning that we can use C++-like auto in the kernel
C code. Thanks for bringing this to my attention!

Bart
