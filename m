Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF15371D15
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784972553; cv=none; b=FyP8MrJbQRr4rgyOkx4VCmfNaMBB6bh4LnD+NTncPh0yMzZQEnFSS9wCj3gvqdGAuRiVE40aryvDuiw+eQTGVRRk9UCQPPqA51zQSK9wZTs2SQlRhT53zHCA/Sc0fWFqkSlnpos0eO2ZRQ1Mnc4Rq3xv686ZQKNZKK1i1SIKdUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784972553; c=relaxed/simple;
	bh=KDnuoI8ID3GkoKDHWgK7+SAUrktiVMJnjoWBDP5c+8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ies4zWPeHrmmwDp0izt51GYpO+IfhxF5fPxbikyLHD02vS6oNiMPmSu3epBEpq+7clu6cByNkQCkdMnXf9kaKDXhC1DwOxOWsIt+73fUhe319/ENHfMl5MxA3W9R6wRXzKg96h6ghYH1RO7A2QQRiCqB/bZ7Tgm9DT+WnnUcIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIHC6/E5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIHC6/E5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057C11F000E9
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972552;
	bh=KDnuoI8ID3GkoKDHWgK7+SAUrktiVMJnjoWBDP5c+8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RIHC6/E5VI8CE3pPWRcllowwWAb6ZXBbWpjZeYxAp5ZCHoAXDGEnErp8wG9Ngbc4/
	 5Zp9xS3DsMQFjuEhz+cC25hwuIihCmz2LmQQl3i/NX/849lmFGfuYLM8eLRv+vimGu
	 wNU+z5WtS8+S0QupLO9guN1nW8LFG1im+kG+hKfdyrZpuq4lN+ytDKpGITcVr+SeEg
	 gqVhqq3VdnxXcyaadKlxkua670+/5UlRTivpnoDGK42L16+LBcE8OLxG13gENQZNzo
	 B69+RVaV3Gto24D7R//TznzAunDC+NbyHxLmI3EsX0izPHBDQuMzT/ltehKVbWaVHa
	 W20ChWyFkA++g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1319106e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqRyr9ucgq41ix3XM7xvCc8FSBrqpFxcxQEI7BND45EsaAAX8/wjTNMBIJtu+LAKjwwJ5VnMiVmGh9z@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcvWibVnL9ISwcJVmUpMsZZCtdfOKVpdvKDxPRUk60Z8Q3VrC
	Qu5T7hGwjuiW3Vr7i7MCdLx+vSY8Et9k51cqU7KCdmNPgRN+D/HUVkOQ6ViG+1s9nqLsh5k/XOF
	KqbYzGoxBQYf9FPXnYClen3qITZ9AQRw=
X-Received: by 2002:a05:6512:1108:b0:5b1:5a90:25b4 with SMTP id
 2adb3069b0e04-5b2c1b02d72mr317970e87.19.1784972550844; Sat, 25 Jul 2026
 02:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719134548.8830-1-linux@ulli-kroll.de> <20260719134548.8830-3-linux@ulli-kroll.de>
In-Reply-To: <20260719134548.8830-3-linux@ulli-kroll.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:42:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLm4WiEaDmEGu0E7v1qmJFrmGMW9D-HqqvSeisn7f_3JLg@mail.gmail.com>
X-Gm-Features: AUfX_mzrL-M4gM01Jv3A1DSFmOG63KYYzpitQfc0Jrs-CYLAzUSXTDbaLTcIEj4
Message-ID: <CAD++jLm4WiEaDmEGu0E7v1qmJFrmGMW9D-HqqvSeisn7f_3JLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function
To: Hans Ulli Kroll <linux@ulli-kroll.de>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 3:48=E2=80=AFPM Hans Ulli Kroll <linux@ulli-kroll.d=
e> wrote:

> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
>
> Mark PCIe reset as GPIO pin function
>
> This allows ipq806x to keep the PCIe-reset related configuration in DTS
> without tripping over strict pinmux ownership checks.
>
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>

This patch -> Bartosz
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
