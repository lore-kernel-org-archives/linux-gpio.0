Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB369417D99
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376737; cv=none; b=LzEF+ia8bmITumQg30XeNLHiNwzrA+7EyVx6QGkgejUlQQot+YJDpmjgi7vG6BotSuooi9D6rsM6mdlw58dhO3XizRDNsr50IvJ0oHnTUsaPVGsjiH7LGKN7nIl2lE4U2t1VikgFBksO9anCNJnQENoIvWyJfATAUzAzgjYZqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376737; c=relaxed/simple;
	bh=j3vvgChfUHxcnO4FbqO5KKyC21+mz3fdMLHSQLjDleU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujqOYNcw38Kle5G78Df4zlgJrRLLtCmxcSA6yOs/QSDfMln4zONMB00zP4Qh7cL7E2/iNqdabOLf+kWeiEc3e6clQsJZxxPh0RjAfCL4v/AwjWzCUQkOF7LUGanDEKg5g+wrt3YKl4BQj4sJ3w7zhF61DDACoPTDcj5HG2w+lDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J89Iz0ko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J89Iz0ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7701F0089D
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376735;
	bh=O1aFOPIm665Eiw+j6TUvQPtIt8QoHRt8HSXrKrg0cGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J89Iz0koAqOnjzK0pkFz60RQBdV9uLL3PzTizp1q54dlHbB8m5kxR/jEBgyNcnPGr
	 o41oMrc+ZEeaMA6gdGuiG4bhEhmubQFkL7bSEWtYffRfZS59SmRTFLDsKFA4iKwuNi
	 5plNydnXgiAvG63mvvFTY659e78HvUJ4uL50Tg0W0JW7Jxq4iBgq7uBCW24rrIzpr4
	 H93mN0zBZudKDCpKchVKvUwdcX1eYDorV6zxla9uLS5akvn4DEY+NsQngsHG5CF30Y
	 QkYKyRr34MDvtpETel86OkqJ/7vaDZDALxlGdEkdbuKDs0hOYuZLpTKbtnFKV21vae
	 yoLgbfzsqz0qQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1865097e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 02:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxx21OEdc2KN7LxGQLcXtjnE+YCgeB0cLmyoI5ID1GdShJABkxSd+bdBsmkC1pOJzWCqnn+WG5j6eZd@vger.kernel.org
X-Gm-Message-State: AFuF++mZOPJ+K85j4bcvclVWMud/Sav3NQOiRltHWgox3GGaoqEL7jam
	gg81tG6oNsd7tMpecufAa43C3wN0NEJOjvmgfxYJOQzl7mS3bdoUDATP6sTBGrBipFxcG3Qt8IA
	s6nrw7NW1kBvX7DBYQ6xeTYjKCtZ5I/U=
X-Received: by 2002:a05:6512:668d:20b0:5b8:afd2:c17b with SMTP id
 2adb3069b0e04-5b8afd2c4cbmr300055e87.11.1789376734252; Mon, 14 Sep 2026
 02:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:05:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLmT1brMi8qd2jyV4_=u50i2NEQO88unv0wq1er0RQdERA@mail.gmail.com>
X-Gm-Features: AcwNN1URGziW8FcEeLQAwIn_mJYzQfGjAW4RUBIvo-J7yMS0ni6UqDbXdjuNGSI
Message-ID: <CAD++jLmT1brMi8qd2jyV4_=u50i2NEQO88unv0wq1er0RQdERA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl: Replace tabs with spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Jesse Taube <Mr.Bossman075@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 9:42=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> YAML files do not use spaces, even within the values in DTS.  No
> functional change, although dt-style-check will warn about it
> ("[tab-in-yaml] tab character not allowed in DTS example").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied, sorry for the slowness.

Yours,
Linus Walleij
