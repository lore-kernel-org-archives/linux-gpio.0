Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F0533F36D
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 00:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334630; cv=none; b=euWzfToyhppe2gzGqkgAjaYaqZjJ6R5OMJcBqXmP7UWp+cYe8Rx/Rqyw7HKZ6N4OWcDdLRlJsYn90E2j58Z3L0rhbMKBHShB0zIXH1qp33PodYl/mLPNijTdO4pQH/rFCXEL7zufXC26q9GbnIRxQ+3gN39gl0V4JRUJfOF+IsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334630; c=relaxed/simple;
	bh=7qihWULzhNXrMFY/3lzqq7H5HpmEEjJl5mAZAg5n+k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BS3EJk4Ecq0epJJN9DuDFw1OzeAE8Fa79lSLhXthYuXpc/etY7PXCeuKFG0cexvl/zT9vgujKImxb4E22kWqC8qQWYi5L6ITfeq6C3aw/XePICaoO7/QOJOQ1XsF5WlhWig2JYLG8xDQR2LtlEohYIjZuAN8lAX7VXuQhWbyMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGHVg9ZY; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGHVg9ZY"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-82890dea412so527570a34.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 17:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791334627; x=1791939427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=AGHVg9ZYwJfjV02BrJFLN65pjF0Wy3Yc0huZcIkg3eDjzhLVyaHED4MNpMf5O2ysXS
         i8OM/GNa/qPp2DU6uczvud/52AlFHNX/5uO1KobfRnivNjJpOhexl05Os5+1wb5c+cx8
         DX2ql59xrtlqh0igIgozvRrSwB7pSa1ik3PNozvFwtH4gm4/KtLMKaf+Gn5bIEQXLfpK
         FDbInxsBcrOUz2/CtHHPzI2/1GU29rTOAn0960hupQzWwqEJgvkQOLNzV1WWLI6/9pjS
         JmiVUvYaKZgnJy1X8k48VbI2hBgYHY3GdFqAnthgOW0xUQ+J3+21fVrzveETcg94VXp1
         zz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334627; x=1791939427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=FvwVgUvINWrozwmATnspUgu0NYHsUMCI+SYhhdEatGBpOz9hU5K5R5uHqZb8Mnt3lW
         tDQdYbLyxV7h8EeRO6ABLDri+275vst+imGof44IVRCQ1TFHt1wpQbGLf3foWYokwes0
         m0DljHCWZ4SH2C2iG/9fl8QLgYwxuyCYcD9uhgAJ67BPef77uVsXVNHqdrGl2B2SyJCr
         H3khtqyzhIgfyskjFn4cd61sUYDBzYkmpdJhlVGg6JjGNw2U3S/mZqwX16FjnHYT/K4B
         JJiu/+2DZBbAiRMTuCDGwpPxgfUl880Z6wfHmdAns617qDlqZcx4fdtpQUUjQFxsPa79
         rs9g==
X-Forwarded-Encrypted: i=1; AKwUvBxrqv3tCFmKZ793DW3bz20xvvmydbQ6f8bL2D+GF+QHDSD3stkC49kx6OT83VDjkgp0+HM5x6bsSVg/@vger.kernel.org
X-Gm-Message-State: AFuF++kDYrjRfkVxI/DYuRjmOGE0sMn5pCLkhbl1QYssAr9qM1pWgcqS
	a0idKodHmN3GqvMwlW8BsGhN6rhFtzyyg3vBmhcpYAFgAsDXOSBq9zI8
X-Gm-Gg: AYBFou16KTZvDPG1Vk58MsweOkc0EUmRfXYVNriduxxWkBrHcTcVr8hXHN/s9owTYTZ
	BwTsjuVeW1CJglgUp2EhxU9Y8TPCBK4g/VZX99ZkpTnfzYu0yFmfRO9nA9S9jhZwWHc8jyUw90+
	rHTvVoBOXTn5TnEbIZqQdXrhtLRlrS79cfD9VXDROI+Qj6M/Xm31h+9UG3Add6rhe7K1/MZit/z
	Jgy0EWzF89Y8OaTSCR0WJzRmNkzP62PkPBk3Y7NgKdGFyCypjaxiAEQEiPugNXWPziMk6eML28Y
	iUekB9lsqCGCRtgC/HT7mPg1QsX6W45gzMVYe30nk1GIW3qeGRkGzfqRi4exNTCobhJACWkUx2O
	dQtV9qc+2iogHlVPovJSSC6Is3k9jjYQzj58josoE1M3mfGwpPGZeR3HIbsdCHBa1JlhllUUcAL
	vjBhoi92+/3Mk7HDSBELt+AZe0m5jDSEl4dN8TjSNYj/VkkEtay+B6VaDw48PKQ2DKk7BB+8L6f
	dJphjUxkpW+JAxwoaR8AJhN7Ok2qpvJoEoGEzWRfVot3lG3QqDL
X-Received: by 2002:a4a:e90d:0:b0:6dc:e1c3:b2d5 with SMTP id 006d021491bc7-6e7a913602amr915341eaf.75.1791334627605;
        Tue, 06 Oct 2026 17:57:07 -0700 (PDT)
Received: from ?IPV6:2600:100b:b034:8212:4cd5:c80f:ba72:80cb? ([2600:100b:b034:8212:4cd5:c80f:ba72:80cb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25722e3d8sm1005183fac.15.2026.10.06.17.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:57:04 -0700 (PDT)
Message-ID: <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
Date: Tue, 6 Oct 2026 19:57:01 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Chen-Yu Tsai <wenst@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chen-Yu and Sebastian,

Thanks for looking at this.

On 9/30/26 3:17 AM, Chen-Yu Tsai wrote:
> The syscon node is the provider of the regmap. You need to fix it there,
> not duplicate it in the consumer.

Unless I'm misunderstanding, no driver binds to that node, so its regmap 
comes from the generic syscon code, and changing it there would affect 
every syscon. Lee, Arnd, Mark, would that be acceptable?

These are the options I see. Please let me know if there's a better one:

- Do what Sebastian suggested and make syscon use a raw spinlock, except 
when the node has a clock, since regmap-mmio calls clk_enable() under 
the lock. Off PREEMPT_RT, nothing changes. On RT the lock would no 
longer be preemptible for most syscons, including across bulk writes. 
Most syscon users that do bulk writes only write a few registers, but 
enabling the Amlogic G12A PCIe PLL writes a sequence with 40 us of 
udelay() under the lock.
- Have the pinctrl ioremap() the node a second time alongside syscon's 
mapping and read the input register (DIN) with readl(). That read is the 
only access the EINT code makes in raw context. This would go around the 
syscon, and it requires that DIN never be written in a multi-step 
sequence, which is currently the case.

I'd like to know the best approach before sending out a v2.

Best regards,
Ryan Brue
