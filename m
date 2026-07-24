Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F73B6371
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928828; cv=none; b=sEFh3G+sfbeoV8xFpD34Rz5aDEVRGO44FWw/aP9Z6PIHSsL3sfZAnT9BDqajadKVwUrbfftmWyoKh0UWD9cQLu51qQ1unKo/lIJu+V9h96jrJ7/Ijet9CM3zTMd8qS05NkxK8FldJFqkN/wseZi4L7TJh2sgprs+3oIAnhqPgc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928828; c=relaxed/simple;
	bh=yHFCHv1SQW+IjFPxEkHkiDP5RWfvxON6aFiwmXE/HIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUavYjB39iktTOFZTbkpuq++muV4/NPpKzj9TwuYjhSxFWKxz6zhZ8LRULpx9TyrPEtHm5z3FJ3bAC807k4VjTTKHzez5oPldhXNJ1I92PHpZFFuPhzzmYn7bJpZ+yaTwfAtbx5Buud0fYz328BL8+430uyimd0u1A+Xti0SXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5Ar/gw6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5Ar/gw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B14C1F00ADF
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784928827;
	bh=yHFCHv1SQW+IjFPxEkHkiDP5RWfvxON6aFiwmXE/HIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R5Ar/gw6gIgxdzP9lo0Kzmf3s1KtXe2ELNiAXq6JrRmVTErUR3d7t/0QYrE9JlXKl
	 ZNGzmwtfoc7V94Pw9xL5a1Uz+v1qlHkjuTvIxcNWzu6AZOxYU8PC6fCk2jpEy4LAsU
	 u1Q4xp4GA7yIykJmbcQ3PISNwiXYf9G6aUnaF8kreKt7cClnq6YgSnpJIKw7uFQYoV
	 UlS3xGDwxIkLBq9vxAhOpoCzmb/3YJqoBOidk/3Ij9q25ePy1ptgEyvMSlrsEews6I
	 krJsX6RQZucdOwNzqPNxLb9ooOryKNTdxBYPylyCjGAxPIwa+AQ2JexqkKqlLZCIrd
	 qQU7nTSjnf/Bg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c95395230so7872011fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RouStxr9/TKNRAh3Tmia2k9e6o2M5zgQH60NbY8nGFbkjd1FtYKMtnp4v2aU7oiOXwCVSc+OEisqjWB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1MA+dYQ8TFaFOIHQ2xkpEf6N2yUh02l92xBrPj9NVXKWaX2VR
	y/6seHJNgryXBrY8jPCfmOmlPpFPINI68Z36IvHPFx90/PEqyZF0O1ARLCfajo82/DCRcHcc2D7
	KtujV3L6xDusp09KuoekJGXnSb6hS+6g=
X-Received: by 2002:a05:6512:65d2:10b0:5ae:c745:f39 with SMTP id
 2adb3069b0e04-5b2b2f6f194mr1567318e87.44.1784928826320; Fri, 24 Jul 2026
 14:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:33:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSS+pgSkDWKrC5jfxmSgBNqFPOo_zgCmHCzNeNX5pF9A@mail.gmail.com>
X-Gm-Features: AUfX_mx98nMos0Kx5oubZwpKrlQlM33i_C7MOroNH_eLPRXK_I_VYrccjf3ZYI8
Message-ID: <CAD++jLnSS+pgSkDWKrC5jfxmSgBNqFPOo_zgCmHCzNeNX5pF9A@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] pinctrl: npcm8xx: fix pinmuxing and configuration handling
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, brgl@kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 2:29=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:

> This series cleans up several NPCM8xx pinctrl issues found while
> comparing the upstream driver with the newer Nuvoton tree. It trims the
> bmcuart1 group, enables RMII outputs from the mandatory RMII mux path,
> fixes the RG2 drive-strength encoding, and corrects a few GPIO and
> pinconf details.

No comments so patches applied.

Yours,
Linus Walleij
