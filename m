Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025B42C50F
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517894; cv=pass; b=n6QMg9JWQdC3UtG98Awm0gTrCg8LzS7QXir3fv7hIWqfkY51LSC/h3bkAWFlP2XMR/aq1IVhrS/SFdKibEZhm3/npJdbGW0TzKmXpmcM1wYaUActZWIbris7IezTagDqn+zc+qAN+7G6jTrNk+iGctmZp6cV7ztYiI/ehMyPG44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517894; c=relaxed/simple;
	bh=Uhh8q41hmOlByjiX1nPXF362Jh+d49ZbfzvIl+Q5Sug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWybf2tCwfvfT7Dnt1nYnnS1W12FXvrbKb+q7jquhyfljGxt5Vx7mM2lVWQC+7/RcOxf8NRYXmb8Tqzkl6sQ2lD1jrKJxFgUWj6Pg3j4fb50wiMs0E4cEHSJhUuO27rOS1FYB/sdzwAlQemx3+TP8OEBLoZtScR04hHWRtNiH2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Exy5EQ16; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Exy5EQ16"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a063d211ebso1806544a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 10:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785517890; cv=none;
        d=google.com; s=arc-20260327;
        b=ASajDuqzuwmbsQJu9JLnR513mEAWaOTygaviLLajbZCdvGshwSPmtI8HSuLqjPL66A
         nQzQE/tNZuh4HAy9kXRHi+mqHXAFZl3Sssh0tnqDPLFSRuImoXLgdSExs6Y2pRArZtNp
         89jtl+pFOtn+JxUbwtouNVQhkc5nEelOPJAKRYwzFkseuNoDv3pKUBQp3upmZ1+QVZu9
         xxw2pkstolbgu4eSg70MtqWnUahrBqfGB0SvXa3feH90c7p6rcqD6mFCPfmhLerCRWik
         a5dYohLEV7pTVr9wOTiGhshkraCTbB3sF4prv8yahG5z6YlcydEYhsmPSk/g0caAA+g/
         HcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        fh=tm/6bVzfnjLHzczcpoxgFBAUVvxHQWOWchnOACWy40U=;
        b=SUop/ZBu4EHhqdf59NKn3UMw7Q3MCNWxwR4gyhUWNIA86LgS9y7WISUSf1/pRbQOkp
         6RZ9LKJrveD5xR6MYmMGG4GlQPiSKRS675bo8L/rdJwGqKJIXMoxWYfHL9YiKAGb3QFh
         xansxv8vkWG/HGDTyGYHfeiserpMjQlIOgO9kXhLxt1FYEkkTZqeAf8rhpc3RWrldTg5
         CeoKn2aFGuK4oi7jgmHAo1BsCBR+ltvqQ0jiWvr3loqCyTnhaVOI7VDOmeqRznEl1Zyc
         ycutjZPnBZv4DHQ/SCC0TM3bMPVSjWK4RLmfrEUBoY53ayWm3P3iBHASgUjEto+WLGOZ
         mNgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785517890; x=1786122690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=Exy5EQ162dvgPIB46DJfZCIj898OhNHYTDXIQagaTUngdPry8jW88hSxi6aVeP31S7
         YzgozmElj0AURbi6rlolpsPiLByD3Dd4Ii6jY6wqjM621Fqqa0b22PEBuASgo8mAw4De
         q9L3mNgaXd9xOA1YKaScbjzyuSCFbwu3UiiXTk2ghLdVxl1k256wj9vTvGHuymhzwrX5
         N1QWFADLLAUwVNfVysAJrQvM98upHj4eMDVgmRkgOseJP/GEExxCmGqFNrQL6nBDdWuh
         5q9mOh7bcYV0Wbl5Q5V2ykhADYOUtuUfmzcCHvOZ5sPgDDKDntg7uK7b27OmDy1F3uAo
         XHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517890; x=1786122690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=DsLSivJrQ9I9+FkStFF+MIYx9TPWrQmTRDXwqipAx2nRY8pYOTC53OBZhhHk6jqDg5
         EhEelEooSdT77ADscUdu1DQfCzB1b2AEXPZ1Z1C9PLG25ItpZWNGV+OlZlzNet6pnsGf
         lywV6s0XFEN3LLuvWOGxtp3l951TapgcPAIjPDJyX9INuUr47O6v3Tzg/FRHjDAL0Xcn
         R5ZWouSPx56aG7DedrLpVXNlooY6004On1b4V2n1koNIKQPImNWFC6QKm4PEFC8L56ly
         4PrxdLnrVCsaKP7Iw89y5jwxQHLjfK0hoS/jbb0qcfNlHHwLc52Bc4TCc7R9HXoyNN1o
         FJkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHvFsc2NTRb//R3oMlIJ69FgKcJ662H7bZjImnvtMDpFcY+EBC0LXjYch6nFsKhu18hKpemvZgXIQm@vger.kernel.org
X-Gm-Message-State: AOJu0YwvAMRLCuOBNzKl3QJSJeguWDl4dUSRlpGvPmfI5IhMbC7NLo92
	BM2bQSZTC1wDtwgsDoEZd4ZtisjXvNscSxBhbPw6uh/pq/YfZ3QUJoMtUXpHL8YlUVBgLyJv/Ze
	cR/Eo2XpBfMuNzIB191+/DmM+J2FI759Ae+pbu6cfgg==
X-Gm-Gg: AR+sD13nZeQAEKSM6q5TdCK59TOT9Eq4JhiDh/o8KlzcNUm3eMssflkTDFr0X/TsJC9
	TmGbXI0re78e3/yk0Dsb+W2mzHRx7vfUww9+jLzLBw1Iu8jZ/c5ZN7Jo4CD5yQ+ohewFjKbI0KN
	cQa5ujkSb/ZkMOP/JjHid2gEr5vr/bqsnldP8i+JV7TTdQsP9c5eEmAYByZbb3sIPIG29UnTG1X
	iAStCySqjZo53+I7fmrYV63HDGyZ9k877jgxoX7JGiHjH6YW8yQpLFszJGJjxLzoYabkhu/fm+U
	gph9anka+3cooEXiQ9N6sSX1Ui3WqI+sWpfr7anAtUFQzooAi7J65qqSS2O8RhOhy8xkPBfgSa6
	L/4AdIwXK5zRe4g==
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr275774a12.18.1785517889487; Fri, 31 Jul 2026
 10:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2026 11:11:17 -0600
X-Gm-Features: AUfX_mwyptmYyOf4p0ZyWTJXkdByXi3n4edVXueGHxTjG-w_nq_PAPMefUUmQKw
Message-ID: <CANLsYkyJ=qOz_7x8igcwkiHsJQWP8JizB4-q5QV5gv-s+e6eVA@mail.gmail.com>
Subject: Re: [PATCH v15 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I won't be able to review this patchset until the week starting August 17th=
.

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote=
:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v15:
>  - Update Kconfig description per AndrewD and Julian's feedback
>  - Enable the GPIO driver even without a DT node per AndrewD's feedback
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback
>  - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
>    feedback
>
> Changes in v14:
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
>  - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
>
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
>
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
>
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
>
> Shenwei Wang (5):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   rpmsg: core: match rpmsg device IDs by prefix
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 587 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
