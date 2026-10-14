Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BD33D6F0
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966345; cv=none; b=iUSQf/905XcWj9y7XaA7BXau43nYPqBmHsWfcwk6A77blc7rlJy4uwSNbTO8LiLn1bMFQCwlg+PXeTVxX6XWi7SXaf23S/SbnGNxvfroSHIU6mHyP+099VqeYB5dri3vD+seC7B20kjD8BCIWdUDcKY8o4kvRFfjpZwvx95qTbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966345; c=relaxed/simple;
	bh=oQvR5tJ4dw2Wk3sAiJAzIyO/Vdq4EGIAjsZKqgkjuZ4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugZmApjQvz1H+XE8knS1b1LV/GQVe5gL3w2xNCXh70mKFh/4OnuqIb+7AH77+AFjQZj6ii5W0qJtGBCqQwu/5/8p0N6NH7HA4Q56DydiXANbhtun8S6WY1+Vv2GBpCyZiOvpEO3SQ7LchlRuBSvGF+lKQUQmCwSTOS6x8y90zWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mw4vXVah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mw4vXVah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E361F0089A
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791966343;
	bh=oQvR5tJ4dw2Wk3sAiJAzIyO/Vdq4EGIAjsZKqgkjuZ4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mw4vXVahEh0Obw1/BwWf8KYcs2KVDE/Rmbb0wfTYI/e4srhz1jhj+EyZYxH70vyzK
	 BU3sqpQB1hVuLqJ7pUFPNq6DRNBbvy14NcoOlvP/b3TJGKYHStBGr627Ga9Zc66mtR
	 Z7I4XGMORdTMawZ+11jizyX9M1Ws61myePD6zTzoiOSjvY12C/cwHg3QAR+FJXKU9u
	 /hP4Ej4HOdsbi65BGVRbguNpERINjsZqGpdg5xtm+VsW26Z0H4us9f+SyUbHoOVbJz
	 Dg9Exy8DEBS14s08pqeiEBXI3SfY5canvY5NL+hUKFwmb4D1lUdpLX6kp8ShYRqDYk
	 xxoy5cIMB5zdA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bad794b197so4093516e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 01:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2Ikm8QGfNbDfxEaB5VySRqUvLxk7xo69LjEvV0sVnOARIqSHctxwuTDQ1XSBqRA6VEgqyT6gF2Mx3@vger.kernel.org
X-Gm-Message-State: AFq9FYKKap4LeaAFzPIdTd2g+Xh10xR5HMh/fZrOa/q1SznI8d66cVti
	hm3wk2A5qGRjvL2cVXPVcrY2hvjN5ghPQzFKjBxzc+CW1Ol+TRihaK8mqVc5/btmAWvftsLyPwJ
	K5B6xw9UbBvBiu6Fe++m9KM3W735rON/lBTQQzIr7BA==
X-Received: by 2002:ac2:4e0a:0:b0:5bc:d17f:3889 with SMTP id
 2adb3069b0e04-5bcde6bbafemr5668753e87.20.1791966342309; Wed, 14 Oct 2026
 01:25:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:25:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:25:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261013094412.945609-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013094412.945609-1-andriy.shevchenko@linux.intel.com>
Date: Wed, 14 Oct 2026 01:25:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me8-q5LTLhMyDuqdgoKFOUUxdfaJPxrj+w=comhbA88GA@mail.gmail.com>
X-Gm-Features: AclHuK8otTVUbxeqOpHKBJCykJG7SQU9c53ZTQ1W6la2LozWT8DXDVEiQ2KdSEg
Message-ID: <CAMRc=Me8-q5LTLhMyDuqdgoKFOUUxdfaJPxrj+w=comhbA88GA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: shared: Don't define variable in the
 middle of the code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 11:44:12 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> While the C11 allows us to define variables in the code, we do not
> do this style (see more at [1]). Move the declaration to the top of
> the function.
>
> Link: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Doesn't apply on top of gpio/for-next.

While at it: the subject should be "gpio: shared: ..." for consistency.

Bart
