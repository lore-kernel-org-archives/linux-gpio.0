Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519E3905F4
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050105; cv=pass; b=AKvbuvMW9bYbpari1Wu+jJq8M5WmVyCh1fKMYfshQayPXm/mHCpT25U9T8xFzzBq7ZCy+QJngXKWDvD5nFQAtz9VbekqGDLpqhGuiU6S0LksbWTjukKS0haZPUB8daWtU+Q6zLVeV1G5hFHjV5R7UlnFnOfRp7Vk8qKNJ7PSBRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050105; c=relaxed/simple;
	bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddwSRNpAe7vDZzzHp2RUHgPkvyfg6/e8HXSGCbTqdBhQB6tkqHyeIPaYClDLFkHot1O3BUyy7oBDF3JQdLGMrz6VJ+eHVmAtf0+2men1CzxxjMJTXoCfj7wcOq+V5qR/2pFS92V9/C+FbfMF+nTr1yrH8oA0QE8z4nHEJlgbUo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUNSjoJ5; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUNSjoJ5"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e4a2f00beso121489766b.3
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 10:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050102; cv=none;
        d=google.com; s=arc-20260327;
        b=a3yV9EQRbybUDUhWwMgKz8JjqVxUXClpx5Np1KoFchZPIGccdnEqr0oV8tysy+HGKb
         idUZa+x0r2pDKUTRoQIrNBX9DmXuh1F6IPmKhBBwBkE1CFnW81eHiIyCxyuUKnkH5NTz
         zyGC2XyHKVwFjtJnlXm3loOEFDcss7+9zgF1cLBdF7yMZA5+sFkL7XJiBCmgoAmZYUPI
         gyRSd4Xg3BCpjBrDjDIZzRP9QBvQZEZ9i3X+SX3kWXMoodE6H6MYD1OjhiDds2rLgJob
         p94BAWdywe4z/3QR28+crr27ouI37Akkabq1Un8hqppDJsKobJeydq6ZrqU/Q28cOIz7
         JmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        fh=mvgzJQ1TvyUjKatZW4vr/9NRrKPDH75LjAqUFSU0VfI=;
        b=ZuMfSFMG5/+G4p3sROKKJwZOGTPuIIFPEATnC4bHdAiKn1Ha6MsXQMavNGiotCvIFk
         BCgHgzfkPkviKoG613YnuSgVUdMjxLlkZyKr9rG+btuBALGQW9dKa17ygfnoW7+fT/51
         6x2EypVDa5tXgz8jH21awCn5nCL8s3IyoHKKn8rHXZYH6c/vtO/DFGL9/jFubDy+9NCs
         7zsr7vpYuppzX6m/v8MdF5WGJ+xW5AoNk72TqvCQQ/XcY0ScByj/SisiWVzuZWWK9qez
         JHtMGkuJ4cLhrU5xAIPdJPJaqGs3T8ytpzAES54JeFk3Dv06aEhnigdg6J4gvy0pRYx3
         HkGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050102; x=1791654902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=QUNSjoJ5rTHpZDcSbmTQXJ+uN8iopeFWfJtrlI+EYJM4YoZH2o5o+s3JWkzYS4pfYX
         5Z/q2vwWjztTHavg93HZLte53diu4Iayxxmn6he3jEHAyFLT1GubAWtJsNnNzzJY0gjt
         Bl0jGM771ATpXHP7CH+7VDE3UuUiDGK2BMd54NPLLjn9Gxch82MvnzhzfRmDXyXnc8f4
         jq0JSpIsdUrhVGDgVxrMJP9fMdTu5iUp4QBaZ+4D0N9gQEwO7jAP5LG7g1BcMMySMiJ8
         0J3WlW77tiluszif6RE6onBPIdGFHLHNaajsXZmKUXopWtG2wIqGMR3TpwVKvmF7lwF1
         4WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050102; x=1791654902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=BSjt85UdSdpBF4aEhM7bkI/uNYyLJGF/2dojjyWk8FBbWQq8NO/7bu8XRaawC5zFIW
         pBTrgn379hD8R1LTkIs9dtiNor4AtcfEEDpRu+VGtgvTddDJnvRe8C++mbZ1cCEmWkS7
         B6WwzULTtwXAYVqqkczqkMmRJSxgp971DyJCVjNPpT2pH2LtCI+sn0EMgIPqqWSInR83
         mMOB60ZKyHclEkF6J03Bgmpnoj9JOIXxnqhzdgn40HA7s3FKNv+YpHATJlUvVm/FGRpm
         E9bpHlrV6nd1uIb27fXE86oV6UKrgq4mJ6SVBR7Rl6lAfVwR7MjQFnEelYS/PAAcfStL
         1Wsw==
X-Forwarded-Encrypted: i=1; AKwUvBx4Rrg/waSMQwEaNEJxO+iALneFXWn9KiRzbkUjYCV5DleGupkBeq4rWi/5GiW+EczkSmzs7lWVw2xX@vger.kernel.org
X-Gm-Message-State: AFuF++leIYivjB95YHIwCI5iTZ6MKg23tYc1LzfDXy+IKyJ2eUCtKuIK
	4r9C2UETyNiKJx7l6TFWLVpe7WL5/9GIMTIXBNJPr8YJVLmAQB+jVQTeg/aFVcLSQ+9cHCvFNRn
	ch87A0n0marAHeLxjNJfBeUi0nIBoHjI=
X-Gm-Gg: AYBFou02lczlgzlW1WSCxaF4QrcCZYkW1BI+NDPjY4lYXJzZTCqW7BRfXeKAxw2P2cg
	Z8bZH3+KbFxXyKEmM+oCpd1CH5N8rlXz/rJRGMtfxwSCfXAiRqfqrVAouDZPHk1gOXv2GCk1wLy
	YpB2WUqjc/BzoESl0ytiVCkHPVnwcIDoYgNtAuJlwYCYF6UOD8DYVWy7mEU6CR10iIDqsKMoS+e
	uZxKc7lQyAvFIOFL0OzqKdFyFMqdwVFuLVVNBn4MA1rf4PLaZ/E8Hqr+wZw1y7vvDCygJ0y0bep
	31b381NyZtUK1BSC6/Dl4I/VnMzlt/0Pu4wHmob8C6xDCp+t7mU+Rd1eIpfTLlhl4wyRnv87ETI
	40lcRSeG36XTCQtXb3aTz7Cfu87wjL91xoeA6UC/JesFAWnt66r3/cxoTzFjZRp+c0JeLStqqLy
	VqEyBKVZ9qvKEATjWajoEplOT2uOz63WhORF1clM6b38oVR7E6Z40C
X-Received: by 2002:a17:907:7fa8:b0:c2e:4292:d26b with SMTP id
 a640c23a62f3a-c2e4aac022dmr541503866b.17.1791050102486; Sat, 03 Oct 2026
 10:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:54:25 +0300
X-Gm-Features: AclHuK-Tnk4vGYGovhYsTrmL0EszXMNMJq3_DIUiup98Oar2sN_FwV71aRE1nR0
Message-ID: <CAHp75VfcuHPQ3S4LD6OBAMvu=hiGdSU_pji9+8LAGXD=y4C=9A@mail.gmail.com>
Subject: Re: [PATCH 6/9] gpio: mxc: use local dev variable and device_is_compatible()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.
>
> Switch from of_device_is_compatible(np, ...) to the device-model
> device_is_compatible(dev, ...) API which works with both DT and ACPI
> firmware backends. The 'np' variable is retained for
> of_alias_get_id() which has no device-model equivalent.
>
> No functional change.

> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -428,17 +428,18 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)

It seems you missed updating the headers (like switching from of.h to
property.h). Other than that, it looks good.

--=20
With Best Regards,
Andy Shevchenko
