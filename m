Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564475;
	b=z4ZpR5iEN6d8xAAUkt0aj2AZMih1wNvkCCNur1MQ6kkL+i9kIDH+g4JaNjNKMG8OQ6Cg
	 Q/vcp7gl54yZ5ejnA2/6SkXf5k6CxgiBO7ryKO94kuGl9ak4/m2vfvobcsEQsTDPuGU8L
	 BpCOFVKM+aVApUsNkxPlzJdlHtXGsfGehQTgiUB4nbdVMabR+kinwhe/8XT7ac4prC801
	 2568DyJb+LaHFrUx0jvk5W5j5bEXE1gCwxUb6L+zPPAw4e5HLEdARSryq0kZ8EX3GM+87
	 HqLTFvxq550l0IR9MYxD49TBpuJw9gXsJYUCtWKhYeF2neEaEGTEDbxkYduneokmbtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564475;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=;
	b=P6l18cAUmn7JeruSeJCMlzgym3TQPXYv9FIE2w28qQ8Ru8XiM9lT1m3WLYL31CsChaLo
	 /Vr9VjvGpS3LvbP8qEzrpIJFD9qyqSlcxe0o4F+9Nf9bV6LRbxQ4GdfTSnLXsUqTTwS2M
	 QWENv+cHds45clpUioAM1XHqhb7jo26S7nhruKuuKef9HgJH2+YydPlqFgnYx9yCkwzmd
	 wyTqhVYYhIu6RgQJV9wPbdwVj92TuVGUpuJpDezJRG3dxZ8RJhklU7DSdaRY89VIdcGdO
	 51T+YFPQN2Rjfit5GfLdw/hM3BVOo+FDLdsIYHboszpX5ZoRSkE9PK82jqjRc3op5Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QB5z+R34;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6F606A32E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QB5z+R34
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FC81F000C4
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564475;
	bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QB5z+R34JgjSKXfdTuQQ4z5Vl3JWBLQzBFWeEA6acYvWfibhM2Rffli/kvKZux4vr
	 MYh8+DiEPhITQf8jKKKz9vDQQ85fvRos4R7RZkzlBjyxhUlkHAgy0OSfr2SFn5c+Ww
	 S4z7xJqcTzwnh86Gm7zTVOFPrh+KSN/vdKlOa+T9t/TWDrPQ4h2xQr1FmXNwUqUyOl
	 2X9yIEHKT9wjquLxU2vag5N0nS+K0iVjdAkr/IaACUbpFSr0dnZRZtnO2x+NkM98v5
	 d4zfoXbk/7ZWF1eF3UTKkTvs1uzp6Z74ISEzKGLl/Ct8OVqU2MHngWy07ePd3k6Tsf
	 yf927Q1beTwRQ==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso993278eaf.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzzzoY2AnZHfoJSAu1QdKaY/pxMOsWmhj1g4Yw4McpveGsTh7XeU/psvMexkSP+WspVgxi0Xk/pebF@vger.kernel.org
X-Gm-Message-State: APuU4Z/vqpBuRqaaFqk+PqvEyuJsoRLJRQz96i3TEwPmYPFSiJwWFjdV
	ixZdI0/lITcqNYYi9HZbK+FntyTcLJ7H8IAksoeR9T2Gyca0sP2o8Pu/WGnFwE1zJNAiGfHV7rz
	2HgcKNkF/7jNACRVEdM0+JG8KlsVbZ14=
X-Received: by 2002:a05:6820:7084:10b0:716:c53c:3f4b with SMTP id
 006d021491bc7-71ab52797f9mr747028eaf.88.1794564474160; Fri, 13 Nov 2026
 02:07:54 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:07:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
X-Gm-Features: AclHuK-a3uoEAZFrK5h2rEztceybIFl9qYaKDq9CCMUyZ6HAOHlDJiKihMms9VA
Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
Subject: Re: [PATCH 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
