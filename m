Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061A4973AB
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372829; cv=none; b=HIs5sAPSjWkdVnMr9knepyG7eBV/lmloIlQ9mc3VRQshPxBtPZQIxpjGZrNH9p5UBJydpbpCXSEcJPE1HBd6joeVcvQ5t+SnLVzCMt2mvt3z1wlwxTH729OQ0+dKalV356UW7aJGgGpiDW7/nDa09faOwSdFHttgMhWCrdpwlWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372829; c=relaxed/simple;
	bh=C+Zpwgdt2K7ODmUmZFs5PwxiVXXn3j6xqLkF3qLtEWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueWHVKdVQff5dJbs2QEaK0oJokdLhn8xh06sxjfjL/BfNVTItaLo62A+U9eyd31vTjowlZQKhmC5MW3Dp2CjWIpjzB57EuyP+gAIk35ZMBv2BBi4/kJvNXXgZvxDfiSZ3jGQUx3CvABKNX7SGX+3SO1Bfr0bguN0NLGLWRku4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EF1IhK10; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EF1IhK10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EE01F008A3
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372802;
	bh=C+Zpwgdt2K7ODmUmZFs5PwxiVXXn3j6xqLkF3qLtEWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EF1IhK10+TdbgSIO5BEmOvdVr+uHDAeUgGSTYKcKhp3K/ZQQu6pXQGlJ82L3L7B5/
	 jDMo8dEO/uz9E01XGEYcmE/4DcVeCtX+OEV86++o5M62UTd07n8L1KhYbc0REstoTo
	 fflBncixe4+w5KfOrzpuPE+9zsp42n3YdzKPALi6QmM/NDT8+l8rc9MlxVQiyV5Opu
	 vr/0ELwk+eBhhDHYhK+7O56gfZXYk9HutKSeOU5zzYBqqKMhzlbS+6tTvrarTcO9XS
	 OvyE4WyPzyiTJWDtbwKmyZ5pzeMa8Jv/j0uGx7tFuffs5UR16fGVTWm7Ww4orPl0sj
	 z12QACh60/VJw==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-49e18e5583eso465035fac.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:33:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2AW+HxqavBRSEjL5WI5QTJycNWGNO/7duZFfMUgq2vkU394OLsu4vURmDLCjlRTJUymZofJtMud52@vger.kernel.org
X-Gm-Message-State: AFuF++mx4dbXRWIwnMi3LITXV0cJFAX7hHgl6rNCztf25uI/a23EMmNE
	CpcUqAaZxwmAuVkz9dzZvBESvDyLsrOHUL0yQM5rv2FkXovNgIExwBjsRPMPNRw/EOmNqsiC1W7
	wSwWaway8HY1Y0raBo3562Cpf90Pt+6U=
X-Received: by 2002:a05:6870:7097:b0:48f:e25e:e202 with SMTP id
 586e51a60fabf-4a2597a4240mr1680070fac.61.1791372801479; Wed, 07 Oct 2026
 04:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:33:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=gUxYXUs3TcMmFtqX-81MSTc_DRb9Cj3J7kGD3YcEeow@mail.gmail.com>
X-Gm-Features: AclHuK8mhGzFYpQCWb4ENMapNoQMf3mkG190Ia_Evk22K6ygvYZyvphqkH7y2y8
Message-ID: <CAD++jL=gUxYXUs3TcMmFtqX-81MSTc_DRb9Cj3J7kGD3YcEeow@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied.

Yours,
Linus Walleij
