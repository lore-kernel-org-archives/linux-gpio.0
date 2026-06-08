Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE62C3B3C1A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909536; cv=none; b=PBfwrv5Y6/d8OuAgKcBCUxdljxUroOozUY+M9o62RmaXhiJ4mc5SJCN86QSrgLLTS3cCcdHzsd4po11cJ1XR8q7IW+BKAEKJyeQQRxWbw7vdJoK6J8YN638o9bwTXoEWs7br4P8mTC0eJ2jac/6bzNxXCbpQOeuiLWKmfhiEz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909536; c=relaxed/simple;
	bh=0Ppxt17mDa8ZUEK5PWxE5TG7IE7wX8RKGYOE4bnofqc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhOOtPlWd0iNic2Yzn+WKCk+urg8N23rC1k6YP33SQ31WjpgFkGCpnpt5Djt65xPhsNhKI3xeG8LanYaWIiyGKfu0bxQTBffgmOS6nN3sKa/IA1Efp6UkOpiLZh2ERLR+VJTJDygagyHTxiAOP8iCkMcgFjQL8HhXIPounadFKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy5uy1gY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy5uy1gY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F011F00898
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909535;
	bh=0Ppxt17mDa8ZUEK5PWxE5TG7IE7wX8RKGYOE4bnofqc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Fy5uy1gYynayYSCqSqBoyaDAA/VcbQtwBLevWM0aZsCyc9yoXF7xU7rXAKfpPMZWD
	 JLTsF2qe7qL6LE3ooPBGzsvXFj6PJZLmFznO1wPwzZOkxryXhIxvAZFx5YPtrqccYO
	 Jf1xZSsJkCrEXRB4eTuGx0MnrmE0mQa5XdzG8KWHL96BPpoOpbBWVcEwZKpBstJdvN
	 9njfImRla5617k2GMsrK9suLwPVksrMv3t03s4PXZmDNuwdpZQn4ooOj/Wo6l487aN
	 rgoySCiyoWhcIFUBWIEKkf68Qarir2HdleoMbrfnqLjNsmXq3CRo7LWKR/xBzrPhCx
	 ucV1Ewpixm5Pg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-396775c2720so37082991fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 02:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9zdEiyXftePHKo/ekYdBE2WcmgnI3/CtfqaukyD+mt2U+zOfLyC9ZrWi/IFs7Iys2KfRC5gdeYJL4W@vger.kernel.org
X-Gm-Message-State: AOJu0YxzjNfo2h+pPUATha0JwZDYuhCQFLxqn+U1bQm/FgZdnbKCiIfV
	cDsxXvVKgDTo0Ap/eAiTgo5iG+gtiQOXHp4h7rloXwdH8ayp4gh5Rzl+ojmWhdznNTZbu/iderL
	PcLAeKoYLH6f6fIxjvkhLMw09449Y1eFxA3cFaglmBQ==
X-Received: by 2002:a2e:a591:0:b0:396:b398:5956 with SMTP id
 38308e7fff4ca-396d094c5e6mr39705001fa.16.1780909534065; Mon, 08 Jun 2026
 02:05:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:05:32 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:05:32 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
Date: Mon, 8 Jun 2026 09:05:32 +0000
X-Gmail-Original-Message-ID: <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
X-Gm-Features: AVVi8CdZtMgqfIDAjbSfhssvHmbQQPQmDlzR8HKyr8j_ARYiMnfgaBnyyL3kpqQ
Message-ID: <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, tglx@kernel.org, 
	grant.likely@secretlab.ca, anna-maria@linutronix.de, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 16:25:13 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> The GPIO controller's registers are organized as sets of eight 32-bit
> registers with each set controlling a bank of up to 32 pins. A single
> interrupt is shared for all of the banks handled by the controller.
> The driver implements this using three gpio chip instances every one
> with its own irq chip. Every single pin can generate interrupts having
> a total of 96 possible interrupts here. It looks like there is a problem
> with interrupts being properly mapped to the gpio bank using this solution.
> This problem report is in the following lore's link [0].
>
> Device tree is using two cells for this, so only the interrupt pin and the
> interrupt type are described there. Changing to have three cells to setup
> also the bank and implement 'of_node_instance_match()' would also work but
> this would be an ABI breakage and also a bit incoherent since gpios itself
> are also using two cells and properly mapped in desired bank using through
> its pin number on 'of_xlate()'.
>
> That said, register a linear IRQ domain of the total of 96 interrupts shared
> with the three gpio chip instances so the bank and the interrupt is properly
> decoded and devices using gpio IRQs properly work.
>
> [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
>
> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> Co-developed-by: Vicente Bergas <vicencb@gmail.com>
> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> Tested-by: Vicente Bergas <vicencb@gmail.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Hi!

Can you look at the sashiko review? Especially the bit about tracking the
GPIOD_FLAG_IRQ_IS_ENABLED flag looks correct.

Bart
