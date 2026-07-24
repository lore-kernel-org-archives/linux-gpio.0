Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA75421256
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888466; cv=none; b=Lw2s8WWOpqymFiG+s7AUjVbq+CreHI6PLuiEpwMrW2200/a4PKmf4zG4aI77qNpwbIzRjiBq9pinfXOiEYbcg2BgztOoOXjthVGUHxNtkwM5Gvld2ga7RUoWSRUgfeVoT5uNwamzFTw11DEDgzj1Bq7p2+dZOSS4EIXiIya+Ltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888466; c=relaxed/simple;
	bh=EfknOjf2jnFM8oTBVhMolS7pwha4qhwLngmPtrQZl7k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEc5BKPIidF7ZSVEgdpn1QWmbahUTNFpNSHal/hCpGfna+mph05O+eyFFqE5YJ0VRRNcG+JvWg5kGU0KuJ/9rgUclJnFqayWUMGzs35/2T5V8of1sNQ5IBUhtqVZze9cuIzqIq9eSFcJt0YS4yXxfXvBCN3waYGfqURVYJIdmOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4W3Z8l2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4W3Z8l2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C776D1F00A3F
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784888464;
	bh=EfknOjf2jnFM8oTBVhMolS7pwha4qhwLngmPtrQZl7k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g4W3Z8l2mFKqDv/WFcy2cXTJDPTlhyOVLUC6OlAo30LN2y+fBQPlNxIRVpAySbUU2
	 Vi4o5OKNNRP3YdfdkkPLVLwkyCaymHUyjH43NSjPfOpCWxQgZN+AODM8DI5v2bz/W1
	 VkFJqrp38eJNb0Zj4sikWotEOh1pirfHSvZ4hNo1HbvriPgirbf6LS/mhxIMXXPqUd
	 I3OnU2+fbgqo93J5BNPLjFy/0shLRtsfD9/zMUl/SgW70U6pgWliId/9xsmaTShFYP
	 cv4SM+8dUcojP2fkxr/pULNYSP+4kubx/ld3t6xfksIcOQcFvlQxP6LUZLy56Zyvru
	 pprMEfX4JcMwA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aea0fff535so283985e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 03:21:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNkgFBNIu0gUH0Y+j2GAnDjYmBbJXMAz8AbNWwysnV1nofUFkZ9zh5SLIz/Dahd1al0Y7gHCeNBJCF@vger.kernel.org
X-Gm-Message-State: AOJu0YwwS7o2uXoteFLWzR+ETCqOpctzOv+dKVA4BMp6H++6jOgT4bM9
	h0pYyazZoTKfJpBJLgu9I4yzhub94PVuZPFf5fz1pnsAxCzCQ0wIiXsYsrZrXL0Y9dG+CHDhTqB
	SuD0GNLCmboq1RzwKj7nHgKxS8yo/Uvn76S58jsu67g==
X-Received: by 2002:a05:6512:34d2:b0:5b0:163b:e2d6 with SMTP id
 2adb3069b0e04-5b2b2f77b4fmr1157928e87.62.1784888463466; Fri, 24 Jul 2026
 03:21:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 03:21:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 03:21:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724081838.33428-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724081838.33428-1-phucduc.bui@gmail.com>
Date: Fri, 24 Jul 2026 03:21:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfp=8X55HcCW+SGAOQc1pdf_Uh+9uyOD7JYMZB_a+K4iQ@mail.gmail.com>
X-Gm-Features: AUfX_my-ULf6Tpa27IwwCw1zz-js6Dd2KXLjfk6HFOyBMGdbmp4w24XrfuFMErs
Message-ID: <CAMRc=Mfp=8X55HcCW+SGAOQc1pdf_Uh+9uyOD7JYMZB_a+K4iQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: restore cache_only state on resume failure
To: phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 10:18:38 +0200, phucduc.bui@gmail.com said:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> When pca953x_restore_context() fails, cache_only is left disabled and
> the IRQ left enabled, even though register synchronization may not have
> completed successfully. Restore cache_only and disable the IRQ again on
> failure, matching the state set by pca953x_save_context().
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Fixes: and Cc: stable?

Bart
