Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3ED391E5F
	for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786899715; cv=none; b=HHTN8A8Mvu0K5vyu6kPbHpF8NPiZORdl7SxgUc7ZDj5cae+aqOYy4QqilZXVw6sb8mozEfPjzKoUN2T0rjuDmJA9N9nYQWOszb1fuY2mbkWqc3FWGOha9aXc3GapzE+YFClt6Hx+SL3f92u1ZxrCfdHbmsB6uCh+cwU9kzFJpOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786899715; c=relaxed/simple;
	bh=lSJQLIodR3waRArNX7nAQigBXZ7KMNI+H3yZs3Z0s/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTeNPJYIyMiI7Ml1+5nRGSUmC4ol9fCnQU/fivEPeMfcVRKcPm9o72NcskYPqK0ugCTe6rrEuPT4trTpwHwbtyS4F+Vk+afnNoK8vBFKjYgNlp+3QCmKSePvvJ64Pe45YHC2Ynrs9MqtyIEXEQ6Q2jzMuZkenqMW8axy+UV9zF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtxQnNrV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtxQnNrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F3C1F00A3F
	for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786899714;
	bh=lSJQLIodR3waRArNX7nAQigBXZ7KMNI+H3yZs3Z0s/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YtxQnNrVUSTzePIXxlBG8TSP/JEYZW/IWl13arpuBcl5FQ9AEDvm4GzM8ZqJuz/jN
	 drezQ6bdv+QTg4DP3vKWAsHUvnmV9CqriZEH/5XFrn1SFOk7jtykvFo7Z6YuFuiue2
	 2dnU7uDeT2N81tjoIw9HqzKBtptHfCFtiDFsjFPu3QONCL3AKbw9K+eYp5zINIR9np
	 moNBMWF7dUVzFEuPZ46AehY7JPYmbZKCYnZxTYuxIvLiA6fRXyuVTrVQMfc683OfZF
	 o2KRyWSiXuPdBrIFJ61V1aH1gBkAW5D3NvX8EXfiC2QiBH3MKeaix7stCbaSqNa7oI
	 hREEGgpllqw1A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b29599b81cso3590466e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 10:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrKoE901cMEIr5nhMuOHqVA9R5Oq0O7QpfBOwEcZ2f+46TPZOPBRJZs31w8Iuz+emE1kW9hVzt+a8vz@vger.kernel.org
X-Gm-Message-State: AOJu0YwzDJRiK49+lzPcRwYVGwWKRjXMPXtc8gmxLm+qmqs5/e8LFVS8
	BvgeJVnNbUH3SmCB2lQDXED4yqzSZ5LZRQW4VSuAGXPuSoR6stcH42r/68xudPMrkO3jVs+YcjO
	671c6YpJBZGzQltq7Ku8W4nwIcatjoks=
X-Received: by 2002:a05:6512:3f01:b0:5b0:1f06:f204 with SMTP id
 2adb3069b0e04-5b459138fa7mr2771373e87.34.1786899713230; Sun, 16 Aug 2026
 10:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813084642.11325-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260813084642.11325-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 16 Aug 2026 19:01:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUFt8kKGumURy_Ohx7GvxSvko7=u_YGFkfK_KK=GnsrQ@mail.gmail.com>
X-Gm-Features: AcwNN1UADoNQ0z2nSAL4wSH8-R-tV791BUF-pIBxOXP0COAi1FbSRCbSxYhqaeg
Message-ID: <CAD++jLnUFt8kKGumURy_Ohx7GvxSvko7=u_YGFkfK_KK=GnsrQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pinctrl updates for v7.3-rc1
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:46=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Here are the Qualcomm pinctrl driver updates for the upcoming merge windo=
w.
> There are two new drivers, interrupt handling improvements for pinctrl-ms=
m
> and some minor driver updates and refactoring.
>
> The merge from the irqchip tree pulls in dependencies for the PDC interru=
pt
> handling changes.
>
> All of this has been in next for quite some time. Please consider pulling=
.

Pulled in, thanks!

Yours,
Linus Walleij
