Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577138;
	b=YiJUOCeMRLXPETQ4jHTaN2lDWkP+fC0CXyP39mPCGg+4P1+nfnygJIqdp0B+ukS4cXIn
	 0DrbJFtAb4LaIl49YHNjCagqXqIC4dXX42WFgs94OK0rGOgRRIVlDn7vMysLZB71EMq5v
	 ZOCrQxFlCO8ZYDFE9aWHB8I2sTnqLzzuy1Jqaqrs/fsCGl3XYwVRapML7FEzK5bBGFpPI
	 sQjEIShCP7Z4OKBAt/JZcOwm6uAhZ6n0T/hBXkQpXSmvV+d/4IM8g5PJLs9ABolFP/1wj
	 Hyp65IcpDYZrXTtmjVn2oqQaXeBBxU6vgbel68SQr/fvXnI5wIFqCf38DhiyiU+OGTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577138;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=RF0qZYLxDSre+DZbeZnQ0IZv7m21cFrpxvATORER0qM=;
	b=FQ2gozfKYZdvHiPXULpi0K+qZ63own46omAOq55/Rbz6BchwKAG+5JGa3yCY/KNLrGkf
	 BeZuhlDVCNnWe8fRocXCdktif/xc/02huy379hrTl28xfdOKEikS2wc+VVcMrdBSyObAs
	 yw0QrjR9AyctLXNJ1lZcvezFCwLr15BhvgQN6LOjLC/Az4VIAonPl+/X04Au6dc07oIbH
	 GLok3OkRXEhqVGDLGdR/kKPbeLZePBwtDKDWFh/aXHZCS3lvHLF6GjlE9Arnvp2Ytz0FS
	 auz21pM4jmZ5QNHnDyyev5RL3QBG5cJXC5vgmJKuB38xp4gkorhEbZEx9lsqJgURVwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTzQsh1k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59343606A319
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTzQsh1k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372B91F000CA
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792577138;
	bh=RF0qZYLxDSre+DZbeZnQ0IZv7m21cFrpxvATORER0qM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lTzQsh1kHXCFuX+y5jkfaJb2PYwzkSd4KvmhhI1ekqXmJSoUGKX+Q+zJ5LY3M449v
	 rj4NKrQ9KF7cfnjd/Z1m8g+7+dsPPxzkSTcHnVvRf0kjd+Xvpg4GrG/U8kBswG1SKS
	 GAzV/O09EzcUd+Gu6P1ERxMUmmtMIH7zeOy9GedAkPKVzcGBN+BQ7pK/vEbiGSux5W
	 5N94w/Us/lh8MwzjQy7pgMK1PL/yceYGfGNim/yQg1vNnb8VTQQuL9BOh2e7lz+zNR
	 hcNbC9Yxq/MyRfoEoEYghsbyg/eGh8AnlZ7kiVRF4hEelQ92XbtUm6B4cPmjgozsdE
	 YTd/xKctEYNgQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so5669881fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:05:38 -0700 (PDT)
X-Gm-Message-State: AFq9FYJpOp8UEQKdYjyP9Ig7JAGKR4r1U/jxkbWisIB20KMGJ2vbyDqh
	wuz4NqaEtNvCff6Y1+8MRdUUlNZSS9qXVl8fPGqFdMksm8MPNX2nkItkiOCGfAPrRbZKoNEJ0ZN
	vpZfp0j2gbFXmZcYxTHRJ2xqwLapNxv4iCBDgXfOdrA==
X-Received: by 2002:a05:651c:31c8:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3ac4b795a82mr798221fa.13.1792577136866; Wed, 21 Oct 2026
 03:05:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:05:33 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:05:33 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021095551.3283369-6-aambrozewicz@nvidia.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com>
 <20261020-gpiolib-chip-removal-v3-6-aambrozewicz@nvidia.com>
 <sashiko-outbox-179021@kernel.org> <20261021095551.3283369-6-aambrozewicz@nvidia.com>
Date: Wed, 21 Oct 2026 06:05:33 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mduzetc38ZttGFEQqtOnyvD-PumZ7=m5FOEF75eGpq55Q@mail.gmail.com>
X-Gm-Features: AclHuK-c62CC1jnmwGO1-TdnPZcp20ujz7YeGKQLtN4R3iNiFa4w_v-HUz41X-c
Message-ID: <CAMRc=Mduzetc38ZttGFEQqtOnyvD-PumZ7=m5FOEF75eGpq55Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpiolib: let the character device free its IRQs
 first on chip removal
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 11:55:54 +0200, Adrian Ambrozewicz
<aambrozewicz@nvidia.com> said:
> On Tue, Oct 20, 2026 at 01:23:24PM +0000, sashiko-bot@kernel.org wrote:
>> With character device IRQs now freed in the notifier callback after
>> rcu_assign_pointer(gdev->chip, NULL), can an in-flight dual-edge interrupt
>> handler queue a spurious rising-edge event to userspace?
>
> Yes. With the IRQ thread delayed in a test kernel, a reader blocked in
> read() gets a falling edge as a rising one when the chip is removed
> meanwhile, with both uAPI v1 and v2. Without this patch any failed read
> does the same, for example on an expander that is going away, and so
> does the HTE thread.
>
>> Should edge_irq_thread() and lineevent_irq_thread() also check for a
>> negative return from gpiod_get_value_cansleep() and drop the event?
>
> For v4 I plan a patch before this one that drops the event when the
> read fails, in all three threads, as debounce_work_func() does.
>

As annoying as sashiko reports are, I think they will result in better code in
the end. Thanks for addressing these issues.

Bartosz
