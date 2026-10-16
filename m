Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16E4BD371
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156483; cv=none; b=Xq3v3Kxh2iC784lVk+x0cI10/67q6hmC5EfhwKZEL3kWL+het3HFReYp2HFmX3gUn5LfgeSME687atTOdsMVhtujg1BSOl23vRrpOijWabXmXcTDijE9u4ESoAZZxHjiDiVg7Hfiqo3gsE1EbNpTwMOiuJ3nAPRDlnv9g3CaVRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156483; c=relaxed/simple;
	bh=IBtsww379ucVBkMmo8yYkba7gIdGc8re+3xjl0WWVV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekfxR17KMvuXArMzHltKQJpP5q2yNp3ajLgX8l+vgq+O2G/+ITZ8rVUdyY0w6XpojAbEA3mh1+Ch7aOJW+ziOMYiu46pTQJX3PTZT1837WrKVPDF0I4YRTZCuTdKQlWhCefXOwAj9u/Bqr4z4IWJ+9fzwRH7hmeVR+DNeyit32M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0WGVume; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0WGVume"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E891F000C8
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792156479;
	bh=IBtsww379ucVBkMmo8yYkba7gIdGc8re+3xjl0WWVV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V0WGVumeTedEHR2AoRQDo1rd35kxpGTR5Rco75l54SLLNp9tfdxKm2bSXoIUdCuhI
	 1ur4JAJozcXoz0KGYEqwE4KdS/J9M1DMiVf2XZo9TmhVD3qrvLSBu7rAhEIccXmM2s
	 zM9++t42GyzOu8UikZZ6UhtlQ64REpWMzRi3GFYFe6DKdigTIhlwHnX75lbPF9a4Xh
	 f/wTZbdzX369cL4C4jqD9k1HeLlckcjRMRvILAnRZS+16M1fcpoaXSu0dgCJ5BBw4C
	 QZ/Q8P7mFVIRByEDdWNuWG16se9GjqK/xXfGav7ekMFSXlFlI1b1aPRfxkhfPZpyUF
	 cJpbikXvONepA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a772ec8389so50002361fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 06:14:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNscdjqayonJJnsqj21zNDVx31Mm+1agW7V5MuANyuGNTYA2IMgH62cD7mqREW+kJmfQybedA5i6v6@vger.kernel.org
X-Gm-Message-State: AFq9FYKOxrQLsn05Zsw/ZJbsZFpwTYD8WRj/f43YN4FPVQL6UQl/Jr8u
	0Dk+A+w4X0YAlMhVNnJiRmGJRpDxYV0z6iF1MfzAqyhhiaQMq0QJ+rA2OPkVDIyTyanavVNSt93
	FtMdeOhWzO2oB29dnF+VREnaocDLfsFM=
X-Received: by 2002:a05:6512:1193:b0:5b8:f523:6886 with SMTP id
 2adb3069b0e04-5bcde8d5ddemr7061879e87.66.1792156477967; Fri, 16 Oct 2026
 06:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
 <20261008071436.596651-2-khristineandreea.barbulescu@oss.nxp.com>
 <20261008-1e3e0aa3fab167d544c21e68@squawk> <5738951b-4856-41c1-8766-c41f2e63f3d2@oss.nxp.com>
In-Reply-To: <5738951b-4856-41c1-8766-c41f2e63f3d2@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:14:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=k3xFcFMsAS9gOc-tnGd0nOxidqST093YXzL+4mvM3PA@mail.gmail.com>
X-Gm-Features: AclHuK89SeERPwraJjQ-sXSvZlY9dT774wPNQR4vvufG9BfgRm39fBetpzFZiak
Message-ID: <CAD++jL=k3xFcFMsAS9gOc-tnGd0nOxidqST093YXzL+4mvM3PA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: s32g2-siul2: describe EIRQ
 input mux registers
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:16=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> On timing: I'll hold the v2 respin a bit longer.

There will be merge window on monday.

At this point it's probably best to wait for v7.4-rc1 and rebase on that
before you resend.

Yours,
Linus Walleij
