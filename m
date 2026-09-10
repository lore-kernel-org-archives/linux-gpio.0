Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2203CCA12
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025068; cv=none; b=VDZP8BINSu03Pq0+AlxMs2pWxm3UuiPvyuOHIMLqTr0wWciZymDj2C6GKOV1BiDp5ZwljFDz5GvrENOLI9k704FAjs8/i6fZkEDWslejWV3nsgWjEFxV5XmWi7luNbZadyKMLini4UnwgitAs/YkmcEPatdFzxOr5jtr/FbzSK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025068; c=relaxed/simple;
	bh=+U3CsgVsX98Bv1eArnHlNvqaVE6TND6nINIu7hrzK+U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTwmPAQZxgZtn4p7Akl0W7xDZ3+RfvpbER6NhNWPAZc3PhR+lvslz7ogmYNoqX3wfMMOdMgT4mzvCD0wmmobnSkdmXOquGT34h6pPBcHzDrWHlwWYFg+PdBu5UVMp0YsZYUlN4LhLKPBeS0KsdJm263DrxHJQAia3jkvr4nc61g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lx475Gaz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lx475Gaz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90AD1F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025060;
	bh=+U3CsgVsX98Bv1eArnHlNvqaVE6TND6nINIu7hrzK+U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Lx475Gazuys68iHJTZl+TWFJfxPzg25YPfTf/ER633EImwQXGSeBqjSlTGiplBfsV
	 OJadQw319gQC2RFH7nBUXLQnsKnBifshyHeUzK/Mec8oz7mBNM9BcIcSyyF+qO7Qso
	 pyHiBL3AZ6cOzmXZwKUo+7e6gXlyOF7EM+HWPaAzc7gPD0Fm3FA8zH7jyoSfOTthEG
	 FOeYF14nMn9Be7eRZjJn1CgKolofuy0WEEKelLDnqe8OUHVHPtSBvcpDWFHec06yHQ
	 7huu/H2ys0ZwN0woMeHAAkW1XcuV6LeQcJXopl+6TE9YY2TVzuZi5108bcGIIRFNfQ
	 Kew04k0H75ewQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so72708521fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 00:24:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVCtCLw0r8ZQjqduFGbykAO2BXK4Dgx6J1Dlkmc3V5feCkN7h9rsg1n9FRX52lTsQXsJ73F2UB8aHZ@vger.kernel.org
X-Gm-Message-State: AFuF++kmstPxnZqJoYCOzOtShmzWasuDkAVbCbL60PJwsctAaRnCgGq/
	29JSg+vidxz8ljtHKXAcg1jICdm+6WtX+ALvuQsqmW+iMd7AleahE0oGRoJIBfnNit5m2DoR+aw
	Mya7U7F63l8qvnDvakoohioUDmMAl/hFOLuWk7kaVXQ==
X-Received: by 2002:a05:651c:19a9:b0:3a3:462f:329a with SMTP id
 38308e7fff4ca-3a371be7d52mr49246631fa.13.1789025059432; Thu, 10 Sep 2026
 00:24:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:24:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:24:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alUyZ2zVWCPhyHHX@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alUyZ2zVWCPhyHHX@google.com>
Date: Thu, 10 Sep 2026 00:24:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me5FPXqLzpMvr6MMGJcSqfah4yaRU0EDrV+jOn=X7iTbg@mail.gmail.com>
X-Gm-Features: AcwNN1VcRf3mEWCD3x1wh-CxVmrq8hB-EFgGIfSDmr_ZS3mGsHSgozFtnP9n4xk
Message-ID: <CAMRc=Me5FPXqLzpMvr6MMGJcSqfah4yaRU0EDrV+jOn=X7iTbg@mail.gmail.com>
Subject: Re: [RESEND PATCH] sh: ecovec24: use static device properties to
 describe the touchscreen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	jacopo mondi <jacopo@jmondi.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026 23:41:31 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Convert the board to use static device properties instead of platform
> data to describe the touchscreen, so that support for platform data can
> be removed from tsc2007 driver (ecovec24 is the last board using this
> mechanism of describing tsc2007).
>
> Device properties do not allow custom board methods, so the method for
> getting "pen down" state was removed (the driver is capable of working
> without it). If this functionality is needed proper pin control/gpio
> support needs to be implemented so that the same pin can serve as an
> input GPIO and an interrupt.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
