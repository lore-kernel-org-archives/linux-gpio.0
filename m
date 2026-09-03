Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DFD4248A1
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424886; cv=none; b=bulyErMZjdUHx62bY/0Tzt7WjMliE9hlazsMRcmLg/BlmI9bsEdywq8drCVEfE7OWmaY0Xp6RMsav/sxXngJAUSkEs42NQAqFtSaMkapF4DM/MnRuksMI9fMc5qxvQGJK2jsq5oP+ZXzK03MOe1qiWRMAXi1UgJbLuXvHkBuqvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424886; c=relaxed/simple;
	bh=lEKb0+YOxXtzVgut+nkMzjsKSshlOe4U7D1aSjpZWVY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHYaEUpZzSlY2kj+JpE9rSSPi6hDkTf1OEhLSfXJyYdjuGicQEBbcevN6vWUhnrxmw7NeIrt4mHhvI/DPHq883onkLwC2X09tmI94wWLItmtyRyUXiemBTx3anbIYhNpqklPTWhGlhaMkT0ByZQNSKxn+tqmMSggWIvigjTQ2z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWZX1qW/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWZX1qW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A0E1F00A3A
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788424884;
	bh=lEKb0+YOxXtzVgut+nkMzjsKSshlOe4U7D1aSjpZWVY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PWZX1qW/WeYi+NPCTIE1a9iJzrpdOSkQnaW1vd8IqVhnwuhHAsqx7MV5fv2qy4HTg
	 lkbBRuhw0GVWTJEEWaE4DCgb9W+2bMIYBsaJzoGP9IFMvmkZIBTG0zJ9pOmdxpRq0A
	 UiE+yJfXSSXjrN5bfxUOL9aRDS6x3QblLeKTafl/P3SNe34qRWykHYRvJpxELixLoL
	 YPSj1L4L5t1tZJvoJkFeQ84zNCHph9anqB3qG25hkFngY2rtQxLelEwRJ3BfS+p7Yv
	 SGV6qXEK0P+1fFw0YfClQ9sa1bUHsJzz8aqvBTsHmURLbj+zwXIi7hNIRGRrLcPfgB
	 ++AoVVjc4Mlqg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c95395230so19186711fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 01:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmSPPcpZ0ynR6N98RLo9XEE2OrZIYlkC1WOpDY9K3N08MqIGWpXt0ye58w0ZwHIM+b4j64TEO6j9tm@vger.kernel.org
X-Gm-Message-State: AFuF++mFheMjtGPWX8CINslKxXFH2mculib8o0KvfV37HupFC032Cx8P
	LrvCbM9qaA/LeEAHhsJUF16jimW8fjXP68ZV9Zv48bwLIwZpoRXE3rMS2eFr/AfgO4XiPJFuNI1
	i7x+yAnmEw8991tb/Hm0cBiGRjqiTjwo1cTcJQ8HKZg==
X-Received: by 2002:a05:651c:150b:b0:3a3:314d:1169 with SMTP id
 38308e7fff4ca-3a34fb36f0dmr21932931fa.1.1788424883342; Thu, 03 Sep 2026
 01:41:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:41:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:41:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com> <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 01:41:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfyWDZLT6yUw-AZ2Fscr7Gc-AWo4oDe2m5SpebU_t_FkA@mail.gmail.com>
X-Gm-Features: AcwNN1VEBdJvpbmZUs6ofO5UN50QGhE_IwY4y99KQJVjcAeHhEHKvW5IuQHyt6Y
Message-ID: <CAMRc=MfyWDZLT6yUw-AZ2Fscr7Gc-AWo4oDe2m5SpebU_t_FkA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sep 2026 09:53:01 +0200, Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> said:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
