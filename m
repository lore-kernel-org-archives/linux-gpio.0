Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177819;
	b=YI3SJygSvgZTpbPwmrOGT+SLQA/Xo9J4V7qAo9DwxMojbnt4yyPQbQ4KDZmieFBkTmIb
	 2EjjBCVfnwvtRsmGpie7//G2h1XtImwZtdiKXk55/vsU30ZFGlm79YaFGvfQjDqx0StkS
	 1sknoy4zbbdUbo6on53Jvn9Jg65fS3qcG5sda7X2C50HhwRT2IK+4pL/pbP5SZiELgPB8
	 nUjaWtLkQXON0qg+jv6ZZ4AtyInD8OahNdPrQXSL5A988UMlp7cgjHfvayAO5kBpwUHXA
	 3gidv8V+1j9ziR3AlZw8WMDq2vk6kWxyj2MEtSUock2h9Mj8Vcvzyiq3msSzkgj6/Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177819;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=;
	b=4UMQesefG+DdNA8IBRxGE4x+FAidFv+CM74NOhT/tuIr8/Qi4C5vRq/OqwU+jISrtceb
	 IErM3shN289gnbtLP5Hd8++mGQ57+mZ4ej0TgVq3YFYdRk/Vz4gk9a4qizmQpCUhdN64s
	 9UJKB60a/vwZbIaUGkQCGF5tnW47C7X6kXrqmXXqUg1gHO8hzs1TyqEw9z0FfkanNqR+N
	 KOVbviWL7c2enf9inWfjmXlJfAfgNvdAH9PQ8aacNznn/3cogk7pURKt8KjvCOoWBJQPn
	 WDXOIBCNYLZylk1QeuoV4QtLdl5t2z/fUF0+NRMuxqVP3P8Tv+MHwpxAHAZLthDw7Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQibXMXB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F409606A320
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQibXMXB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53221F031E6
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793177818;
	bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DQibXMXBLOAEyZVKE/CFJHbMV5XqkbaoxFzHIv4VTo5A3IU0tQx7cwSKZ8rip/JWW
	 I86vH+gOtl+DfXvkTGE6I3pts1sRPcn3XAbfdbnvlVWCZX+yqCAO6PDB3SvLfAGfj7
	 BW4pzRvSN6QAm/Dv8rZ5PDBs5rrsWN/DgdJbc7iIMiEhbAiBiW/UerEVdQc8/f59Jd
	 y0SlKqTzFhENavQ7ifRlwkmjMmh0xLSI4jnTCgNOFaax2EOp+bVTFxfWsg3zaEbxJH
	 My1MzqDqBb+NlLiCKyoU0VhqcithADxt4MXYpK25hE2axgQUOKoReEdLYaEaLCDDq3
	 hardoIB9bgoQQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab01c46697so4938311fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 01:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaaITr5yYyx9OJx6tTa21ZnqceJ/goL9zaaCgriKelAqRLUyfV4ttAoAd9b0ehagjQj3TsbGSzbG+K@vger.kernel.org
X-Gm-Message-State: AFq9FYLssxBOM8h1Ty77aDwIqvta7RxtndSSLW91v/cVBo61YPbRJk5A
	TOayjCzzIBKiZfK7QGowI0zd27ksKQUYhusbcLKJjFMWv/tiP2Cl7ALLFMpRTCCjR+zsY4Yav7V
	IkXhbMR7QUq0Ut+NvHR6RxBegj+yy5VLI55AP32Evxw==
X-Received: by 2002:a05:651c:150d:b0:3a6:58f7:da9a with SMTP id
 38308e7fff4ca-3ac9cfcc25emr3279141fa.27.1793177817298; Wed, 28 Oct 2026
 01:56:57 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Oct 2026 09:56:44 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
X-Gm-Features: AclHuK9mMPE05cIDjki8s1mLCHmR3I47pX_uEOr7Y0FdJXyzRik8jx1n3BBNXe0
Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/18] riscv: add initial Zhihe A210 support using
 SCMI clocks and resets
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:37=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> and V2 boards. It replaces the earlier series [1]. The way clocks and
> resets are handled changed completely, so I am posting it as a new RFC
> rather than as v2.
>

No, please keep the numbering. You can add the RFC tag and still post
it as v2 retaining the changelog. It makes things easier to track.

Thanks,
Bartosz
