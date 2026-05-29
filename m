Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0013E5ECB
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084779; cv=none; b=GKahTDTcI9bqifGQjvnqP8SSdQjbHZc6ItQTHoPdr84I3Qe6jC489yLeHOuv7Z7ZQhFtF5Pwh4lWqea7618cFOIS79bT5PbOtPlafz2Ag4wMciXLLYG6HsFWHfpK0SwfC4iZsXibhcHzbV66G5pNkhJwgaBOCse85h4vDnKovCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084779; c=relaxed/simple;
	bh=zV8O+SqmyWm/zpvwcj4ITeBANPTk/EqDLonmyJd7fSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRfyVBdP9tiJ07xpMlQHyrYGweQmkqhjkIo0qzrwOsR+ovGTySoT79xtxeAVnexhmD9UrUafCtPTqOqvU1Efw5Ldr44Hq0y9wptWiUSYUo1PlPA9fPPPSy+Dfefeoos2s79g0XAKyhhEi+8hJ+YDPfaGsdhstqMA5ohkv+iToTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+2qZeHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+2qZeHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F065D1F0089E
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084778;
	bh=zV8O+SqmyWm/zpvwcj4ITeBANPTk/EqDLonmyJd7fSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j+2qZeHjnzJSyE9HU9jKBjSK+G2QmthX0a0a85IInrEvO4MPQAmfRd3DNjgra7FJJ
	 4hSFLFGYdMznGVAW2by6jny9dZeRQVz4yuzY4W3X02mFaqKn0dPg9/7tqPNj9vYePc
	 eydHBaWFgzF7/m0YrJkJwOpDzKikWJ7lUZoz+GBQoNjWi4dkqu5XjnfzvgMfV5T+Tq
	 8TcGHVBVgKH2ba5DVW/4jcjYjV7sLcvAfisryBipumLIRqT3C8r7qZFlmanrU+m9af
	 Eo2ClhJhVT+XIYzpEZth0YLWASFBLW0gzIr+cKalYkRu9i2rQ36KXSEPr/EmSp7a6f
	 UA1y56YofDknQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso16929551e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:59:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OFJncvgxcxzz2WXj6jp1/ORHBqznJM9nlFCJSJDaCn+ivnHqVAzi+lus41+fvFDM32xYwroSds/ci@vger.kernel.org
X-Gm-Message-State: AOJu0YxYAhjrITA73Pb9NREfE/V/zrjeKHL/5bhEquvBsz80yP81gpOk
	2bNUFxSEV3/tyHMy61CyE11YPF4OnrIt1DO6gXTKPImj/I27nd4ooBXVTVrd5xjVUG7h+Z0G/lU
	mkwra9TNnGnAfVidjmnYwCReJrOH70Hg=
X-Received: by 2002:a05:6512:b89:b0:5a8:7425:5659 with SMTP id
 2adb3069b0e04-5aa6091c807mr379113e87.39.1780084776675; Fri, 29 May 2026
 12:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529094143.1872822-1-arnd@kernel.org>
In-Reply-To: <20260529094143.1872822-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 21:59:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPjmM1uy85NPLU4QSrvtwbr0cw370-2dj+oa-Zpr7tyg@mail.gmail.com>
X-Gm-Features: AVHnY4JyJcpGbqSiBLBFReVQVGgWDsizwmrWX0TBi_EHo1PBbdmQqipNPava35M
Message-ID: <CAD++jLnPjmM1uy85NPLU4QSrvtwbr0cw370-2dj+oa-Zpr7tyg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra238: remove unused entries
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prathamesh Shete <pshete@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 11:41=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The -Wunused-const-variable check points out a number of added
> entries that are currently not referenced:

Patch applied.

I guess these entries actually exist in the hardware though, they have
just not been attached to groups.

But it's easy to just restore this when needed so no big deal.

Yours,
Linus Walleij
