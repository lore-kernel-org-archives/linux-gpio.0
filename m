Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4653612E0
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837350; cv=none; b=hJ939Hah3XEmn9rmnXS62QpXicyYhI7FbhetpQQe2IRV9RLUCZgO7RbamZK+38H0Ylpm7+/nfWjP9ppKjIdCDfb2O3ZE5/mhtF0uct4tIuu4z3I76p5IF07BXW72mVbCo/4f5erZHU98LsHQGDbtOh7gd7tgrTSazX15i80Smvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837350; c=relaxed/simple;
	bh=z7MbmFjagvwOPHkWhYZhxlqzl7AgiZionzFX+6AgoP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p80yB//tuDfuACGL79o77/Xbl29Y8ZIzktk/yxhZUb0qWf1CSQSF/tw4y4o3dE98yCODDAJxh1uE17+CR3V0kJhb8ufMOHWO8gOC0MRqC5t9GGB8kXHh+Xz6zQZ01O3vTniIjEKdiNMPYSqBGgnoQmy46Dzg3d4c1OajoOPqjMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lcl2Ia2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lcl2Ia2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4E01F00899
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 06:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837349;
	bh=z7MbmFjagvwOPHkWhYZhxlqzl7AgiZionzFX+6AgoP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lcl2Ia2/rhuh9Qg67XQrXUsA0diJ2m8bIBx/AsVGZguno3dCBCp7yNlE73Qo8pERP
	 eL6uNPvLPM6okGoP44waJ7ZDUQI3/bDA20U9bT0POsNxBBDDjWMMvu3HrLZorKDaVg
	 yQb2cCG737mejfpsozjeLur8CSmXi/+b21Tj+R2u4BgmwdrDtUEKPmyULi+/c6nTGm
	 6D7QrrfjX+jY4xJaHP1+73W+oLjOk6pRWWhfUUqB30i2OZP5JbFAEwm/VWuOU9QeY4
	 3UJ+csfsCH7lYj7yyna+5//pieHjPBqpP7f+95LpD6V2klfT7C2dErogcJ0uxDEkJs
	 VW/Sh1hCz25EQ==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a65fd1534aso37617821fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 23:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0wuLrsv3d40YmRSKtBwequB06ftde8YfWvOAFq1g1ngPSLGYTJklpNGkhY4HW13/3zLX0r4ZiHYDj@vger.kernel.org
X-Gm-Message-State: AFq9FYKeZ5yGr6OjWJr8JRgjsob91VpkgdDpAMHE/zeJjI4V8z3uLn+j
	sDyOp5FcXFrvxPG8qpSYumfFiAmZBeieraEyqo/2LcA/4QvHw8M39L0RglzMw/JpnJ9PkFr5mcV
	uBdZeQcD5AcKCAzwtYmOyExQtDmVOt0Q=
X-Received: by 2002:a05:651c:50e:b0:3a7:81c4:1906 with SMTP id
 38308e7fff4ca-3a781c443f0mr6371931fa.8.1790837347752; Wed, 30 Sep 2026
 23:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 08:48:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmq45JVz73npFH-dKAWwGwf3_EH+Na_es8C2VmM72wv-Q@mail.gmail.com>
X-Gm-Features: AclHuK-CPkuH_5xxS0knluaiy0Um-A-nfzAOBDIZSTCVrJ2RKDpbsRs1oi7Z5Jk
Message-ID: <CAD++jLmq45JVz73npFH-dKAWwGwf3_EH+Na_es8C2VmM72wv-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: amd: Add Remote GPIO (RGPIO) bank support
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Shyam-sundar.S-k@amd.com, Matt.Devillier@amd.com, 
	Guruvendra.Punugupati@amd.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 7:28=E2=80=AFAM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Some AMD platforms expose a second GPIO register bank, Remote GPIO
> (RGPIO), covering pins 256-271 through a separate MMIO region that the
> platform advertises by name. This series adds support for it.
>
> The first two patches are preparation: one centralizes per-pin register
> access behind a single helper, the other factors the optional
> named-resource lookup into a reusable helper with a minimum-size check.
> The last patch adds the RGPIO bank itself, including its pins, groups,
> pinmux and interrupts.
>
> The RGPIO pins are registered only when the platform advertises the
> region and the main bank spans the expected number of registers, so
> platforms that do not expose it are unaffected.

Patches applied tentatively, I see Mario isn't on CC for the
patch series so adding him now. If he sees some issue with them
I can still take them out.

Yours,
Linus Walleij
