Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFEB414A11
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452685; cv=none; b=IKB9xjZjbIQ+4MDqpVW47UbExJeHm5e8kyu81jvUMnjlWbrvqSvHIQhgeyRHjUmja5h3RxD/mg1tQNzhZf9HWLBWmJWVrMoGfkKSM9n3pflQ5DZAZ8w5etM+Kj5xGPdtq7qhzCkHpkRhrR2LlhDDLx2HBAGFgFhR8hRIl59eYa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452685; c=relaxed/simple;
	bh=lPpL7DLSPBNvx4CQPBmrtqwVDLiWiURRjczeOm1+9UI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNUnq93IBqkmU2LD6oe2fv8iCcv1HW6dJEqbF1cTl4UHLBQ0GNlEMJ7Ei00u4e6GBF2jh2U5BtF/QdPgnm+w+VZkqZ9MQEaTP2vjf/bIMjpVXuCE3jNdBmMG4sNwf3l6dTDi3sEJy/gBFPag9+WnXhS1zsDAuMgPlM5vi9xdv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSrb1v7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSrb1v7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358E31F00893
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791452683;
	bh=fVN+gUpteuWjtPy+WZnu3PxqrcHtKZz8bFfOA06AIzM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RSrb1v7oR3nMf06nQSOunlHETOzAwb1F4M6bA2rUdVU9YQAdpsZAeXCp5wu2xX+oh
	 HpAVry+mcSnbo9cwity67pTBFVXCfRnlg4gsLaJMEMozZJYaPoG05k0s52fTGO7raZ
	 8XMdZh4hK3Pa++8ZYrY9AhxUb59trtZhqX8FA60W65PVpUoRs35AnyxgFyheEZ4gzA
	 JWX2cgEv6sWbDdm69RGFYb9zNEOZ4jE/l5JTmfYXMBTTkT9ky3JUl2IJReUgJxI3UF
	 Xp/houiN4PnQTK3/8RZuHtfOAYu83nwkABL9kXxeVa8n1teQdq/iDCKE7qqseGjRHE
	 sD6BQUhbf5SXA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a9761758adso22537631fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 02:44:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynJulowDfYmz/SYZW2YdXd0Wuk2GncAbLrI5n5CO7auASasBAxmeiIRvqfAjWz+WjN+lMejZrif1wt@vger.kernel.org
X-Gm-Message-State: AFq9FYLtYMRHYFmHowby6Y77/s3bfUMGO0zoThG+SrNAp3arrEH05l54
	TeyfZ0gS02yE1wLOxYS2RVOIFWFT5nTNcbDOvxq5oPHjKVc5l19HQKTJEb6i44RTAQlcC5uYL1S
	3KPsnRmdLrVtPXZSy2nQ5aTHXXXcl74dPaCYhC5OvMQ==
X-Received: by 2002:a05:651c:555:b0:3a6:553d:cb1c with SMTP id
 38308e7fff4ca-3a9a2cdf2a8mr11341451fa.12.1791452681941; Thu, 08 Oct 2026
 02:44:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 09:44:40 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 09:44:40 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-162895@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-1-c9f5a8b50df9@nxp.com> <sashiko-outbox-162895@kernel.org>
Date: Thu, 8 Oct 2026 09:44:40 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdkYcyCMTz7jf79AiwtYZhTd6riboZ6XV-0+ti_GENQKA@mail.gmail.com>
X-Gm-Features: AclHuK-xW1IC5E5tMUmeNXw2ZYoOm0QGB-pVQWNlcCjPaLvZpqXXP1E1CDnGRYQ
Message-ID: <CAMRc=MdkYcyCMTz7jf79AiwtYZhTd6riboZ6XV-0+ti_GENQKA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	Frank.Li@kernel.org, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 12:57:13 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] gpio: mxc: data race on mxc_gpio_ports list during concurrent probe and shared IRQ
> --
>
> commit bd719d33a26c1f816073bbdb04f543bc3f5ed730
> Author: Peng Fan <peng.fan@nxp.com>
>
> gpio: mxc: fix race between chained IRQ handler install and probe completion
>
> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window, it leads to a crash or missing port. This commit
> moves the handler installation after all dependencies are ready.
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 7e2690d92df6f..e05f276a50e8d 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>
> [ ... ]
>
>> @@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>
>>  	list_add_tail(&port->node, &mxc_gpio_ports);
>>
>
> [Severity: High]
> For fsl,imx21-gpio devices, all ports share a single parent IRQ. After the
> first port probes, the shared chained handler (mx2_gpio_irq_handler)
> becomes active.
>
> When a subsequent port is probed, list_add_tail() mutates the global
> mxc_gpio_ports list without any spinlocks or RCU primitives.
>

I think we should switch to list_add_tail_rcu() and list_for_each_entry_rcu()
first across the driver.

Bart
