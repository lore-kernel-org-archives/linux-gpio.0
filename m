Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D4199920
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241883; cv=none; b=tDlsKyn7/P6JNnJs+6VuQ3e/A+KAVMdGSoQNAbKsGdmc0lBPBnZ2EWlR/pJfphJGTza2wZl8jgijXJJQSNXFwU3hznDHf8O292N4vtlYUWpUXV3D9SWBZ4Fv5gGAHeFy9SIr7jf4Ml28rdoEg3tgQ9ZhLxL+wUHpVvPJVTXRZjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241883; c=relaxed/simple;
	bh=kskJWXzhNyI1vU6hKjus6H6e3qBuiPmJnGCDh0Oyc8s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCVArzu/pOOhWihWbC8Kw5qPDNWbhtJGAKZcbKkEFVgLqwiT9MVcDewtZYylCBLC38yDfgqwlsbJbKtftdjfcgyI26NUa3a3soxZBrq+248tj2N6bNesePj7rCfGTtEv49w4WQMzkitAEuqq1ika17olknu6BnI7izFnbkcAkTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVSpTH/k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVSpTH/k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912F0C2BC9E
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771241882;
	bh=kskJWXzhNyI1vU6hKjus6H6e3qBuiPmJnGCDh0Oyc8s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=KVSpTH/kkBDx2JlaWBDOYFy1lQb6WPEQEQHIMGuxRfxKPxhxIVmxvjxJ2q9s7CPVG
	 Bp20paNi3g1vENKjuasefALD2tyC/Br2/oEhCyYVz3MP4vCgrUmqFbH/4mqoegprkm
	 USFPNR8XFoAb1waT/z2iydOV85ODbOcjRkb6oBKRL7D6nVZr6iF3YODEdPy7EcZcvt
	 2eoo2ivYMlhqsI2JHdRxlCUz9UvCggeYo13mGyIPK0WbMcOpdCCY1fnPM3uzKH+/Eu
	 LiX75TKysjwcEZdBPFJSPy33dG1y8daAcyngq+V+/hTXxpaYTJ179ujNebNWGLiT+O
	 9ESBhP25U8vug==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e4993e00aso2596680e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 03:38:02 -0800 (PST)
X-Gm-Message-State: AOJu0YwNXVhF4DoAZh3BDZMaZHWKTnGvF4FZF+RB7gRx1ylII3pdwRPk
	uy8THuMWlEOzyixUodDmNqtoDmQ6vanRZDEP37QubV8ugsqYY++8D5Yu0PP5B5OwFXE7NoYB7XD
	FszXDai9OcYMnE1bXzuKRdmvNaoLygcP6z7nORvq74A==
X-Received: by 2002:a05:6512:3792:20b0:59f:691f:ed67 with SMTP id
 2adb3069b0e04-59f69c20c25mr2692203e87.3.1771241881240; Mon, 16 Feb 2026
 03:38:01 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 05:37:59 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 05:37:59 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260214213239.2546012-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
Date: Mon, 16 Feb 2026 05:37:59 -0600
X-Gmail-Original-Message-ID: <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
X-Gm-Features: AaiRm52qDuzuDvlpt7d14vF-lX3t77v81Q7g1MK2DqyZw_LNkHmlR1KUxDvVt6A
Message-ID: <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
<james.hilliard1@gmail.com> said:
> Allow GPIO controller child nodes marked with "gpio-line" to
> configure direction/flags at probe time without hogging the line.
>
> Teach OF gpiochip scanning and OF dynamic reconfiguration handlers to
> process gpio-line nodes in addition to gpio-hog nodes.
>
> Also parse "gpio-line-name" and apply it to desc->name. For gpio-hog
> nodes, keep "line-name" semantics as the hog consumer label.
>

One important thing that's missing from this commit description is: what is
the use-case and why do you need this.

The DT binding patch should be sent together with this in a single series. It
should also be documented in the relevant .rst file.

I suppose it's another shot at defining what we previously called
"initial-line-state", "default-line-state", etc. What happens when someone
requests the line, reconfigures it and then releases it?

This should also not be OF-specific but rather a GPIOLIB-wide switch.

Bartosz
