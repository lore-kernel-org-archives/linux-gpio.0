Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B4E2DF13F
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786123231; cv=none; b=MnmlODo4sbI72FBnli4bahOGkwER4rtv3S+x/XGDXTkSSNxqnpLgo83pRAbC7lVmopghsZLiKxOmMEB7JUraNJn9PUX+fSzUSPqOxwnyjxDj4CitLHbhAQ000wt24u1a9Hmgn6aX7ofJQPiZSEz8GNubcifz9ry5/plQCXO2JbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786123231; c=relaxed/simple;
	bh=z0RYy/nIJvTOLkU0NIZgUW/550l8f5zGxhkeKOF5248=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5Ny2c8heeLgvl1kPkrQ/VAmP6Rmxn2gPEkl+p14SlJKH9zlRtREYhrokLtV21yrjY/i9qJC99CginB545go9Nr5EO+282m03JmFR7NrvtqOkXhltO9DTJMn/cPhIJGguNI1U/yuzk2Fv/euXj6XsyVaA+qRZjJyN/ikYrUSlk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GI849d+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GI849d+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0071F00AC4
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786123230;
	bh=Gg3oYVQYlXm6P2vtp12+vm5BasXw2QLtKk//NjWMotI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GI849d+ENPlRt+jEfPUbSYHpsLYzTq20IlsqybWARiiUfl6kGQNclXPXL7pYFBTaQ
	 WYeu4cXuY2rPPYVA5qNLVQCiBs+sBy3ajsURnJkmYPe8RtanD+bIljsOL1hBDEsko+
	 M+OPbNP1y3tU8euCPePmPVKnxU3x0HdJ4eauuuoKKccK2twfIthwHphxBXjWjI/7rY
	 KT8wIHsOiTM0Mef1EvMzCeYqyInPdV76ZRmcJSw57iUDN3RrY/cS824MJwvKbLxpAK
	 5zo3eSpgcWhxi7PYb/z15YJ4kGrcG0pKoDgzDn+iNXaQy6Xzv2rVdOeCXimx+hy/EH
	 5SmNmM2vCJkXA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b0117dda13so3150407e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 10:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoRDLGqiwEhq+6jgb6z5XJ3lrWilr7G/O1gB5Huh6FKn+sxDaA5+xlFL/zN3CtsJEL55I3diOljZQY6@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5rvayoM2RA2KJICsLjOjUSHxnx994xuKi5sDogDfhP5kDjhF
	WRffBMC99O+coXH8raDR+LKKPb19XHn4NLj5o6uEk2gNePn2suoriipB7sAgZeIApizpIdtBpAl
	GroFwV/h3eKGEk0E35lTWaRZj1HdJ0w4=
X-Received: by 2002:a05:6512:3784:10b0:5b0:12e1:486c with SMTP id
 2adb3069b0e04-5b30b740f96mr210413e87.24.1786123228943; Fri, 07 Aug 2026
 10:20:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com> <4c0f22af-6124-4118-8ebf-0725e8fc89bb@iopsys.eu>
In-Reply-To: <4c0f22af-6124-4118-8ebf-0725e8fc89bb@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 19:20:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8Ki5cM9buRVRNNorC00Lug=Zxyvco8jx7fQi-cqT8wA@mail.gmail.com>
X-Gm-Features: AUfX_mxQjz2qk4FtcquHlSD4s6HrtS5fu7UyLqTNePyQlrK7Tk9WIU-tS9v15jo
Message-ID: <CAD++jL=8Ki5cM9buRVRNNorC00Lug=Zxyvco8jx7fQi-cqT8wA@mail.gmail.com>
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 6:39=E2=80=AFPM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> > This patch set began with 11 patches and is now 37 patches.
> >
> > Is this becayse Sashiko is touting you to just fix more and more issues=
?
> >
> > I think at some point we have to draw a line and say "let's fix the res=
t
> > later".
> >
> > On the other hand I appreciate your efforts...
>
> following reasons:
> * move binding changes to separate patches (8 patches)
> * openwrt upstream changes (4 patches)
> * issues found by sashiko (5 patches)
> * new features (3 patches)
> * code cleanups (4 patches)
>
> so growing from 11 to 37 patches looks reasonable

Fair enough :D

Can I ignore the  new Sashiko moanings and just slam this all
into my tree for linux-next now? I.e. are we happy?

Yours,
Linus Walleij
