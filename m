Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3793C3DDAED
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542300; cv=none; b=PAo+FEiPFx4VYiigC+a0G6QxmxromHBJhlfHHprUrJPRia3AgcpYPK8MhFzDdnRMX8XLB4Z+Sl7jvXr9PRNG7LdTIJZbgoEDSyUgg/RjB1g8pojaw+1Z6OC7jxthUQ3kdmXPOaoIFzQQUHoXa/+1v2zvFdC2pWcr0PC93h7xr+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542300; c=relaxed/simple;
	bh=8lPlbNiiCCLSXGJxdDMpeeFf/gDf0KQsx9YvMkYDEok=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sv/x3ryTb6mLvyXYjUmwRiL+yCgYxnUneDPfKH+zczpiKlZDUC1p4xt2MHVL9aYQfGJJLUfnCS5obntu6mpi73xT89QV7lDU0GFXzYtD48oUJk6pM8bRxEEBAieYeY/w7gcle6x6aKmo3J7I3TqlktoT+kdskE8Nq2y+OuBSRJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jb32Z3wa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jb32Z3wa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656181F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542289;
	bh=8lPlbNiiCCLSXGJxdDMpeeFf/gDf0KQsx9YvMkYDEok=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jb32Z3waY9vl5nRvWaFGqFa5GdGmIZV68I2kwHjzWUmy34X19mEnla2582s9+NGrX
	 2S3LtA3YjWCi2tE14CgxczD13vv53QtMLqcomJuhtZHvSjz0skSt01SaIaj9GKXCPM
	 nnEt6HN0/UI8XzFw9Bi+CVnG/rPmS313eVl3b4dZAxIqIQKRPqecv8TlZ1VfTH3FDZ
	 nLTu3GB5HpKNBg6fCqshpdUKO7+Yg0s1gpGKbq53dOrGShUy1RazLixTEEvbHk7EnD
	 lk+4En/kLO5hIiV2OXM5RYbCO13FngOpM3IiqtIHBKTzKeE/72BwuGJrGHc9P+FqEo
	 HnwpQ2VS+wIDA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c86945164so86285481fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 03:11:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywv/BqXR6o3DmxZYIpfUkIKDy8fhty69+JtDnMEEfjQVki5mEiF
	PcrNpZxrmWmD+zx8e7ibiLl4Mp4BtCdbKBDYs1TPViGRLE0c4FbwgzrUk3hzuO1/BtBqofWp8RK
	sduIOrtkpqW7vCyy+6OKYqiOi0/rNpXi1rHsqFySl2A==
X-Received: by 2002:a2e:a9a9:0:b0:39c:792f:337f with SMTP id
 38308e7fff4ca-39eb295193emr28276571fa.37.1784542288087; Mon, 20 Jul 2026
 03:11:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 03:11:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 03:11:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260717-gpio-dev-drvdata-v1-1-401b0cbd4d70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-gpio-dev-drvdata-v1-1-401b0cbd4d70@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 03:11:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf=0KmhGL8J2HYMCAVV2f1j4_3QJKV3Ahcx+ZBaNYj_UA@mail.gmail.com>
X-Gm-Features: AUfX_mxKdc4PdLLTEICq16e7A3lPUMs09m6qmNzHJ-oeRTWD-N5BJ2RoORP0zCc
Message-ID: <CAMRc=Mf=0KmhGL8J2HYMCAVV2f1j4_3QJKV3Ahcx+ZBaNYj_UA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: unduplicate the pointer used for storing GPIO
 chip data
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026 14:37:31 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> We currently carry a dedicated pointer inside struct gpio_device for
> storing the driver data. However: struct gpio_device already embeds a
> struct device which is not accessed by anyone other than GPIO core and
> also has a dedicated driver data pointer which is currently unused.
> Convert gpiochip_set/get_data() to calling dev_set/get_drvdata() on the
> GPIO device's struct device and remove the duplicated pointer from
> struct gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Sashiko is right, this will break sysfs unbinding so let's drop this.

Bart
