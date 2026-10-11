Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DFD44064A;
	Sun, 11 Oct 2026 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720356; cv=none; b=J+wzzZxRNVtx5Vcgks/4TTjLdJscIum+LGYB9bM3aPuljwrNYz5CGPY1Wv7mK7TiS8oA24rOdzTz3nnEzW2uS50Oa5836jeAJkPPQDuD+cgp5XvCUlTlh0BBsaISa1PBB9eRWn/c/OunsBp2EZY7Ftd36p8DNVswk940LpHpMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720356; c=relaxed/simple;
	bh=qCVk8KXyKoRwrW1WbUZ8CAg0BRlTByBY5v4IUd5gK7M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rPH5AWNcGyAi5Az2TPALvUkcjSShSbwrhkINtPK1Kc9n1fdqnhX+7a+A+8KrdhLQfGan6yR5eXNk5LDWWvfGnwDiBv/h7935C2Ax/O0HVpBOM2WhNWuov+z/Fu6i0jO3gk3fXJX48xVhrmiLVd588TTU/ypm+OY4mwuDBfNI7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJK2Y5l7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJK2Y5l7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECE41F0089B;
	Sun, 11 Oct 2026 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791720347;
	bh=FBvu+Mx0b6DbR7z6aTX+dJEpLPV/iZinlO7pPMSl0ws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YJK2Y5l7rfZVb0oKzH/0Nydynf1Dappfq4bDwL75vaYMpDx3E64sYvwAzNGA6qc7P
	 d4pK0s6y4exi2J9YyDzkguJx8sygM2hFp7l7zDj4rPX6OCnePspamSYKxhyBdd0fpB
	 JOlwqXmMsqp/0ZO6KjS4DmljiYGib13Rq7eRZ4d9oDLHIxKqMsN1i3DljXjRBDyc78
	 K7aFoEbrjAfIHol7TWDBMrnAtbJGh7Bv/Ozr1mE9AHuLlnuqgoTKtFRkEN1NTcpH33
	 9Uwf/03RAV2Ey3iBLnFfBg387MwUUO35cV8ms3eknRUAiX2QVtqSgvT039a14HSQJg
	 XKv7nDadLfjog==
Message-ID: <sashiko-outbox-167213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/13] gpio: mxc: fix race between chained IRQ
 handler install and probe completion
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-1-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-1-cb47ce2ad758@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:05:47 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: mxc: data race on mxc_gpio_ports list during concurrent prob=
e/interrupt
--

commit f3eaabd7240ce61fd8c78877e57457bbc5ad25e0
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: fix race between chained IRQ handler install and probe completion

This commit defers chained IRQ handler registration in mxc_gpio_probe() to
avoid executing the handler before mxc_gpio_ports is updated and other
probe steps complete.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 7e2690d92df6f..e05f276a50e8d 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
> =20
>  	list_add_tail(&port->node, &mxc_gpio_ports);
> =20
> +	mxc_update_irq_chained_handler(port, true);
> +

[Severity: High]
Is there a remaining data race here during probe for shared interrupts?

On i.MX21 compatible SoCs, all GPIO ports share the same parent IRQ. When t=
he
first GPIO port finishes probing, the chained IRQ handler becomes active.=20

When the second GPIO port probes, it modifies the global list:

mxc_gpio_probe() {
    ...
    list_add_tail(&port->node, &mxc_gpio_ports);
    ...
}

If a shared interrupt fires concurrently (either preempting the probe or
running in parallel), mx2_gpio_irq_handler() traverses this list in hardirq
context:

mx2_gpio_irq_handler() {
    ...
    list_for_each_entry(port, &mxc_gpio_ports, node) {
        ...
    }
}

Since the traversal is done without any synchronization or RCU reader
protection, and list_add_tail() is called without locks or RCU primitives,
could the interrupt handler observe partially updated list pointers and
trigger a kernel panic?

>  	platform_set_drvdata(pdev, port);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-gpio-mxc-c=
leanup-v6-0-cb47ce2ad758@nxp.com?part=3D1
