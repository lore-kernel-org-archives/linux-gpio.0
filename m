Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227988;
	b=2W10WRTgf6MRVcOE6ZmD48th1ljNBum33082E/tX1bWJwcHERD1ukVjZ/qV/KtnfjDuM
	 HMGA8UiwObXQrf5mf94MNSjaE5g90or0Ym5SQpWbZ6y6mhapzgDgvf1KHgULWskYsrHT9
	 wfu9082JIioMZ120kwhAEpIVg5IkAR1c47Wu89IY/mwgy90sEd+GbUZz2IZb9hMUeXvoL
	 L1rEjbiMkNzfrjrV52UWF4ASP9bALZXDUBcIkOZLBLtZDw6bk52KEVWOKT3nuQtdBmjyH
	 s8L1iCB6c9i/wVy7KGfULxbAOy2OkM0Fye5eXckrOyhnpg9ewcjLtWjKcIrPsoAjMlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227988;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=;
	b=vcdTLeiJIqQkti+r49Ihwb+Yi049/C3xEE3dXMOQK5/jfZ3IevGR8799rnUWbO8OVtLw
	 j18rcSUisIqaXxHw/gsgOehlopJCwT5OPOgyYHbnhYXf8+mVIfO3s/zH1YmkNQq2vAH5q
	 9RExyqpS2WqQRdvHOZ0nEaNRfN/BmyxGm/W3iy7piNSwzXvvbEu47+4ycSRgRKq0Co/EK
	 L537ZJWEa4kJzcPuDG+Bkhq0XWgJiee1y/PDdE5RwNrCYpM3BI7l3XL2cViFM5M/yhRXG
	 wkKBnd2eVLqTbzeOwdSMyfoqcUBkgqpN/jkAAHlhEANZ+es2RElA57wGTvc3p+3Fo5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoG3Tpvr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299B606A329
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoG3Tpvr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFC81F031EB
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793227987;
	bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MoG3TpvrBpkcNOjjXlzCqkry5e09Sbh4WEMosecwIm0u4ucwfmxyGCSH6HmVBLD+E
	 mqnizOjovDh3TSi8hfYf1rVMAOGP3Sb6kXOELfx52ckxd8gMtYgQ3On7WqlUiS7ArT
	 JWqMZmtJ4vCAtC6uAVKi0bEueAN7uWAFbG3DqtVJoxzjjkfb1dvSk+WJbQ5vBaTI2V
	 OePwGMMsXiu1K8mjxMbs/4pzQehbukEjthpphFtH2j3MehP7uF5L2a1OpcsQWtl88F
	 kyC3lhriuzdzXzzQSvd+Y3U2nXTKABoymr5BNtHdbnNHPkQiGJoww8nQmkWNNqbFbk
	 dQPs7jqom46rw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso109452e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 15:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfZSJhQBdFx34JoYvXRAGG9qIe5DYH1cXgE7ZbyZ/6wpl6q3h28iPFn6IrSn6mAEfGtVQMD/Qy8Fqc@vger.kernel.org
X-Gm-Message-State: AFq9FYJy77U5k7hvjD+Q+MYdLB0s/j9xpaQqXAaMhuDLx0d6a/aIGJKd
	GO7AwN+Wm5LZLhi1Zz3VZUzNQWyO72hkrXHkaVC6Tv3QYs28HQZIOBl+O2GHYqI4x974vljqKF0
	yiSxa7RzQ1YhmRIl2ym6swl+6NcRN0GM=
X-Received: by 2002:a05:6512:3186:b0:5bf:b7d3:beb4 with SMTP id
 2adb3069b0e04-5bfd11acd08mr221499e87.15.1793227986490; Wed, 28 Oct 2026
 15:53:06 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Oct 2026 23:52:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
X-Gm-Features: AclHuK_KQ4oBhICxbJAF69cbCxAU7hikZMXoxY43y-DzbhGz00AVIZeTD4WQFRs
Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Neat!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
