Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949AA4D1791
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163259; cv=none; b=olxAVD7Pv/s/j8kdoWE+MosBmpvQOn8Juz81t0RhD/dCUOf+VJ1TCziZ/Vg6J6tgvuHcyZ3xsOaxcfmQwm7oZlE6Pr7FqyP65ivjihp9fC/q7lYeSnPlD0H3ggdBF8h2PnQQzmsFYk0bRamwJ1/RxjlB23FJ7+XLfEEKKORwZrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163259; c=relaxed/simple;
	bh=7RGIO54fyE/iVl2rO+u+MlOK+PQfzNFmJNUDEqLEwwo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=b3MQLdirGxcuURCAeXJaN1bRE5xsol+27UeDAtM3KcUyrCLJxEvHBVSa3j3ondiNHzHrRZhOUg4UIJNrkEk2Dyjfiwc4HsuzXFgFVUyxLu4kisRB0NUwHIjCcdLpeu0MZdgTHteEwLwidYJ2lX4wn4ptR/ekWnFYedatUCKpCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yndv2wP7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yndv2wP7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso786675e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792163256; x=1792768056; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQBXFtSQf7WJJHzyT6nR2Bw3zqoZgRsxsOc7UBU3Xv4=;
        b=yndv2wP7MWTiybgyyrOBReyhGNHx49iRnEb+3zNzGIHs07eYYbaYRhdrvWOiPRT/TM
         KcEhzRNuTy7NkEy9IVcdEslLC8FL1BBIYctMxB9YXrwVTGP8+ZIZeQd38MNqXa7NXf7C
         gEkzNQLiFMKOJg44Isl+q/hRNPWXHG2uRi+eybMAXJYPIQX8NksosrXBy8rTK5QOavuh
         ylT3LlP1PEXJuuz0fhN11p6igTB8mGEVVIDezhrHXNVU4ClSfrdBx1FsitX9/Bw/kW5r
         EGss6n/KewYKM+IFJWMSKgLWmb/K4lIU/G5cFbLl9pBZondtkkRyjuO93Q3pkRROoh3u
         l+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163256; x=1792768056;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQBXFtSQf7WJJHzyT6nR2Bw3zqoZgRsxsOc7UBU3Xv4=;
        b=vGTU5i0M5pJ+GPWWA8gzHLm2DqUGsYBLdhHD3CU6ougnc387qPnE0Av67cM6LtHce8
         5xNwS+S2f6ySJCeM73lRcrpwhqqmC0UMyRgZLGmjppK0Hk1a/pwbKlng7/4z7XYvFNl+
         KmEbpyuK/EyDsIHNQL6q/gVfKyHLdD+qJwrs23HyaAO7hs0DtUF2bBYSILLBLttfDhwP
         D8Q9yNVUR2PPPQvQUyeoXF2AxvsM9NU171Fv86XlAopsDkUvvQO+DjL62FYiQUeKFNbg
         DQv9n6tBNQZc1DHH9UsFzQkOcKdWMxq4UoXeV/TrME7fMVKN50rEztS+QTvfPm0+I4WS
         pabw==
X-Forwarded-Encrypted: i=1; AKwUvBzBAmRjYbDOzMTJVasFUjGRQqr+SMBRq3Fj7gc+smF3mv2LYUxcJ3A5YC3CAaqss5zeqCX9pJ+XHUFW@vger.kernel.org
X-Gm-Message-State: AFq9FYLb91yGTaiZWgvVTi/pyNrvUvvAO7bzGNcbHvPk8Mgq7vo2zGQQ
	ODXowiM8OPUz6GyUiwbDbuvcfCZt/vuP82X5MZtIrZszcUWk9omiMsG8JFyt8KslxBA=
X-Gm-Gg: AYBFou3cpSf9TgdNVHQFxXReEDBlL5p9M9tPGenuzfN2oiOZxZ051gj3kXaySIYf0J+
	rwVZgOX2hh6kF1AmgBWMhSQRthUGGOTlkLitolgZjIUmSzGyQlLz8o5Z8K7/ieIIsCUkO1W4xSh
	DkMm2uYQ1NcpBcKk2DCRLjWyPCI//aJOs3q3QRB5Zb8aoPSpvkGP54HfBiZ8MtrZFCpcmpXRtRe
	Rtp4ZXj15u6naP2Xev5tFPBBuzzRu9zPXqlG+jogFx0G7XKtYOTPR/1+RRCEgufrG4lW9FS1CMG
	3ZSxTb8By4zVE4Zr/G+kbmMlDXMA54xS1GDlVmkQ7HJH9jNExx1PemEZP0BEaStUNpvtR1UQJB1
	p8fJkL4QuokNTI9DpzN+Ahpvj8nsa9T58R2tmbWEmbNbka2DkwXzWA6NKEUN+3Rn9LbUxgBkMYe
	rLBwzPzxLqdl+DK6jutOSBPyhE1Kn4GDX/B3rIEJbRqG7xfmmsx+0O0n/UEsvv1d9H6TgJPjNB3
	fdl4pGEhI4yMa7QF6I6Yhtfu3ddwrQkfHX5l/aQ0NnK145tG3TLecvRMtwN629e
X-Received: by 2002:a05:600d:644f:20b0:4a1:d307:d56f with SMTP id 5b1f17b1804b1-4a1d75fa37fmr1458705e9.15.1792163255733;
        Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510ba3sm5544284f8f.56.2026.10.16.08.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 17:07:34 +0200
Message-Id: <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Christopher
 Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
In-Reply-To: <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>

Hi Krzyszrof,

On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
> On 16/10/2026 16:41, Ettore Chimenti wrote:
>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>> Using same definition as OMAP2/3 except pullup/down enable macros, which
>> are inverted in this SoC.
>>=20
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>=20
>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindings/=
pinctrl/dm816x.h
>> new file mode 100644
>> index 000000000000..15aa15bca9bd
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * This header provides constants specific to DM816X pinctrl bindings.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>> +
>> +#include <dt-bindings/pinctrl/omap.h>
>
> I do not see this being used here, IWYU.
>
>> +
>> +#undef PULL_UP
>> +#undef PULL_ENA
>
> Why are you undefining other macros? That's not a easy to follow code.

Do you prefer to duplicate `omap.h` defines? Only the defines above do not
apply to DM816x.

>
>
>> +
>> +/* DM81xx mux bit defines */
>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>> +#define PULL_DN			(0 << 4)
>> +#define PULL_UP			(1 << 4)
>
> I do not see this used by drivers, so why do we need one more header?
> What part of SW are you binding here?
>

I added those (DN/UP) because they are not defined in `omap.h`. It may be
convenient for future board upstreaming. I can drop those if undesired.

>
> Best regards,
> Krzysztof

Best regards,
Ettore

