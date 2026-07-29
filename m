Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BCC42DA56
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311459; cv=none; b=j6TGP6uoLdRs4wc5j+8rfqLaOnX9NdrEl0bjsg+T1o+byZ5CYGh0n8t881pRwbOAs6til5zHadddUrBdks9wSpI9oCEplCJMklWX2vGwdDnA04jaOcGq57pYBOxFIyLKpe8fgTkVfTuT+wZBtzZtsMeY2RFyA5tktLRFGVxe4+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311459; c=relaxed/simple;
	bh=Bw2TtHwa/4qM/hRNTbeGMOd+OyuVWzLcUJAcd5rxsXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mooku+3CVyesFI3hFMhvEwvy3oxXyFUM9AdgBvX7KE5T1zoAkNo4aV1VGZCO1JAo85OVo01afdfS91GIfmqYK7Ar7njTG8A3jRFa6IEkL5c7eAq4hZLsnNPDSk1UnFbZHxqybyQU+QgeoLcTbm9GbKkyHrexv8yl9FcBUR46aSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNx6lU+K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNx6lU+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646A01F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311455;
	bh=Bw2TtHwa/4qM/hRNTbeGMOd+OyuVWzLcUJAcd5rxsXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VNx6lU+KvpOVa5ftB/0LZk5uK8FBdBZOHATIszrSAdeYP2BpfWe/3tTAV3umFm9Mm
	 kphpSv2n3LiuVjqSbU0qw5HoJULLN7+otzutEiEu9R2TiRN4iavNX17nocXdcJPskw
	 DbMBt6cj8k//Kd8+/I2LwDJStg04ysuOopwO5br1Fwdcyios2oRGR7xzctg5gKaVFw
	 44JEqQSpVZflSnAeryryYXG6EIAWXvCbkEPsqh3wUNcy+/LfxMXM4ju6TBzYlwYOmK
	 5jMBa1RzRsPwfTI4UiNkL/nDqZjAPEzqkNxTuP3KMGpKrCpdbWJDEIlD2ZFfr1y97S
	 U21de2cpsQJOw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so575094e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 00:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RomTj774EGa55yfrGGPEXkprDyj9q6LQNKnrZ5tWEJ0YCVzNEKROCmkXnsxKwVZzd25B5y3RJFS6By4@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1RXeN6uI6lG++A5GgC9ix7kSG7CQpA1H38JdtqpIF0F2TvC3
	st340hBS3FvDjpAiEIEROxLxcOEQde6BvS8lU7q/EFSgn5FqD9mYcAZzxQwPwPcYY3HjnfJtw2f
	jpuOuJBtOwPAFRe7lT4Jd0ubt0tl3X0E=
X-Received: by 2002:a05:6512:3da1:b0:5b0:162e:127f with SMTP id
 2adb3069b0e04-5b2d0218984mr1414421e87.29.1785311454188; Wed, 29 Jul 2026
 00:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725022150.9214-1-kr494167@gmail.com>
In-Reply-To: <20260725022150.9214-1-kr494167@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:50:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLmipYnkDJ+Ed4LM44zZYcqU_Q+D7BBTs-RdrY4pDCmjpw@mail.gmail.com>
X-Gm-Features: AUfX_myJB79cJTm0Zj157DCXcqGdSSgbryYyG23dJ4LRJ-XToKOZrwD_9EKx4Bw
Message-ID: <CAD++jLmipYnkDJ+Ed4LM44zZYcqU_Q+D7BBTs-RdrY4pDCmjpw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: generic: free maps on pinctrl_generic_to_map()
 failure
To: kr494167@gmail.com
Cc: Frank.Li@nxp.com, conor.dooley@microchip.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 4:22=E2=80=AFAM <kr494167@gmail.com> wrote:

> From: Surendra Singh Chouhan <kr494167@gmail.com>
>
> pinctrl_generic_to_map() parses DT configuration and allocates pinctrl
> maps via pinctrl_utils_reserve_map().
>
> If subsequent steps (such as pinctrl_utils_add_map_mux(),
> pinctrl_generic_add_group(), pinconf_generic_parse_dt_config(), or
> pinctrl_utils_add_map_configs()) return an error, *maps may contain
> partially allocated map entries. Returning the error directly without
> freeing *maps leaks the allocated mapping memory across all drivers
> that rely on pinctrl_generic_to_map().
>
> Fix this by calling pinctrl_utils_free_map() and resetting *maps,
> *num_maps, and *num_reserved_maps in the error path of
> pinctrl_generic_to_map().
>
> Fixes: aaaf31be0426 ("pinctrl: extract pinctrl_generic_to_map() from pinc=
trl_generic_pins_function_dt_node_to_map()")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>

This does not apply to the current "devel" branch in the pinctrl tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Please rebase (some things may be fixed already) and resend.

Yours,
Linus Walleij
