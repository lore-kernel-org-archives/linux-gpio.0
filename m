Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503171;
	b=fzlNMwe00zLELtufyjnftpnnNJAoYiiohLlDsBOCxXoQrzwDVYr5HEMY3A7bihiUVz+6
	 ZU2LMtVL9sSFHythXYaemgFIqHcXqpQiuXz/TVkRHGhmZ0SI1tVM9YalhZwptlsaq6Duu
	 wuoWT8D93S3MTHePA1kXCggsaMUKAIt0T1VOgp2/fABU2T+SOswNB5Dy33OY6wezL9Zm6
	 coefnyHib82pMF5pMiRglXJQGFtX24SNxyOz/RbDRGOEY9+YnrSJoxid2u2NXZcJBeuDm
	 rBhr/EHTZ3xUINkOML9J2C8+1TFkDaUFCf5f16JIcRWx+8cbs2vLPwmAnnkrWttwONg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503171;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oK1/JKm/08Rgn6tYDzjASA68ZyWvvDJTLiQZFsGJ8Ok=;
	b=5bCqKOjqgVuWubkKbwmuZ9It9fPMTF2qN0Zbi8q0FPX05G1oHrLbaKBUym6ckiTNBfy3
	 nDpomdj/bBWNZR4HCU01VTiy64Xc/f792cug/WfK/hWKIEA/rKLmxdVAYEkIWagGfGnI/
	 Wm9kbMMwdt4zJ0E+2zmuVyDtlFWJRW6CGvTql9bwr0x8OGSWa3YT96h0tbKh4N+1a/dAp
	 IG4twPTRKYfSIILPTXqI3Hq7xRULK8nuqzcwzau63jFxsU+BhzVeMnQEdMJWmdNkdmc3i
	 FnB4aaGGlVRuE2QkFwe6RduA6OL3pneUWltq5NIUs6akz6mZIDP/Rd9trtH380h95wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1TTbvIw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA8606A327
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1TTbvIw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADF11F000C6
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503170;
	bh=oK1/JKm/08Rgn6tYDzjASA68ZyWvvDJTLiQZFsGJ8Ok=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=W1TTbvIwBiUEuuWycnaUMOgYU2nJ4R5dKnZB2Ef8AKmWraTZzcFBhkdVMyaLb7zNt
	 +70hWIcQ5YIolt1byPaj+fFYU7dqPzny1r2rEDc/+5bPMZJO+2CXJf6fmwr/0HUp+R
	 PA4KLAEWMV3ML2XJ2SqwB7FkA8bI+KddFLlkBsh71Z/tVj4/Rm2dX8WzWG+nTfJqyQ
	 0He7J2RqfRJr+iZqeM5DFBA+3Nct4BCoKC7b6InD6yvb3FYDulSDW7S7pW8F2BIgb+
	 XhLlH/mk6VXLQou0SvgA2WyTjsJmfOCF+UBwyg95N0jGMTfJfazbqTpLeLzr42Tfru
	 k0IS/jVj8veUQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso9812051fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:32:50 -0700 (PDT)
X-Gm-Message-State: AFq9FYJBp4NgPgPGKWwfQdNmYTcc8dIvGTpTkvO7Z2Y0L0vlO/1TX8Ji
	rf7BfVB2cHhQHodlOWmmXv8BQGRN3nAhLLZJmC7k7l2yqwARQ+5VI8eplEHmQZ5x2CIxoeGjfj8
	gZcbYs+Ak12MJAeVPzGgWwTUQLAkYRSApLbSUGd0sCA==
X-Received: by 2002:a2e:b8c4:0:b0:3ab:3b73:4560 with SMTP id
 38308e7fff4ca-3ab3b7349a3mr17754711fa.11.1792503169004; Tue, 20 Oct 2026
 06:32:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:32:47 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:32:47 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAOrEah57VOsF9aSV3zRF787EbfnkBhFkyxuGgkWjgbojMyhp9Q@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com> <CAMRc=McxpU=hAivRV=e_QEVsChsg6SCOqwCsD__qUBogSfv6EQ@mail.gmail.com>
 <CAOrEah57VOsF9aSV3zRF787EbfnkBhFkyxuGgkWjgbojMyhp9Q@mail.gmail.com>
Date: Tue, 20 Oct 2026 09:32:47 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdhUJQOZqwGw4o8k3y0eTU4AOEe+C-sLesFR-PoNoSH4w@mail.gmail.com>
X-Gm-Features: AclHuK9apRKjZktDgrWiXrmz-TryjlGZK_nMLNI0Zgrwyc8MYUt5r_-WPQ6ZcCI
Message-ID: <CAMRc=MdhUJQOZqwGw4o8k3y0eTU4AOEe+C-sLesFR-PoNoSH4w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/14] bindings: python: cleanup and support
 Python 3.15
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 15:25:39 +0200, Vincent Fazio <vfazio@gmail.com> said:
> On Tue, Oct 20, 2026 at 8:10=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> Hi!
>>
>> Thanks for the series. All looks good to me but I had some comments on t=
wo of
>> the patches. I queued patche 1-8 so no need to resend those and I backpo=
rted
>> commit 5524758ab4c3 ("bindings: python: _internal: collapse isinstance c=
hecks")
>> as it was marked as a fix.
>
> I'll reply/fixup those couple of patches.
>
> Also, part of my inexperience here, but I probably used the Fixes
> trailer incorrectly.
>
> The previous behavior worked but was not in the format i had
> originally tested in my early patches but which i apparently didn't
> commit [0]
>
> If Fixes should only be used for actual errant behavior and not for
> fixing mistakes from earlier commits, I can change my usage
>
> [0]: https://github.com/brgl/libgpiod/issues/148#issuecomment-3197361208
>

Yes, in general Fixes: indicates a commit fixes a bug and should be backpor=
ted
to stable branches if the commit it "fixes" was already released. Should I
remove the commit from the python-2.5.x branch then?

Bart
