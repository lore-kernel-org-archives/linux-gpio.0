Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5841D624
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801050; cv=pass; b=nn7Cv1zVw3KB3Dk4uDdn8E1/2tQV8+lFayXoXwFWtbeIbd1UwfCC3IEpmDxpjxAQ2rM+1lrL1+gvVrBu8sKXBvXSWYoWkIkPbd+4wX4djUrcjOZioBQySz1bZiwhxh/dYxSAaNGqhJ7UC8rLilH0BDQqki/yEcYuR7pX2SoguUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801050; c=relaxed/simple;
	bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2L7IX3EDpQtwAnqfBbErZeLF6J4E0XjF9QY9R2ShvDPMwuGtnkgn7YD1DQ8vMNfpKy0LxLCoj73pINLX8S0xn9+kfT2f1GUIkBc4texmXvh1CtqhSy7ZuFZZtfkOiROj2zOCWMhdCbxQwdilwwMYTYA/NBSlz207tb6vOOlBGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxDrdibd; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxDrdibd"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e36c3478aso220089866b.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 03:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801041; cv=none;
        d=google.com; s=arc-20260327;
        b=U45DRBe2keqQKr9vFbFRXiVYcIU38YimUCaGKf3tifJOaVT0ZqIqPhP03uLZCGW9NH
         YsOSGvPc3otjWUs5qenZGJNlYocz4QMrUW6Pe7uTfVFQlMfYoWQUick//A3RlhluRbjd
         jmYk+lsbAuku7vxDNmDA+1HmBiuinR6ztiBrMN3UAxdbaa7Sr2YT/bpUA8S3j/Rh6EVa
         U7Xv57REqW2Q86aINvBISsyi8F886msmp/OtW9EwLBGROHOZ7hQin+U7AqdlVc31Kxsr
         jGTfHXbzYpd1GIKP3WhL+LnxMQv2tV2cdVUTAe5VHlOYkjWhufUHOR0Va7HZLAvotAhV
         F4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        fh=MRJBOegP4JXtGqOx9oz7/D1jlZP9Z2kp6pydV73EgeU=;
        b=V1gjwnQ9Os4knc3ad0XzjHgFXFDaKeAh41DiZr5PYaPGiPZPLHRvPEsCW1UuD/bkSG
         tv79mycIsMh191Qm72xFUeWZQ3a070TtmfLqhdYlCvgd8cKCKF5sl0leqV8jHOWerAh/
         cCmZ7q1VQbD39OTtiUXyUqyvUmPuGaavD+DFt8GEhKNmg34aknSkhGkEqpn9EoaI6CaJ
         4MbVzPJ8ik8zxuZ8HTsx2BLSayn5X76rQuQrt5nftfJv6U6n8CoADLZq4mhWL5lw4mdl
         lIoE/7/VWx5X/6m/1PYL4TzULqu3UGgU73/85TSF9+7QLsuCJbfoO9Dt8N9VTLGSZYOx
         MFGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801041; x=1792405841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=JxDrdibdlfh4aeRXmzmgxuwDKumTFnNV5hbsVLB0Dk8K2AsIt5PppPNoOjJyM07sk/
         pQMUikMfpfLU8Ch9VVa+3w2yC5hwQNVFfsLxuOoMqVuMP4rdrbvDXfncHtTNYl8nrBxb
         4o/WGIpWXM3gR5iMBmEp9VjAfS8vv37e2ZsRMUJplSKfWiCIS3EEaewmcLa0ppZ1ylCZ
         KKonEDcDKbRx4P6SdzQMeJctNngJj3lgyE4UcaNrMyNDUGzEqy0cmFcAyBKz62RWbTCK
         N6ULrcbz7VIiOBlmE0DfhroWZz74/Pt8I0kwyzy7kTyhkweUaB118SLVzJo1iv2HeTSf
         hEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801041; x=1792405841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=M/mAjuvq3g0c3jUUWLkZ+XPJCc24LRWISYcM8u67Hj2GnuuBCaUbEza4L5jmLfOoM2
         /ACBKZ1s/XzcRxAGQD9IhV3Y+xZvxa4UjSI5anePs+2bE4f4h4ts3qthN+e3Y22DnyE5
         H3nXx1Mm9YXN/Ufn2FBY5ibBe2gkPzkdDOBGwVz3j+ZrrOlv4R3E+WPAVkwLSsZmINbx
         rWj7wGMNx64wOMWzQgwDqvLYJh0vxLByQjRlTA6GW2mjZihC2JpSgv2cBOU01rcGrNXc
         exQyZ1QSm1STHL6vUiEyv9gNQ1noleSWs+Va3BQ21TFZMa0oy3HV4rgC7qWzo+EluzPb
         xWCw==
X-Forwarded-Encrypted: i=1; AKwUvByYnCGorymwpUQ8RE/Pv++8zMMAYsNLdsBPPYVv2Q9z4c0RhpB6vwDAZoUiqS1AEw+hl2fvHB6ua7Dp@vger.kernel.org
X-Gm-Message-State: AFq9FYL0DpRIDXRy7EtKYZ4A/JtHKT4AWh+/BQKpii/QpzEZ/y/V3Iar
	MUq4g7pUmcIbIP+n8wEc4BdjHoj6RDaSFRDthDLZMOUeABkIVU8cKKpr1fxQOnfZUsdaXxNNiwH
	20z19/HEgXgeEHoXNlfZR9mOU6lZNyPETZJpV
X-Gm-Gg: AYBFou0Q0TFnwK02pSkflxw+iz+5kIYAlRSnzy4qNXYaVrOmlEn93qnj/kLwgKslBEZ
	tAWN3BB7uCsKX+KjaAD+Ho5a6aXVNc2EDXLpKAVdWw5v3ZHuu8HS9HliG8FO+Aio/qH1QPSWfcj
	v6zg5RoNVLStMGOCwEsb2d8xP8ojCuCTC5dlyhECOF+fASQbUYP1g3Lu/5LSFuYyTNVZV/5Ecdf
	Ep9bAU1x/z6JdsBrWhZwb3wibAWLknzDLozT8PjucsopvzTX7DnlUKcPW5PMCh9r8+/UphZb/IM
	b/TACdcWY62pYhrYCHqtCt6SYwRl3HSak6tIFt/QO6JcTioMX/7/zqlBpE9mvrp6S1ViGeCnts7
	jzdKlOR4Cn+Czh9xRhCdEhjdl0VKxx+N3F+8gh0Wl8wUD2f513SMSuWBybe7KVSfLfo7d1nx8dP
	DA8zbqfpPlWGbyQqfJM3lQVgXyAErTK2TUAsFXMTZg
X-Received: by 2002:a17:907:3d4f:b0:c26:19e3:e979 with SMTP id
 a640c23a62f3a-c31aa02999amr829174566b.25.1791801040894; Mon, 12 Oct 2026
 03:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89>
In-Reply-To: <asytkrYip+v2vl/i@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:30:04 +0300
X-Gm-Features: AclHuK89C5O-S_Ib4WjyrexO79x7Ht_pFlIF6GUEOqfiEQUn-PMquRFiuZzNiXE
Message-ID: <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >
> >The code doesn't modify any reader part of this member. So, the above
> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >assign_bit() does change anything.
>
> I will replace with below:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so concurrent calls for
> pins on the same port run without mutual exclusion. The plain |=3D and
> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> can lose updates when two CPUs modify different bits simultaneously.
> Replace them with assign_bit() to make the modifications atomic.

Right, but the code does change only the writer side. There is no
reader side that was changed. So this patch does *not* add any
atomicity. You also need to check if the reader side already uses
test_bit() or something like that. Otherwise it makes no sense.

> >> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> >> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> >> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> >> wakeup_pads to unsigned long and reorder to avoid wasting words.
> >>
> >> And fix the enable/disable path unconditionally sets/clears the
> >> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> >> Only update the bit on success.



--=20
With Best Regards,
Andy Shevchenko
