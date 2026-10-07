Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B8A486B95
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369374; cv=none; b=W8kKt8nthSgMz6AKLs72FCdugvQIL0H5MiyYPHc1QgtoF4An/gZz29C3XSf/IAUaWgSLpgTf0vpRYplSJG+ZOgAmeYKetq+pVrQ8qMzZ4ov7K7heJy9GG+W07ttaZGi/5JedJNRLFbJgJK149i1BgsEmUJ7n33N6xuzBrrebXWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369374; c=relaxed/simple;
	bh=gbXw/P13odUIJOlP0mZOEYL/A5Hj204/xec9+qFdyQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mC2e/11fq3FW2RH57gLv218rAAijbyeY4krY98JHGMsAhROEx5rRc9xb5l88jB7szczpWfCPKmERy4j54VvjFZssSuVmZnKbCxSBycC7usGWYVYOoHGijK4tNI/QYp/O3N1/q3g8zMkgxEJdmQuqm8xqdSx7zsMD+LsM2Xcu0Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvoewflB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvoewflB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AEC1F0089B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369345;
	bh=bx6mWRdOWgIb9ye+nLE/tkjNc3nUXMNF7mOKMpqxWAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZvoewflBJxOXYhrH6N9dMuZRVH4BqVoFArQ2EiVqBeQfEpriWJLYDn9eXA8aeKjrr
	 xHBMVyPdWWKjI8vDDaHGAebd+PH6Gh67PZhMHC2xlh9fbnNNuDdVB6XnbxnY6oiq/M
	 5pWTjixqER7QC/m+Cxtl3zHHvE1Bmfnwp2OeT3QoGcLgYV4jhUJu+k7ORjhqWyXMJQ
	 x/2M1My8oh1hvsv2fLcyZVg40XZUuFmeyrxSoDefsES1U+8YW00pN2k7OPWBBfV3VV
	 bZErqZj15Yj0xFn9/BWsw/tGRI2yuYXxOP2igQIFIlvZPhbZxghvE9bpctbdGvDofG
	 0v3eUTKq+qyAQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba437621bcso1103829e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 03:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjdKJm0551N6qY2B9Ua+1QZPnHLimoIXDTeEPscBeRfi4ZqFo19NDNWsosIJtGnwc34sdUl5ZDaG3d@vger.kernel.org
X-Gm-Message-State: AFq9FYL1DhzxaNGSMXlKRyjz7q8va33J/yepnhxMgLYIquWkKuuW/S+A
	cWEtmDu49Aor7GXjr2/O5ZVbbpcIwpQgykDVa6CZBtGowdI8lomjE48BY0qYToIZfPswLrvLLPg
	Iu4I/mmZaPih0oQNPOeNGqt7usBshruY=
X-Received: by 2002:a05:6512:250e:b0:5bc:b7f6:99af with SMTP id
 2adb3069b0e04-5bcd0639aefmr556834e87.1.1791369344545; Wed, 07 Oct 2026
 03:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-5-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-5-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:35:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0CrXLdaq=0XW=dkctKpJN7LNZkobo3fry7O6J8wuVzg@mail.gmail.com>
X-Gm-Features: AclHuK_GYh3LWvdqsu_xdCZ9-oDxmD2HZEJ8XaJYtg9uAMl6VGST9hL4DFl5ONo
Message-ID: <CAD++jL=0CrXLdaq=0XW=dkctKpJN7LNZkobo3fry7O6J8wuVzg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> samsung_dt_subnode_to_map() can reserve map storage before adding
> configuration entries.  The no-child path returns its error directly, and
> the child path frees mappings on failure.
>
> Use one error path that frees the accumulated map in both cases.  The
> caller ignores the output parameters when the mapping callback returns an
> error, so they do not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Peter will decide and merge this patch.

Yours,
Linus Walleij
