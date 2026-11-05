Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870645;
	b=IUR/IEwTiDCBVAt2eZkfAUIzqzfCbEMGvyLFEYhJ7xsJ3tIEWXVax5QglpZv+vifXqmr
	 IFXmI6vqAuXIrNGeMQwXqGi33z1TuRjNKs9r387aNzLw8a+Mv3OyTSZKbJoFZhhhd4Wn1
	 JZ6DV5oKldR+cKGetIOeRWJLtz0ndQrOzo954WfEqejSkfH7PVIaULSIBjfzY69SxcAi3
	 sMW/QWz4FZn6P+MjThA7OiPDFCVCGx3S6nqiLouXB5o2n28dbGCkybtfdIvYBAFC7kUj+
	 rycT92jt6LxzGBgbmwJawS/JklG+za8rgCkM4BxbXKkfjROgVsH3tvb2gRh1rsQ8bZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870645;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jHdgjJk6xIGbyst8scCaL6YlxLPI/vAvF2nihFmwgTg=;
	b=vj1aEpg0PLu9awHL1ZINnI+Vt72ts3ETQb5IptiTBk7+DG6v8DkkW5gsuEj1v7fCdRol
	 QskGtPbK57s30nRscZniMKpRYABHPhCOhHaeBi2m86SqX6xGOgDT9swS20US6sUjeg/4u
	 NfXtUYeble1+b5Kv4Y3f7ModN5YYhSpVcejv2yWi/w/3OP8ktAAX+KLfsApaPzBmChomE
	 kXT7rooo7zddFJzCEsGyXGp6VuiymvSln7fUMBW19cJJ46p2/3RouCyWEPobj8eZZ1HwK
	 oRZjpUQFI7PULRzoxF6tlyZDXdDlxWaqV+Mv7i1ZtVS5/ttX2iy/sDAWuHOqztxUlHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QnnzrWAl;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA7D606A328;
	Thu,  5 Nov 2026 09:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA7D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QnnzrWAl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793870643;
	bh=oFWx0G4SNUn6EJg5WoDciGHt6BRaaIO/akfCKMdbA+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QnnzrWAlzT1lm1vy146BWZIZpxIQXMief68D0NDiyCNQBm6055VQ23pHa/0bHlbjz
	 VZtZ/k9ikQaSdMUS4DM/XuaWYoDamzsb6U+6kyiGNvv/CwhkS9ivWJ1mjLWK5/dLU5
	 Vi7s+uYVPG2FFA34K59wxY8jql0DNjjj/Q1DoqueG8apAqu9iPslPTrAdUUWGlGO6K
	 +UjVxOoZeVDdtLfLhBkudVJT4O5CTjZcqdvTQuBjRnfH79oOukhxLVgOD8s7VYwCM5
	 rXq4/fpmLFEUfxTmJu+B0p7gSHSF1XfgS+tXG8EiB9knBcTvc0fyLUXDvW5+hioGoO
	 NXYSCeasyKzNQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBDE617E05D6;
	Thu, 05 Nov 2026 10:24:02 +0100 (CET)
Message-ID: <21e22f14-38ef-4645-82c5-b8b520d93c48@collabora.com>
Date: Thu, 5 Nov 2026 10:24:02 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
To: Shubham Paralikar <shubham.paralikar@mediatek.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261105050535.2551413-1-shubham.paralikar@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261105050535.2551413-1-shubham.paralikar@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 06:05, Shubham Paralikar wrote:
> MT8901 and MT8971 are booted with ACPI firmware and both describe their
> GPIO controller with the same _HID, NVDA9221. The existing MediaTek
> Paris pinctrl drivers only probe from devicetree and pick their SoC
> data from the match table, so neither SoC gets pin control, GPIOs or
> EINT interrupts, and two per-SoC drivers could not both bind the one
> shared HID.
> 
> Add a single driver, pinctrl-mt89xx, that matches NVDA9221 and selects
> the MT8901 or MT8971 pin and EINT tables at probe time from the
> "ChipId" property in the controller's vendor _DSD. That _DSD uses a
> MediaTek UUID rather than the Device Properties UUID, so
> device_property_read_u32() cannot read it; pinctrl-mtk-dsd evaluates
> _DSD and walks the package directly. All four objects are linked into
> one module, pinctrl-mtk-mt89xx.
> 
> Make the shared Paris, common-v2 and EINT code work on ACPI and with
> these SoCs:

Okay, that's big, and ACPI is definitely welcome, but the implementation can
be better.

> 
> - paris: add mtk_paris_pinctrl_probe_soc() for drivers that pick the
>    SoC data themselves. ACPI resources have no names, so map the pin
>    register bases by resource index on ACPI. Register a GPIO range and
>    request the ACPI _AEI event interrupts, and support
>    PIN_CONFIG_BIAS_BUS_HOLD.
> - common-v2: on ACPI, count the EINT banks from the MEM resources and
>    take the IRQ from the platform device instead of from DT. Add
>    reg_order[] field tables for SoCs whose per-pin registers sit at a
>    fixed stride (MT8971), wake-event EINT lists and bus-hold bias
>    (PU=1, PD=1).
> - mtk-eint: add a skip list so the init-time mask sweep leaves
>    firmware-owned EINTs alone (MT8971 EINT215, PROCHOT), and add the
>    MT8901 debounce table. On SoCs with a wake-event mask (MT8901),
>    unmask the event for the static event list at init and for EINTs
>    armed through irq_set_wake(), mask it again when wake is disabled,
>    and re-apply both on resume.
> - MT8901: add EINT-only virtual GPIOs 182-208, such as the xHCI wake
>    events, which firmware describes as GpioInt resources on this
>    controller. Skip pinmux, direction and pinconf for them, and report
>    debounce as unsupported on EINTs without debounce hardware.
> - Add mtk_pinctrl_program_bias_by_gpio() in
>    include/linux/soc/mediatek/mtk-pinctrl.h so client drivers can
>    program pad bias by absolute GPIO number.
> - gpio: declare acpi_gpiochip_request_interrupts() and
>    acpi_gpiochip_free_interrupts() in linux/gpio/driver.h. MediaTek
>    EINT provides .to_irq instead of a gpio_irq_chip, so gpiolib does
>    not request the _AEI interrupts for this controller by itself.
> 
> Signed-off-by: Shubham Paralikar <shubham.paralikar@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/Kconfig              |   14 +-
>   drivers/pinctrl/mediatek/Makefile             |    3 +
>   drivers/pinctrl/mediatek/mtk-eint.c           |  251 +-
>   drivers/pinctrl/mediatek/mtk-eint.h           |   16 +-
>   drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1437 +++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mt8971.c     |   58 +
>   drivers/pinctrl/mediatek/pinctrl-mt89xx.c     |  102 +

89xx? No wildcards please.

This can be pinctrl-mtk-acpi maybe?

>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  252 +-
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   43 +
>   drivers/pinctrl/mediatek/pinctrl-mtk-dsd.c    |  140 +

DSD is an ACPI table... and this is a parser... I guess this can go in the
pinctrl-mtk-acpi driver as well?

I think that the best way to go here is:

1. Have a pinctrl-mtk-acpi.c for all the ACPI specific handling, then
2. MediaTek SoC specific driver should register themselves with NVDA9221 ID
    and pass their own mtk_pin_soc pointer to pinctrl-mtk-acpi.c, so that the
    pinctrl-mtk-acpi.c doesn't have an array of mtk_gpio_soc_table.

Imagine what happens if we get 45 SoCs in there.

This is the first and very important feedback that I can give you - everything
else is about some code style and unnecessary dev_info that has to be turned in
debug prints instead, but it's useless for me to go and actually do a careful
review because I think the code will be changing a bit.

>   drivers/pinctrl/mediatek/pinctrl-mtk-dsd.h    |   36 +
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2296 +++++++++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h | 1646 ++++++++++++
>   drivers/pinctrl/mediatek/pinctrl-paris.c      |  144 +-
>   drivers/pinctrl/mediatek/pinctrl-paris.h      |    6 +
>   include/linux/gpio/driver.h                   |    5 +
>   include/linux/soc/mediatek/mtk-pinctrl.h      |   43 +
>   17 files changed, 6450 insertions(+), 42 deletions(-)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8971.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt89xx.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-dsd.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-dsd.h
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h
>   create mode 100644 include/linux/soc/mediatek/mtk-pinctrl.h

soc/mediatek/mtk-pinctrl.h? No, no, no. Unless you strongly justify that, for me
it's wrong in principle.

Cheers,
Angelo
