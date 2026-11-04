Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798188;
	b=sdSfkjPsoJwt46Yci7EsK9mgEc2/dvadFe9FCxgG3Dz73CblR8V4CG9dTVSQd/TMxmmO
	 GKo9z3NWDItPz9eegDN9NeFLUMJOp8zprO3DLwMKy/hfssr9YZnlMNdMII4OQxwp+hF6h
	 nYPz0mMZ4YZlW0/kiMBVzWhqkMpNh5UcpHBn6rxuelaRAsKWp0w882eyam4x1YGCcPzUS
	 3Ex8PEaJJ9C++gRlHDSGbRMLrv79mTlezG0upniQpt6/WotYvCiLo3ZlQp6z1DA1xVFiv
	 xDIXYgey3nEfGOMpSSBSHtG+7cn4HMqrZS4OKYOzccCbGKwQD4NzKRGoDnqYCwcoeAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798188;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=H9VTlijTFGW2hK1YgmVnrnjy6rcLsJbVdxBVMKqQ5Mk=;
	b=CMoQ4KYjFNZUoXU7HRpWKaxBvkekjgLFhCM7fAiNvz7SOJZ/or3ZReimVkzCnKHHKv8B
	 sIQHVRsmJrMiyl0tnv5H9nXYGZfmMKY4LKVOJXL5CJhryJIt34edhU5h2EwUIjCxDJ5XW
	 65mI42UvzxJudcUvhesEfZ/1mazjvV9e9vHkjJW1KWjTOiYcRor9FY5Uemir7QDeRO9BT
	 18JBYpSE60/qAe8nKXLXFSMcxVqdU2VRgXF8wk/tXYzQj3dzDmun74RoGJD+jnLRamwUO
	 y/aNQthTUpVrWZA0g7R969etdM/5TAJGyRqWmql906D8StJ07tvq/EhorozkHTyF9hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anVIaiiw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E708606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anVIaiiw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE981F00A2C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798188;
	bh=H9VTlijTFGW2hK1YgmVnrnjy6rcLsJbVdxBVMKqQ5Mk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=anVIaiiw1pZMJg2YZ1N3c1UamUmvnrrKGQWnO8NEpY87ayerF9aRI865xN7k4arhP
	 0ora4PhcKUA7tc3gRf5KJPZRLzDlKLUVlUaqjd2AMjgBarla0oTMiSTZyFgbsGYlwY
	 fsVOjVqGXMbB1lKrRbyHQGM8moEQGCArsVVqCajNxylEETrn8qtM2iWzHaOLT43wdY
	 9CF1Ojyj4aExSItAwUd/2QmsiJWsZaO/6jXd0s8gtn7I/G6Mjw5g7TIub3bSE58eC8
	 ii1USs42gD/OF3w97LAp+kC8W3GgxUmmbmvKzN05ws3y5BPE6ZVY/ahrli3ugfB9y1
	 B7FSo5BHSH9EA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso731267e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw0Rcf5E4inmU4gNJsTu17q1HKaUbDZowzLuvhoV3omTj5y2Sx2p2C3jy7Rw+xtSM9WRhnpzb8XoUMq@vger.kernel.org
X-Gm-Message-State: APuU4Z8RFZhTJ23x6GYAMlnSXTva9ZINfXfH2wp5B0rxjJud06w5A9on
	BCOLrk6eSjTb3h7DwHYNiz6gMr9UoiCovMd/whosct+cwCJZCICAQaE6IxShSFy7BhMqagBB3JG
	FSDBRXDS9xmEkVfbPebD0i4aXZaNPbvY=
X-Received: by 2002:a05:6512:6681:20b0:5bf:d9b4:9b48 with SMTP id
 2adb3069b0e04-5bfd9b49cfdmr3241637e87.23.1793798186772; Wed, 04 Nov 2026
 05:16:26 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn> <20261103-a210-scmi-v3-7-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-7-ee6b31580808@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:16:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLk_PJu_ViUmKSg19VEhc0=3SoyiqwkSH3vGix1qk7xpDA@mail.gmail.com>
X-Gm-Features: AclHuK9XaDppXSCtd7Lxt5eqeFEltqu7_7zUAwED7nuqN9o1y9Frwslmkgi1DM8
Message-ID: <CAD++jLk_PJu_ViUmKSg19VEhc0=3SoyiqwkSH3vGix1qk7xpDA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 07/17] pinctrl: zhihe: add A210 support
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
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
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhiguo,

On Mon, Nov 2, 2026 at 8:45=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>
> Add pin mux and pin configuration support for the AON, PERI1 and PERI2
> pad controllers of the Zhihe A210. Each pad forms its own group. Drive
> strength requests are rounded up to the next supported value.
>
> Across system suspend, restore only the register fields Linux has
> programmed and leave the ones set up by firmware alone. Release the
> optional pad controller reset at probe.
>
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

This looks good, just waiting for a non-RFC version and review of
the device tree bindings.

Yours,
Linus Walleij
