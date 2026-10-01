Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4946D093
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883849; cv=none; b=u6CiucSQ38kqRd4t+bt5ACli4rgiK/F7FCjR6AeDtGHIF2jq+SQyJFp2KqXmm7EosXy8fsCwyifHSg/DU+OGOO/QAuo9BlcRw44Jn3ipZ8hiR8BNCkdDL6I+tChnQQ0s8xeg3zGwJRvUOzeqFr8MbPlU9RSYmUNouqg9WN6omw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883849; c=relaxed/simple;
	bh=93TpAdAVv+eFIOtANuTk4QptP02rm1HaphW5r0bOVp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZacTcw0qrn/gQeLPniy9iq9rZyUW1l3yP1aVqPfFlCgSlIMWCglHOvfNPMvN1vXPWb7tQLI8xCG4ZOFM1+sqVKwwHpx1g/KFmsRMTG5TV5YfD4F0RCyAxBtg9yxjZgVdIdK5/rPNgN+G9VOD+aNHuItSbZ3lwmeUZX2GdxXK0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaJOAgOu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaJOAgOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3351F00893
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883848;
	bh=Pv4VQuh+im+GCzt2Y7LzJQc7Ew1QXP4uocWBUeqq6Ks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CaJOAgOu4PxujbUSv3qh3IuCYGutTTzgvdfk81iLFEQoqL8CWiAL3ItRKZsDx79qG
	 Nlnj71bvbsTM0H6GJ//1uw0oj1/oUWwOWD2WQ70tVCvRV1OtkEKR8kaitM8BNE3iR3
	 XC4FDjX94O/Sm7fGtQeYkYNZlgdW9vc8ws2mEU+Z7iCbrwPmB6JD0TY5s03rXqUfpy
	 MdHCuePBSJUE5m4AwMysBOmrSmb/zq5CYTMw9IK4zwEwo3x4zJXIhh/blFPkP30xaU
	 Qw4QezOeKZcM8WlDC+5xXmQMMWt7A/Swx5AF+rDB8UKwL68SqKwoOu6jLOQWsL1aNl
	 3Px81aCGV5Qxg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cedd9baso27506341fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIZdMkqHXrc12HKBW1/F+k2dI0l6Cl56EobqjN7ddDHaL0pywqJ0vSDM/1n6z+X5TdIMPRQZo9c4Ro@vger.kernel.org
X-Gm-Message-State: AFq9FYL+ug4vR8WONRh+TAFsl4Uzau/8l2VZB9EIdReTP/LZ/7MZIrb7
	P5Cq/Fjv+IUj6ukD9D6dXqnKW55GcGTnSy1UhPKojNj7MIl18DNxHC6u8SDm0D04rB7Klm5Ol24
	1+Ad/WWlet7fmpwNHYqSaC2qdB8yWoT8=
X-Received: by 2002:a05:651c:a38b:20b0:3a7:5f55:5e25 with SMTP id
 38308e7fff4ca-3a8877bbb3amr571691fa.10.1790883847184; Thu, 01 Oct 2026
 12:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
 <20260926-loongsongpio-v1-3-71de7ebebb76@gmail.com> <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
 <C6A08AB5-069E-4CC6-8CA0-DEF22F369208@gmail.com> <44D04759-C409-4C4C-9FD0-737A8CF9B79A@gmail.com>
In-Reply-To: <44D04759-C409-4C4C-9FD0-737A8CF9B79A@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:43:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLn54ts=136H2SXtOfx2n7PukYCQJY9VyKm_h+uxR4=gDw@mail.gmail.com>
X-Gm-Features: AclHuK_8ckElo2Ilr7FKbubpv0AmCOd4bxgHAQ1KfG7tMyCrYsrMM7-VCs_ZWMM
Message-ID: <CAD++jLn54ts=136H2SXtOfx2n7PukYCQJY9VyKm_h+uxR4=gDw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] gpio: loongson-64bit: Add shared interrupt support
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 7:47=E2=80=AFPM Miao Wang <shankerwangmiao@gmail.com=
> wrote:

> >>> +       unsigned int usedby : 31;
> >>
> >> Is this a bitmap? Then use a bitmap abstraction.
> >
> > When exclusive is 1, it is a pure number while when exclusive is 0,
> > it is a bitmap.
>
> To correct my self, usedby is not a bitmap. When exclusive is 1, it store=
s the using pin
> id, while when exclusive is zero, it is a counter which stores the number=
 of using pins.

But what is this mess with using 31 bits for the pin ID?

How many bits does it *actually* need, using 31 bits looks
like some way to try to help the compiler to optimize the struct
which is pointless because the struct isn't even suffixed with
__packed...

Yours,
Linus Walleij
