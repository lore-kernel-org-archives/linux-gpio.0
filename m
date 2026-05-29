Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A590C376A08
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780087516; cv=none; b=ihgCZ+8YMPdHj63vqiMJURSPRtb1baVRxBsz9wCQumqQTCBeI3kD/ubVP22VGwrDUTGqph0ygQP9iFh2Jiaopiudrl/8/9Xj4pSnnbL5DYofexdKYUeK5TPqAY/pBnNbeRNfrD4S7fhtV6T1z6EnLg5PwMwbjBbuMFz0Eui71kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780087516; c=relaxed/simple;
	bh=L8Ni85Q06Eefx8xhs489hrJr1FXCx1F//yOGoH67cUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fz7WPtl/+ghZU9BCY8GyQuQWf1rIC30O8QlydI/sZNvld9iKPzTEm/NXA2WBMjEXn3VP/eaWb77ABiMIYWtCYON1FHbA1oAfyDD/yGCt89+8JAaIc6JhF2IAYRPi90TJGKEaasuRm1KMO95dR/mWlW7yK2/6Qaac06vzzoMXo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWkJ4DRz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWkJ4DRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746041F0089B
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780087515;
	bh=L8Ni85Q06Eefx8xhs489hrJr1FXCx1F//yOGoH67cUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UWkJ4DRzhKZCkCYz6RvZzZxZz9UyHusHpo/2r71WfFnDfg3kB79At5zvXpf4rHfDk
	 uCue7UA2kg9AOl7G0cRlkMy0Ueq5YdeO1q231gT0u7B1WrEJ9GMm8PCl0UvlW14gOd
	 8ZK8dcRFeZYUtwdH2oGEjN7NtMakXvvhAQzW0VODWyw6lkQ/La+JvRBS9cGmEkko6h
	 //QzBtrjLz9oRHbvvxL811JHZFoQ9EVpqzj0Gn0t01ClEMTzbjEbtO/WzSngndkw1y
	 qfpIAodS1KZjQ7yaP0sazeSGKBI9BcmObO9YmucoWikXBinKz4zwtIxe5VYSc75ena
	 AZ8+jpCvvQGYA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-393a44854d2so121582201fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 13:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84PPqoGxRXrhtu6kRL0eSkWV2fGT0gKkv0XXd1sX2Gws4FaxpxrwEGt1rqpPlBFp92Vlgue2mMszp7@vger.kernel.org
X-Gm-Message-State: AOJu0YxVWm6DLSwybXw2yiN5QJsX6/t5Zred3ZBRI0nPI2/y/P/FOvDJ
	p3Zh7QkQzTKfNEHbrbn0ZayrcGKpCC4qHNUKZIoS7WhVeM0OknOfI9xAm0SVVEahV4eyvcLrVf5
	d9VeABgUYkAcnQlAq5Qc2nurtSZNv6ZU=
X-Received: by 2002:a05:6512:689:b0:5aa:265f:acd0 with SMTP id
 2adb3069b0e04-5aa6092a8a5mr449918e87.39.1780087514246; Fri, 29 May 2026
 13:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
In-Reply-To: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:45:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-eLSMXdrxgCj5n1X8KyHuTwiDc-0KYot+Jxdec7ziUQ@mail.gmail.com>
X-Gm-Features: AVHnY4L3CTkOpc_4zzPdNijuz6M2O9zERQnv6ya51npZUkYxUKhYGUHbKVRGBqw
Message-ID: <CAD++jLm-eLSMXdrxgCj5n1X8KyHuTwiDc-0KYot+Jxdec7ziUQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Replace open coded eoi call with irq_chip_eoi_parent()
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 10:09=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> Before commit 14dbe186b9d4 ("pinctrl: msmgpio: Make the irqchip immutable=
")
> msm gpio irqchip conditionally initialized pctrl->irq_chip.irq_eoi to
> irq_chip_eoi_parent() only for the GPIO irqs having a wakeup capable irq.
>
> In order to make gpio irqchip immutable pctrl->irq_chip.irq_eoi is
> initialized to msm_gpio_irq_eoi() which now gets invoked for both wake up
> and non-wakeup capable GPIO IRQs.
>
> Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
>
> Since the irq_chip_*_parent() APIs internally do not check the valid pare=
nt
> data is present to ensure irq_chip_eoi_parent() is only invoked for wakeu=
p
> capable GPIOs validate d->parent_data within msm_gpio_irq_eoi().
>
> For non wakeup capable GPIOs d->parent_data will be NULL since parent
> irqchip diconnects hierarchy using irq_domain_disconnect_hierarchy() and
> later irq framework trims hierarchy using irq_domain_trim_hierarchy() whi=
ch
> makes d->parent_data as NULL.
>
> No functional impact.
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
