Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C93D6CD7
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367452; cv=none; b=U5iWXl7DncOcYgwm93QnT8WsjDstU0Azjamb701iJqcGxS+umq+qJXmiOAOehPk3vLHrTU0LxAGCunOSHA7kmBAsOKbtO6//Ll0gjtuUBgtXwrn44cldUdazR4TOTLJhnjXnRoX9dH5clcclyWicC/XSlXXychcGDei7eEWnzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367452; c=relaxed/simple;
	bh=TvOzo8RjsLIaVVajzywOgjFrzZwCgL5apopPTnfRjy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fj4qMJTNdRWOpPZbUyYtBcdX2j6388Lq+EVKsdu4iKpQ+b1Dmxj4FL1ZUXlyd38jo3WDBbCYHbxH+EZJTW/D2FAD3Rzwqt5G2yQwew6V7DMUlryU15yWmo9KqB+1M/JC4lKj9cgp3VIaYqR5gIeIGjWUyXBp7aAt0/NhBlDMddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YN0cVSjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YN0cVSjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9D0C2BCC9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367452;
	bh=TvOzo8RjsLIaVVajzywOgjFrzZwCgL5apopPTnfRjy0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YN0cVSjBhpqxw6QKrKuxWUGd11SDdOBA7ABeXT/kOAoepwMDJDSxLRF5wJQo5lmAP
	 PSuUNffzGyUujMFAi+ZvFWFsQSoZcLjM7nxpc0Up75sWfxrRjGBebrtFdIxP6OGCDo
	 pkpUQuOt67WzOzVgBAt+S/e+k8LPQh7RI7z4l3usttSPrYRukOqTNkcoWGJIWwWMAq
	 tHin3fxcpQQsW0FTtXaqUyDnD9Rhmwo6JG0oA5MlDDZCKjaIL2158mr5VKncs++iS9
	 Xn+8aXW/EkwWjC7/iUFZ1fVl0woDNBSBjUgLj7NRrdY1nnQFuSYkMr4X8piUWhPF8w
	 5MXRvYG/B0hGQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a402b2d102so11796518e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yyNX/m0gkH3F13941S3R/xGnP3tdtL8ZgRniedALBjoHqZWnoNQMuvZ2Iy+RdBHqQD4dDd4XS32C4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28Jyd9ApoQKZpPRZi6Ly5cjGqXRBv6kQHN8EMtcvARkJWM393
	obACU/f55mlA81Oln5uuaKEpIBjS3y4ihuicRdmggKKWNvQq/k+eDooJl1kMG8aIl26kvcoph7X
	2IUOPk6VE1NR4nUwCqodDBP7GStH2GXA=
X-Received: by 2002:a05:6512:3f28:b0:5a4:505:f633 with SMTP id
 2adb3069b0e04-5a74662df1emr1039066e87.38.1777367450963; Tue, 28 Apr 2026
 02:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:10:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLmeH6Hy1tm-uTV7YP9gHc7vk+-vaYNT5cqZPU75Jyt-=w@mail.gmail.com>
X-Gm-Features: AVHnY4Lt1Nb-eIUW4vHkvKpaNVPQodgCRHtRa3BH6rlTVPd0JsgyLmESZ18n1Jo
Message-ID: <CAD++jLmeH6Hy1tm-uTV7YP9gHc7vk+-vaYNT5cqZPU75Jyt-=w@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: More compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Joel Stanley <joel@jms.id.au>, linux-realtek-soc@lists.infradead.org, 
	James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 3:05=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Follows https://lore.kernel.org/r/20260410103005.163128-2-krzysztof.kozlo=
wski@oss.qualcomm.com/
> but should not depend on it anyhow.
>
> More compile testing means better bot coverage. Plus having ||
> COMPILE_TEST and obj-CONFIG_ARCH_FOO is kind of pointless.

Patches applied, early in the kernel cycle so the more build errors
we get from these the better, we have time to harden the patches.

Yours,
Linus Walleij
