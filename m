Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C532470F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743554; cv=none; b=IleRCnHJrVGy4VRK2jB/N2cvsyHvyZDbN6DF0d0IQvA1YXxtXrxQ0jJ8n3sHjWo9ctUsrfo/CSupyBnC3I+2FAew9cTqXcDcFNWBWYqJqWJtx4nhy5VO4HrQNFi9gAEHH2aZIPmBbve/kVCirrA67EeY4jKm3B/T9uRuHpxFtL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743554; c=relaxed/simple;
	bh=WgoW38fWzknfdNLjDWLlLz2YQNJlq4RKHZXI8sYBKZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t22xp3GKJD51UdgWweN+8luphIc4WR+/zJU5trYZClLpTbjelARm4+scAXSay1guDAxY5DFQ/sCaBxaJkZRmD4CpNsrg2/tsaS1oXbn13Ky0DmyqpT7qqQJ2AQy7xjlRbL0dEs7VeIe7tQx8QKNU2XHZ1gR+tkMm70DKrgmpzyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiyGSCVG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiyGSCVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FCB1F000E9
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743553;
	bh=WgoW38fWzknfdNLjDWLlLz2YQNJlq4RKHZXI8sYBKZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NiyGSCVGy9MNt5EVLlbzhyJHtSfOGumvBSVDagcbdM6TOuMtfr656Pn1oZAbzByEk
	 go+sfIIAIETRxX5hKdL5ODxE34/gT8rQJmnTWzUGKRsOdZs6GSK6XGP8jVtqMFggHM
	 cTZ6lqtt0GK1Svf827l1MSItCrO4VPKnnE4Fq5xsvC2y12cV6Yyi66NPte20SG8xk3
	 Zi51goSjFZ9zbSeVSZpWGEJBiYYtUq8BnBZ21GEB5uGZhnN+zFGYOMPPTI/HJe+ApE
	 RjuVxz6/DrUgOaubsV8lXqxt32FDy1LCNOX02Q1wlxTsSOKEZRpUZgethLf6z9PvLH
	 /xFufxpUGnpNg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so2343729e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 00:52:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YzLMgST3DexG3BSuWd4L5I+/qtaytjfoaybtV011ILc5Pb3gKTh
	pzyU9HppsImZVWbhiqi4UIPTo+mVX4IMPEKsT4GNDJrjbnDgVBAoZj2iXOU3QWpilt1ZAv9qgQ3
	BA6Nn+4xFPPGSISUpDoLAQGs6B3X1lu8=
X-Received: by 2002:a05:6512:33ce:b0:5b2:e82b:37f5 with SMTP id
 2adb3069b0e04-5b2e82b3a22mr974942e87.2.1785743552370; Mon, 03 Aug 2026
 00:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729211048.719757-1-rosenp@gmail.com>
In-Reply-To: <20260729211048.719757-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:52:19 +0200
X-Gmail-Original-Message-ID: <CAD++jL=uCMote_c4nMh-9KHb59MHY-pM+BM6N6j92hUccuVE7w@mail.gmail.com>
X-Gm-Features: AUfX_mz1QpC9aLqfjp_6vEbrY9vMro-_xn3bWTNmVZUcyM4Bt4lYInZo10nagtM
Message-ID: <CAD++jL=uCMote_c4nMh-9KHb59MHY-pM+BM6N6j92hUccuVE7w@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: pc104: Add COMPILE_TEST coverage
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:10=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:

> These drivers used generic APIs and have nothing PC/104 specific that
> prevents compilation.
>
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
