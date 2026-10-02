Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D5B368D76
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977588; cv=none; b=o2BAUgTUiiU6K35+Xg7Mb66tA8RE+mrTa7KaoQ/CSwr3JYYEwYrCGvJej2Rmlgma4nPMwQYX+JiUOF8g88xi7BpJsUQtSb9GRCt0eqwSW/hB7MkWgtnvcZV2/ROneYDA6cAtHY3HAEkCSOl+8Z3n/Sv2jm39t3I/vALH5SYP5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977588; c=relaxed/simple;
	bh=i0cC4wvYgnWVXVz9jQn9jqtYBkRgwyJOqcIgkuQX4Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knBot6gPGc+wBoicGO/ueeL9bUioa0KPGh6QMiJq2TfK7FGR4T8bj3XBYp25JYyYp1tvOeiaB8sEz+Cwk091/iQB8UC3abS9mFH7CqWEZuZNHoK570vRUnGDNH/+PoxXaLn1al+cPr4LFr8oskFy1VaxzTV4DTQAjU1rUGlpy8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgGGoqu2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgGGoqu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E3B1F0089D
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977586;
	bh=i0cC4wvYgnWVXVz9jQn9jqtYBkRgwyJOqcIgkuQX4Wg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UgGGoqu2hEeTwl0fOs6enOXUmJ4iECII9OoA7jXwx5V1Z4BoRLhltsBfJnZelK+ed
	 yFTgeim4E28HQjzh0ztX+oba2nbwGH1zyuGUfGt34V1hMjLBDPE4xDhpH65zhhKBl9
	 ImUpz5bHtsz59Tu1e4ZX+sf+/AS14+AdWhOqnh1GHVTakM3wKupk6HtGfmITFVbPk1
	 Kg7mwOHn69Qr2s6R/2hbMLn4uzPBpXJWJVJppe2ASQtnuiB57I93jC1fwzOzCcrZwP
	 mzV6DPhuEACXA4PuQj9FTjAMoVlipt2LElF6F4+Ut5MWx6qTqIUR3c0jP1xF8ookZQ
	 3t7EdiOOC8ecg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42939bfeso1614e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 14:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpO0Zg4Janx2SB72C+g2xzFWzmHkbKr5CK9xZe1krqlZSHoOoi1QUH2ZQMx1FSeZULQJB9/OV6As73@vger.kernel.org
X-Gm-Message-State: AFq9FYIIm8AxZEfBrChvZ5wtokgeG75Cw45ergc5RRNb8UuNPEcxVqeE
	kMsDwmKr3uZ2DhXCLCVJQ/w2YByCWkb8XPA0UHI5nhcG8Y9QHm/SdK8EKekgNq1hPbUxENXrfc+
	Qp07DzbeG3Is2sEDyGj75unCYaBvbdiE=
X-Received: by 2002:a05:6512:4011:b0:5b8:bc5e:b57f with SMTP id
 2adb3069b0e04-5bb9bc1dd58mr1538101e87.55.1790977585496; Fri, 02 Oct 2026
 14:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002124636.3514597-1-arnd@kernel.org>
In-Reply-To: <20261002124636.3514597-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Oct 2026 23:46:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Bs+hbNOcWQrHozjzdEuOifj_8P_jngUU+mQ4b49S_pA@mail.gmail.com>
X-Gm-Features: AclHuK-xzc-uCQPseoyib6NWPHxpR0VlGhbebMXUz5ZQfR0oPv4fqfP1SyiVadA
Message-ID: <CAD++jL=Bs+hbNOcWQrHozjzdEuOifj_8P_jngUU+mQ4b49S_pA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ambarella: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Long Zhao <longzhao@ambarella.com>, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Benjamin Boortz <bennib@mailbox.org>, Frank Li <Frank.Li@nxp.com>, Johan Hovold <johan@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 2:46=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On randconfig builds without CONFIG_OF, this driver fails to link:
>
> x86_64-linux-ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_a=
ll':
> pinctrl-ambarella.c:(.text+0x54cdf0): undefined reference to `pinconf_gen=
eric_dt_node_to_map'
>
> Enforce OF as a dependency as we do for other such drivers.
>
> Fixes: b40e9d140c24 ("pinctrl: ambarella: add CV75 pin controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
