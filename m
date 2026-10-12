Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4343CE58
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792312; cv=none; b=fZFRlFvkWYjELurpzFRAUBufGLFhDECfF1l0EoD1j4yYSMHGIbANIiJN+nLW/biPTcKDNRMTQ+0Iso2waV/RhP8aWN5snuuV8jLS+h2/n3XaYKJrAsc3LeaJZLiFpKZxc8X+BIKqhXWbvV2HUTFxEKg1fUsy3KHkCMUo/Qf5AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792312; c=relaxed/simple;
	bh=fBwpQrscKG2MNu6DtML6mpRhuMqbND/8kAIqBtzxt70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KA4K+2CZ1oWwyHWTdJO23j3K0CeaA2KwPZQjgMcUKcuOCZ5qlfpl78DMFG6HJmwfre+GprtScS8ja/JVIe57JEHbR2e1hntLis3ULpyj/ooi71VqQ8mjsZhlot2Az7uHJYHxvC846klBvJaoGTy+o3btSoVAqQ8+nrG41Hr9Nxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyKP/1RQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyKP/1RQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF1C1F0089C
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792311;
	bh=fBwpQrscKG2MNu6DtML6mpRhuMqbND/8kAIqBtzxt70=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dyKP/1RQx3ArMyGVqDcXNAppN/owjaT1MS2VjY/Nse6XeLef9vaodufU76h0NgM2c
	 y2uklV6DlG2YlK1OV1okEVyjbFSP20EpdMh0l/2yolHpxora210x5qNEydfuXQ28/z
	 chUAJGF9jfEFH3Jm2eR1GT2r9hcNqAFkPvYkinC/sGrXRyCesdx0wVjkYXOMMUGnKQ
	 jy6Hip6BWQoN0lCmBXVmjMrGi6QVQueMtg3CK3V9FATvLJ1GTEHu03rYZ2XAc+uMxe
	 7lZhhXmdW0PqqjnHF8Uu7JI8oG2WcH2XPWCrnNl2aiqSSys+5KGghkog/UwTPx1O5W
	 eqCiq81tzuVng==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so18266331fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 01:05:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw4yeQPZvuX+hmolOrW4qkEv2P5JEqxADQi6z9u0tMrqpED5FNXrItj5FyoqpWm8o5C4j8FbRTdANci@vger.kernel.org
X-Gm-Message-State: AFq9FYLfH7gQ6Ts8XKxbMdM9X4gF/9wGV4FXVx67deSPZxno58dDWy63
	W/ZO1rNGe582/EJyAAdQgVNIwmr/tNPJEI5OzxP9bMWBwMp3gLHpjg304XHuLf1QLXnRfdyE+P2
	JYtpTmAwgRA7uvf62qpjQP3vQPN12TmA=
X-Received: by 2002:a2e:a9a3:0:b0:3a9:a2fd:5931 with SMTP id
 38308e7fff4ca-3a9c55db070mr18556191fa.6.1791792310210; Mon, 12 Oct 2026
 01:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012015433.6155-1-phucduc.bui@gmail.com> <sashiko-outbox-167547@kernel.org>
 <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com>
In-Reply-To: <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 10:04:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
X-Gm-Features: AclHuK8NzHYGDfIcjnpzczSW68YihUIiM9-DfvkM2k3b8qWCvW0U7vvOxNAQ2k4
Message-ID: <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:53=E2=80=AFAM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:

> Linus, could you confirm whether this approach would be OK for
> mcp23s08?

I don't understand Sashiko's fringe use-case rambling here,
I think the patch is fine.

Yours,
Linus Walleij
