Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC63413256
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 17:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543394; cv=pass; b=LZ8zxDQ/6OnvaFkrqAqmgIqwClIcqvVXWuV6rc/4F9EbZ0pace5AH72m1ygtKKINm2gM94Y3E3gVFO1JMnHd2v+vzefG4zS7sjgIDBVPScCGmCfGSbNRuUjD1QPkQHyN0ZMQU+0VC0qgpqFah9D89vn8UnLumoDbrlKUFQzFqFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543394; c=relaxed/simple;
	bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kW4UtGOHhgEHQGtjF/+ctrMMOHXfgeeEbapPl2Q/JpQJXTre4hes54h7VzR88sMEnqWO1Xi+dKvRHulQWeVepL/5gsFDCtfJHTWPczVDRzDEwl8/nKhGgGqidsKzupgx70Lisgvb7Nn+vuJXnL4nucq5YYDVZldIKro97I0Jp4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU2Iblhk; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU2Iblhk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bf1141c26ecso429477866b.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 10:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781543391; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCzzTY499D++zIN51sA+hEuOdtgd4oE9kblFXIpRqXDdv2gHYY/nmjHu6rC2LL99P3
         ZLrJ8Al/2oXX47FEyM4JQxaGkyqp3PALIPHpJxafs4bKfazmYh/XbLSJEq9pJvqq4QSh
         GAvdTQIHu3CnsuNVE7vRKasAKNONAveJlrb2pS2pnv+vajp6cP49nZqP6tQ2T8uDSJ1i
         hbvl5HVBQNSS6cbtLQ+0dYaI9uoYywFCveWCSoHpiz2S7wYb28x7KoLjcuiqiN540NbB
         byV12618Lx/tdC2XnCXZfcSAvyZQNxXSd2YaKy4bpKtcApfit4IYCicZMWiZjlJGc1rw
         /ARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        fh=Do9gX7oMlrXZ8hJ79F6BeLp/xYu1mAeZQUzTPqg6t0s=;
        b=faP6p10eSsWPJIMjtbynKgXvLa5K00xclXBGJJtQrm8ySbeK02QtLyG3nNqI+W4hzR
         lK+GlRdji83xn26gpKzDXG6LX16WoQ9JeShSNS1EC6OdzVLF1lSw0lxgOV7AiJnhevLj
         3wPa4NbE8cntHQ26G1yaGM/KT7u6xnHlQYwbncl+3SYru04Ho1jxO/E8QZkpSJiej4db
         Swx3iI6lHjJYHuKlVa2/IvtXRE8j/WPs4MTgUh8yooyrpqdAt4mOT0COankvY4968MuU
         W1SIGyJNftEJbMBhfwViPLbNlYpKfYqj3VVjNF/l1ZAjTJhjQLO50F94rNBVK3OHEPAm
         iKNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781543391; x=1782148191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        b=bU2Iblhk9vnsDgxKxhXjiCS2mj7KbveT4augZWlTS6ux58qPS754bw7G+7+uJqKHi6
         94kyHYvMEuQOn17rovkHBYwgLZ8V2jwcTV/FJ8meab5Jbv74cOonR7apCDQj5rlH/KJ0
         /4yVzA8HArrPKtkyyb0ssZSbr1jfVj59ntpAdQV71pDu0KzeibnBqtdwdDVQiwaPnu1M
         Mw5AMag5P2ngaFmhlJrCA7D6lvASB7VtVykTakWfnEx6uOCaDGJMcyogV8FJq+tld6g2
         1dIHFO+Fu+J2UK9OFZ5wsroZG7o440c59fGLL63lcLUc8p9y0sADHiHVsbD2E8QSHUeb
         nHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781543391; x=1782148191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        b=F78sUU3JPZYL08rDTWJY8Z5uZUTv5i8A0IO5Ame3kdaEkrl6xS8IOsTTohTR3M7Gew
         6Nfdp3ln0pgCAZNJbx5jU6xFjsmuQTYpJWCXnaBotxJlBbhTTkeGflclDZR+hBDwiRWb
         Td04NEJCaiBVI/UMhmWsjRG3ej4Q6w3q4sExU0EibOp9gvQRklgXba+RIKv0S1rL+y6N
         2gzI4mWMJaZ6JJuujPa9R2thTIOIxf8bVmzDPv6dpZUZDmczvHAVnVtkOTi/6QEj1V4z
         a+LFbAmP2fc4+yFerfU4g/1NFWLinew4rrMoHPES8I3tGVMBKxjFDk/94mp3LDK8VqVP
         MKKA==
X-Forwarded-Encrypted: i=1; AFNElJ/iVY9j93nGZNgNc3Ij3/ZhzyalWAV2uNuUHv3QKPLyaa523Vr7O2sLwQLnZSDgmYzoIa1s8rceVjTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPVbKAYKy9h6gQLfeYeL0TTHLH02idr4Lfm9sUCx/GvoB48dA
	JzmqyMshB+1f41q4F21L8MbvUvR4jDV9PljuxD4Xk0b3x3OpzZn3m5N/Zj7EK9XWQS0utQfV7ri
	gQ3LaNlvS77426MimLv17rXkeKDCosr8=
X-Gm-Gg: Acq92OFXBRkvpbUoEGBG0VT1XTz/7+eIwiRxVcq1NIjNp24/Nlcm+9r3tPnP4TOLpWn
	xxfbt5Tb/qzqKKtUEJnPpeKQWchFJD9Dr1zawyzBjqpD2Tc5ayJG2BRGbDU5Srt9q7QqXojhcNF
	v/MHSDlw3rn9K37oUmVdM3oZMKZexeP/TBTj9fgN/OF0+o7RkDRSLpf696AAzKOpyB3RjqWU/SQ
	xGkrg1lFeoXggfel2LVk3Ic+BWwAGb+g2HWlxJkz9U9p+CD01nzC8N1KefZmNypC6CnNi++V0eA
	Hfre+Rbw3lMjDcAZ
X-Received: by 2002:a17:907:3f8d:b0:bed:2a8b:3e73 with SMTP id
 a640c23a62f3a-bff4cddd831mr594131266b.41.1781543390991; Mon, 15 Jun 2026
 10:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612200717.361018-1-l.scorcia@gmail.com> <20260612200717.361018-2-l.scorcia@gmail.com>
 <20260615-palatable-aerobics-3091229b6ada@spud>
In-Reply-To: <20260615-palatable-aerobics-3091229b6ada@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 15 Jun 2026 19:09:39 +0200
X-Gm-Features: AVVi8CcgapzCFj6cwsB094FQLtSSMmdLrOP26pKMcjV8D9cFGpyiqQvrj10_jjw
Message-ID: <CAORyz2+4EquYcUHEnoq0N_p7vCmDpPONEhVrmAfO1eX_RNMYbQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
yes, sorry about that, series v6 has been superseded by v7 (I replied
to the thread and marked it as archived in patchwork, please let me
know if I have to do something else to mark it as obsolete).
Sashiko was correct, the regulators node is required for this device.

Sashiko also has suggestions for v7, a few pre existing issues and a
few nits here and there but some are actual improvements. One bit that
caught my eye is the use of the modeset register in the
mt6392_ldo_get_mode function. I have to double check that with the
data sheet and the android kernel sources. Not sure if I can do that
before next week though.

Is there any way I can trigger a Sashiko review before sending patches
to the ML?

Thank you,
Luca
