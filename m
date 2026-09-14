Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1533F368
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420656; cv=none; b=o7xAvlNzs+LtmBo4UAHuPCxZSwxvgHX3XDDWGHSGehX0EhwqYlYzZLP6znon55BP2B9PqgV6fhgrYqFEPq7qna8OVBYngI9juMdfNJHQ2GQgQQD64CEfsUFIqqdT9Ebdc6p5HuQSJawYftxvPpHqDqL4t6GHE/WOL8TA8QZGIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420656; c=relaxed/simple;
	bh=SPH2yTaJN2+oSe3I3KJ+8QZMneaPEyA++eBCEmtFrho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MODIP+bNA7iUrDqH+w+BYVl5WHxZTRoT871+92ENzj+zpFBecyyiy6/I20vGxr8Es7uDoZm2UU4yG+yqeqZgl+iJR+EnH1Fpn3DpC+/mHbEJU79NmWvvW5UIzPf5hKP9oHPMiTkdZILyvJ54PJPoQZEJ5Pnw9/c4g4/c2fAXnWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAA1t5PR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAA1t5PR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744861F0089D
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 21:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420654;
	bh=SPH2yTaJN2+oSe3I3KJ+8QZMneaPEyA++eBCEmtFrho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fAA1t5PR6uytt7TO/+zRxHcBsR89bCEzrRFsItHVGQ9TxKajyM3spHG+5sijP19OJ
	 t1zWQodK7soN5keOj0OF2PDyPrLqTz3IIIVYVgyjyitTzxm6zqyCnQde7V0vQU6FDC
	 xuUQR0iZ7zWz1Tx5WUoUYh3mR8oOHyfQbDU7G3T15qFWH0szwx8nqwaWC49XlRhF8Q
	 qAWd7oY4Wyv4/8AQED7TGy+CDw+jeXMhyzQQuAfIVPkxEreL8GcwZc5pPBhSTMzY9l
	 rfMVDPdwNKQcCvQ+aMvWAErD138DKFtfRRZfKAE+1khUpRmhXGhlYjbKL44dsLMWlD
	 2z8C0hCDy4s2Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso293965e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 14:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBymgjO7g8j7h0k5vmacMgsgufdCEzaqS/RRNYNx5Q61Xa/4w0BKPTpzcN0wG/ykfyNnHL079s1BhN+N@vger.kernel.org
X-Gm-Message-State: AFuF++kOzsz+HDLQ9HNMUAY5x9y+HVfbl4cZoh9bLnc9BppH2K1Bvmmu
	o9ImwbnSypawt1+c7eco1DdAYu5Vlzr67vcuxWHVfWQFA7nFXJbxBNmGw4UdvEkobbfkGG51fRp
	SlUcb+gUpCDn9qLbFrALR/WxhhS3P0mY=
X-Received: by 2002:a05:6512:1053:b0:5b3:f8b:b714 with SMTP id
 2adb3069b0e04-5b8b2a8671cmr211409e87.21.1789420653140; Mon, 14 Sep 2026
 14:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
In-Reply-To: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:17:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=hnRNYuGxe=T7T5aPQFve5wtD5qt5e6z7-kz92GiHpSQ@mail.gmail.com>
X-Gm-Features: AcwNN1XpyMYmDGh9l_sJ8JQBmfLBouLclcDrGavwm4fsBketM_Ew-WInKbZCshk
Message-ID: <CAD++jL=hnRNYuGxe=T7T5aPQFve5wtD5qt5e6z7-kz92GiHpSQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 4:50=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

That sounds reasonable.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
