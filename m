Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569367;
	b=e5QVwjmCXXcCLQXD4kFLM+iTUckJDIPeS6KWBgCQSCzmMdNpEVBnki7nPixqozMF8Ezq
	 J4UX0d+GqpppjcKoZnGoDM2yez+tmXlE60yU4+NMxzjnQuwc2buHRYKmC4tPGu0yerMqu
	 Tt85UhvJCo6VV4zPjoNHQZkRIHYgh22w16OzBlhQhmkL4yziwcSxE87rU/+ohKo7VGfjr
	 ojPFh6rt51cZxGYL+30CkOOwU+YfwZSuekr74iYdCxxytr1RoeJ1mnQjAmiB+e9+HaVmO
	 KAsVXIIHAvPvdYPBcU0aMXvsrJhS5wQaecUTy6kao438Np+LZdZAiSSeyomTjpnt2dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569367;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=x7sBPB/yCpRz6ihUjtYZCgIDWXnkL3T0FpDEU3rZGnE=;
	b=bjOEIpcCScBKDAQgiWNYO7jhdNZPhtDJK8xIIc+dvmf6jufguPs18nfY23ndi2zc2hjS
	 gAh1VWIddy0OralT1zjH1t27jnDg9Rdfjjw8gT+JWTEw4PuPKzxA6lc78PtbufB6ntaZK
	 s7lMLjS5xcd8MXWeazFk7C1D3MyW6upS3UJfSg+TcUJEjxKq/6AwXF06bEnQM2y4vkS/E
	 sb/NUjGhRuCDKaLjGqPdiLqWEVEKG+KUEb8bZONrjGjGQZWuJocv0+MfZlG/NxKWZkm+a
	 zY02HzCSzRVmpt3lEjywTWvN17a7psbVma1P7hg9gTo5/WOflGZx0++12QGKm1jL5Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GD0QuLkz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BC4606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GD0QuLkz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173A31F000CB
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792569367;
	bh=x7sBPB/yCpRz6ihUjtYZCgIDWXnkL3T0FpDEU3rZGnE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GD0QuLkzbIa1btgdMjnx6Xqwv2O+gp24ehxnmtQxXK2z8cvE+/g/qNXkECU+LEdY6
	 C4nxGbLodMX5H340Rczba3Qf1uOIthdLZFbij3HkvqCSBw5QpQFyGdUinaMdrK3cBJ
	 tx5EnMbnhNnzDQNpE3ZvLUVpULvCZSfxumLhNuHXHYkPWOf1Zji4TnKNbEeqwvEr7I
	 t1VkIDbUyinkuv9ZlRoq89BPzvQiuNfrnVe09uvwdjgo5lp/u9Z9VcwmJl/Nk6zmge
	 RC/7ad1TmmbJguD2WwVlAjvd9Y3z1151423FyslVD3AtU4OLbmTtrwoVOyrBOrG/kJ
	 UrHlr4A71S4Jg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab53a99771so3910091fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 00:56:06 -0700 (PDT)
X-Gm-Message-State: AFq9FYJFDda+Ps1m8Lk9ewwDeK4r+vnAm+WE/wGEMLym76Y6NvqRP1Nu
	LMJvSUJwe6J5RugIBlHbNnYvk0nS9zArocASYbUHh5UFlFYvqWs6NdjcWxhyGWOmLBZqZakakLG
	8p+2Xn07IhaMklaX1rI+sQjtsPXdqc6zTC0LIN6fBQw==
X-Received: by 2002:a2e:be9a:0:b0:3a6:47b8:ca8e with SMTP id
 38308e7fff4ca-3ac441b2fafmr4109021fa.22.1792569365761; Wed, 21 Oct 2026
 00:56:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 03:56:04 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 03:56:04 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAOrEah7+ydbnsOOciOuYhTpa4zEdp-+PFNK5p16HWr7LUxAWWw@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com> <20261020003728.13669-10-vfazio@gmail.com>
 <CAMRc=MdDNWEYkzGPMRw38CL2EE6p2meNJ636VxEgoqs93mdS1g@mail.gmail.com> <CAOrEah7+ydbnsOOciOuYhTpa4zEdp-+PFNK5p16HWr7LUxAWWw@mail.gmail.com>
Date: Wed, 21 Oct 2026 03:56:04 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdDF6dD3seGcmTBvjXotw99-GVShN8wqSfBVQB4JRuqHA@mail.gmail.com>
X-Gm-Features: AclHuK8am4cyrh61PuJad79oZiYE7FTK1JW1mjnaCgVJDsQC5ZLWbOgKVq0Xl-Q
Message-ID: <CAMRc=MdDF6dD3seGcmTBvjXotw99-GVShN8wqSfBVQB4JRuqHA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 09/14] bindings: python: chip: use literals for
 dict/list and declare types
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 22:58:25 +0200, Vincent Fazio <vfazio@gmail.com> said:
> On Tue, Oct 20, 2026 at 8:02=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> On Tue, 20 Oct 2026 02:37:23 +0200, Vincent Fazio <vfazio@gmail.com> sai=
d:
>> > Use literal constructors for dict ({}) and list ([]) and explicitly ty=
pe
>> > the variables accordingly.
>> >
>> > There is no functional change here; just minor cleanup to squelch new
>> > linter warnings.
>> >
>> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>> > ---
>>
>> I don't doubt this is the right think to do, otherwise you wouldn't have=
 sent
>> it but could you just explain to a python noob why we need it?
>
> I don't like blindly obeying linter recommendations without some
> justification, so I understand.
>
> "Need" is a strong word, but some of the justification is in the
> linter check itself [0].
>
> In general it is uncommon to see the long form of `list()` or
> `dict()`. It's no less correct, but someone familiar with Python would
> find this just as easy to interpret.
>
> As for the type annotations, this is to be a bit more explicit about
> the expected types of values within the collections, otherwise the
> contents are open to being inferred by a type checker like
> mypy/ty/zuban.
>
> By being explicit, we don't rely on this inference and dictate what
> the type checkers should be expecting (so we're less likely to run
> into errant types finding their way in).
>
> -Vincent
>
> [0]: https://docs.astral.sh/ruff/rules/unnecessary-collection-call/
>

Thanks, could you put this bit into the commit message for v2?

Bart
