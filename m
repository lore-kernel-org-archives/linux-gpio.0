Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FE3E9C0E
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372163; cv=none; b=tcasOKXSRoIfS6ceW7fGJVUPjKfl5vHvjtAHPN6QPbGcxRbYS2Syj6trv6J/k2lZ6GCMvCQtwfEkquml4Bg/tNBawG+rg0W5twl2gYi5XdrVOkfuxmhCPA4BbcetkZCnC60PEiHrqcZFvD/CBSwoUxdyvPQwzozSElviff0re38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372163; c=relaxed/simple;
	bh=eh3FmuZnKhUFGy/OSFjTCb8owuQ142K4+RLLX7RLn6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7ScDmrzlsPh5ZrmKzQmxn+fTAwrVTJHItfGA1oJNkkgNHRJLXSWcUqwl87JSTdEdU2SkUmpYxRFRh6qlV3weHsGSVL5oUP2iCpelM0nx51RKyYJgoYnZUn8KgiZPIkChdDB5rzn4Gyy2WDcBHQhYfFynoGZgWAijlW7SvKeAJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPI11ELE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPI11ELE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02A61F00893
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789372161;
	bh=r7/BlypSr8FLjdPM6zCDe6iNWNDjYtDqv6ft2rxt8h0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kPI11ELERspyGKY8N5SG9QQNGJWFCm9Arv2+v0FcW6aapw1MV4slF5brAU7atzbtr
	 DCEp6IIbFpkXiS+L0jVlhx8VOqeHy9W950xZliB/W0Kd/xsmfpL6/1QKEJXTe5ac9l
	 U7N0FIbbbAGUaVlhF3iZPkeALMUruS7pRDTH+7Pylt/QQvT0TeCJ5QA2pNTCeH7PLk
	 hcNjrj5OcV8feB9Dai1fOSM8RVtS+BjP5MJv2SgHADfPse3TTz6NS9asTqMag1jJW0
	 m+rTVpxw47HGf1ZbvgycpbxXVY7+XBIBFWWR90Bt1ZkO5GehGywrSKsxeIr9DqxVjE
	 FyoBUEFuRX4mQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso2820068e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 00:49:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwR9LICTEqvug4ELTXZBVCclbOoRXojhVMr5FlrrFIKUtiuNRJesfmVR46dAyRHWPBT80ZUN+y8C/cC@vger.kernel.org
X-Gm-Message-State: AFuF++mOoy4OsLEWXd761RJ/7pYZa8zBrGeTxVemTZdN6iClX3msNrhv
	Hw+TPJ6W9tAEsxO+nfuX4vRlnSXoJ6hFkdNZVmabLWmxTBR8mq5pu874J1dg4ZAF94tx38oYkMs
	g/DMkMJzayyzwJn9fbC9xXLWGKZA5avs=
X-Received: by 2002:a05:6512:b07:b0:5b6:4ae:19e7 with SMTP id
 2adb3069b0e04-5b8ae671edbmr361456e87.26.1789372160429; Mon, 14 Sep 2026
 00:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914051537.15320-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260914051537.15320-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:49:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=tdpVpZoUO=FL-0q_5uQg7CdNKWQz9_q7BrpHcmGuSQ@mail.gmail.com>
X-Gm-Features: AcwNN1Uj6h2UqqrVwbVNk7lWjtjuOMT4LWv65lrQhwx2Y_4hAImWC751EKMsmkg
Message-ID: <CAD++jLk=tdpVpZoUO=FL-0q_5uQg7CdNKWQz9_q7BrpHcmGuSQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: virtuser: skip free_irq when no IRQ is installed
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:15=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:

> Disabling interrupt monitoring uses atomic_xchg() to clear the stored IRQ=
.
> When monitoring is already disabled, atomic_xchg() returns 0. It must not
> be passed to free_irq().
>
> The bug is reproducible on an x86_64 QEMU guest with
> CONFIG_GPIO_VIRTUSER=3Dy and CONFIG_GPIO_SIM=3Dy. Configure a live
> gpio-virtuser device through configfs. Its input lookup must refer to a
> live gpio-sim bank, such as key gpio-sim-test with offset 0. The
> consumer's dev_name attribute is shown as <dev> below; then run:
>
>     echo 0 > /sys/kernel/debug/gpio-virtuser/<dev>/gpiod:input:0/interrup=
ts
>
> On an unpatched kernel, this reaches gpio_virtuser_interrupts_set() with
> ld->irq still at its initial value 0, and free_irq() reports:
>
>     Trying to free already-free IRQ 0
>
> The same reproducer completes without the warning on the patched kernel.
>
> Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the =
GPIO API")
> Assisted-by: LLM Codex

This should just sat Assisted-by: LLM but Bartosz can fix that when applyin=
g
I think.

> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
