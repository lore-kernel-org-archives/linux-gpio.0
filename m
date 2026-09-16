Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE9477E31
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548590; cv=none; b=Pnotp398t93z5ggsYzhzi/FQzHAYxk54dKh4vPrB8pWnaLdrJKdTACCcJQyspnWqIY4E7QbflL9bx+yPd681c7oEDeBi4+YBp9Z7+pEy+jY1wGi4z0MDD0ErUdINQfOHGBTG8y1Sy9LWWCAR4KoYyshHMygzUgcGd0CSq4qEcNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548590; c=relaxed/simple;
	bh=czz0IwIOVpzhTrWGhbbRXjGCqr+0eQQqu+6ERxijrVo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yvw2oK5WPY2tJLd+6OX3giv8+ish37yfxTp8WYj/fBOPI4gRFq2uz0x9/TTl0mWgz07EeHxKvKN6C/2DLsRp4QR/qFSBvIQVRD9+Kzwuz9qMg1LiJig716VnOVvB9UYKg5fKW4W4LFBMFMBMbbRQZwoUJad4Kjgi3IsfqwP1DPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5kCQuPf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5kCQuPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA971F0089E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789548588;
	bh=XZufHBxWjYLc5kcpKxhUOODtlXpCA55rAwXnXUObZ/A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=n5kCQuPfECtjhVx+Ju9vZ48VmOdR62mUikjiHskPstgyStn0Ds4NaUTwprz5uFLwX
	 WubDgdl1aN59nxjxlhzlZF6SbgXxh30qA7HsTyTCHgJQhKkTtLPScUNReUGIUR2jXk
	 qBAXm9UM5IyFk9ypeVWMV6T1WFuOvSEjDKxgLllyIybfm3816FJJrZON529SJDEqQ9
	 X7OUceiQy/pv7OEuFVnFqVxVtuESZXxf/eOswdVa9XUXaEVUe0q7Q2RvmJaLeFNzaQ
	 /c8DAeF98LjvzKaU6YqAwyCYgrHGFm0H/FgqxFRaIYxJQ4rY9t+8lZ1O/xdLs3T24F
	 TJ5v3/7avr5Jg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so803790e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 01:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxB5Y/deKBVtb3Fdg8kX4osmS9Ie4MJKuimZNQesVRUpKM0bj6AaSgzU0NiJGfC0fwW9zFDR2eoWfEv@vger.kernel.org
X-Gm-Message-State: AFuF++lA2ugssURR0QyhK3cXLU+qvXdUZD6JukovxvILs/xdwdeASAMH
	yK9hvPJcy6Zwh5H+Fdw514UWmj56f8htSlG9eMHZukBtvPFjMiE/ALkO8Bbb0TY9SkZt+TnGeMs
	U3shkH5MvcDQNlFbcCB97KRl4dLKypBQhGRAPmunU2g==
X-Received: by 2002:a05:6512:238a:b0:5b6:1a7c:aa14 with SMTP id
 2adb3069b0e04-5b8b6643b61mr425058e87.44.1789548587447; Wed, 16 Sep 2026
 01:49:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 03:49:44 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 03:49:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 03:49:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdO+6xKy_=uLnw26bJV=9yhiakpzh0E6nt5jchVYHSk0g@mail.gmail.com>
X-Gm-Features: AcwNN1VamhLvznLMmE2uvYmINQFIFBQa5sGbvxcCFdh2dKkSiAOnLUPmIyJHqfs
Message-ID: <CAMRc=MdO+6xKy_=uLnw26bJV=9yhiakpzh0E6nt5jchVYHSk0g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix sharing a PMIC GPIO between multiple consumers
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 03:44:45 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On the Qualcomm Nord boards, three discrete regulators feeding a WCN7850
> module are gated by a single PMIC GPIO (pmau0102_e GPIO6), so the board DT
> describes three regulator-fixed nodes pointing at the same GPIO.  Only the
> first of them probes:
>
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
>   platform wcn7850-pmu: deferred probe pending: supplier regulator-wcn-core-vh-1p95 not ready
>
> ARCH_QCOM selects HAVE_SHARED_GPIOS, so gpiolib creates shared GPIO proxies
> for the line rather than taking the legacy nonexclusive path.  The failure
> turns out to have two independent causes, one on each side of that
> interface.
>
> On the provider side, neither of spmi-gpio's direction callbacks clears the
> opposite buffer: .direction_output() only sets output_enabled and
> .direction_input() only sets input_enabled.  A pad left in DIGITAL_INPUT
> mode by the bootloader therefore ends up in DIGITAL_INPUT_OUTPUT mode on
> the first direction change, after which .get_direction() reports
> GPIO_LINE_DIRECTION_IN even though the driver is driving the line.  The
> same asymmetry means gpiod_direction_input() never stops driving a pad that
> was previously an output, which is a bug in its own right.
>
> On the consumer side, gpio_shared_proxy_direction_output() reads the
> direction back for every requester after the first and refuses with -EPERM
> if it sees an input.  The readback is not needed, since the proxy is the
> only entity configuring the line and already knows which direction it
> asked for.  It is also not robust: a provider without .get_direction() at
> all makes gpiochip_get_direction() return -EOPNOTSUPP under a WARN_ON,
> which the proxy propagates just the same.
>
> Either patch on its own is enough to make the board work; both are sent
> because both describe real bugs.  Patch 1 is what makes shared GPIOs work
> irrespective of the provider, so I would consider it the more important of
> the two.  There is no build or apply dependency between them and they
> touch different subsystems, so they can go through separate trees.
>

I responded to patch 1/2 before reading this bit. Ok, I'm not against 1/2,
I'll queue it for fixes.

Bart
