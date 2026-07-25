Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2E3354AEB
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784971987; cv=none; b=WTK2J9JYeddVSyjoilT0M9WWbfwLxtJOtbLiSfiuneKRSFgG0fSLD+pNkxbqrNibJSz34TiyfxrS8hOeTDIHroeBW61AT3Mrn0FvsWAk94iQg3F12JqtzJE1hAVhrq5WsTvq1ZS6J+LK+TrAErnA7GIh+wddVQneoU0GHRnyUTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784971987; c=relaxed/simple;
	bh=0k8zgy1fe01IruBK2Aq2uGUGIfll169KRrURZfti90c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KyG/BAVucteRR0TfNF+e8qSldwYFhjvLRKuVVvY4YXIT4K1Q8ZwZqimCiQoCHJerc2fP/QkPxHo3bV6kbA1UzLz5ZrJDkux5yr+fQtMABG/ldPi7KZLJEdBXd68zH9Pv6JOWLxZyAy0H9393n5k0x6eNMRvjqPHUMI1IqSBxj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKNY7TX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKNY7TX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98681F00A3A
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784971980;
	bh=wTNjaqtVswAc4gE/y5h0ZVpruAphWEqFHxfszjxeL5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XKNY7TX/jQWKHxNsG0CGQqV7CZHiDwyQNzNm2nLQhAz9aSbu2TBDtg0KCOFcq9ZTJ
	 vTMd99Ci9LRinj1TQXpg/rXC+Im4mZNk4yoUIZHtCRa/ec5Ts2wYGrLrt9Upw3B6ku
	 nIaL+V132Jtcc/I03S88pKs+U6SdQqdtC3fCOoMhvw+wPlYKrA86Wh5feIAI/cL1wl
	 e0YL+43aoFe6Rj4XEeqSmSN1qFNl+YuUHEetacG3AP8R+++Seg/to33Pcrt03ZtVM4
	 a7+utoC0wl4pPrdZwDz5Iod7NksPB/pemah7wowex8Pn/hw2uxySzCufhHXRTxst73
	 CIPfjMIoxSp4w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so1431824e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:33:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPdLM17k9WB43oTG2lz36J2ZTGrGOwkIoPOPr2ZsssKpS/cWjO4LTCKfQhUu4BR1XCQNgb1OLbE/aE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92AkduNGf8Ngmqeokxo+3MiHY5UJvPwmWXJRTfKtdg4tvnKPa
	UQMGlZj46cBxSkWC4m4mlsi4moyBLc5ivoVxaYbbm16uHT4icGxvhuE3eIPGuiaSIX9vJ/TKNtO
	ioYlkOMW+bm/+3Wb6tQoDKWUYcuZuvwo=
X-Received: by 2002:a05:6512:1593:b0:5ae:c563:f611 with SMTP id
 2adb3069b0e04-5b2c1b522f6mr264734e87.36.1784971979464; Sat, 25 Jul 2026
 02:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720162853.173801-1-mario.limonciello@amd.com>
In-Reply-To: <20260720162853.173801-1-mario.limonciello@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:32:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLnE0ProBMC67fE4JbU0W3Uau_AdLkby8D=FoqNPU6huaw@mail.gmail.com>
X-Gm-Features: AUfX_mybm6XUZoyE6n2NdUHbvILMGXUCvbHFAzTZw00NHyAohZrA5FVYUnvuUSQ
Message-ID: <CAD++jLnE0ProBMC67fE4JbU0W3Uau_AdLkby8D=FoqNPU6huaw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl-amd: Don't clear S4 wake bits at probe
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 6:29=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> commit 6bc3462a0f5e ("pinctrl: amd: Mask wake bits on probe again")
> introduced a regression where Wake-on-LAN no longer works after suspend
> or shutdown on some AMD platforms.
>
> Firmware-programmed S4 wake bits for devices like PCIe NICs using PCI
> PME are cleared at probe, but nothing restores them. Unlike S0i3/S3 wake
> sources that use enable_irq_wake() -> amd_gpio_irq_set_wake(), PCIe PME
> does not use GPIO IRQ infrastructure and relies on firmware configuration=
.
>
> The original intent of commit 6bc3462a0f5e ("pinctrl: amd: Mask wake
> bits on probe again") was to clear spurious wake bits left by firmware
> to prevent unwanted wakeups. However, S4 wake bits are used for
> hardware-level wake sources like WoL that bypass the kernel's IRQ wake
> API.
>
> Fix by preserving S4 wake bits at probe and only clearing S0i3/S3 bits:
> - Firmware-configured S4 wake sources (WoL) continue working
> - Kernel maintains control of S3/S0i3 wake policy via set_wake()
> - S3-only wake sources work correctly per commit f31f33dbb3ba ("pinctrl:
>   amd: Take suspend type into consideration which pins are non-wake")
>
> The trade-off is that firmware-programmed spurious S4 wake bits remain
> set, but this is less problematic than breaking WoL.
>
> Fixes: 6bc3462a0f5e ("pinctrl: amd: Mask wake bits on probe again")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied for fixes, thanks for always fixing these
issues Mario!

Yours,
Linus Walleij
