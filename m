Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036195;
	b=J51WGhYGQv35MGcZl9IxiRKCTXiYQNIMoAKuQs6Q+eFT1e28PlDa/Ucu773t16tDkH1k
	 S9AEVjQFe2ZFUpe6+dnjxfNc4Vd2ho58ZW4NPNTpufthtbwH2wp3Mqx4sfIg8CK8/OSq9
	 89NBwMjvmr5xauTmvWf7SeuGJxXiK/sJt4sAYojsUyHycxQw6VdfrW/OSmo353KXn9LVU
	 eYN4FJLsBpOWhkHZpZmtSCYuikZjh5V6hIha7+9h+0IHoa+BuQpMO78GueZuowCXU2t9V
	 +HJJOK/QmmqaDU2ocm1uFbmylNsi26yYiSj8Fj/fIJNmMKj5uN3/z3+SdKceDqm6CiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036195;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jr2i5Ws8efXcq7fsLottyNoSDK02f27nflx3w/WwBX4=;
	b=OKgDBXSnOIo1Oapv4qsxANca28KKfpJORfRUo06VX/kxBfSkKMMM192Fs3JAzp7k3uFR
	 G7hLX1fBfXtMIRnDtlCuvAETIYeE5dr1PLOUHZtRLq1wJi909CRdLmvKEJ8B/ju01mwj/
	 khIJZuGpHQRyb1/3uTeMBR3xMJg5VeOBGm0SLyMDiQC15McN0EwG9JGNk1sveT8rjUtnj
	 KKL4SJkzChqqN4bxpiWu5D7XVnO+uyC+6CZdPjM9LHfyhcFhU8h0HgT7FGgxTunWJbHMC
	 mqdFQoch7W5w/VB/4xSYGnByNBjNUZYQVcx9q9kML5gHcESTUvGlk/1AelrgQee9Sqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e/v+eP0h";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9677606A335
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/v+eP0h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741AC1F000CF
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036195;
	bh=jr2i5Ws8efXcq7fsLottyNoSDK02f27nflx3w/WwBX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e/v+eP0hWOV6kjrBAYvATcWqJ/gpTYajGabAuTPKDi7RdPofCoC4e4edajjc5vl40
	 9yfvw4ZdmUN7Uf2c53lZTCOqs505LhW/o4zhZIDc+pnvObwR31spw8mxRUee1Al9y8
	 tMCLQxfN0H8Y8nP2MqZA1EC3Wyb3Hb0imIEt6VKrRrtYYbZ0OfGkb5yehDHQqfy5DZ
	 fNqnR2Ds/v3WKlR+NbSZQ1jSa65a8kBBXS8dDyquOO89DCX7OWtqJiKP51UimA9hNt
	 W+8MYCG0JCTZKPxdOJ8Zz7jjSftDVIP+0zfe7+dV58zgGOzzdco5q6OTz8JltFYLQP
	 EpFBCJR/jEn5w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f7768acso1128179e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEsLVdy8UmNJHfYwNSGpaqiyJk0v+ZetZq5OKrbd8Z5fKJjBi3YSHhWfQI6mAK2oaSXJ2W/8a1uppNj@vger.kernel.org
X-Gm-Message-State: APuU4Z+uyhU+rtRg/iu1MCcY/G0e+qmzj52jGwlsZQslLtHEjRaUniec
	631mAV4w43nExbq6BIGkduRJBLRsAQpat8cTR3zWRtnpOIFhFJ7dmjIm5ZmIZOc4BF/DskssVeq
	7dI1oRSD074sxTPgsqRJvw6eXGkM8nJo=
X-Received: by 2002:a05:6512:6891:10b0:5c1:b107:2bb with SMTP id
 2adb3069b0e04-5c1b107097dmr214230e87.29.1795036194225; Wed, 18 Nov 2026
 13:09:54 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:09:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
X-Gm-Features: Aa3M54qVfEnBQGnC1md9osy2E13w8uoX854ImpVfar6VoMvtX9B4F6U4NV-DAk4
Message-ID: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:32=E2=80=AFAM Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:

> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

Fix your email address in .gitconfig please so you don't use
your login name as name.

Example:

[user]
        name =3D Linus Walleij
        email =3D linusw@kernel.org


Yours,
Linus Walleij
