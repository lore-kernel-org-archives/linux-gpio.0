Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E83E5EF9
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946964; cv=none; b=FHA+BEAKk+v/A5LKQYMOUStedrzWc8uBowv8z2fOd1HFha4rDYhpiI+lEUi9MIUJU927+1yHWPRDxlQ2dc9yaOFPVPjrb9taC3aYqxJiu/pkP7Q4rBinaKnkBWCCRE7oB0liBOVef6KJzPTM/wO9wm2AFtwPkO5Rv0aueaeNuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946964; c=relaxed/simple;
	bh=rpEx0+La6xp+uh1Gw4xWDWNT+FHG8ZwUhMggbL059Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMjrxupNp1Sj61/toajLFfm744/DKld2BJrSueAiazwdhtDnIprJz1sl3NRj91+EhH3H50c6ZsNtgzmMKHhWKfYr3zZ/BtM28idv2dgy4K9jT/G+OO9EOIxt7YPlUexuwSO9j6mvb+p8+kn8Rndz5mwp/D78UkFVW0nJQMvRKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbK/KpmL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbK/KpmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6397E1F0089E
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780946963;
	bh=rpEx0+La6xp+uh1Gw4xWDWNT+FHG8ZwUhMggbL059Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SbK/KpmL0hK94CtJySNbWjwrOrBir/D8yRPZFlVo/glJnlPXNqrssNEVbb23xC21a
	 fneBsk209DjPKm1sZBz4AB+8iCgBglm1aIBnDODDZB2w07sP/kTlTGUkMw+qLEg9F6
	 LEbZu/kGIyGYSHR8fpESWqq3fYleGrg4QrylR1RgqkIBORetJdvm/nIrJG+qaXJbQD
	 6NBKuudAnuOFzgbJDToq1uE2jvjRQy5frO6fe+/wMlSIn+gJV0WpLMEcrqSwmQEKR/
	 bN3slQ0ILi1KzaLPLN7vRUz0nONTWfjytfVqT/qWnM3VLTl0gIVqE2weKdVf2lYKRw
	 nWzz5owJsBG+w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68d9d56fso4754407e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 12:29:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+nr7cGRyCTswWgzMzXD9nO61MBtKSUXJ7y7CJ0ueJjwuuZ8v8SsgMTjyURkk+D8e3ADMHArBcWprqG@vger.kernel.org
X-Gm-Message-State: AOJu0YxffBjRbGdlnImhwpgx68Ch/xS/uWu1r5EJhmbID/CsH1qNTHkI
	2eCYSPcpLm2xUnWKYSBbg9kSfByyVlpftgvCokfiaWTqQeCPKgcyz6g3m9mjmgs2llKzNM3ngOA
	hHK8TCJeWsClB966AoyXof5UA8874UTQ=
X-Received: by 2002:a05:6512:3c8c:b0:5a8:9909:50b4 with SMTP id
 2adb3069b0e04-5aa87be96a3mr4844941e87.21.1780946962145; Mon, 08 Jun 2026
 12:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
In-Reply-To: <20260529100308.51271-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 21:29:09 +0200
X-Gmail-Original-Message-ID: <CAD++jL=V59hoE=7Xv3=2kyO6Z9PbejiStUs5LXOo06fCpn=2xw@mail.gmail.com>
X-Gm-Features: AVVi8CeHjAMDyz1xo5GR6gfqE45MW1Df0V_jwU7JlxT5b5PN4nUKH4NEzlAIG3g
Message-ID: <CAD++jL=V59hoE=7Xv3=2kyO6Z9PbejiStUs5LXOo06fCpn=2xw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: mediatek: Enable MT8189 as loadable module
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:04=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.co=
m> wrote:

> This series enables PINCTRL_MT8189 to be built as a loadable kernel
> module, which is required for GKI (Generic Kernel Image) + vendor_dlkm
> deployments where vendor-specific drivers must be kept separate from
> the GKI vmlinux.

Maybe tell us that this is for Android?

> Patch 1 restores the tristate option that was recently changed to bool,

No the driver was merged with tristate.
See
commit a3fe1324c3c5c292ec79bd756497c1c44ff247d2 (tag: pinctrl-v6.17-1)
"pinctrl: mediatek: Add pinctrl driver for mt8189"

> preventing module builds. Patch 2 adds the missing MODULE_LICENSE macro
> that's required when building as a module.

So that should be squashed into one patch or it will not bisect.

> Together these changes allow MT8189 pinctrl to be properly packaged as
> a vendor kernel module while maintaining the existing built-in option.

So why do we change this only for MT8189 and not for all
Mediatek pinctrl drivers?

I would just add this tristate option and license to all of them while
you're at it or I will get like 20 identical patches and it's a waste
of time for me.

Yours,
Linus Walleij
