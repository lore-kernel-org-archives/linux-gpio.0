Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2745FFAE
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774735; cv=none; b=ZtSKWGnHVa5N1Ir8FJ9Xfk8Erg9DbDEzUn/mIAYx9TolG01WDlWEaW31u30temTulziSLAuvyDuaQeBDANVkV0DyD7SLVJug93V0JeW/xvBrw/wGxYvutSkU5D1sWIZ02qVfU0RsVQIQqQSXwDWyZQiBvefzX7ZtDTCzHiEK8ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774735; c=relaxed/simple;
	bh=LWlNm4Hqu/6yss+FNCzGhtjesCrAp81WnXy+gDh5wwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZ1IJTC6Vyq2ALZYMMwH+y1+FNtYsmKHTHsvxiNtSVEalsaPTrgub1XlFGmi8/tbYoWztapdGe4RufI+HoXl/9ojkGYSNhXMqxv5VR0rtw0YkmKfFK013ZrlexFJoSYPFVZcrJ5m/1I3sMjkMgWSAA5V+vJsKfZOF8vQdqO9L7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNDNhU34; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNDNhU34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9691F0089B
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774719;
	bh=LWlNm4Hqu/6yss+FNCzGhtjesCrAp81WnXy+gDh5wwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VNDNhU34xfQdoQi4d0Alm7ZohQ//9Nvt51fn275dq5pUxqzvdJyigdv3+zG0iE4PB
	 q/5kuB3J6JUsk3SS2Rp8jowZLyO9LJY9S1qcu9Xe+iIh+/YYgFDJ7rRoNFcQKc7oUa
	 OLI97kpi/cgpnMW9Qy6gOcurtjn6xECLxqZ/RSEVstqIuhHDaUQzxsnZg4Ver/Tq2S
	 wO4lW6PrDVWHIiOk4GChGQ9NkjN5Qosm1MhM5aM2qBOyeXqmetKYXdae+a+mo/h39O
	 wcaNYIcsWAj6deZ6SRb0cyO109Fkx3iQib/7HsJMLhNNFmXHLP07PT+eS/Wk8OUKHs
	 Ed1vBd352J9ng==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3f77a228so497863e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 06:25:18 -0700 (PDT)
X-Gm-Message-State: AFq9FYLyAH5PO8hDe+5QYfT5GHqXCcdFKDBZRxFNFc0aPVob7IaSpBPl
	lKONxAnCTYAs7a9WXBZvdLdu2EuOhrDsVanXYm/69Qu1/gs3eqIclugg8/Ge68ZMyen515x6Y2Q
	lj9KQGvA0PkPf8STMVvgBebZAmAkjbJU=
X-Received: by 2002:a05:6512:66d0:20b0:5b8:f7c0:cdab with SMTP id
 2adb3069b0e04-5ba40601a87mr483807e87.53.1790774717776; Wed, 30 Sep 2026
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917230650.117403-1-rosenp@gmail.com>
In-Reply-To: <20260917230650.117403-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:25:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkrAxKynTeBn_aSj7RXzZKz46ubEHCkW0C27Ov8zYPELg@mail.gmail.com>
X-Gm-Features: AclHuK9iCfQA9adOSkkO--8ZsscDbZSc4jPsWtSvpOWhQkt94d5SJSMX3Aphlcw
Message-ID: <CAD++jLkrAxKynTeBn_aSj7RXzZKz46ubEHCkW0C27Ov8zYPELg@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> The Armada XP variant keeps the per-CPU edge/level mask registers in a
> second I/O window (percpu_regs) rather than in the main GPIO window.
> The suspend and resume paths however read and wrote them through
> mvchip->regs with the per-CPU offsets, which hits the global
> GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
> was therefore lost across suspend/resume, so a level line could end up
> unmasked behind genirq's back and trigger an interrupt storm once
> interrupts are re-enabled.
>
> Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
> both the suspend save and the resume restore paths, matching the
> mask/unmask handlers and the probe-time masking.
>
> Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
