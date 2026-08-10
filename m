Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5553DA7C8
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367307; cv=none; b=IN2VlC7YkKyM/2Raqyx96s3S8j2tML4v99IuE46ql4cCQjyGwxPHsJeo9i+31xYuHpp7Ie3d8PSFEXpwVdUeOameMN/959ZK5MGMMh9omYNlgF/xNQXhItDasmewVqlHjTGoLnizovXljQbMqI7nRcSdsK9dAIq3yDS9GvFMNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367307; c=relaxed/simple;
	bh=JwDhx/0D+tayieNxwpVkbgSROKgJDX7SSVfca9Mn9No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNEgdD1YO2VbqrrTcySYgekcz9Mcw2Gni8iQ9B/dkHj4l3IDd0lJHgIYHpTGEizbhljL+DUgsUDqMLeHj3FRn/PMPcXs6KXJamUN9S7PG9I+BshX1BQnx+r8WWf4bGH8HTy4dWJS7w8VhXj936IkaAOfeTd1tvTExCAdPafsqj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Azn3oAF6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Azn3oAF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56161F00A3F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786367305;
	bh=Mex6+YUTjnUjC9Q3NQSKuNqtW6ib0n4wLnfzuqCQKIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Azn3oAF60ulXr60AVrgd5++w/a2QT+xiZOhXsSZgGRW9G93ykmy6f/D02mOY0K1dX
	 5UU+PBSgugBgOTv2zZpd9o+eNsbFoEdaLcBdutzV/sc0uI+nubpXZGp2qlJbYT0Gkm
	 ILdnWtsXk0CqCIgIChS4rY9OGpJ0sS/tlG45koJuvuGy1VpXdS9ktyA1LbxNNCQfxa
	 yE8M+MYJ0GR+1AP8LqKMVAuPVNCzGVPWhMdaMtGVhHCNaOmTxAyExXKZf7xxK/FJAe
	 bb+D3eFrpPmKpOWctUtP2qCwGroO/Jz9nErMinLcEzVTX3uLK2nLZcli/URBrAYpEX
	 DR531f4TRbxkQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2020888e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 06:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp1t5kf3bKb8/OocRtpMAKiQWEDT4EwsMFMCHE8mWgmcD4W8P3EbfogoeUA7OLW20rgpE5ficGZ34+7@vger.kernel.org
X-Gm-Message-State: AOJu0YyEoptY98cAj8YS2vN+qHI6X+2curNZ1pkfQv6foKa/1X7raCg6
	VZz+EHBkQOhZfqw2nngFkysxgmIgiySDMrBUxwjrKNo7GDP9icCwXqno5RzllM1PoSqn3YkHPMj
	02Z5CcIhyKcjVkL+djV0Y8JR47NwApsLVwarlLSqpfQ==
X-Received: by 2002:a05:6512:2347:b0:5ae:b86b:71f0 with SMTP id
 2adb3069b0e04-5b3092de7e0mr2588468e87.37.1786367304353; Mon, 10 Aug 2026
 06:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 10 Aug 2026 15:08:12 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfo4J8n9MWOzUBRz-VRu7T6SNLTTGrnWfHxGfWxZz71Sg@mail.gmail.com>
X-Gm-Features: AUfX_my5LS0eP6nW1TviHR6fvDzSsa_5WW_4107uE-LtvAShw-kgxeD9ZkUBg8U
Message-ID: <CAMRc=Mfo4J8n9MWOzUBRz-VRu7T6SNLTTGrnWfHxGfWxZz71Sg@mail.gmail.com>
Subject: Re: [PATCH RFC v8 0/8] mfd: ls2kbmc: multiple fixes for this driver
To: shankerwangmiao@gmail.com
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, Xi Ruoyao <xry111@xry111.site>, 
	WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:04=E2=80=AFPM Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>
> Previously, the driver has been introduced to support the Loongson 2K
> BMC running on the Loongson Servers, which is essential to prevent
> the system from hanging when the BMC is being reset and the default
> efi-framebuffer is being used. However, there are some drawbacks in the
> driver.
>
> Firstly, the driver tries to read and write to the connected PCI-E host
> controller registers, assuming that the BMC is connected to LS7A PCI-E
> host controller. This assumption should be true for real products, but
> to prevent from accidentally reading and writing to the wrong PCI-E host
> controller, this driver should be modified to check this before
> accessing the registers.
>
> Secondly, the driver uses non-exported functions to tell the vt
> subsystem to redraw the screen, preventing the driver from being
> compiling as a module. This can be fixed by using the exported
> functions instead.
>
> Thirdly, the driver directly accesses the GPIO controller registers
> using hard-coded addresses, which might conflict with the loaded GPIO
> controller driver for the same GPIO controller. This is fixed in this
> series by using the GPIO subsystem APIs instead. To associate a GPIO pin
> with a certian PCI device, it should be declared in the firmware level,
> i.e. in the ACPI table or the device tree, and thus the firmware
> interface should be discussed and coordinated with Loongson personnels.
> Despite of this, the proposed solution in this series should be the
> minimum necessary change to express such association. Furthermore, the
> conventional GPIO pin number and the controller address are also
> provided, to be used as a fallback when the GPIO pin is not declared.
>
> Finally, there is a minor issue in the driver where it changes the
> mode string describing the screen resolution during probing, which
> prevents the device from being probed again if -EPROBE_DEFER is
> returned by the probe function.
>
> I have tested the changes in this series on a single-socket Loongson
> 3C6000 server with a Loongson 2K BMC, and the driver works as expected
> when the corresponding GPIO driver is additionally loaded.
>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
> Changes in v8:
> - Address issues found by the Sashiko AI review bot
>   - Fix the error path of the probe function, preventing unintentionally
>     returning 0 on failure
>   - Reorder the patches in the series to make the change to the Kconfig
>     entry for ls2kbmc to be the last patch, to satisfy the AI bot's
>     concern on failure to clean up when the driver is built as a module
>     and is being removed.
> - Link to v7: https://lore.kernel.org/r/20260810-ls2kbmc-mod-v7-0-8aa0fb5=
a5462@gmail.com
>

Don't send several versions of the same big series within minutes of
each other. Give reviewers time to respond.

Bart
