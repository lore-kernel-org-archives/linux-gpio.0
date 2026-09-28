Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F647F77B
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584707; cv=none; b=J2r8LG3VBWFrGW41s7Kcxd7JIRmYmv4QGC9zU5vkxF0cDJ9cueAqr0YdGUc2yA8XPZRoDQqXkbOXRYTG0iUnreFJogceyIG/S3LaTSJ3eY+OtsTN2RlwRgI1YlvEQe60jA6HXMON2ewkL/vVVQJJ0099zBsKck93RvR4PFyWF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584707; c=relaxed/simple;
	bh=KzmtaBx/W7Qo6eJlSIglcMY97ok4d4GtoRfvLF0hscI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnqL/jSTxylOKRgWa9omLeni5pq/n2rUly3Tm2up4D9thR8lIFFi5g2BZfPEiaXkLU/sZJzmrVkdYtk4wFSXKNxFMyq34xQHOu6zNKnpV42B5us3dBc/voxMUvwwFOvgIcAXqcJ0dlETapdEMT9EPWG4A62kzwG8BTFX1sTLa1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fk3TfVQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fk3TfVQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BC21F0089D
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584705;
	bh=KzmtaBx/W7Qo6eJlSIglcMY97ok4d4GtoRfvLF0hscI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fk3TfVQ8MwNrWU6IzYBQXGVhC+7X8nYQZRYw+k3Yoy5mHGBU5bsNSttCLOn4tIcf6
	 alM50OyxM2mXVJpsTVzS0j8N4MhabhzahjBjUpa77Lr2VzbbC0MPDef8EPEsa1zqQf
	 27EY3yixr6k0zTBpNh6+HLvn3ATCMb47fylmkf1oStT9Z+N4SO0XLMAyzdptmYGOSQ
	 WMyb2fXIyw/tYnaqM2N+emPTnuAuj+NAYgE6L0y7VBunrm8/IIqV433U+3aQVTcILL
	 d8mKJCXoh3WoDHK0RRMTxhaSae9ZsSgrIUs9YbFGjYYcWka8e5T5LCUxBQU8JoFq2s
	 jdGTbhUN0h73g==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f490bb27so709235e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 01:38:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxD/XcSPe1JZWph8xY4A1YdGR7TIuNx7NOSLMJ7hq57J3MPeKJqKs8L/z82JTl1F7oUSlhawXuxLRrz@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Gu3roC/C8fZZWYaCnS32A/jLXb0OiaAWKiap7OZLYx/dxaLW
	q6Xcy2i1ZfYqMbJlbAN5BbOmHEInMr3pT9xRr6pne+wj3/ArjCllgH1sbAd8noTkAe3e6krtx80
	uLmhJnu3v0UcRDdwKIPxZ4cSpJsLQe6//GdE0Dnec5A==
X-Received: by 2002:a05:6512:2c86:b0:5b8:9978:a2bc with SMTP id
 2adb3069b0e04-5b8e6d91f8cmr2796693e87.23.1790584703696; Mon, 28 Sep 2026
 01:38:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 03:38:21 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 03:38:21 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com>
Date: Mon, 28 Sep 2026 03:38:21 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeJcYezVbqVq4cM2RuAtP3mxCuKKLMS3z+XqyS4DEa5qA@mail.gmail.com>
X-Gm-Features: AclHuK9pVuYMjJOL3S9OWFCVZ-No99gs9AaKgirufX3RDkqpWzOUGcwSuUMSUDU
Message-ID: <CAMRc=MeJcYezVbqVq4cM2RuAtP3mxCuKKLMS3z+XqyS4DEa5qA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add required gpios and missing
 PWM functions
To: george.moussalem@outlook.com
Cc: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sep 2026 14:22:11 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On multiple Linksys routers, GPIO 1, 30, and 46 are used to drive the
> PWM led on PWM1, PWM3, and PWM0 channels respectively, so let's update
> the pwm# and pingroups accordingly.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Are we *updating* or *adding missing*? Depending on the answer, this can be
interpreted as a fix that should be backported or a new feature that should
be queued for v7.4.

If this is a fix, can you add a Fixes tag?

Bart
