Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1F33A4510
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488864; cv=none; b=BIznaNh0GBMKfKVjSOsktb8fi1FDH6XfE62I5cHJbTGm6nLPoQleqxV7WvL2wb+JeMw1EWnK23Kn/O6BCTUiKYnccfykzJkXh/JfApws909PtICgdgaaFQXaKZeaKREf0hfSPUluyLAMB95G91iKCOcLr/KmgLJ2h/CBVNL8nSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488864; c=relaxed/simple;
	bh=6X2t7eJ5QBcElQzrzDWM1Xhhl94ovrcRm6oVdNZYXAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+36XW6yBxm7RdDNtLrug3bt9PvGL4IwEYSSihENsr07XBRIjVBg0YjiKuPU7P8rolXfkPbEC3qPVeG0SKlawRG9fcyvZ15QPdOPGALS7sFImSeBFFE+CPhV8bzV1P46JHhPs8IcTEm08YxUeBL+EQO4zxFtbj/wpajXHumsn40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGAMS8Vt; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGAMS8Vt"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33c2520ad38so8132844eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 12:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488862; x=1792093662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6X2t7eJ5QBcElQzrzDWM1Xhhl94ovrcRm6oVdNZYXAg=;
        b=AGAMS8VtfTxOnkcYRBBjh+oBAdaOTUoeuHfMKEXZzWULPcQDZHwMUcD3WU5ki+9y8a
         xS24aYvzp6T2U2fzS+y4vD+mZaAsbWkARDeZTolxjEtE9TokK3+4+LdITrbXo1sYQfe0
         WgAYH8yJIrCOdl7zx/sAf+5guWpMZBCnvOEwixjTb+C2dPCeW65hHlcraO3G+o+E/atJ
         ieYjhE0O5ecA+pmOd4LXukL+n5XoY5D9hsKRS/B/o1WFQuF+x51JxrHYt7cWhTyftKVP
         DI3sSGiF5Ae4KUXT++/x/IHD9z5YX2MI8Fr9d/fDMFhoBn9bJDoM2n+4rNfIQSR6Cxhy
         YEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488862; x=1792093662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6X2t7eJ5QBcElQzrzDWM1Xhhl94ovrcRm6oVdNZYXAg=;
        b=nCQv1E6fhn1Csj5/8KVISIRszKCepFM2Du5MXaNj9zvqtgqgmhhDEh9ikzlqRLMaEI
         J6xhVoNgi0/bmpCZ4Jjf/jSBRWkHhAqXlZCPveOwDYUjPYO15qZrpn/CQnU0wLdLUdHE
         IqXz65zeb9AOimvwW9ypRdSZE9bGfcHzcC4YRVBkTffljFqwDj2SoSZXGNrPNjQxgTdT
         kn5g0t1yy8vuAbT2MNylK9DjmQ8x8uZ8T/dkpK39ZaOYN1ugkNB7NKmpRMYtACO6Vufr
         HlqylRqdulmGeOTBckYT/H1Twy6DFN68WazPrr9j4HTe3Adcqx42BcQyHIq8X1sXtSQs
         MX9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNSlK+SmOJsVr9J7z125Df6EayL7lnEQ+cbLPovKQWx8YtMafs7+k2YgbWWSx9xQOG0ZsUM3rJP5XB@vger.kernel.org
X-Gm-Message-State: AFq9FYLwA9p+EFAnJg0g+UcL/6bT75dGI6WQtpTo/AlRLzCe3v1QYhIP
	vnE81L2Eswc373xPyzti32NIscntHhWDS0jJaxnPvImJ0Rcku93ZADmN
X-Gm-Gg: AYBFou15WUGaCpJ/ZLhpG6jluLQw3K8DwewYSB2mTYCRppji8kc/kkqCGEj8bCC2G6/
	h8ry9tQq7cFqvmKs6E/oIfal06zDqi3DVrI+zauoP3jXCiM0Pn76VSUYaaZSJGB0h6cEimk5bge
	e50bMBWz+sCEVOj9+JeFMIML1oftiNMFiNUS7p6emALjeqTRQ/nq8DFBvLLujlnGMkqCNp1JQGU
	+3+0+uOhpaFFG59d2ArSrEf/JyoVhL8nKuy/lgrXf+JjUrnH27D9iylH3OvhpSe9ef0AGAu5Tbu
	FihL9442VaTsZzBK2lPZo/joGNJ9yetEu3SLZQMWr06vQRk3bXO4QV++XzhlT0M5bg4XFZnbvc5
	RPbocUuPodlTfLexKFWv9p6/YioMhveiv4Zcl+NBqahYX6XqnpaHK4NiygisAqUcDcc40kPYEvJ
	ckI2ks/cQaxJ0tmhMYfRT3MU9muYU+qZ12CVOoSR3zNEp7BhsQKSoAf0EsNSF+nRuOnp+EMPqwj
	bVmhj9PVNfn5+XADp/Rlvmn/rvSwlTmm3mwusjCq3BdbzFf4erhufyr9wzPXqy6VlOj7L9jfFd9
	lDS97w==
X-Received: by 2002:a05:7301:580b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-3517ec1b4d7mr4689953eec.28.1791488861717;
        Thu, 08 Oct 2026 12:47:41 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm291906eec.9.2026.10.08.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:47:40 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
Date: Thu,  8 Oct 2026 16:47:19 -0300
Message-ID: <20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

While bringing up the Radxa Cubie A7Z on mainline, I went through the
A733 io-bias code against the user manual (v0.92). The register layout
doesn't match, on both controllers.

On the main PIO, GPIO_POW_MOD_SEL (0x040) has two-bit fields per supply
domain: PF is bits 11:10, PK is 21:20, and PB falls under the VCC-IO
field at 25:24. sunxi_pinctrl_set_io_bias_cfg() treats it as one bit
per bank, so a PF request writes bit 5 (inside the PC field) and a PK
request writes bit 10, the low bit of PF.

The R-PIO has the same layout, PL at 1:0 and PM at 3:2. The a733-r
compatible shares the A523-R descriptor, so it also gets the inverted
encoding and the RMW at 0x344, which the A733 manual doesn't list.

PL is the case I like least. Running the unmodified helper on the host
with the R-PIO state I read on my board (SEL 0x000aaaaa, 0x344 = 0) and
a 3.3 V vcc-pl supply, SEL becomes 0x000aaaab. Per the manual table PL
goes from 10 (fixed 3.3 V) to 11 (fixed 1.8 V). I haven't run that
path on the board. With no A733 board DT upstream yet, I don't think
anyone hits it today.

Locally I set BIAS_VOLTAGE_NONE for the A733 and gave the A733-R its
own descriptor with NONE, leaving A523/A523-R as they are. That's
roughly what the vendor BSP does too: its kernel never programs these
registers and keeps the firmware setup (all auto on the main PIO here,
PL/PM fixed at 3.3 V).

Tested on one board (the vendor kernel reports SoC version B),
RAM-booted over FEL, with your pinctrl patches on an integration tree
and fixed regulators for the 3.3 V PB and PM supplies. With a few
printks I checked that UART0 (PB9) and a gpio-led on PM2 reach the
helper on the first request of their bank and that SEL and SEL+4 stay
unchanged. Same registers without the printks, and UART and the LED
work. A523 is build-tested only.

Would you be OK with disabling the io-bias programming for A733/A733-R
as a fix for now, and doing proper voltage mode support later? If so
I'll send the two patches, with Fixes: tags for 0535bfbfa97b and
31d68e10381c.

Thanks,
Vinicius
